From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Aug 2019 09:12:18 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.2.x series
Message-ID: <20190802071218.15705-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e275b8ad4f..544f6bff3d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 1bb374629e..33e708fb57 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 b1cd8b9e0bfe7afb2fdf3915605db3a6cd3fe098833f9bc0b37aae74b057ee43  linux-5.2.4.tar.xz
+sha256 c645402843f90a69426975f8923923dfc6edebb5d1bc0092560ffb7135d3cd96  linux-5.2.5.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 07be647189ced7eb8ba5ee769906e67919975772184842cc517f609df50cdadc  linux-4.19.62.tar.xz
-sha256 0b21e7b5effd92303a551b5be2380c9703d6fb87cfe5189fe0d795cc73903d2d  linux-4.14.134.tar.xz
+sha256 75988760b931864b46292dcfad1dd54b3f4da10168041f48ca6d7f6dd4e5d25d  linux-4.19.63.tar.xz
+sha256 429121e27971597044fb9efa19d25dcad76f5ef5c4e2d5270e674948e4055b74  linux-4.14.135.tar.xz
 sha256 242484430d0729791d8efd92181b7d34b4021050646c6e00cf459866eab94b6a  linux-4.9.186.tar.xz
 sha256 0b1273d35c0664234e069f1ba894161b466679f6e1053f44fcf4098290937984  linux-4.4.186.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cabdb7f209..d677468a3d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -307,10 +307,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.186"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.186"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.134"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.62"	if BR2_KERNEL_HEADERS_4_19
+	default "4.14.135"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.63"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.4"		if BR2_KERNEL_HEADERS_5_2
+	default "5.2.5"		if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
