From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2020 11:28:20 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 7}.x series
Message-ID: <20200824092114.61129822A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a3711132a99406d3cdf8acca3b71a6b12f7281c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 03840f7b27..05727a88a7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -124,7 +124,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.7.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.7.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d0122d61ce..638947ac9e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4725430c65b7573b7d26c402dd9ffdad18529a302ce2e342c849e7800f193d44  linux-5.7.10.tar.xz
-sha256  faa7b6f99220d5726f0eaee74a6394f0a3b89be1a75254f3804630211f3d6d21  linux-5.4.53.tar.xz
+sha256  cc8c3611c9bdcd29266b2606ab6c3a07a32fb64fd7f1cd731100e4eddb565225  linux-5.7.17.tar.xz
+sha256  add2ab2385c40fc9a3dfebe403e56da8500b633dc7dc42cf0c670c61d151a223  linux-5.4.60.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  e7f6c63c5a3921623f1c5df32a9cd61a93a76bc543dd7d91184a4714362cd7b0  linux-4.4.231.tar.xz
-sha256  4f843ba02fda5217942225afdce020d5f2f9b24f4210bf71a7c4fb63ceece8eb  linux-4.9.231.tar.xz
-sha256  a7e521457bc553848762c201d7ec5015b043c9dc447db2553eb193701634f9e1  linux-4.14.189.tar.xz
-sha256  7d7da84f65d31546911283c36478b548bc78c4139061a7a0241feca8318e3a6f  linux-4.19.134.tar.xz
+sha256  97e689dd083d780bf7bacdc17c0a9ec9e9be118507dccedf4b77eef9666ce7fc  linux-4.4.233.tar.xz
+sha256  2a6dcab0652ab181820d56b6014235a125cf933e0edf5bdbc038160fa9e7aca5  linux-4.9.233.tar.xz
+sha256  3ea4d0221a071d58703cd346a8a6ef1582a32a8c4565a4919578817444d4fae0  linux-4.14.194.tar.xz
+sha256  a4421dea5333beeaaef81312c6f415330b9e4fda6027f399a1c55f97d3da2114  linux-4.19.141.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 41faed137b..2480fb11c0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,12 +334,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.231"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.231"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.189"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.134"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.53"	if BR2_KERNEL_HEADERS_5_4
-	default "5.7.10"	if BR2_KERNEL_HEADERS_5_7
+	default "4.4.233"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.233"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.194"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.141"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.60"	if BR2_KERNEL_HEADERS_5_4
+	default "5.7.17"	if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
