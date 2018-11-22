From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:37:13 +0100
Subject: [Buildroot] [git commit] linux-headers: bump to kernel version
 4.19.2
Message-ID: <20181202071557.48B0C81583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=082fee9b60f80c758557dbb3b1f34be68be6e4a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add hash]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     |  1 +
 package/linux-headers/Config.in.host | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 46f587ef6a..d708b87ad1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 c10c7f81019bd782ea77a25725f6d53e9affa4a0cfd3985c161f3a2a22f2df73  linux-4.19.2.tar.xz
 sha256 36c6d1360db9eab40270db6d292c259dd34d3dc06049d64afe3e4cfafb8562d3  linux-4.18.14.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
 sha256 ee3f19a4ff8a42793c193e361e1d34fcc821a5ca9b58db41befb2b4df0e482be  linux-4.14.76.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cdf639ab3a..7b4babe96d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_18
+	default BR2_KERNEL_HEADERS_4_19
 	help
 	  Select the kernel version to get headers from.
 
@@ -60,6 +60,10 @@ config BR2_KERNEL_HEADERS_4_18
 	bool "Linux 4.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
 
+config BR2_KERNEL_HEADERS_4_19
+	bool "Linux 4.19.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -125,6 +129,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19
+	bool "4.19.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
 	bool "4.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
@@ -295,6 +303,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.76"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.14"	if BR2_KERNEL_HEADERS_4_18
+	default "4.19.2"	if BR2_KERNEL_HEADERS_4_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
