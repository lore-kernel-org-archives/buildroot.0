From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Dec 2016 19:43:35 -0200
Subject: [Buildroot] [PATCH 1/3] linux-headers: bump to 4.9 kernel version
Message-ID: <1481492617-23250-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index da17068..18d7cd0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_8
+	default BR2_KERNEL_HEADERS_4_9
 	help
 	  Select the kernel version to get headers from.
 
@@ -80,6 +80,10 @@ choice
 		bool "Linux 4.8.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 
+	config BR2_KERNEL_HEADERS_4_9
+		bool "Linux 4.9.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -100,6 +104,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9
+	bool "4.9.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8
 	bool "4.8.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
@@ -237,4 +245,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
 	default "4.8.13"	if BR2_KERNEL_HEADERS_4_8
+	default "4.9"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
