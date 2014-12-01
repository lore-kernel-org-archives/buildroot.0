From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:24:27 +0100
Subject: [Buildroot] [git commit] rp-pppoe: bail out if installation fails
Message-ID: <20141201223450.76C9F80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c39422a10399878a6400ccab565f98ad25e94928
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an "|| exit 1" in the installation loop, otherwise if one of the
file fails to install, the build doesn't abort.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rp-pppoe/rp-pppoe.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 6827628..4e17f2d 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -19,7 +19,7 @@ RP_PPPOE_CONF_ENV = \
 
 define RP_PPPOE_INSTALL_TARGET_CMDS
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff; \
+		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
 	done
 endef
 
