From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 21:35:55 +0200
Subject: [Buildroot] [PATCH 2/3] linux-headers: bump to 4.18.3 kernel version
In-Reply-To: <20180819193556.28865-1-bernd.kuhls@t-online.de>
References: <20180819193556.28865-1-bernd.kuhls@t-online.de>
Message-ID: <20180819193556.28865-2-bernd.kuhls@t-online.de>
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
index 783cc7ea3a..5c01b128bc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_17
+	default BR2_KERNEL_HEADERS_4_18
 	help
 	  Select the kernel version to get headers from.
 
@@ -75,6 +75,10 @@ config BR2_KERNEL_HEADERS_4_17
 	bool "Linux 4.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 
+config BR2_KERNEL_HEADERS_4_18
+	bool "Linux 4.18.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -97,6 +101,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
+	bool "4.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17
 	bool "4.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
@@ -268,4 +276,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.17"	if BR2_KERNEL_HEADERS_4_17
+	default "4.18.3"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.18.0
