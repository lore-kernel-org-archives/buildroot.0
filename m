From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:47:10 +0200
Subject: [Buildroot] [git commit] boot/uboot: change from FTP to HTTPS for
 official releases
Message-ID: <20200604204645.6B3C482293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bfc379c50e7c7bc532bed8dc648025c4db14358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The HTTPS URL seems to be more reliable and quicker for download than
FTP.  FTP may also be a blocked protocol on some sites and in CI/CD
setups.

Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d50e72846..71689207e3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -33,7 +33,7 @@ UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
+UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
