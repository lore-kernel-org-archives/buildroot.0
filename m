From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 May 2017 11:16:22 +0200
Subject: [Buildroot] [PATCH v2 2/2] linux-header: bump default to version
	4.11
In-Reply-To: <20170501091622.1930-1-s.martin49@gmail.com>
References: <20170501091622.1930-1-s.martin49@gmail.com>
Message-ID: <20170501091622.1930-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- add missing BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 symbol (ThomasP)
---
 package/linux-headers/Config.in.host | 11 ++++++++++-
 toolchain/toolchain-common.in        |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c67626b2..b1ef3d623 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_4_10
+	default BR2_KERNEL_HEADERS_4_11
 	help
 	  Select the kernel version to get headers from.
 
@@ -62,6 +62,10 @@ config BR2_KERNEL_HEADERS_4_10
 	bool "Linux 4.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 
+config BR2_KERNEL_HEADERS_4_11
+	bool "Linux 4.11.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
 
@@ -83,6 +87,10 @@ choice
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11
+	bool "4.11.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10
 	bool "4.10.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
@@ -222,4 +230,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.64"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
+	default "4.11"		if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 379006d02..c47482455 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -247,6 +247,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
-- 
2.12.2
