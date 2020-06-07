From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2020 21:58:04 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 6, 7}.x series
Message-ID: <20200607200416.5C252818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8db0c3472bd4f97671fa65f8d2bda755cab5daa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2af3a00352..26ff0e9ea7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6462de8465..6cd249a281 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  de8163bb62f822d84f7a3983574ec460060bf013a78ff79cd7c979ff1ec1d7e0  linux-5.7.tar.xz
-sha256  65ab799393d490463c610270634874dfcb66440a312837d04b51bbb69323034e  linux-5.6.15.tar.xz
+sha256  40d318add8cefe3fdb26f19dac7386f5e7b63854ae021e593466902856ce9ded  linux-5.7.1.tar.xz
+sha256  25504b4de7baf912071d1ed40b13af0689305442b9dea9218fd096d8bd997cf7  linux-5.6.16.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  2667b90a42d42557aca9e3d37bba1b4e71809b9523958e6870ada311c4790744  linux-5.4.43.tar.xz
+sha256  103f039f34a9009c42ea643b4f473bda6bb9607d5ad7f63b56b3e2351615fe2e  linux-5.4.45.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  49474956a6149c16cbcba862d1f4db54835a32d336063c75094f669f1c34c65e  linux-4.4.225.tar.xz
-sha256  e547748c548b0f55f665bc78cfec322e7b96f41527b5e4b5d79430fdaa57c3e8  linux-4.9.225.tar.xz
-sha256  671d1f1d5ad0ae74fb21ee70a5544400e7d6270098d3f8b134484ded2c3e5b90  linux-4.14.182.tar.xz
-sha256  9843f40efb37491770688810d153d0779daed8eb097773a0de5abf2cb0d1bd7e  linux-4.19.125.tar.xz
+sha256  418299385195f09b27e371a35f305f3aff148e7557a341b53460091303aa9bb7  linux-4.4.226.tar.xz
+sha256  460a8c168fe5c60ce5b30015a4e4bf348d93a89f8b949de1f90779567ef345ca  linux-4.9.226.tar.xz
+sha256  4265afef56819b04656107a5abecde205c5bc5fb04b2e81447955e7e45db8085  linux-4.14.183.tar.xz
+sha256  82af886bc588b5c8d7474beb2bac13810ee3ed07da356a2553c81ae8e52e586f  linux-4.19.127.tar.xz
 # Locally computed
 sha256  ea53913813cb5a9069608532b327de7a7ed0fdc8fed8c6f10cd55d1ac6a58ffb  linux-cip-4.19.118-cip25.tar.gz
 sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2982f6374e..14cce317e3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -342,14 +342,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.225"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.225"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.182"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.125"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.43"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.226"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.226"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.183"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.127"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.45"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
-	default "5.6.15"	if BR2_KERNEL_HEADERS_5_6
-	default "5.7"		if BR2_KERNEL_HEADERS_5_7
+	default "5.6.16"	if BR2_KERNEL_HEADERS_5_6
+	default "5.7.1"		if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
