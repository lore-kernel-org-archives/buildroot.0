From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 07:21:48 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.2.x stable version
	and add 3.3
Message-ID: <1332152509-26953-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 75c13cc..c9ec72c 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_2
+	default BR2_KERNEL_HEADERS_3_3
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -39,6 +39,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_3
+		bool "Linux 3.3.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -62,6 +65,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.24"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.10"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.11"	if BR2_KERNEL_HEADERS_3_2
+	default "3.3"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4
