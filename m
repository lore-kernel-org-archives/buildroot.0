From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:06:47 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 7}.x series
Message-ID: <20200731071036.D9386839D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38f4587997585d21d0a235e1c512427412734572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 72f004335c..03840f7b27 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -124,7 +124,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.7.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 1faf2f904b..d0122d61ce 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  40d318add8cefe3fdb26f19dac7386f5e7b63854ae021e593466902856ce9ded  linux-5.7.1.tar.xz
-sha256  103f039f34a9009c42ea643b4f473bda6bb9607d5ad7f63b56b3e2351615fe2e  linux-5.4.45.tar.xz
+sha256  4725430c65b7573b7d26c402dd9ffdad18529a302ce2e342c849e7800f193d44  linux-5.7.10.tar.xz
+sha256  faa7b6f99220d5726f0eaee74a6394f0a3b89be1a75254f3804630211f3d6d21  linux-5.4.53.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  418299385195f09b27e371a35f305f3aff148e7557a341b53460091303aa9bb7  linux-4.4.226.tar.xz
-sha256  460a8c168fe5c60ce5b30015a4e4bf348d93a89f8b949de1f90779567ef345ca  linux-4.9.226.tar.xz
-sha256  4265afef56819b04656107a5abecde205c5bc5fb04b2e81447955e7e45db8085  linux-4.14.183.tar.xz
-sha256  82af886bc588b5c8d7474beb2bac13810ee3ed07da356a2553c81ae8e52e586f  linux-4.19.127.tar.xz
+sha256  e7f6c63c5a3921623f1c5df32a9cd61a93a76bc543dd7d91184a4714362cd7b0  linux-4.4.231.tar.xz
+sha256  4f843ba02fda5217942225afdce020d5f2f9b24f4210bf71a7c4fb63ceece8eb  linux-4.9.231.tar.xz
+sha256  a7e521457bc553848762c201d7ec5015b043c9dc447db2553eb193701634f9e1  linux-4.14.189.tar.xz
+sha256  7d7da84f65d31546911283c36478b548bc78c4139061a7a0241feca8318e3a6f  linux-4.19.134.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3b040a8876..41faed137b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,12 +334,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.226"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.226"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.183"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.127"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.45"	if BR2_KERNEL_HEADERS_5_4
-	default "5.7.1"		if BR2_KERNEL_HEADERS_5_7
+	default "4.4.231"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.231"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.189"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.134"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.53"	if BR2_KERNEL_HEADERS_5_4
+	default "5.7.10"	if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
