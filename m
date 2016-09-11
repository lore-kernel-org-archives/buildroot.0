From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 16:01:05 +0200
Subject: [Buildroot] [git commit] legacy/kernel-headers: adjust recommended
	target
Message-ID: <20160911140110.12DE6800D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a26aa9686ad457d208df3b85a39c9befa04caaa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously they were set at next available version, which is problematic
since new syscalls can be introduced.
So switch to lower available.
There's a caveat for 3.1 and 3.0 headers though since there's no lower
than 3.2, so keep it at 3.2 for those unfortunately.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d7b996c..8957be7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -366,12 +366,12 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 
 config BR2_KERNEL_HEADERS_3_17
 	bool "kernel headers version 3.17.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_18
+	select BR2_KERNEL_HEADERS_3_14
 	select BR2_LEGACY
 	help
 	  Version 3.17.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.18.x of the headers have been
+	  As an alternative, version 3.14.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_7
@@ -512,12 +512,12 @@ config BR2_PACKAGE_CUPS_PDFTOPS
 
 config BR2_KERNEL_HEADERS_3_16
 	bool "kernel headers version 3.16.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_18
+	select BR2_KERNEL_HEADERS_3_14
 	select BR2_LEGACY
 	help
 	Version 3.16.x of the Linux kernel headers have been deprecated
 	for more than four buildroot releases and are now removed.
-	As an alternative, version 3.18.x of the headers have been
+	As an alternative, version 3.14.x of the headers have been
 	automatically selected in your configuration.
 
 config BR2_PACKAGE_PYTHON_PYXML
@@ -728,32 +728,32 @@ config BR2_KERNEL_HEADERS_3_0
 
 config BR2_KERNEL_HEADERS_3_11
 	bool "kernel headers version 3.11.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_12
+	select BR2_KERNEL_HEADERS_3_10
 	select BR2_LEGACY
 	help
 	  Version 3.11.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.12.x of the headers have been
+	  As an alternative, version 3.10.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_13
 	bool "kernel headers version 3.13.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_14
+	select BR2_KERNEL_HEADERS_3_12
 	select BR2_LEGACY
 	help
 	  Version 3.13.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.14.x of the headers have been
+	  As an alternative, version 3.12.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_15
 	bool "kernel headers version 3.15.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_18
+	select BR2_KERNEL_HEADERS_3_14
 	select BR2_LEGACY
 	help
 	  Version 3.15.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.18.x of the headers have been
+	  As an alternative, version 3.14.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
@@ -1559,12 +1559,12 @@ config BR2_PACKAGE_LIBELF
 
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_10
+	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.8.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.10.x of the headers have been
+	  As an alternative, version 3.4.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_GETTEXT_TOOLS
@@ -1717,22 +1717,22 @@ config BR2_PACKAGE_EVTEST_CAPTURE
 
 config BR2_KERNEL_HEADERS_3_6
 	bool "kernel headers version 3.6.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_10
+	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.6.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.10.x of the headers have been
+	  As an alternative, version 3.4.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_7
 	bool "kernel headers version 3.7.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_10
+	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.7.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.10.x of the headers have been
+	  As an alternative, version 3.4.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_PACKAGE_VALA
@@ -1905,22 +1905,22 @@ config BR2_KERNEL_HEADERS_3_1
 
 config BR2_KERNEL_HEADERS_3_3
 	bool "kernel headers version 3.3.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_4
+	select BR2_KERNEL_HEADERS_3_2
 	select BR2_LEGACY
 	help
 	  Version 3.3.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.4.x of the headers have been
+	  As an alternative, version 3.2.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_KERNEL_HEADERS_3_5
 	bool "kernel headers version 3.5.x are no longer supported"
-	select BR2_KERNEL_HEADERS_3_10
+	select BR2_KERNEL_HEADERS_3_4
 	select BR2_LEGACY
 	help
 	  Version 3.5.x of the Linux kernel headers have been deprecated
 	  for more than four buildroot releases and are now removed.
-	  As an alternative, version 3.10.x of the headers have been
+	  As an alternative, version 3.4.x of the headers have been
 	  automatically selected in your configuration.
 
 config BR2_GDB_VERSION_7_2
