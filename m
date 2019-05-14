From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:39:49 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190514153411.9017988313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a443cb5aa438e63923a4fa097bbfc0b4ab6ff935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index af3c9115f2..914f01f62c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index fae7c04cd9..1411cf05cc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041  linux-5.1.tar.xz
-sha256 2e376076cf8a20c0f86fa30fc56a9ca35cadbe43908cd24b7d678f97f3676c61  linux-5.0.14.tar.xz
+sha256 a04d991416e780c229d62a11e36aa936f132027ca8d4fa73006cc96caf058ddd  linux-5.1.1.tar.xz
+sha256 5c3eb8454e13e1c5d11e31ec63053b207ee5bc02f5778fa4708e751a3e45eb07  linux-5.0.15.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 90de6296504c64cbc4147fe053a1e8f88a98b7aed7896777e33a0321d0714782  linux-4.19.41.tar.xz
-sha256 a855a134e7a77dff92ad50f20501dbb39a1ee011ffa781ed885a3d17c6b9f23f  linux-4.14.117.tar.xz
-sha256 fc84fd68077fff55bb1779fbf3ee916257a4362a8e6d982773856c78f7865858  linux-4.9.174.tar.xz
+sha256 f809d76010d575979362551fda3190569502973d5e2a972e78b9093a3526da26  linux-4.19.42.tar.xz
+sha256 687d73abd4b9af66ec30bdccdf96193e04316f9f5a1c7b8d74732c10b4729a15  linux-4.14.118.tar.xz
+sha256 d98434f91f9df2bf36c7896ca747b7cf98be2e3a491073fd26e3f53cda07500c  linux-4.9.175.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3fd8b000c5..38fdfce737 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,11 +298,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.174"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.117"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.41"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.14"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1"		if BR2_KERNEL_HEADERS_5_1
+	default "4.9.175"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.118"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.42"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.15"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.1"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
