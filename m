From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 May 2016 08:55:06 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: add 4.6.x series
In-Reply-To: <1463399706-6220-1-git-send-email-festevam@gmail.com>
References: <1463399706-6220-1-git-send-email-festevam@gmail.com>
Message-ID: <1463399706-6220-2-git-send-email-festevam@gmail.com>
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
index 04d5890..cc0ab41 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_5
+	default BR2_KERNEL_HEADERS_4_6
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -78,6 +78,10 @@ choice
 		bool "Linux 4.5.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+	config BR2_KERNEL_HEADERS_4_6
+		bool "Linux 4.6.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -99,6 +103,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6
+	bool "4.6.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
 	bool "4.5.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
@@ -223,4 +231,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.9"		if BR2_KERNEL_HEADERS_4_4
 	default "4.5.3"		if BR2_KERNEL_HEADERS_4_5
+	default "4.6"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
