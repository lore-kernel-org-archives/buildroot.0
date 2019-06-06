From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:40:40 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{0, 1}.x series
Message-ID: <20190606154048.7C7EE8136B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac4c7992786872113f4fda47fd90ec3d7efd90f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.{0, 1}.x bump]
(cherry picked from commit b24f274abe19afae5a03c1f76b6f4824ddad6a5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8153cd452e..3aba64fd3c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.45" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.46" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index d5d7100f6d..2b543e7e3f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 eb31e62fbb30aaeedb892cecdd8ac9746d42cbbef2ef2356f9ca8e13514b9d2b  linux-4.19.45.tar.xz
-sha256 2eecd6825a0998c8b6dd686cd4cd76e9f0d195bbace89f0b82495cc11ddb2884  linux-4.14.121.tar.xz
-sha256 13ffd8b0725d9ce9f9e927f4748ef640b049d7c69f21b28ca0d976cc23072566  linux-4.9.178.tar.xz
+sha256 097b52fe8a872259f4a3dba571b2eaf7b9863d9cde5399c6b316dec0ef57e67a  linux-4.19.46.tar.xz
+sha256 c8a3f40ef877e18b3d2890e0954f2d81b6d012a7321836ca4e5b036ef93f68f5  linux-4.14.122.tar.xz
+sha256 532e4b7b0103806dad9124fd09d15d19594eca08e7f900e94ff805d3b4171ee3  linux-4.9.179.tar.xz
 sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32a3bc597e..8a848b077a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,9 +288,9 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.178"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.121"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.45"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.179"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.122"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.46"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
