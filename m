From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 09:49:16 +0200
Subject: [Buildroot] [git commit] linux: default to 3.9, remove 3.8
Message-ID: <20130429074908.BE16B9B8D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75b7dc6860706baaae3bf1dc58c10def0df03e8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ec1a636..3ec687f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -20,8 +20,8 @@ if BR2_LINUX_KERNEL
 choice
 	prompt "Kernel version"
 
-config BR2_LINUX_KERNEL_3_8
-	bool "3.8.9"
+config BR2_LINUX_KERNEL_3_9
+	bool "3.9"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.8.9" if BR2_LINUX_KERNEL_3_8
+	default "3.9" if BR2_LINUX_KERNEL_3_9
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
