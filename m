From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 13:56:04 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190525115302.E0D088D1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8990bd3032fc0c996100b2c38e04219f60db5f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b4445f05de..7f4f0441a3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 19dfa19fec..a04fb742c2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 b0f53e12daf8e710992151333edeb7d7da3d935a6aa3db8360681f7d05a6aaa2  linux-5.1.3.tar.xz
-sha256 ab37029bdc9a4e3fc5dc2cc6f6e8f506a62fa42f68e50897c24fc9dbba789629  linux-5.0.17.tar.xz
+sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.x
+sha256 7fbd0b3d90a7a28a013f1e3f006c02235c12b41fd020460722a0b7c9936db0d8  linux-5.0.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 707642e993775618a5afa039b1058fa49f1c0faada46e8cdcb976241bca6b288  linux-4.19.44.tar.xz
-sha256 ddb8e86cf65e6f53f782bc46f026823b6b3fc472aa1385b601f22dce2dbccb4c  linux-4.14.120.tar.xz
-sha256 c73b1e3ebcc35b653f7b673ca151fc67b814bdb27269799fa7cda251827887ee  linux-4.9.177.tar.xz
+sha256 eb31e62fbb30aaeedb892cecdd8ac9746d42cbbef2ef2356f9ca8e13514b9d2b  linux-4.19.45.tar.xz
+sha256 2eecd6825a0998c8b6dd686cd4cd76e9f0d195bbace89f0b82495cc11ddb2884  linux-4.14.121.tar.xz
+sha256 13ffd8b0725d9ce9f9e927f4748ef640b049d7c69f21b28ca0d976cc23072566  linux-4.9.178.tar.xz
 sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 16096b65e1..a91dd1f20d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,11 +298,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.177"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.120"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.44"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.17"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.3"		if BR2_KERNEL_HEADERS_5_1
+	default "4.9.178"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.121"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.45"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.18"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.4"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
