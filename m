From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jan 2019 15:45:08 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: default to 4.19.x
Message-ID: <20190110144508.5650-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4.20.x is not a long term support kernel, but 4.19.x is (supported until end
2020):
https://www.kernel.org/category/releases.html

With the upcoming Buildroot 2019.02 release being a LTS release, default to
4.19.x instead.

Notice: The userspace API breakage in net_stamp.h causing build failures has
now been fixed in 4.19.14 by commit e4a2ffe9029fd (net: Use
__kernel_clockid_t in uapi net_stamp.h)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 4 ++--
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 932aa62991..f1e963b76f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.20)"
+	bool "Latest version (4.19)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.154-cip28)"
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.20.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e94d28419a..aa1636484f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_20
+	default BR2_KERNEL_HEADERS_4_19
 	help
 	  Select the kernel version to get headers from.
 
-- 
2.11.0
