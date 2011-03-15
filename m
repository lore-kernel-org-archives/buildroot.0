From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Mar 2011 09:11:23 +0100
Subject: [Buildroot] [git commit master 1/1] linux: use 2.6.38 by default
Message-ID: <20110315091144.D87DF9033A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ffec8419f7847868505177d78fb67de17321365d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bdfdf9a..75e574f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_2_6_37
+	default BR2_LINUX_KERNEL_2_6_38
 
-config BR2_LINUX_KERNEL_2_6_37
-	bool "2.6.37.4"
+config BR2_LINUX_KERNEL_2_6_38
+	bool "2.6.38"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.37.2"
+	default "2.6.38"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.37.4" if BR2_LINUX_KERNEL_2_6_37
+	default "2.6.38" if BR2_LINUX_KERNEL_2_6_38
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
