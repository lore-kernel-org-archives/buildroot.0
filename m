From: Joachim Nilsson <troglobit@gmail.com>
Date: Thu,  4 Jun 2020 20:24:20 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Change from FTP to HTTP for
 official releases
Message-ID: <20200604182420.37049-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The HTTP URL seems to be more reliable and quicker for download than FTP.
FTP may also be a blocked protocol on some sites and in CI/CD setups.

Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d50e72846..ede14fe234 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -33,7 +33,7 @@ UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
+UBOOT_SITE = http://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
-- 
2.25.1
