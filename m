From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  3 Dec 2014 17:18:25 +0100
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: bump to v3.7.1
Message-ID: <1417623505-5767-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The main difference with v3.6.2 is that this patch calls "make defconfig"
before make.
"make defconfig" is called by the Makefile with .config file,
so the original logic isn't changed.
Calling "make defconfig" is required to correctly prepare dependencies file.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index bc8d912..bb7e215 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT91BOOTSTRAP3_VERSION = v3.6.2
+AT91BOOTSTRAP3_VERSION = v3.7.1
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
@@ -41,7 +41,8 @@ define AT91BOOTSTRAP3_CONFIGURE_CMDS
 endef
 
 define AT91BOOTSTRAP3_BUILD_CMDS
-	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) boot
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) defconfig
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D)
 endef
 
 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
-- 
2.2.0
