From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 20:54:44 +0200
Subject: [Buildroot] [git commit] linux-header: bump to 4.11 kernel version
Message-ID: <20170501185525.093AC7FE01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00f367cc2a34fa067f88535ed7d25286f51c9462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c67626..b1ef3d6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_10
+	default BR2_KERNEL_HEADERS_4_11
 	help
 	  Select the kernel version to get headers from.
 
@@ -62,6 +62,10 @@ config BR2_KERNEL_HEADERS_4_10
 	bool "Linux 4.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 
+config BR2_KERNEL_HEADERS_4_11
+	bool "Linux 4.11.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -83,6 +87,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11
+	bool "4.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10
 	bool "4.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
@@ -222,4 +230,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.64"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
+	default "4.11"		if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
