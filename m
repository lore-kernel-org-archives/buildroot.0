From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Nov 2013 18:32:44 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3. {2, 4, 10,
	11}.x versions and add 3.12.x
Message-ID: <1383600765-16907-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 88aa7e5..2bd8b02 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_11
+	default BR2_KERNEL_HEADERS_3_12
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -60,6 +60,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_11
 		bool "Linux 3.11.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_12
+		bool "Linux 3.12.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 
@@ -78,15 +81,16 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.51"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.52"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.67"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.68"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.17"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11.6"	if BR2_KERNEL_HEADERS_3_11
+	default "3.10.18"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11.7"	if BR2_KERNEL_HEADERS_3_11
+	default "3.12"		if BR2_KERNEL_HEADERS_3_12
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
