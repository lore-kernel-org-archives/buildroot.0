From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jan 2014 11:44:02 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: add 3.13.x series
Message-ID: <1390229043-22002-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2285c4d..0e4143c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_12
+	default BR2_KERNEL_HEADERS_3_13
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -63,6 +63,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_12
 		bool "Linux 3.12.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_13
+		bool "Linux 3.13.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 
@@ -92,5 +95,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.27"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.8"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13"		if BR2_KERNEL_HEADERS_3_13
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
