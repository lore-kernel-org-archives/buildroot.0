From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 23:52:23 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 5.{4, 9,
 10}.x series
Message-ID: <20201227225223.15240-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fd6174747e..92b0543515 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 83bc3b851d..cb702146bd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
-sha256  39fcfb41dcdf71b6b42b88eff3d8cedbe7523830ccae847f3914c0b97e1e6b49  linux-5.9.14.tar.xz
-sha256  beec970bbb93de8ab839f27930f7ab00c7bd65af0ffa07a50e765affdc2561c6  linux-5.4.83.tar.xz
+sha256  f9153333e5ce60c9cd9a501fbcb342ba6032b8fdb2cb492115c5595712a19525  linux-5.10.3.tar.xz
+sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
+sha256  1de3586d8e7a9a814726610745d80907a267590d2770ec1079ef2875c4984008  linux-5.4.85.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  e52a49ceb639d871478a143c314648c35e22222c317ecdf49866830fea5c3dfc  linux-4.4.248.tar.xz
 sha256  4687268061c9933c298b30d28e4bf1a30dfbab7c0da4bee194968e4f81ffeccf  linux-4.9.248.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 25cdc2ba33..7b27cee036 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -354,9 +354,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.248"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.212"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.163"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.83"	if BR2_KERNEL_HEADERS_5_4
-	default "5.9.14"	if BR2_KERNEL_HEADERS_5_9
-	default "5.10"		if BR2_KERNEL_HEADERS_5_10
+	default "5.4.85"	if BR2_KERNEL_HEADERS_5_4
+	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
+	default "5.10.3"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
