From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 15:41:54 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: add 3.11.x series
Message-ID: <1378233715-7812-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And deprecate 3.9.x series to match upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ef76733..f05111b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_10
+	default BR2_KERNEL_HEADERS_3_11
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -52,10 +52,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_11
+		bool "Linux 3.11.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 
@@ -83,5 +87,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.10"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11"		if BR2_KERNEL_HEADERS_3_11
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
