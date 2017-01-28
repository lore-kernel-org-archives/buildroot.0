From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:03:04 +1300
Subject: [Buildroot] [git commit] package: update comments for reverse
	dependencies of util-linux
Message-ID: <20170128080730.8F1FC80336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c5077e117212de88aed33fde5a02ba91f6fe834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
dependency on BR2_USE_WCHAR, but failed to update the reverse
dependencies of util-linux.

This commit updates comments in Config.in for BR2_USE_WCHAR for reverse
dependencies of util-linux which directly uses wchar now or when it is
pulled from other dependencies.

eudev doesn't use wchar directly, but needs C99 compiler. Autotools
generate code with wchar_t for checking C99 compiler.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2tools/Config.in          | 2 +-
 package/eudev/Config.in            | 2 +-
 package/f2fs-tools/Config.in       | 2 +-
 package/freeswitch/Config.in       | 2 +-
 package/gupnp/Config.in            | 2 +-
 package/lttng-babeltrace/Config.in | 2 +-
 package/lttng-libust/Config.in     | 2 +-
 package/samba4/Config.in           | 2 +-
 package/taskd/Config.in            | 2 +-
 package/xen/Config.in              | 2 +-
 system/Config.in                   | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 5fc55a6..75029f7 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_E2TOOLS
 	bool "e2tools"
 	select BR2_PACKAGE_E2FSPROGS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_USE_WCHAR # uses wchar_t
 	depends on BR2_USE_MMU # e2fsprogs
 	help
 	  E2tools is a simple set of GPL'ed utilities to read, write,
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6412675..02fcc7e 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_EUDEV
 	bool "eudev"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
-	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index 6a98e79..ab81734 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_WCHAR # uses wchar_t
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 0156afd..1f64593 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FREESWITCH
 	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr, included in freeswitch source
-	depends on BR2_USE_WCHAR # libuuid
+	depends on BR2_USE_WCHAR # uses wchar_t
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
index a5ecab7..3074a42 100644
--- a/package/gupnp/Config.in
+++ b/package/gupnp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GUPNP
 	bool "gupnp"
-	depends on BR2_USE_WCHAR # glib2, gssdp, util-linux
+	depends on BR2_USE_WCHAR # glib2, gssdp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, gssdp
 	depends on BR2_USE_MMU # glib2, gssdp
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 9634a4d..09fab44 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_POPT
-	depends on BR2_USE_WCHAR # libglib2, util-linux
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	help
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index ce60599..4aba188 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_WCHAR # uses wchar_t
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 5ae2c36..ce97bea 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -7,7 +7,7 @@ comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
 	depends on !BR2_STATIC_LIBS # python
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
index 7a9a136..7d26aba 100644
--- a/package/taskd/Config.in
+++ b/package/taskd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TASKD
 	bool "taskd"
-	depends on BR2_USE_WCHAR # gnutls, util-linux
+	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/xen/Config.in b/package/xen/Config.in
index 7254a07..b5dcbf2 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	depends on !BR2_STATIC_LIBS # dtc (libfdt)
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_WCHAR # libglib2, util-linux
+	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/system/Config.in b/system/Config.in
index f9a3bda..875ed37 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -158,7 +158,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using devtmpfs + eudev"
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # eudev
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
