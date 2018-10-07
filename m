From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:44:18 +0200
Subject: [Buildroot] [git commit] legacy: don't select kernel headers
Message-ID: <20181007194611.C93858E027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b3c43f7dab775ed801c3f4ca67eb7032b913ba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel headers versions are parts of a choice, so we can't select
them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 122 ++++++++-----------------------------------------------
 1 file changed, 16 insertions(+), 106 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 20e2d5c8c6..c942fd8e81 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -167,53 +167,38 @@ config BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT
 
 config BR2_KERNEL_HEADERS_4_10
 	bool "kernel headers version 4.10.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.10.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.14.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_11
 	bool "kernel headers version 4.11.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.11.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.14.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_12
 	bool "kernel headers version 4.12.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.12.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.14.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_13
 	bool "kernel headers version 4.13.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.13.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.14.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_15
 	bool "kernel headers version 4.15.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_14
 	select BR2_LEGACY
 	help
 	  Version 4.15.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.14.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 ###############################################################################
 comment "Legacy options removed in 2018.08"
@@ -1133,33 +1118,24 @@ comment "Legacy options removed in 2018.02"
 
 config BR2_KERNEL_HEADERS_3_4
 	bool "kernel headers version 3.4.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_1
 	select BR2_LEGACY
 	help
 	  Version 3.4.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.1.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_3_10
 	bool "kernel headers version 3.10.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_1
 	select BR2_LEGACY
 	help
 	  Version 3.10.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.1.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_3_12
 	bool "kernel headers version 3.12.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_1
 	select BR2_LEGACY
 	help
 	  Version 3.12.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.1.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_BINUTILS_VERSION_2_27_X
 	bool "binutils version 2.27 support removed"
@@ -1710,23 +1686,17 @@ config BR2_PACKAGE_GMOCK
 
 config BR2_KERNEL_HEADERS_4_8
 	bool "kernel headers version 4.8.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_4
 	select BR2_LEGACY
 	help
 	  Version 4.8.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.4.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_3_18
 	bool "kernel headers version 3.18.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.18.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 3.12.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_GLIBC_VERSION_2_22
 	bool "glibc 2.22 removed"
@@ -1749,43 +1719,31 @@ config BR2_PACKAGE_PERL_DB_FILE
 
 config BR2_KERNEL_HEADERS_4_7
 	bool "kernel headers version 4.7.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_4
 	select BR2_LEGACY
 	help
 	  Version 4.7.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.4.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_6
 	bool "kernel headers version 4.6.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_4
 	select BR2_LEGACY
 	help
 	  Version 4.6.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.4.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_5
 	bool "kernel headers version 4.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_4
 	select BR2_LEGACY
 	help
 	  Version 4.5.x of the Linux kernel headers are no longer
-	   maintained upstream and are now removed. As an alternative,
-	   version 4.4.x of the headers have been automatically
-	   selected in your configuration.
+	   maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_3_14
 	bool "kernel headers version 3.14.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	  help
 	  Version 3.14.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 3.12.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "musl-cross 1.1.12 toolchain removed"
@@ -1914,23 +1872,17 @@ config BR2_PACKAGE_SSTRIP
 
 config BR2_KERNEL_HEADERS_4_3
 	bool "kernel headers version 4.3.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_1
 	select BR2_LEGACY
 	help
 	  Version 4.3.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.1.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_KERNEL_HEADERS_4_2
 	bool "kernel headers version 4.2.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_1
 	select BR2_LEGACY
 	help
 	  Version 4.2.x of the Linux kernel headers are no longer
-	  maintained upstream and are now removed. As an alternative,
-	  version 4.1.x of the headers have been automatically
-	  selected in your configuration.
+	  maintained upstream and are now removed.
 
 config BR2_PACKAGE_KODI_ADDON_XVDR
 	bool "kodi-addon-xvdr removed"
@@ -2005,24 +1957,18 @@ config BR2_GCC_VERSION_4_8_ARC
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 4.0.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_19
 	bool "kernel headers version 3.19.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.19.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas-generic-loaders package removed"
@@ -2235,14 +2181,11 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 
 config BR2_KERNEL_HEADERS_3_17
 	bool "kernel headers version 3.17.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.17.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_7
 	bool "gdb 7.7 has been removed"
@@ -2383,14 +2326,11 @@ config BR2_PACKAGE_CUPS_PDFTOPS
 
 config BR2_KERNEL_HEADERS_3_16
 	bool "kernel headers version 3.16.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.16.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_PACKAGE_PYTHON_PYXML
 	bool "python-pyxml package has been removed"
@@ -2591,46 +2531,34 @@ config BR2_PACKAGE_BLACKBOX
 
 config BR2_KERNEL_HEADERS_3_0
 	bool "kernel headers version 3.0.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_2
 	select BR2_LEGACY
 	help
 	  Version 3.0.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.2.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_11
 	bool "kernel headers version 3.11.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.11.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.10.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_13
 	bool "kernel headers version 3.13.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.13.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_15
 	bool "kernel headers version 3.15.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.15.x of the Linux kernel headers have been
 	  deprecated for more than four buildroot releases and are now
 	  removed.
-	  As an alternative, version 3.12.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 	bool "DirectFB example df_andi has been removed"
@@ -3457,13 +3385,10 @@ config BR2_PACKAGE_LIBELF
 
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.8.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.4.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_PACKAGE_GETTEXT_TOOLS
 	bool "support for gettext-tools on target has been removed"
@@ -3616,23 +3541,17 @@ config BR2_PACKAGE_EVTEST_CAPTURE
 
 config BR2_KERNEL_HEADERS_3_6
 	bool "kernel headers version 3.6.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.6.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.4.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_7
 	bool "kernel headers version 3.7.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.7.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.4.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_PACKAGE_VALA
 	bool "vala target package has been removed"
@@ -3794,33 +3713,24 @@ config BR2_sh3eb
 
 config BR2_KERNEL_HEADERS_3_1
 	bool "kernel headers version 3.1.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_2
 	select BR2_LEGACY
 	help
 	  Version 3.1.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.2.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_3
 	bool "kernel headers version 3.3.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_2
 	select BR2_LEGACY
 	help
 	  Version 3.3.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.2.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_5
 	bool "kernel headers version 3.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.5.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.4.x of the headers have been
-	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_2
 	bool "gdb 7.2.x is no longer supported"
