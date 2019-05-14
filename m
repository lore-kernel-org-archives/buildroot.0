From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 May 2019 23:24:00 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
Message-ID: <20190514212401.26177-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Including mitigation for the "ZombieLoad" speculative execution
vulnerability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 914f01f62c..c41dcc6c05 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 1411cf05cc..240f095f26 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 a04d991416e780c229d62a11e36aa936f132027ca8d4fa73006cc96caf058ddd  linux-5.1.1.tar.xz
-sha256 5c3eb8454e13e1c5d11e31ec63053b207ee5bc02f5778fa4708e751a3e45eb07  linux-5.0.15.tar.xz
+sha256 ec7ad67a423698855200b46e1c7ee325d68a8fe4706c66fe456780a8c99bef5b  linux-5.1.2.tar.xz
+sha256 5ca7ce390f52d0ce10b3c07f77701e75f7370b5da856646f63c2b67a4ef9fcac  linux-5.0.16.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 f809d76010d575979362551fda3190569502973d5e2a972e78b9093a3526da26  linux-4.19.42.tar.xz
-sha256 687d73abd4b9af66ec30bdccdf96193e04316f9f5a1c7b8d74732c10b4729a15  linux-4.14.118.tar.xz
-sha256 d98434f91f9df2bf36c7896ca747b7cf98be2e3a491073fd26e3f53cda07500c  linux-4.9.175.tar.xz
+sha256 111619a1fab2368bf4da05c079e44bf25ee00ee250694c1b8e536f2ed5d2df57  linux-4.19.43.tar.xz
+sha256 5615b713389d74044eaa57032dab674228116b63ed358086c33bd929d7ad3b7c  linux-4.14.119.tar.xz
+sha256 2a94d008c0737f01d4b78f669a3c40e334cacebe4d62eb25252171cee205b178  linux-4.9.176.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 38fdfce737..8284913860 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,11 +298,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.175"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.118"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.42"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.15"	if BR2_KERNEL_HEADERS_5_0
-	default "5.1.1"		if BR2_KERNEL_HEADERS_5_1
+	default "4.9.176"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.119"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.43"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.16"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1.2"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
