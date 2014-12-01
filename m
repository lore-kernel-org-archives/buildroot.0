From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:23:33 +0100
Subject: [Buildroot] [git commit] rp-pppoe: don't install man pages
Message-ID: <20141201223450.6EEB880048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4c06aeb1a974c4d0007814e0f845c7d856122cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't support installing documentation on the target, so there's no
point in having explicit code to do so.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rp-pppoe/rp-pppoe.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index b17086b..6827628 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -21,9 +21,6 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
 		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff; \
 	done
-	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		$(INSTALL) -m 644 -D $(RP_PPPOE_DIR)/man/$$ff.8 $(TARGET_DIR)/usr/share/man/man8/$$ff.8; \
-	done
 endef
 
 $(eval $(autotools-package))
