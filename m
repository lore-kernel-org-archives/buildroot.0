From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:44:50 +0200
Subject: [Buildroot] [git commit] linux-headers: bump to 4.17 kernel version
Message-ID: <20180604204329.50A827FA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bc7ad074a9256215e77721250d86324e576e459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b99b36e83d..f6229c065e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_16
+	default BR2_KERNEL_HEADERS_4_17
 	help
 	  Select the kernel version to get headers from.
 
@@ -71,6 +71,10 @@ config BR2_KERNEL_HEADERS_4_16
 	bool "Linux 4.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 
+config BR2_KERNEL_HEADERS_4_17
+	bool "Linux 4.17.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -93,6 +97,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17
+	bool "4.17.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16
 	bool "4.16.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
@@ -259,4 +267,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.46"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.13"	if BR2_KERNEL_HEADERS_4_16
+	default "4.17"		if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
