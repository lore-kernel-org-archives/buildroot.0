From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Nov 2018 15:30:07 +0200
Subject: [Buildroot] [PATCH next 2/5] linux-headers: bump to kernel version
 4.19.2
In-Reply-To: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
Message-ID: <92a6e6b55b9deb073d6aae08490a5820964eb69b.1542720610.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cdf639ab3a8e..7b4babe96dbd 100644
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
-- 
2.19.1
