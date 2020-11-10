From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 08:39:07 +0100
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 8, 9}.x series
Message-ID: <20201117203826.EE4DE86A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=493b1d7b254a881a3eff43e818cefb3ddc917a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e8390647a..64efc20394 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.9.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4b76398c5d..a12192c137 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  3239a4ee1250bf2048be988cc8cb46c487b2c8a0de5b1b032d38394d5c6b1a06  linux-5.9.tar.xz
-sha256  ee767991808d234ad9acd17f0ba94ba7979d30c528876bee6fba337ea540f0af  linux-5.8.14.tar.xz
-sha256  c0b3d8085c5ba235df38b00b740e053659709e8a5ca21957a239f6bc22c45007  linux-5.4.70.tar.xz
+sha256  6cc182fe19a8f3958c24d453f4ab68eb73fb5cfb8af4c95b02f3db049e655370  linux-5.9.6.tar.xz
+sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
+sha256  d2466fd6eb5433e7bf287b617b11b2640c65a7ea93a57eb7a80d7f537cbc1470  linux-5.4.75.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  067814035c17e77dee84076dcc06a95eb675344cd926b7b79a16b80fee593364  linux-4.4.238.tar.xz
-sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-4.9.238.tar.xz
-sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
-sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
+sha256  32fe14f120436c927d895d3c59a37ca50c0ae3648ba3599d9cab57ffa4699214  linux-4.4.241.tar.xz
+sha256  c4c6d04f91d881e68524bda6062b5c1835f285bd03344bf8f2eaeef3394bb32c  linux-4.9.241.tar.xz
+sha256  9e832899ec75dbfce393c9f7a07df24183b28f0bb95ad4dd8b1fa027bc668ad9  linux-4.14.204.tar.xz
+sha256  cbc648f5405cb2b554b7a0f23885742d9969a11d22692287ee756adf940a48d2  linux-4.19.155.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 16af0449a5..97c30c9b3d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,13 +346,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
-	default "5.8.14"	if BR2_KERNEL_HEADERS_5_8
-	default "5.9"		if BR2_KERNEL_HEADERS_5_9
+	default "4.4.241"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.241"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.204"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.155"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.75"	if BR2_KERNEL_HEADERS_5_4
+	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
+	default "5.9.6"		if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
