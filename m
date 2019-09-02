From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:34 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190902161338.817678A2E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=195ad1db0a1f0707b05fe38330b89946bf81bb5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.x bump]
(cherry picked from commit bd30a142c8b9dae5814af110f51096da47e6b124)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index dcb517c84b..ed24cb7f92 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.21" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 598ce3055b..aafa7ec5c1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 07be647189ced7eb8ba5ee769906e67919975772184842cc517f609df50cdadc  linux-4.19.62.tar.xz
-sha256 0b21e7b5effd92303a551b5be2380c9703d6fb87cfe5189fe0d795cc73903d2d  linux-4.14.134.tar.xz
-sha256 242484430d0729791d8efd92181b7d34b4021050646c6e00cf459866eab94b6a  linux-4.9.186.tar.xz
-sha256 0b1273d35c0664234e069f1ba894161b466679f6e1053f44fcf4098290937984  linux-4.4.186.tar.xz
+sha256 5a1c3d60c38a7a0a086fcd6fdce5603c31c487852b1b64c071ee6de62c98a502  linux-4.19.67.tar.xz
+sha256 8c62d495444dba90200740ec770d274780b010e957cfc447f07999d717e37042  linux-4.14.139.tar.xz
+sha256 93d945661246f726b694455c80c140717d2beff5a718445a51183439bbe5d0b3  linux-4.9.189.tar.xz
+sha256 974239a3b7713de2ed46da06446cf0a87e97c871d89a87a71f3521fe84d98859  linux-4.4.189.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d3b17b9559..16ca3ae665 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,10 +297,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.186"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.186"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.134"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.62"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.189"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.189"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.139"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.67"	if BR2_KERNEL_HEADERS_4_19
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
