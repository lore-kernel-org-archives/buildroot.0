From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jun 2019 23:41:06 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190604214833.CB5DE8EC29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b827a3f50e392adcdacfb56181ee7b29a5f6acd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c2e0c12748..a6a16deee0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 7dc87f108e..edb3839e0f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 d79f90f5ca97befbfee4e247204b2ac4f45e7bb03d63a79184bc748cf3cf6ddb  linux-5.1.5.tar.xz
-sha256 0bf0d5c64dafc1184e9aafd2f3ebb77aa88ddee881a7766436258feaa214d9ec  linux-5.0.19.tar.xz
+sha256 9d68a206b0808d81ce582c861d0bda0d1095bcbd0f181db063665b68fc9cf478  linux-5.1.6.tar.xz
+sha256 3ba720f3189e5a08e7c533da8c12595d662a6c11d3466db6a0ff164ef4e54b68  linux-5.0.20.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 097b52fe8a872259f4a3dba571b2eaf7b9863d9cde5399c6b316dec0ef57e67a  linux-4.19.46.tar.xz
-sha256 c8a3f40ef877e18b3d2890e0954f2d81b6d012a7321836ca4e5b036ef93f68f5  linux-4.14.122.tar.xz
-sha256 532e4b7b0103806dad9124fd09d15d19594eca08e7f900e94ff805d3b4171ee3  linux-4.9.179.tar.xz
+sha256 5d08f3890e7ca2b94529675120f170c5b764f795e6dd184a1190c23a40ef5365  linux-4.19.47.tar.xz
+sha256 25f58cb56bde388ac9bcee984f5f2d0ca094b0a8af6b92ad1f5b2fd0e6725b85  linux-4.14.123.tar.xz
+sha256 d25a490d62a3e96a587333e163862585eac4086fc8d4893b4ec1711e7d387c5f  linux-4.9.180.tar.xz
 sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 377478c1c7..f75e834505 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -302,11 +302,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.179"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.122"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.46"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.19"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.5"		if BR2_KERNEL_HEADERS_5_1
+	default "4.9.180"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.123"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.47"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.20"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.6"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
