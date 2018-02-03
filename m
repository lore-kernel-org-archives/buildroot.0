From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 00:02:35 +0100
Subject: [Buildroot] [git commit] linux-headers: drop old unsupported 3.x
 versions
Message-ID: <20180203230433.92A5E84356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a9b7b8a1ec0f200c6b82641512325284dee9a54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These versions are very old and no longer supported according to
https://www.kernel.org/category/releases.html, so drop them and add legacy
entries.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 30 ++++++++++++++++++++++++++++++
 package/linux-headers/Config.in.host | 18 ------------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fd8505b167..60f9148234 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,36 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_KERNEL_HEADERS_3_4
+	bool "kernel headers version 3.4.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 3.4.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.1.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_10
+	bool "kernel headers version 3.10.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 3.10.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.1.x of the headers have been automatically
+	  selected in your configuration.
+
+config BR2_KERNEL_HEADERS_3_12
+	bool "kernel headers version 3.12.x are no longer supported"
+	select BR2_KERNEL_HEADERS_4_1
+	select BR2_LEGACY
+	help
+	  Version 3.12.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed. As an alternative,
+	  version 4.1.x of the headers have been automatically
+	  selected in your configuration.
+
 config BR2_BINUTILS_VERSION_2_27_X
 	bool "binutils version 2.27 support removed"
 	select BR2_LEGACY
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e0f97f3b5e..069e31de24 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -31,21 +31,6 @@ config BR2_KERNEL_HEADERS_3_2
 	depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
-config BR2_KERNEL_HEADERS_3_4
-	bool "Linux 3.4.x kernel headers"
-	depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-config BR2_KERNEL_HEADERS_3_10
-	bool "Linux 3.10.x kernel headers"
-	depends on !BR2_nios2
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-
-config BR2_KERNEL_HEADERS_3_12
-	bool "Linux 3.12.x kernel headers"
-	depends on !BR2_nios2
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-
 config BR2_KERNEL_HEADERS_4_1
 	bool "Linux 4.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
@@ -256,9 +241,6 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.115"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.80"	if BR2_KERNEL_HEADERS_4_9
