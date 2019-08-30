From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Aug 2019 19:00:53 +0200
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.2.x series
Message-ID: <20190830170053.12117-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1c8f7e5323..2bd2d859d5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 7c62819165..133a55377e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 b6f02a4b306ca5cd314d72615bfc2650166969613135da202630e6c4e1b5d4e6  linux-5.2.9.tar.xz
+sha256 0c2a831f993dc8a8a8e1ca4186b467de72ff173c6f5855e2aab70f6f7fb033f9  linux-5.2.11.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 5a1c3d60c38a7a0a086fcd6fdce5603c31c487852b1b64c071ee6de62c98a502  linux-4.19.67.tar.xz
-sha256 8c62d495444dba90200740ec770d274780b010e957cfc447f07999d717e37042  linux-4.14.139.tar.xz
-sha256 93d945661246f726b694455c80c140717d2beff5a718445a51183439bbe5d0b3  linux-4.9.189.tar.xz
-sha256 974239a3b7713de2ed46da06446cf0a87e97c871d89a87a71f3521fe84d98859  linux-4.4.189.tar.xz
+sha256 c091760b520a4e4a4c7034a8329cc2689a0ea3f81a377b694ed196d623e2d987  linux-4.19.69.tar.xz
+sha256 0bb9f0812326ec4554de1bea02628840e03b6664b5abfd9d8510049e43203a17  linux-4.14.141.tar.xz
+sha256 fe8a1ca080a462de6832762ba8b71410b828f0e52c1e11d3c46d83e9ac1e0a16  linux-4.9.190.tar.xz
+sha256 fec8c8549a3775b922cecad74a6409b33520a669d451dc51ad47d69c2543c2e5  linux-4.4.190.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c5eb1fb418..00df32f740 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.189"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.189"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.139"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.67"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.190"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.190"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.141"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.69"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.9"		if BR2_KERNEL_HEADERS_5_2
+	default "5.2.11"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
