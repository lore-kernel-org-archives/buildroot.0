From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 13:47:58 +0200
Subject: [Buildroot] [git commit] linux: default to kernel 5.1.x
Message-ID: <20190525114811.0B74C81262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7bb0d56bf10f02e48a5f19cac71d9a5d0eaab32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match the default kernel headers we use.

[Peter: drop 5.1.x bump, tweak commit message]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5f2c81a3a0..b4445f05de 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.0)"
+	bool "Latest version (5.1)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.19.13-cip1)"
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.1.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
