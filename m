From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jun 2019 23:00:24 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{0, 1}.x series
Message-ID: <20190605210240.3B59F8EF8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db8ad8d1c2bf5ef0540605c4888b82d68ff60926
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Including mitigation for the "ZombieLoad" speculative execution
vulnerability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.{0, 1}.x bump]
(cherry picked from commit 0644b8f79c12f1ac85e68c83ca51fbb6b3027a18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 7 ++++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 369d366a7d..63ff4b8849 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.42" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.43" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 4213acfef1..9941af6e65 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 f809d76010d575979362551fda3190569502973d5e2a972e78b9093a3526da26  linux-4.19.42.tar.xz
-sha256 687d73abd4b9af66ec30bdccdf96193e04316f9f5a1c7b8d74732c10b4729a15  linux-4.14.118.tar.xz
-sha256 d98434f91f9df2bf36c7896ca747b7cf98be2e3a491073fd26e3f53cda07500c  linux-4.9.175.tar.xz
+sha256 111619a1fab2368bf4da05c079e44bf25ee00ee250694c1b8e536f2ed5d2df57  linux-4.19.43.tar.xz
+sha256 5615b713389d74044eaa57032dab674228116b63ed358086c33bd929d7ad3b7c  linux-4.14.119.tar.xz
+sha256 2a94d008c0737f01d4b78f669a3c40e334cacebe4d62eb25252171cee205b178  linux-4.9.176.tar.xz
+sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c9d18e6bfc..74b30e39bc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,9 +288,9 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.175"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.118"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.42"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.176"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.119"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.43"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
