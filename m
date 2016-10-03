From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Oct 2016 08:14:04 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: add support for builtin 4.8
	headers
Message-ID: <1475493245-3573-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rest of the support was added in d3ac2bc6.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8353852..890fd7f 100644
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
 
@@ -86,6 +86,10 @@ choice
 		bool "Linux 4.7.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 
+	config BR2_KERNEL_HEADERS_4_8
+		bool "Linux 4.8.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -244,4 +248,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.6"		if BR2_KERNEL_HEADERS_4_7
+	default "4.8"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
