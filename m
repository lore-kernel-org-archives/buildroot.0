From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 18:26:31 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 6}.x series
Message-ID: <20200525162632.23886-1-peter@korsgaard.com>
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
index b568a362cd..4297ae9cfa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.6.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.6.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 403355d103..b70c8a8173 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  daea336aace63a9116475b3f698e259073c00bea57a2a545300dba1c45562221  linux-5.6.12.tar.xz
+sha256  33763f3541711e39fa743da45ff9512d54ade61406173f3d267ba4484cec7ea3  linux-5.6.14.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  83563f027687ecaafb41d0d2d52056f40ec9822f8a9e43592e215349730020ab  linux-5.4.40.tar.xz
+sha256  4e431b7c0266a07b76fdb77f8917ad681f0fa34ffba0eb8a172b67f7ef57bc31  linux-5.4.42.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  cd963e66d7fb07f142fa5274ec90f46c8388a327e2ba28c5fec245d734b0d425  linux-4.4.223.tar.xz
-sha256  cf5300e6f5d8c66c2bed8f00d53f9c58103731809862427012e4010f5d782ae5  linux-4.9.223.tar.xz
-sha256  444ef973d9b6a6ea174e4a9086f0aea980d8575d13302e431ad688f22e27ed0e  linux-4.14.180.tar.xz
-sha256  5050268ec5cf003d96366d1611ecfa4ab6974125d6fa26cea1ccb81dd4df00a5  linux-4.19.122.tar.xz
+sha256  ef76687254eea1a379fbbf0b2b7fdde9450608e6402822d73873a352ecf568d1  linux-4.4.224.tar.xz
+sha256  df6d07e99513f9afadd7d44c471f44c56fccc9e4c984a1ba4b988f053a13c949  linux-4.9.224.tar.xz
+sha256  ab9bea577cfe59fb2f502ce4d6130bfb49163ef969364adc3d36a65721d64a4d  linux-4.14.181.tar.xz
+sha256  d5d9001879d7a77309dca203656490326d26b068b7b0b9d8003548dba8fdad00  linux-4.19.124.tar.xz
 # Locally computed
 sha256  ea53913813cb5a9069608532b327de7a7ed0fdc8fed8c6f10cd55d1ac6a58ffb  linux-cip-4.19.118-cip25.tar.gz
 sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f64a2aeb97..62e65df2c9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,13 +334,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.223"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.223"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.180"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.122"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.40"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.224"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.224"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.181"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.124"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.42"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
-	default "5.6.12"	if BR2_KERNEL_HEADERS_5_6
+	default "5.6.14"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
