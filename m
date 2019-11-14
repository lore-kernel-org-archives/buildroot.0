From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Nov 2019 18:58:35 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.3.x series
Message-ID: <20191114175835.32702-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3794ff00cf..a78a1761c9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index c29f7c23e8..79de759161 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 d72579aa732edd0e25779adfc43e68a53f77e80020c4aab5db2f5b28c247e98a  linux-5.3.9.tar.xz
+sha256 6e7156946d1d72e24786d09a47511e44c3abe5d4da757f4f68f2da482880aeb7  linux-5.3.11.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 58d96d6c2c5ee8288fe9714891e4037a18f457b008e369e33fc744afc2cb595d  linux-4.19.82.tar.xz
-sha256 a9239fd9d341aae07b48a8e7a2afd528fe5cde2617d783454c71e6f3dae2b0aa  linux-4.14.152.tar.xz
-sha256 0f2531f0908e320ee49954e8d84406db659073b202abc514bcc999ceaa3f7ed5  linux-4.9.199.tar.xz
-sha256 1739b0991407c94b328ceab27d77f25a1a3ae03367e8b800e5964a99789165f0  linux-4.4.199.tar.xz
+sha256 868b4a92619cb00ab142a20a67f000525b9605820d1b66faa4a183133eac0660  linux-4.19.84.tar.xz
+sha256 86de4a24379a78d67fc08b2e249ccf7b689eb6c37fbe329fc3dfbe8ab4300603  linux-4.14.154.tar.xz
+sha256 383fd43bd35251636232912ad52fbc844e3c8ab792cadb62b4aefe000bacbd88  linux-4.9.201.tar.xz
+sha256 a78a85c4fb0c0835b01933765c984ab5ab190eac1d521338fb88b03a49641388  linux-4.4.201.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3680d6771f..3c232b3218 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,11 +305,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.199"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.199"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.152"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.82"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.9"		if BR2_KERNEL_HEADERS_5_3
+	default "4.4.201"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.201"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.154"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.84"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.11"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
