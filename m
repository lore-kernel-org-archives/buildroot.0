From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 09:52:30 +0200
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.7 headers
Message-ID: <20200906074542.0F93F875C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f5937334dd4715ffa8df9a96010ab50a4849b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.7.x series is now EOL, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 022f6a7493..d4f2dcfdea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_KERNEL_HEADERS_5_7
+	bool "kernel headers version 5.7.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.7.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_TINYHTTPD
 	bool "tinyhttpd package removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index d9f51e0dcc..f5d7591da7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  7b0bf5029c94df72d1244b6b77e79e376cff2817a782c3ac50767a4121fd17fe  linux-5.8.7.tar.xz
-sha256  419c6248b9ae4dfead4599787aecbfd202e88bc4124523adfa6dd2d642b99fe7  linux-5.7.19.tar.xz
 sha256  86f13d050f6389c5a1727fa81510ee8eceac795297bc584f443354609617fea4  linux-5.4.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  6994dda988e9fb7f5661cf80ff42039016cb0044acd39f830937ba0220296388  linux-4.4.234.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a70a0f2b6b..bbe377ab18 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -55,10 +55,6 @@ config BR2_KERNEL_HEADERS_5_4
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_KERNEL_HEADERS_LATEST
 
-config BR2_KERNEL_HEADERS_5_7
-	bool "Linux 5.7.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
-
 config BR2_KERNEL_HEADERS_5_8
 	bool "Linux 5.8.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
@@ -347,7 +343,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.195"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.142"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.61"	if BR2_KERNEL_HEADERS_5_4
-	default "5.7.19"	if BR2_KERNEL_HEADERS_5_7
 	default "5.8.7"		if BR2_KERNEL_HEADERS_5_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
