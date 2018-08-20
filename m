From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:16:36 +0200
Subject: [Buildroot] [git commit branch/next] linux-headers: bump to 4.18.3
 kernel version
Message-ID: <20180820151132.212388DF6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce7ba57062113f06e36832a2ad5465c35a0ea636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4383466af1..bd9c4827b3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_17
+	default BR2_KERNEL_HEADERS_4_18
 	help
 	  Select the kernel version to get headers from.
 
@@ -75,6 +75,10 @@ config BR2_KERNEL_HEADERS_4_17
 	bool "Linux 4.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
 
+config BR2_KERNEL_HEADERS_4_18
+	bool "Linux 4.18.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -97,6 +101,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18
+	bool "4.18.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17
 	bool "4.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
@@ -268,4 +276,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.11"	if BR2_KERNEL_HEADERS_4_17
+	default "4.18.3"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
