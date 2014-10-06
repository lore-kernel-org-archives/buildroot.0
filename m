From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 08:44:40 -0300
Subject: [Buildroot] [PATCH 3/4] linux-headers: add 3.17.x series
In-Reply-To: <1412595881-13831-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412595881-13831-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412595881-13831-3-git-send-email-gustavo@zacarias.com.ar>
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
index 31c8861..ac8dbfb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_16
+	default BR2_KERNEL_HEADERS_3_17
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -63,6 +63,10 @@ choice
 		bool "Linux 3.16.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
+	config BR2_KERNEL_HEADERS_3_17
+		bool "Linux 3.17.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -84,6 +88,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17
+	bool "3.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
 	bool "3.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
@@ -170,4 +178,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.14.20"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.4"	if BR2_KERNEL_HEADERS_3_16
+	default "3.17"		if BR2_KERNEL_HEADERS_3_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.4
