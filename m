From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 14:28:13 +0100
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 9}.x series
Message-ID: <20201117203828.E77FF7FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b817d8c8e013c8f1d5263bb68641d2f1ba383ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Including the fix for CVE-2020-8694:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b6c4491b35..434623a725 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.9.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.9.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7f6d8cb2cb..4219c7f319 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  6cc182fe19a8f3958c24d453f4ab68eb73fb5cfb8af4c95b02f3db049e655370  linux-5.9.6.tar.xz
+sha256  7656733b316562662026ac82a7c0be41440e16bbf1bdc5447b119e34ff3b86a6  linux-5.9.8.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
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
index 97c30c9b3d..8bd4449efd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,13 +346,13 @@ endchoice
 
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
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
-	default "5.9.6"		if BR2_KERNEL_HEADERS_5_9
+	default "5.9.8"		if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
