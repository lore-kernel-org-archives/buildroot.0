From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Oct 2012 08:48:33 +0200
Subject: [Buildroot] [git commit] linux: add 3.6 kernel, remove 3.5 option
Message-ID: <20121002065916.4304A99795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51009b3b422b9679daafbce5c22d6bd140e43f2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6e174ba..257f934 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,9 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_3_5
 
-config BR2_LINUX_KERNEL_3_5
-	bool "3.5.4"
+config BR2_LINUX_KERNEL_3_6
+	bool "3.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -77,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.5.4" if BR2_LINUX_KERNEL_3_5
+	default "3.6" if BR2_LINUX_KERNEL_3_6
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
