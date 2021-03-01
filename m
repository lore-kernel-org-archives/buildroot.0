From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Mar 2021 20:32:16 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10}.x series
Message-ID: <20210301193216.32292-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f0515632e5..5b3a626871 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5200c53a35..6ab7a6989e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  06698c0ce35ceefa9b79ceb108ec7fb86de05f51fe615f3ae5cc82e293dfe1f2  linux-5.10.13.tar.xz
-sha256  030ae544f346bfa2ce619dd9e17e93d10ec393632d3b6d6cf5d1fc84b914d449  linux-5.4.95.tar.xz
+sha256  27e7bbb0de7f0acc29c3c2e0a70c9a5fafc5fcf250993ce48713f809862ab4d6  linux-5.10.19.tar.xz
+sha256  4e118c072dbe3209ddeaff32ecc558f7e809d54e661550342079f1ee76d9349d  linux-5.4.101.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  2f3830ed4767b27dc6ead9af5c802eed7258b28c527efe90ce188cc6bd668550  linux-4.4.255.tar.xz
-sha256  afdf2d03c920f6b12f4e207ab18e45fbe2d7f4a61c066eff0d9916fc5d00c118  linux-4.9.255.tar.xz
-sha256  75eecaa731c091fcf3bc2ec914b01d299a447d78041cb66a11a2ab169eb801dd  linux-4.14.219.tar.xz
-sha256  d2fdd236e6f31aa8e939f4a686c95417d8571bde3d091fc6a2535937c144195f  linux-4.19.173.tar.xz
+sha256  0c41611ae151b80723eb68c75f8a3366756f93e8748ab0892255344f38d76665  linux-4.4.258.tar.xz
+sha256  d478f8e069f6d8b86b0a69f99252ea9e7cd7070bf6bdd0e9b3773ee418e5c8cd  linux-4.9.258.tar.xz
+sha256  734082b03d9f8e43b123b0061f08045b70c34e3a4b09f8a8da6a287686dac744  linux-4.14.222.tar.xz
+sha256  ac0eb3794e01eac66bea3ab39b8776dadf15c418ddc534ccfd95a0270302357d  linux-4.19.177.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8da119cfa9..2ddee289df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,12 +346,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.255"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.255"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.219"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.173"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.95"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.13"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.258"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.258"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.222"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.177"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.101"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.19"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
