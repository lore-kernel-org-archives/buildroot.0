From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Oct 2014 14:29:24 -0300
Subject: [Buildroot] [PATCH 3/3] kernel headers: remove deprecated version
	3.9
In-Reply-To: <1414690164-24718-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414690164-24718-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414690164-24718-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Deprecate 3.9.x headers for the 2014.11 release, a year has passed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b363cdc..5bb7170 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -27,11 +27,6 @@ choice
 		depends on !BR2_arc
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
-	config BR2_KERNEL_HEADERS_3_9
-		bool "Linux 3.9.x kernel headers"
-		depends on BR2_DEPRECATED_SINCE_2013_11
-		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
@@ -170,7 +165,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.104"	if BR2_KERNEL_HEADERS_3_4
-	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.59"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.31"	if BR2_KERNEL_HEADERS_3_12
-- 
2.0.4
