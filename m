From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:17:17 +0200
Subject: [Buildroot] [git commit] linux-headers: bump default to version 4.7
Message-ID: <20160725201804.ED61B81F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c5ec8c8c8e66b41893aa20718128dd5563f8b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0df5d5d..2ad9ada 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_6
+	default BR2_KERNEL_HEADERS_4_7
 	help
 	  Select the kernel version to get headers from.
 
@@ -92,6 +92,10 @@ choice
 		bool "Linux 4.6.x kernel headers"
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 
+	config BR2_KERNEL_HEADERS_4_7
+		bool "Linux 4.7.x kernel headers"
+		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
 endchoice
@@ -112,6 +116,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7
+	bool "4.7.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6
 	bool "4.6.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
@@ -241,4 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.15"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
+	default "4.7"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
