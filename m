From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:31:31 +0100
Subject: [Buildroot] [git commit] irda-utils: add error handling to for loop
Message-ID: <20141201223450.C41C280048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0b663ce9617d0ba53e6e8c15ab3feebdd4564d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irda-utils/irda-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index e4958e5..2c35dff 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -32,7 +32,7 @@ IRDA_UTILS_SBINS- += $(IRDA_UTILS_SBINS-y)
 
 define IRDA_UTILS_INSTALL_TARGET_CMDS
 	for i in $(IRDA_UTILS_SBINS-y); do \
-		$(INSTALL) -m 0755 -D $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i; \
+		$(INSTALL) -m 0755 -D $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
 	done
 endef
 
