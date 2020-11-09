From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:54:10 +0100
Subject: [Buildroot] [git commit branch/next] Revert "linux: bump CIP kernel
 to version 4.19.152-cip37"
Message-ID: <20201117203826.CA57886A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73163b3f1a7ac2ce524770bf07b9504223241a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit b737c6b3513901f736299d842a872bf78073983d.  This was not
supposed to be committed, as the patch did not update linux.hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2c69b842f3..5e8390647a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.9)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.152-cip37)"
+	bool "Latest CIP SLTS version (4.19.132-cip30)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,8 +126,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
