From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 May 2013 10:36:37 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: Disable parallel build
Message-ID: <1369816597-6221-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The at91bootstrap build sometimes fail when doing parallel builds.
Build it without parallel build.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 67b68c0..0b1ee29 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -31,7 +31,7 @@ AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
 endif
 
 define AT91BOOTSTRAP_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
+	$(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
 endef
 
 define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
-- 
1.8.2.3
