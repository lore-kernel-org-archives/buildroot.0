From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 21:51:24 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14, 19,
 20}.x series
Message-ID: <20190117205125.17810-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8aeb4bdec3..1a50958ea1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index c8401d4ec6..9770bcd3da 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 45096f1ffbfbb4cdeef6eecfa6ca7eabbf534f04645fd0d849564a58ddd2198f  linux-4.20.1.tar.xz
-sha256 24326849dd5120186d8db165ad4410bf0eb28ef07a20141acbad49f125f71c46  linux-4.19.14.tar.xz
-sha256 5f9f1faba9a47e406de9b207d45a00d41d45e11615971ec9ef9493654cd745ad  linux-4.14.92.tar.xz
-sha256 165bd3b42e8f99e62238f711d2c0100ad411bc69588c65fb3a22c190dc35d783  linux-4.9.149.tar.xz
-sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
+sha256 b9c1bd128404a8e73b57f764256fcaca8eb09f9a892e292856dbeffafa187f45  linux-4.20.3.tar.xz
+sha256 d8a088381fe3e7e5484c060dabcdda4b053ef7114f91cfd56db003a89bb11bdf  linux-4.19.16.tar.xz
+sha256 e728518bb024209acc222e803cdc00d0ea2b1f4ebf28a8ed17a639171a1c23f1  linux-4.14.94.tar.xz
+sha256 15965595807e4dce34da951a806af9928b60c19d3f40773de43f606f14ed425c  linux-4.9.151.tar.xz
+sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 494d52662d..88373aee6f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.149"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.92"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.14"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.1"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.151"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.94"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.16"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.3"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
