From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:09:04 +0200
Subject: [Buildroot] [git commit] package/linux-headers: drop support for
 5.1.x headers
Message-ID: <20191002060608.94E87840EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dc7e04832dac323321c78d9bf439a45b8bb3392
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.1.x series is now EOL and 5.3.x has been added, so remove the option
and add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aeeeba04dd..e06ba2783b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_KERNEL_HEADERS_5_1
+	bool "kernel headers version 5.1.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.1.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_DEVMEM2
 	bool "devmem2 package was removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index cb137e67ac..f778517ef4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 361f9c953bb5ca7dbc922c3f698170523667f6a2f43961ffb88fa47b6b10fc6b  linux-5.3.2.tar.xz
 sha256 6d090f866c9739403f78b08470209d1e825c44ce5dbaa237a4a2c8c6609dca60  linux-5.2.18.tar.xz
-sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 ba4dd29902734b263a5197410363b17f30dc60bc999bd6ce90b6f5910b971e66  linux-4.19.76.tar.xz
 sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5942d70576..2e258afd41 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -49,10 +49,6 @@ config BR2_KERNEL_HEADERS_4_19
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
-config BR2_KERNEL_HEADERS_5_1
-	bool "Linux 5.1.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
-
 config BR2_KERNEL_HEADERS_5_2
 	bool "Linux 5.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
@@ -317,7 +313,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.76"	if BR2_KERNEL_HEADERS_4_19
-	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.18"	if BR2_KERNEL_HEADERS_5_2
 	default "5.3.2"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
