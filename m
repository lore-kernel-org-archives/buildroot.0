From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Jan 2018 20:34:55 -0200
Subject: [Buildroot] [PATCH 2/4] linux-headers: bump to 4.15 kernel version
In-Reply-To: <1517178897-5359-1-git-send-email-festevam@gmail.com>
References: <1517178897-5359-1-git-send-email-festevam@gmail.com>
Message-ID: <1517178897-5359-2-git-send-email-festevam@gmail.com>
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
index 5765e76..af00679 100644
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
-- 
2.7.4
