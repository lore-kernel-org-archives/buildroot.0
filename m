From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 10:00:24 -0300
Subject: [Buildroot] [PATCH 2/3] linux-headers: add 4.0.x series
In-Reply-To: <1428930025-25061-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428930025-25061-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428930025-25061-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1bfde7d..ec3b8b1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_19
+	default BR2_KERNEL_HEADERS_4_0
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -81,6 +81,10 @@ choice
 		bool "Linux 3.19.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 
+	config BR2_KERNEL_HEADERS_4_0
+		bool "Linux 4.0.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -102,6 +106,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
+	bool "4.0.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
 	bool "3.19.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
@@ -202,4 +210,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.11"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.3"	if BR2_KERNEL_HEADERS_3_19
+	default "4.0"		if BR2_KERNEL_HEADERS_4_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.5
