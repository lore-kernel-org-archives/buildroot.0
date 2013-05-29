From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 11:15:34 +0200
Subject: [Buildroot] [git commit] at91bootstrap: Disable parallel build
Message-ID: <20130529105607.91C519A654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ebb2e80844088de6ea8a923762ac2c47437d810
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The at91bootstrap build sometimes fail when doing parallel builds.
Build it without parallel build.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/at91bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
