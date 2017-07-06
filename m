From: Joel Stanley <joel@jms.id.au>
Date: Thu,  6 Jul 2017 14:26:15 +0930
Subject: [Buildroot] [PATCH 1/3] linux-headers: bump to 4.12 kernel version
Message-ID: <20170706045617.12847-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index be0799bc5ddb..ab49b6087cd0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_11
+	default BR2_KERNEL_HEADERS_4_12
 	help
 	  Select the kernel version to get headers from.
 
@@ -66,6 +66,10 @@ config BR2_KERNEL_HEADERS_4_11
 	bool "Linux 4.11.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 
+config BR2_KERNEL_HEADERS_4_12
+	bool "Linux 4.12.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -87,6 +91,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12
+	bool "4.12.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11
 	bool "4.11.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
@@ -231,4 +239,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.9"	if BR2_KERNEL_HEADERS_4_11
+	default "4.12"		if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.13.2
