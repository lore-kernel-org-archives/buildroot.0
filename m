From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jul 2020 09:17:07 +0200
Subject: [Buildroot] [PATCH 2/3] package/linux-headers: drop support for
 5.6.x headers
In-Reply-To: <20200728071708.18198-1-peter@korsgaard.com>
References: <20200728071708.18198-1-peter@korsgaard.com>
Message-ID: <20200728071708.18198-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 5.6.x series is now EOL so remove the option and add legacy
handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d9732edc9e..05127ab9c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_KERNEL_HEADERS_5_6
+	bool "kernel headers version 5.6.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.6.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_KERNEL_HEADERS_5_5
 	bool "kernel headers version 5.5.x are no longer supported"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 1d435aeb7f..1faf2f904b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  40d318add8cefe3fdb26f19dac7386f5e7b63854ae021e593466902856ce9ded  linux-5.7.1.tar.xz
-sha256  25504b4de7baf912071d1ed40b13af0689305442b9dea9218fd096d8bd997cf7  linux-5.6.16.tar.xz
 sha256  103f039f34a9009c42ea643b4f473bda6bb9607d5ad7f63b56b3e2351615fe2e  linux-5.4.45.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  418299385195f09b27e371a35f305f3aff148e7557a341b53460091303aa9bb7  linux-4.4.226.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2e1c991871..3b040a8876 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -55,10 +55,6 @@ config BR2_KERNEL_HEADERS_5_4
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_KERNEL_HEADERS_LATEST
 
-config BR2_KERNEL_HEADERS_5_6
-	bool "Linux 5.6.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
-
 config BR2_KERNEL_HEADERS_5_7
 	bool "Linux 5.7.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
@@ -343,7 +339,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.183"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.127"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.45"	if BR2_KERNEL_HEADERS_5_4
-	default "5.6.16"	if BR2_KERNEL_HEADERS_5_6
 	default "5.7.1"		if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.20.1
