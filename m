From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Oct 2010 14:53:08 +0200
Subject: [Buildroot] [git commit master 1/1] linux: default to 2.6.36
Message-ID: <20101023143216.A58E68D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f3da7498566b20c0efcea758a3cbedb37920761c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1e015b7..5191d01 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_2_6_35
+	default BR2_LINUX_KERNEL_2_6_36
 
-config BR2_LINUX_KERNEL_2_6_35
-	bool "2.6.35.6"
+config BR2_LINUX_KERNEL_2_6_36
+	bool "2.6.36"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.35.6"
+	default "2.6.36"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.35.6" if BR2_LINUX_KERNEL_2_6_35
+	default "2.6.36" if BR2_LINUX_KERNEL_2_6_36
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.1
