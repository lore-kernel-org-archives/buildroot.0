From: marcus.osdoba at googlemail.com <marcus.osdoba@googlemail.com>
Date: Sat,  4 Sep 2010 16:02:41 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable
Message-ID: <1283608961-5802-1-git-send-email-Marcus.Osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Osdoba <marcus.osdoba@googlemail.com>

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 toolchain/kernel-headers/Config.in |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e60595f..de8ea01 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,6 +45,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_34
 		bool "Linux 2.6.34.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_35
+		bool "Linux 2.6.35.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -61,13 +64,14 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.27.50"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.53"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.18"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.21"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.3"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.34.6"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.35.4"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.1
