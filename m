From: Fabio Estevam <festevam@gmail.com>
Date: Fri,  9 Sep 2016 14:18:16 -0300
Subject: [Buildroot] [PATCH 3/4] linux-headers: bump default to version
	4.8-rc5
In-Reply-To: <1473441497-29986-1-git-send-email-festevam@gmail.com>
References: <1473441497-29986-1-git-send-email-festevam@gmail.com>
Message-ID: <1473441497-29986-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d8f030..cf03119 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_7
+	default BR2_KERNEL_HEADERS_4_8
 	help
 	  Select the kernel version to get headers from.
 
@@ -96,6 +96,10 @@ choice
 		bool "Linux 4.7.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 
+	config BR2_KERNEL_HEADERS_4_8
+		bool "Linux 4.8-rc kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -116,6 +120,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8
+	bool "4.8.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7
 	bool "4.7.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
@@ -250,4 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.3"		if BR2_KERNEL_HEADERS_4_7
+	default "4.8-rc5"	if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
