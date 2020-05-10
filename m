From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 23:10:39 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 6}.x series
Message-ID: <20200510211040.17102-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 462864611f..b568a362cd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.6.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.6.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ba48943d38..403355d103 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  23a0420f29eacb66d71f86f64fbd35a1b6ff617d520e3e05f3e1f537d46692ca  linux-5.6.7.tar.xz
+sha256  daea336aace63a9116475b3f698e259073c00bea57a2a545300dba1c45562221  linux-5.6.12.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  e16bd5f7284a80a41328bf712e1136b0adf5b71cc0bd263efa7cac75539806d4  linux-5.4.35.tar.xz
+sha256  83563f027687ecaafb41d0d2d52056f40ec9822f8a9e43592e215349730020ab  linux-5.4.40.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  4e98b51c2e3a8fd069dc941b9cb68594f84ea767c2927e93255e1151c5c2fdd6  linux-4.4.219.tar.xz
-sha256  6b17238cced3e1c2753d6d5b4f662bd347d4651f07c35506b849eb10aea7bc44  linux-4.9.219.tar.xz
-sha256  bcae0956baaeb55dab5bad0401873fbc5baaa7fbe957ea6d27a5ab241cec5ca2  linux-4.14.176.tar.xz
-sha256  89749365f9dafa6c62cc5e920a7e532ed4aad9ab766fb436423b153ffbc08c96  linux-4.19.118.tar.xz
+sha256  cd963e66d7fb07f142fa5274ec90f46c8388a327e2ba28c5fec245d734b0d425  linux-4.4.223.tar.xz
+sha256  cf5300e6f5d8c66c2bed8f00d53f9c58103731809862427012e4010f5d782ae5  linux-4.9.223.tar.xz
+sha256  444ef973d9b6a6ea174e4a9086f0aea980d8575d13302e431ad688f22e27ed0e  linux-4.14.180.tar.xz
+sha256  5050268ec5cf003d96366d1611ecfa4ab6974125d6fa26cea1ccb81dd4df00a5  linux-4.19.122.tar.xz
 # Locally computed
 sha256  ea53913813cb5a9069608532b327de7a7ed0fdc8fed8c6f10cd55d1ac6a58ffb  linux-cip-4.19.118-cip25.tar.gz
 sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c6ba8469fd..f64a2aeb97 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,13 +334,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.219"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.219"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.176"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.118"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.35"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.223"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.223"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.180"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.122"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.40"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
-	default "5.6.7"		if BR2_KERNEL_HEADERS_5_6
+	default "5.6.12"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
