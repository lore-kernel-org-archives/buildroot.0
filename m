From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 23:48:29 +0100
Subject: [Buildroot] [git commit] linux-headers: bump to 4.15 kernel version
Message-ID: <20180128225534.C7A1B85E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79df9ad59912eac38d5a7fe5a5dd4f11314a138e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5765e76f59..af00679ca7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_14
+	default BR2_KERNEL_HEADERS_4_15
 	help
 	  Select the kernel version to get headers from.
 
@@ -78,6 +78,10 @@ config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
+config BR2_KERNEL_HEADERS_4_15
+	bool "Linux 4.15.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -100,6 +104,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15
+	bool "4.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14
 	bool "4.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
@@ -259,4 +267,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.15"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15"		if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
