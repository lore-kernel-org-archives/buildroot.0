From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 15:05:10 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 9}.x series
Message-ID: <20201116141842.08FEF864DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68b7d6f6e175f95c6b3e5627a99766b8bf990eca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Including the fix for CVE-2020-8694:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b817d8c8e013c8f1d5263bb68641d2f1ba383ec)
[Peter: drop 5.9.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 545b8a4f62..178a121d93 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.75" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.77" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 43f7fc9ad6..3490cf7b86 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d2466fd6eb5433e7bf287b617b11b2640c65a7ea93a57eb7a80d7f537cbc1470  linux-5.4.75.tar.xz
+sha256  a3e03e6970240dddc8174bf9f49b56d774c40125eabe1582d2ebe85b01addbf7  linux-5.4.77.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  32fe14f120436c927d895d3c59a37ca50c0ae3648ba3599d9cab57ffa4699214  linux-4.4.241.tar.xz
-sha256  c4c6d04f91d881e68524bda6062b5c1835f285bd03344bf8f2eaeef3394bb32c  linux-4.9.241.tar.xz
-sha256  9e832899ec75dbfce393c9f7a07df24183b28f0bb95ad4dd8b1fa027bc668ad9  linux-4.14.204.tar.xz
-sha256  cbc648f5405cb2b554b7a0f23885742d9969a11d22692287ee756adf940a48d2  linux-4.19.155.tar.xz
+sha256  95de46b6bd72f66169629eb0e343b005778539864598eae76c3ca999645d58b5  linux-4.4.243.tar.xz
+sha256  d3aa189ca7fcc6e52d6c0333a0d7acd8789e9a492b32dbf9476e926ffaa73984  linux-4.9.243.tar.xz
+sha256  1c233efaa5063983293a02d4692acc9ced9c03e18857364855d4f612347086ac  linux-4.14.206.tar.xz
+sha256  76dca365255c1a13778c3b24f0eae14f4e66bc12fe79f5e6592b116fc57ef755  linux-4.19.157.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dd95b9a173..30796ad483 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.241"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.241"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.204"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.155"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.75"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.243"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.243"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.206"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.157"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.77"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
