From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:32 +0100
Subject: [Buildroot] [PATCH 08/15] grub: adjust splashimage in menu.lst
	depending on configuration
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the splashimage line in menu.lst only active when splashimage
support has really been enabled in the Grub configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk  | 1 +
 boot/grub/menu.lst | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.1.2
