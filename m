From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 12:26:28 +0200
Subject: [Buildroot] [git commit] linux: default to 2.6.39.1
Message-ID: <20110609105206.9447185AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d4f51dd447a189b5eadc752c958471bdfa48845
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e7d1bd8..e461a53 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_2_6_38
+	default BR2_LINUX_KERNEL_2_6_39
 
-config BR2_LINUX_KERNEL_2_6_38
-	bool "2.6.38.7"
+config BR2_LINUX_KERNEL_2_6_39
+	bool "2.6.39.1"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.38.7"
+	default "2.6.39.1"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.38.7" if BR2_LINUX_KERNEL_2_6_38
+	default "2.6.39.1" if BR2_LINUX_KERNEL_2_6_39
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
