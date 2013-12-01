From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:44:07 +0100
Subject: [Buildroot] [git commit] grub: adjust splashimage in menu.lst
	depending on configuration
Message-ID: <20131201225017.36E709BE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=741740cee6e88eb14600a95b8fdd06f32a9fb271
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the splashimage line in menu.lst only active when splashimage
support has really been enabled in the Grub configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/grub.mk  |    1 +
 boot/grub/menu.lst |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 0c2c035..f15d915 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -66,6 +66,7 @@ GRUB_CONF_OPT = \
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define GRUB_INSTALL_SPLASH
 	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
+	$(SED) 's/^#splashimage/splashimage/' $(TARGET_DIR)/boot/grub/menu.lst
 endef
 endif
 
diff --git a/boot/grub/menu.lst b/boot/grub/menu.lst
index 41e9b62..7845fee 100644
--- a/boot/grub/menu.lst
+++ b/boot/grub/menu.lst
@@ -1,6 +1,6 @@
 default=0
 timeout=5
-splashimage=(hd0,0)/boot/grub/splash.xpm.gz
+#splashimage=(hd0,0)/boot/grub/splash.xpm.gz
 hiddenmenu
 title Buildroot
 	root (hd0,0)
