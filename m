From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jul 2013 15:31:35 -0300
Subject: [Buildroot] [PATCH 2/3] linux-headers: add 3.10.x series
In-Reply-To: <1372962696-20775-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372962696-20775-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372962696-20775-2-git-send-email-gustavo@zacarias.com.ar>
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
index 4955524..8431b2d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,7 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_9
+	default BR2_KERNEL_HEADERS_3_10
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -53,6 +53,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_10
+		bool "Linux 3.10.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 
@@ -79,5 +82,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.9"		if BR2_KERNEL_HEADERS_3_9
+	default "3.10"		if BR2_KERNEL_HEADERS_3_10
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
