From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 19:37:13 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200215183713.22428-1-peter@korsgaard.com>
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
index 38c7510d9e..86e273a150 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.20" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7b3efc73ea..d99a9661af 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  92e9f1fd69543e9ce2a9e6eb918823b1846d2dd99246a74456263cd5ad234d89  linux-5.4.18.tar.xz
+sha256  793f6dcd9a7074dc61bbb092b40b3ce9567f776f21589ecd09f07bc9ed5c67bb  linux-5.4.20.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  00f73c3c7a2beebf5832422c81a037b05ca1217d5f4f6cbcc49284bf7fb2bcb2  linux-4.4.213.tar.xz
-sha256  af85ff764670c2a934ee5b2590437d8e3ab32b1a0b8d51358f36c6bbf6c5eb64  linux-4.9.213.tar.xz
-sha256  940a63247d11476daea6d114a9599be0eb68eeb2e295fe279e0f3312af1e17c3  linux-4.14.170.tar.xz
-sha256  302e8388dd7b49d1b779225cf865af74b9837d1e955b1b290fdd71baf97ce015  linux-4.19.102.tar.xz
+sha256  b6aa65ee2c0767864175e3a9cf7b0b3751263b04a7c8a6e760e9b982282fa76c  linux-4.4.214.tar.xz
+sha256  b47f093dac7034c7c4722e80042c05e4ef53c14a4f28aa992117a127d2b1e483  linux-4.9.214.tar.xz
+sha256  4fe02489e4b4a187eccf0ef87df6100534c9d485e76d876b1fa247c7635332a0  linux-4.14.171.tar.xz
+sha256  23ebffb28c2607682fcb91df90d77467ac5b16a50961de298ef266a919d66be8  linux-4.19.104.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 71d35dad7f..60af628b5c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.213"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.213"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.170"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.102"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.18"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.214"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.214"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.171"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.104"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.20"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
