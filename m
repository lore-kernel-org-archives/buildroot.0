From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:20:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 8}.x series
Message-ID: <20201012081021.C67658F12B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5e83d08eeb212e314392334b47adcaf2de38e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4dbae8ed2c0161caecf6ccfd5fe288e1517550ac)
[Peter: drop 5.8.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a645995b84..f83474e1ee 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.69" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.70" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fbd4704b59..b2eccb38e6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a8b31d716b397303a183e42ad525ff2871024a43e3ea530d0fdf73b7f9d27da7  linux-5.4.69.tar.xz
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
index cb6e58e6f1..87a72af6e1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -321,8 +321,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.149"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.69"	if BR2_KERNEL_HEADERS_5_4
+	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
