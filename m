From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jun 2014 08:30:34 -0300
Subject: [Buildroot] [PATCH 2/3] linux-headers: add 3.15.x series
In-Reply-To: <1402313435-9013-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402313435-9013-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402313435-9013-2-git-send-email-gustavo@zacarias.com.ar>
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
index d22b1ce..8b55954 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_14
+	default BR2_KERNEL_HEADERS_3_15
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -56,6 +56,10 @@ choice
 		bool "Linux 3.14.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
+	config BR2_KERNEL_HEADERS_3_15
+		bool "Linux 3.15.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -77,6 +81,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
+	bool "3.15.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
 	bool "3.14.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
@@ -154,4 +162,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.21"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.6"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15"		if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
