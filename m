From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  3 Sep 2017 19:58:32 -0300
Subject: [Buildroot] [PATCH 2/4] linux-headers: bump to 4.13 kernel version
In-Reply-To: <1504479514-30816-1-git-send-email-festevam@gmail.com>
References: <1504479514-30816-1-git-send-email-festevam@gmail.com>
Message-ID: <1504479514-30816-2-git-send-email-festevam@gmail.com>
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
index e7df0b9..5d20685 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_12
+	default BR2_KERNEL_HEADERS_4_13
 	help
 	  Select the kernel version to get headers from.
 
@@ -70,6 +70,10 @@ config BR2_KERNEL_HEADERS_4_12
 	bool "Linux 4.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
+config BR2_KERNEL_HEADERS_4_13
+	bool "Linux 4.13.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -92,6 +96,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13
+	bool "4.13.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12
 	bool "4.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
@@ -241,4 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.10"	if BR2_KERNEL_HEADERS_4_12
+	default "4.13"		if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
