From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 10 Feb 2015 06:19:08 -0300
Subject: [Buildroot] [PATCH] linux-headers: add 3.19.x series
Message-ID: <1423559948-18524-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/linux-headers/Config.in.host | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2755f2f..c07b7a4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -67,6 +67,10 @@ choice
 		bool "Linux 3.18.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
+	config BR2_KERNEL_HEADERS_3_19
+		bool "Linux 3.19.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -88,6 +92,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
+	bool "3.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
 	bool "3.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
@@ -183,4 +191,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.6"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19"		if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.2.1
