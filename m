From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:54:33 +0100
Subject: [Buildroot] [git commit] package/linux-headers: drop support for
 5.3.x headers
Message-ID: <20200105205311.CF0DF8ECBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6343127e7ac2bd3313efc15ba586bad4706e40e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.3.x series is now EOL so remove the option and add legacy
handling for it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8436951f0f..d049839e2d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_KERNEL_HEADERS_5_3
+	bool "kernel headers version 5.3.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.3.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_PYTHON_SCAPY3K
 	bool "python-scapy3k is replaced by python-scapy"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 0cecb00ef1..97d77dc785 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,4 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
 sha256 568e9f27fbba86131c2e2849f296d54216e2ed3e8c4d8aa78a93b417cab23ec0  linux-5.4.5.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4.4.206.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 29213e40f8..c0ca531bcf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_4_19
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
-config BR2_KERNEL_HEADERS_5_3
-	bool "Linux 5.3.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
-
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -317,7 +313,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.206"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.159"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.90"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default "5.4.5"		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
