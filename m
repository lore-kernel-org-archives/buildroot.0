From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Feb 2019 09:51:25 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14, 19,
 20}.x series
Message-ID: <20190227085125.22457-1-peter@korsgaard.com>
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
index 323ba38d72..f17334ae7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.21" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.25" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index e769f132f0..d7ddd1c877 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 b60ca6c44aa3bc98384944d73ed94229e6359dc61a88fa589027dac30e04d062  linux-4.20.8.tar.xz
-sha256 db08ede726fe410da274e1e98f0de2aed9ff4b0e0b63a89e5928bef46998bbc1  linux-4.19.21.tar.xz
-sha256 8ff98caed5b20b733dedcbe99559d71a0e09e239c0c2488b3fd799c96489eb0a  linux-4.14.99.tar.xz
-sha256 5eb1b9ba43370512ab637452089bb93f8c0fdd7d5399e99561d382f74517a816  linux-4.9.156.tar.xz
-sha256 be5211dd90142568199cd546c0893e1eb71c78774a11660a8bb8070bb9ebba39  linux-4.4.174.tar.xz
+sha256 1cf544308195250805e0731c716691bea4c1ed29e03e6f9ae5be6dc16785a504  linux-4.20.12.tar.xz
+sha256 7ec71d90d6e96e6f741676d157ac06f30c75be4eaf1649143a3c8b7d4f919731  linux-4.19.25.tar.xz
+sha256 7aa43e34e4c9e5965da29cef5ae196e06006f8c0d1d65fd755a2f197f0796a11  linux-4.14.103.tar.xz
+sha256 c09af067af62d299f5e33c279968de58c88fb7c59bd05e8f3bb460f611f60515  linux-4.9.160.tar.xz
+sha256 27da5401aa691762f3361c143f453877f499c02ea6c9c743b09538cb1af1c75d  linux-4.4.176.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4dc1e26d5d..15574689fa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.174"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.156"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.99"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.21"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.8"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.176"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.160"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.25"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.12"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
