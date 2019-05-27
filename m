From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 May 2019 13:33:17 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190527113318.523-1-peter@korsgaard.com>
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
index 7f4f0441a3..c2e0c12748 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 0a17592799..4654f741b0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.xz
-sha256 7fbd0b3d90a7a28a013f1e3f006c02235c12b41fd020460722a0b7c9936db0d8  linux-5.0.18.tar.xz
+sha256 0bf0d5c64dafc1184e9aafd2f3ebb77aa88ddee881a7766436258feaa214d9ec  linux-5.0.19.tar.xz
+sha256 d79f90f5ca97befbfee4e247204b2ac4f45e7bb03d63a79184bc748cf3cf6ddb  linux-5.1.5.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 eb31e62fbb30aaeedb892cecdd8ac9746d42cbbef2ef2356f9ca8e13514b9d2b  linux-4.19.45.tar.xz
-sha256 2eecd6825a0998c8b6dd686cd4cd76e9f0d195bbace89f0b82495cc11ddb2884  linux-4.14.121.tar.xz
-sha256 13ffd8b0725d9ce9f9e927f4748ef640b049d7c69f21b28ca0d976cc23072566  linux-4.9.178.tar.xz
+sha256 097b52fe8a872259f4a3dba571b2eaf7b9863d9cde5399c6b316dec0ef57e67a  linux-4.19.46.tar.xz
+sha256 c8a3f40ef877e18b3d2890e0954f2d81b6d012a7321836ca4e5b036ef93f68f5  linux-4.14.122.tar.xz
+sha256 532e4b7b0103806dad9124fd09d15d19594eca08e7f900e94ff805d3b4171ee3  linux-4.9.179.tar.xz
 sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a91dd1f20d..93c6a5de1b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,11 +298,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.178"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.121"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.45"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.18"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.4"		if BR2_KERNEL_HEADERS_5_1
+	default "4.9.179"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.122"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.46"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.19"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.5"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
