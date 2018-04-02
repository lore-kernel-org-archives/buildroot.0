From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 11:39:07 +0200
Subject: [Buildroot] [PATCH 4/4] linux-headers: bump to 4.16 kernel version
In-Reply-To: <20180402093907.23274-1-bernd.kuhls@t-online.de>
References: <20180402093907.23274-1-bernd.kuhls@t-online.de>
Message-ID: <20180402093907.23274-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2a59e2902a..75f7966e51 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_15
+	default BR2_KERNEL_HEADERS_4_16
 	help
 	  Select the kernel version to get headers from.
 
@@ -67,6 +67,10 @@ config BR2_KERNEL_HEADERS_4_15
 	bool "Linux 4.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_KERNEL_HEADERS_4_16
+	bool "Linux 4.16.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -89,6 +93,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16
+	bool "4.16.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15
 	bool "4.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
@@ -250,4 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.32"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.15"	if BR2_KERNEL_HEADERS_4_15
+	default "4.16"		if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.14.2
