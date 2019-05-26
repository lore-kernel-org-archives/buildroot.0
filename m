From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:45:56 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{0, 1}.x series
Message-ID: <20190526114748.9B2F08E135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03ec111475c17b9c615ef009eb54522d3584d7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a443cb5aa438e63923a4fa097bbfc0b4ab6ff935)
[Peter: drop 5.{0, 1}.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 7 +++----
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bbff4e9df3..369d366a7d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.41" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.42" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 3803eb1a0f..4213acfef1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 90de6296504c64cbc4147fe053a1e8f88a98b7aed7896777e33a0321d0714782  linux-4.19.41.tar.xz
-sha256 a855a134e7a77dff92ad50f20501dbb39a1ee011ffa781ed885a3d17c6b9f23f  linux-4.14.117.tar.xz
-sha256 fc84fd68077fff55bb1779fbf3ee916257a4362a8e6d982773856c78f7865858  linux-4.9.174.tar.xz
-sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
+sha256 f809d76010d575979362551fda3190569502973d5e2a972e78b9093a3526da26  linux-4.19.42.tar.xz
+sha256 687d73abd4b9af66ec30bdccdf96193e04316f9f5a1c7b8d74732c10b4729a15  linux-4.14.118.tar.xz
+sha256 d98434f91f9df2bf36c7896ca747b7cf98be2e3a491073fd26e3f53cda07500c  linux-4.9.175.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ce7f20406b..c9d18e6bfc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,9 +288,9 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.174"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.117"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.41"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.175"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.118"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.42"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
