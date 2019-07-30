From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:27:00 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{1, 2}.x series
Message-ID: <20190730155429.52D2E82818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb60af60022fc4448934e0f30e8307718ea853d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7ed61d1923..871141fdcd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 009e9bd7c5..1bb374629e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 54ad66f672e1a831b574f5e704e8a05f1e6180a8245d4bdd811208a6cb0ac1e7  linux-5.2.tar.xz
-sha256 8a3e55be3e788700836db6f75875b4d3b824a581d1eacfc2fcd29ed4e727ba3e  linux-5.1.16.tar.xz
+sha256 b1cd8b9e0bfe7afb2fdf3915605db3a6cd3fe098833f9bc0b37aae74b057ee43  linux-5.2.4.tar.xz
+sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 327c5759d5888361d6c9d6adb0c8ad7e3c624eb05bb9e5869d9f3078dd0d3f87  linux-4.19.57.tar.xz
-sha256 da86f39a722da656fce4e2685223093b5d5f4db94046fcd79e492428a82ff330  linux-4.14.132.tar.xz
-sha256 6543232fc082485c1088830b9456e1a6e511239e4bf98817b0166ee62cafc3ca  linux-4.4.184.tar.xz
-sha256 033114d5350525dede995d31b596c31b0e26db8d77a0a1c53d36cdc36ead9faf  linux-4.9.184.tar.xz
+sha256 07be647189ced7eb8ba5ee769906e67919975772184842cc517f609df50cdadc  linux-4.19.62.tar.xz
+sha256 0b21e7b5effd92303a551b5be2380c9703d6fb87cfe5189fe0d795cc73903d2d  linux-4.14.134.tar.xz
+sha256 242484430d0729791d8efd92181b7d34b4021050646c6e00cf459866eab94b6a  linux-4.9.186.tar.xz
+sha256 0b1273d35c0664234e069f1ba894161b466679f6e1053f44fcf4098290937984  linux-4.4.186.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e003de090e..cabdb7f209 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.184"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.184"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.132"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.57"	if BR2_KERNEL_HEADERS_4_19
-	default "5.1.16"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2"		if BR2_KERNEL_HEADERS_5_2
+	default "4.4.186"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.186"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.134"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.62"	if BR2_KERNEL_HEADERS_4_19
+	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
+	default "5.2.4"		if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
