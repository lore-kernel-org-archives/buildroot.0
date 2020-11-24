From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2020 20:21:42 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 9}.x series
Message-ID: <20201124192143.22195-1-peter@korsgaard.com>
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
index 434623a725..8b753e6c10 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.9.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.9.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4219c7f319..00bbf3d1cb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7656733b316562662026ac82a7c0be41440e16bbf1bdc5447b119e34ff3b86a6  linux-5.9.8.tar.xz
+sha256  5eb20a65a410669928f94b3975872e493fa6d0fe441c6a78b7564affa2a5d260  linux-5.9.11.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  a3e03e6970240dddc8174bf9f49b56d774c40125eabe1582d2ebe85b01addbf7  linux-5.4.77.tar.xz
+sha256  49da425c1f3c530fd3ff31d85a0461f6b6dc6e459f7faf3eee23e49a98ce64c7  linux-5.4.80.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  95de46b6bd72f66169629eb0e343b005778539864598eae76c3ca999645d58b5  linux-4.4.243.tar.xz
-sha256  d3aa189ca7fcc6e52d6c0333a0d7acd8789e9a492b32dbf9476e926ffaa73984  linux-4.9.243.tar.xz
-sha256  1c233efaa5063983293a02d4692acc9ced9c03e18857364855d4f612347086ac  linux-4.14.206.tar.xz
-sha256  76dca365255c1a13778c3b24f0eae14f4e66bc12fe79f5e6592b116fc57ef755  linux-4.19.157.tar.xz
+sha256  9e0bdebf18a12d0c899e5e4042e715e24a70ab0fd986a3f4c67c8ec2710bad97  linux-4.4.246.tar.xz
+sha256  49e266c7d72d388e8ce6aa486a1018cc0595ae1b9e99934bce5b484fd8dba9f5  linux-4.9.246.tar.xz
+sha256  cb02465cc8f1972cc14707b25d779c8668d220c39e68a24bb23afd4c58182b9c  linux-4.14.209.tar.xz
+sha256  18345206f9c61e8adafa5204d0ca0b8619f1d9aafd70cbd5cb0fbf1faf521585  linux-4.19.160.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8bd4449efd..2dc2457e28 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,13 +346,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.243"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.243"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.206"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.157"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.77"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.246"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.246"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.209"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.160"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.80"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
-	default "5.9.8"		if BR2_KERNEL_HEADERS_5_9
+	default "5.9.11"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
