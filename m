From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:28:46 +0100
Subject: [Buildroot] [git commit] efibootmgr: explicitly depend on
 host-pkgconf and popt
Message-ID: <20180323152955.C8865815A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=283f45e807f0d534a56f31ffabfcc5a3954c976a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efibootmgr uses host-pkgconf and popt, so explicitly add them to
_DEPENDENCIES instead of relying on them getting pulled in by efivar.

[Peter: reword as suggested by Thomas]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/Config.in     | 1 +
 package/efibootmgr/efibootmgr.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 492ebe6e6e..b87fb53225 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_EFIVAR
+	select BR2_PACKAGE_POPT
 	help
 	  A Linux user-space application to modify the Intel Extensible
 	  Firmware Interface (EFI) Boot Manager. This application can
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index cdd500f088..bdc0019d99 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -8,7 +8,7 @@ EFIBOOTMGR_VERSION = 15
 EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
-EFIBOOTMGR_DEPENDENCIES = efivar $(TARGET_NLS_DEPENDENCIES)
+EFIBOOTMGR_DEPENDENCIES = host-pkgconf efivar popt $(TARGET_NLS_DEPENDENCIES)
 EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 EFIBOOTMGR_MAKE_ARGS = EFIDIR=buildroot
 
