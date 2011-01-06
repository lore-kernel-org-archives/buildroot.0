From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jan 2011 08:44:11 +0100
Subject: [Buildroot] [git commit master 1/1] linux: add 2.6.37, remove 2.6.36
Message-ID: <20110106090647.4A0BC8B389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc15930223c975f6390e34c12228e68d208da2ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e28b44..17aa29a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_2_6_36
+	default BR2_LINUX_KERNEL_2_6_37
 
-config BR2_LINUX_KERNEL_2_6_36
-	bool "2.6.36.2"
+config BR2_LINUX_KERNEL_2_6_37
+	bool "2.6.37"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.36.1"
+	default "2.6.37"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.36.2" if BR2_LINUX_KERNEL_2_6_36
+	default "2.6.37" if BR2_LINUX_KERNEL_2_6_37
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.2.2
