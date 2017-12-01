From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:42 -0000
Subject: [Buildroot] [git commit] linux-headers: bump to 4.14 kernel version
Message-ID: <20171201205316.D470180FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65e72a4668b0b7f7a962cd000ac79c32669c95f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 82a27f8..1a5630a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_13
+	default BR2_KERNEL_HEADERS_4_14
 	help
 	  Select the kernel version to get headers from.
 
@@ -74,6 +74,10 @@ config BR2_KERNEL_HEADERS_4_13
 	bool "Linux 4.13.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 
+config BR2_KERNEL_HEADERS_4_14
+	bool "Linux 4.14.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -96,6 +100,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14
+	bool "4.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13
 	bool "4.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
@@ -250,4 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.12"	if BR2_KERNEL_HEADERS_4_13
+	default "4.14"		if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
