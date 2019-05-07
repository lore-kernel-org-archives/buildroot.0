From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 19:42:52 +0200
Subject: [Buildroot] [git commit] package/linux-headers: add support for
 Linux 5.1 kernel headers
Message-ID: <20190507180403.D5E397FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=904eb471e50691e97c3b624beb98f975d5d37c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     |  1 +
 package/linux-headers/Config.in.host | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 035c324447..3d49ea476a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256 d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041  linux-5.1.tar.xz
 sha256 bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479  linux-5.0.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6c848aa2e2..66366628c5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_0
+	default BR2_KERNEL_HEADERS_5_1
 	help
 	  Select the kernel version to get headers from.
 
@@ -53,6 +53,10 @@ config BR2_KERNEL_HEADERS_5_0
 	bool "Linux 5.0.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 
+config BR2_KERNEL_HEADERS_5_1
+	bool "Linux 5.1.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 	help
@@ -118,6 +122,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1
+	bool "5.1.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0
 	bool "5.0.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
@@ -299,6 +307,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.40"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default "5.0.13"	if BR2_KERNEL_HEADERS_5_0
+	default "5.1"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
