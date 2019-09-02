From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:19:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190902161740.469568A409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96c1d008296a842f2ddc21f29c77546a6287de40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.2.x bump]
(cherry picked from commit b6255a16eefff3b79fe2ebbbc6eb54e19af163b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     |  8 ++++----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 095f145bfb..68ffd54c05 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.67" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.69" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 4b029733f7..8a405dab3f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 5a1c3d60c38a7a0a086fcd6fdce5603c31c487852b1b64c071ee6de62c98a502  linux-4.19.67.tar.xz
-sha256 8c62d495444dba90200740ec770d274780b010e957cfc447f07999d717e37042  linux-4.14.139.tar.xz
-sha256 93d945661246f726b694455c80c140717d2beff5a718445a51183439bbe5d0b3  linux-4.9.189.tar.xz
-sha256 974239a3b7713de2ed46da06446cf0a87e97c871d89a87a71f3521fe84d98859  linux-4.4.189.tar.xz
+sha256 c091760b520a4e4a4c7034a8329cc2689a0ea3f81a377b694ed196d623e2d987  linux-4.19.69.tar.xz
+sha256 0bb9f0812326ec4554de1bea02628840e03b6664b5abfd9d8510049e43203a17  linux-4.14.141.tar.xz
+sha256 fe8a1ca080a462de6832762ba8b71410b828f0e52c1e11d3c46d83e9ac1e0a16  linux-4.9.190.tar.xz
+sha256 fec8c8549a3775b922cecad74a6409b33520a669d451dc51ad47d69c2543c2e5  linux-4.4.190.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a3d14fd2a2..2a408dc33c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.189"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.189"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.139"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.67"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.190"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.190"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.141"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.69"	if BR2_KERNEL_HEADERS_4_19
+ 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
