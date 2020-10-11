From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:13:51 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x / 5.{4,
 8}.x series
Message-ID: <20201011171351.6351-1-peter@korsgaard.com>
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
index 5bd3cdb59b..309abb9fc6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.8.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.8.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b1bd51e668..ccb8d7fa4c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f25936177edd183dd0645dce1d81873bcfc0bab1ff1586df75d95cd12723320d  linux-5.8.13.tar.xz
-sha256  a8b31d716b397303a183e42ad525ff2871024a43e3ea530d0fdf73b7f9d27da7  linux-5.4.69.tar.xz
+sha256  ee767991808d234ad9acd17f0ba94ba7979d30c528876bee6fba337ea540f0af  linux-5.8.14.tar.xz
+sha256  c0b3d8085c5ba235df38b00b740e053659709e8a5ca21957a239f6bc22c45007  linux-5.4.70.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  067814035c17e77dee84076dcc06a95eb675344cd926b7b79a16b80fee593364  linux-4.4.238.tar.xz
 sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-4.9.238.tar.xz
 sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
-sha256  d9cdcb9a66942a56b91c8d4b273d15a3c5b8e59fad44b79e03362cfffaa62a00  linux-4.19.149.tar.xz
+sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1fe7d05da0..dacd3f86ea 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -341,9 +341,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.149"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.69"	if BR2_KERNEL_HEADERS_5_4
-	default "5.8.13"	if BR2_KERNEL_HEADERS_5_8
+	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
+	default "5.8.14"	if BR2_KERNEL_HEADERS_5_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
