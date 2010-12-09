From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu,  9 Dec 2010 12:29:52 -0600
Subject: [Buildroot] [PATCH] iproute2: make sure we use the TARGET_AR
Message-ID: <ddfb05452df69d225b814605891ef82a6ae3e64c.1291919379.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0f99894..9965b7f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -20,7 +20,7 @@ define IPROUTE2_CONFIGURE_CMDS
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
-- 
1.7.3.2
