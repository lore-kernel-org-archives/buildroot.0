From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  8 Jun 2013 09:11:56 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.{0, 2, 4,
	9}.x stable version
Message-ID: <1370693517-24002-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And mark 3.8.x series as deprecated to match upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                             | 10 +++++-----
 ...headers_install-fix-__packed-in-exported-kernel-head.patch} |  0
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.80-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.81-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1bb9c02..77da947 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -49,7 +49,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
-		depends on !BR2_arc
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
@@ -70,15 +70,15 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.80"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.81"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.44"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.45"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.47"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.48"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
-	default "3.9.4"		if BR2_KERNEL_HEADERS_3_9
+	default "3.9.5"		if BR2_KERNEL_HEADERS_3_9
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.80-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.81-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.80-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.81-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.8.1.5
