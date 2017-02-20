From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 Feb 2017 08:43:38 -0300
Subject: [Buildroot] [PATCH 3/4] linux-headers: bump to 4.10 kernel version
In-Reply-To: <1487591019-22587-1-git-send-email-festevam@gmail.com>
References: <1487591019-22587-1-git-send-email-festevam@gmail.com>
Message-ID: <1487591019-22587-3-git-send-email-festevam@gmail.com>
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
index 6485025..8f79ed6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_9
+	default BR2_KERNEL_HEADERS_4_10
 	help
 	  Select the kernel version to get headers from.
 
@@ -67,6 +67,10 @@ choice
 		bool "Linux 4.9.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
+	config BR2_KERNEL_HEADERS_4_10
+		bool "Linux 4.10.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -87,6 +91,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10
+	bool "4.10.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9
 	bool "4.9.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -225,4 +233,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.49"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.10"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10"		if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
