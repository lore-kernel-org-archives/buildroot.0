From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 09:30:38 +0200
Subject: [Buildroot] [git commit] package/linux-headers: drop support for
 5.2.x headers
Message-ID: <20191018072708.31B16825A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29ada32954451d47362a70c20126936dac6b87e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.2.x series is now EOL so remove the option and add legacy
handling for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 74201b50e7..c6b6dc49aa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_KERNEL_HEADERS_5_2
+	bool "kernel headers version 5.2.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.2.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_TARGET_RISCV_PK
 	bool "riscv-pk was removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 9fb53ce2e3..7ef711e1ed 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 e84021a94784de7bb10e4251fb1a87859a8d1c97bd78fb55ad47ab6ce475ec1f  linux-5.3.6.tar.xz
-sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 f1143564364f278ba0893a7813afc02da6ecef6d5de147bd5011aa3cc1634b34  linux-4.19.79.tar.xz
 sha256 e69dabd2368440ce1650cda0cf043e1ba3f3343f940a43b68e761739fcb3f296  linux-4.14.149.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 555a2a1d16..5e4df4c9e9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_4_19
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
-config BR2_KERNEL_HEADERS_5_2
-	bool "Linux 5.2.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
-
 config BR2_KERNEL_HEADERS_5_3
 	bool "Linux 5.3.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
@@ -313,7 +309,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.196"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.149"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.79"	if BR2_KERNEL_HEADERS_4_19
-	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default "5.3.6"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
