Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BDDC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96784FA89;
	Fri, 28 Feb 2025 16:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7sywsGaKGJ0; Fri, 28 Feb 2025 16:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AA8503AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AA8503AE;
	Fri, 28 Feb 2025 16:59:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8A31DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9884F42581
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5-CsnZuquXD for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEE041998
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEEE041998
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D962285EF6; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3cc2fef0d2bb77b677e3c55643085bffc583db49
X-Git-Newrev: 99bfbef093f41f20dff305dea83c7763c8b34a1b
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.D962285EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: remove BR2_nios2
 symbol
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99bfbef093f41f20dff305dea83c7763c8b34a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remaining "nios2" strings come from existing patches that
are not removed with along with BR2_nios2 symbol.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                        |  1 -
 package/apache/0002-nios2_is_not_os2.patch | 18 ------------------
 package/binutils/Config.in                 |  2 --
 package/bird/Config.in                     |  1 -
 package/bpftool/Config.in                  |  2 --
 package/dhcpcd/Config.in                   |  1 -
 package/e2fsprogs/Config.in                |  1 -
 package/e2fsprogs/e2fsprogs.mk             |  4 ----
 package/ffmpeg/Config.in                   |  2 --
 package/fio/Config.in                      |  4 ----
 package/gtkmm3/Config.in                   |  5 -----
 package/haproxy/Config.in                  |  2 --
 package/jemalloc/Config.in                 |  1 -
 package/libcdaudio/Config.in               |  2 --
 package/libgpg-error/Config.in             |  4 +---
 package/liburcu/Config.in                  |  2 +-
 package/libvncserver/Config.in             |  3 ---
 package/lightning/Config.in                |  2 --
 package/ltp-testsuite/Config.in            |  2 --
 package/mpd/Config.in                      |  2 --
 package/opkg-utils/Config.in               |  4 ++--
 package/poco/poco.mk                       |  2 +-
 package/postgresql/postgresql.mk           |  2 +-
 package/qemu/qemu.mk                       |  1 -
 package/quickjs/Config.in                  |  2 --
 package/samba4/Config.in                   |  1 -
 package/sedutil/Config.in                  |  2 +-
 package/strace/Config.in                   |  6 ------
 package/stress-ng/Config.in                |  5 ++---
 package/swipl/Config.in                    |  1 -
 package/systemd/Config.in                  |  1 -
 package/systemd/systemd.mk                 |  5 -----
 package/tftpd/Config.in                    |  2 --
 package/transmission/Config.in             |  2 --
 package/uboot-tools/uboot-tools.mk         |  4 ++--
 package/x11vnc/Config.in                   |  1 -
 package/z3/Config.in                       |  1 -
 37 files changed, 11 insertions(+), 92 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ab9c925002..24cbc3253c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -268,7 +268,6 @@ package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
 package/apache/0001-cross-compile.patch lib_patch.Upstream
-package/apache/0002-nios2_is_not_os2.patch lib_patch.Upstream
 package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch lib_patch.Upstream
 package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch lib_patch.Upstream
diff --git a/package/apache/0002-nios2_is_not_os2.patch b/package/apache/0002-nios2_is_not_os2.patch
deleted file mode 100644
index 9da8ccac02..0000000000
--- a/package/apache/0002-nios2_is_not_os2.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix nios2 detection.
-
-Apache treats nios2 as OS/2.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr httpd-2.4.12.org/configure.in httpd-2.4.12/configure.in
---- httpd-2.4.12.org/configure.in	2015-01-22 18:33:07.000000000 +0100
-+++ httpd-2.4.12/configure.in	2015-04-02 22:01:32.851102219 +0200
-@@ -268,7 +268,7 @@
- AC_MSG_NOTICE([])
- 
- case $host in
--  *os2*)
-+  *-os2*)
-       # Use a custom made libtool replacement
-       echo "using aplibtool"
-       LIBTOOL="$abs_srcdir/srclib/apr/build/aplibtool"
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 5e1a769998..f0ddf924c8 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_ZLIB
 	help
@@ -22,5 +21,4 @@ config BR2_PACKAGE_BINUTILS_TARGET
 endif
 
 comment "binutils needs a toolchain w/ wchar"
-	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR
diff --git a/package/bird/Config.in b/package/bird/Config.in
index 866fc65617..5e32194c2f 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BIRD
 	bool "bird"
-	depends on !BR2_nios2 # relocations don't fit
 	depends on BR2_USE_MMU # fork()
 	help
 	  BIRD Internet Routing Daemon
diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 55fd09ef3d..9500baf11e 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -27,7 +26,6 @@ config BR2_PACKAGE_BPFTOOL
 comment "bpftool needs a toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index 8612d4ba81..f55e613071 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !(BR2_microblazeel || BR2_microblazebe) || \
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-	depends on !BR2_nios2 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !BR2_or1k || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	depends on !BR2_sh || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	depends on !BR2_xtensa || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index a45767d506..aeb9548f15 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -46,7 +46,6 @@ comment "e2scrub needs bash, coreutils, lvm2, and util-linux"
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
-	depends on !BR2_nios2 # fallocate not implemented
 	help
 	  Online defragmenter for ext4 filesystem
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 61d89add3c..7f33b256c2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -63,10 +63,6 @@ else
 E2FSPROGS_CONF_OPTS += --disable-fuse2fs
 endif
 
-ifeq ($(BR2_nios2),y)
-E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
-endif
-
 # workaround gcc bug 111001
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_111001),y)
 E2FSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Os"
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 599e1ddfc7..fce2fef993 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	default y
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	depends on !BR2_ARM_CPU_ARMV7M
 	# m68k coldfire causes a build failure, because the check for
diff --git a/package/fio/Config.in b/package/fio/Config.in
index 7825209b4c..ff16c7263a 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -5,9 +5,6 @@ config BR2_PACKAGE_FIO
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# fio uses fallocate() which becomes fallocate64() while compiling with
-	# largefile support, but fallocate64() is not available on nios2
-	depends on !BR2_nios2
 	help
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
@@ -18,5 +15,4 @@ comment "fio needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_nios2
 	depends on BR2_USE_MMU
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 6b924c856b..76af6b24f9 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -7,11 +7,6 @@ comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9
 
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
-	# Broken on existing external/internal nios2 toolchains,
-	# revisit when they are upgraded with at least Binutils >= 2.26
-	# and GCC >= 5.3.
-	# https://sourceware.org/bugzilla/show_bug.cgi?id=19405
-	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index b348eb9d8a..320508f7ee 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 	bool
 	default y
-	# src/proto_http.c:6330:1: internal compiler error: Segmentation fault
-	depends on !BR2_nios2
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040
 	depends on !(BR2_sh4 && !BR2_TOOLCHAIN_GCC_AT_LEAST_7)
 
diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index c272d4522c..a128b8b376 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_riscv
diff --git a/package/libcdaudio/Config.in b/package/libcdaudio/Config.in
index 3eca607fc1..02df01e4fc 100644
--- a/package/libcdaudio/Config.in
+++ b/package/libcdaudio/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBCDAUDIO
 	bool "libcdaudio"
-	# binutils assertion failure
-	depends on !BR2_nios2
 	help
 	  libcdaudio is a library designed to provide functions to
 	  control operation of a CD-ROM when playing audio CDs. It
diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index a0ee7ec531..bb0679e2f5 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_i386	|| BR2_mips		|| \
 		BR2_mipsel	|| BR2_mips64		|| \
 		BR2_mips64el	|| BR2_m68k		|| \
-		BR2_nios2	|| BR2_or1k		|| \
+		BR2_or1k	|| \
 		BR2_powerpc	|| BR2_powerpc64 	|| \
 		BR2_powerpc64le	|| BR2_RISCV_64		|| \
 		BR2_RISCV_32	|| BR2_s390x		|| \
@@ -40,8 +40,6 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_mips64 || BR2_mips64el
 	default "m68k-unknown-linux-gnu" \
 		if BR2_m68k
-	default "nios2-unknown-linux-gnu" \
-		if BR2_nios2
 	default "or1k-unknown-linux-gnu" \
 		if BR2_or1k
 	default "powerpc-unknown-linux-gnu" \
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 5e8fd6060f..d30abc526d 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	default y
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
 		BR2_i386 || BR2_mips || BR2_mips64 || BR2_mipsel || \
-		BR2_mips64el || BR2_nios2 || BR2_powerpc || BR2_powerpc64 || \
+		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_s390x || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
 
diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index f284894555..a3dce57271 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBVNCSERVER
 	bool "libvncserver"
 	depends on BR2_USE_MMU # VNCommand.c uses fork()
-	# binutils issue (bad expression)
-	depends on !BR2_nios2
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -27,5 +25,4 @@ endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_nios2
 	depends on BR2_STATIC_LIBS
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index e42730addb..e36ce05ac2 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -21,7 +21,6 @@ if BR2_PACKAGE_LIGHTNING
 
 config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
-	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ZLIB
@@ -29,7 +28,6 @@ config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	  Enable the GNU lightning disassembler.
 
 comment "lightning disassembler needs a toolchain w/ wchar"
-	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index b42082e2cc..eafac0743c 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	# provided in ltp-testsuite
 	default y if BR2_TOOLCHAIN_HAS_SYNC_4
 	default y if BR2_arc
-	# does not build on nios2, cachectl.h issue
-	depends on !BR2_nios2
 
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 902a3da779..03ceaa1e00 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -242,13 +242,11 @@ comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
-	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
-	depends on !BR2_nios2 # samba
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
index 2973055baf..2123c1ff6c 100644
--- a/package/opkg-utils/Config.in
+++ b/package/opkg-utils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_OPKG_UTILS
 	bool "opkg-utils"
-	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX # binutils
+	depends on BR2_PACKAGE_BUSYBOX # binutils
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
@@ -23,6 +23,6 @@ config BR2_PACKAGE_OPKG_UTILS
 	  https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
 
 comment "opkg-utils needs a toolchain w/ wchar, threads, dynamic library"
-	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX
+	depends on BR2_PACKAGE_BUSYBOX
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 233252c67b..ee740b2377 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -48,7 +48,7 @@ POCO_CONF_OPTS += --no-fpenvironment --no-wstring
 endif
 
 # architectures missing some FE_* in their fenv.h
-ifeq ($(BR2_sh4a)$(BR2_nios2),y)
+ifeq ($(BR2_sh4a),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index f4b58f58ed..8e0ed45c22 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -38,7 +38,7 @@ POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_riscv)$(BR2_xtensa),y)
 POSTGRESQL_CONF_OPTS += -Dspinlocks=false
 else
 POSTGRESQL_CONF_OPTS += -Dspinlocks=true
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2fd2e6767b..3a2f69ea3c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -372,7 +372,6 @@ HOST_QEMU_DEPENDENCIES = \
 #       mipsel          mipsel
 #       mips64          mips64
 #       mips64el        mips64el
-#       nios2           nios2
 #       or1k            or1k
 #       powerpc         ppc
 #       powerpc64       ppc64
diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index fd174bc657..a59d460706 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
 	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
-	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
 	depends on !BR2_sh # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
@@ -18,7 +17,6 @@ config BR2_PACKAGE_QUICKJS
 
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on !BR2_microblaze
-	depends on !BR2_nios2
 	depends on !BR2_sh
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 5907bdc478..36ec656168 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
 	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
-	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_CMOCKA
diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
index e695f2bed7..1fbb870c05 100644
--- a/package/sedutil/Config.in
+++ b/package/sedutil/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
 	# no big endian support
 	default y if BR2_arcle || BR2_arm || BR2_aarch64 \
 	       || BR2_i386 || BR2_microblazeel || BR2_mipsel \
-	       || BR2_mips64el || BR2_nios2 || BR2_powerpc64le \
+	       || BR2_mips64el || BR2_powerpc64le \
 	       || BR2_sh4 || BR2_sh4a || BR2_x86_64 \
 	       || BR2_XTENSA_LITTLE_ENDIAN
 
diff --git a/package/strace/Config.in b/package/strace/Config.in
index e0551f3861..ff7d271c0c 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	# needs at least kernel headers 4.0 on nios2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	# needs at least kernel headers 5.0 on xtensa
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
 	# needs at least kernel headers 5.0 on musl aarch64
@@ -19,10 +17,6 @@ config BR2_PACKAGE_STRACE
 
 	  https://strace.io
 
-comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
-	depends on BR2_nios2
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-
 comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
 	depends on BR2_xtensa
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 30bb4d10c8..4041aba9b6 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_STRESS_NG
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
-	depends on !BR2_nios2
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on ARC
 	depends on !BR2_arc
 	help
 	  stress-ng will stress test a computer system in various
@@ -17,7 +16,7 @@ config BR2_PACKAGE_STRESS_NG
 	  https://github.com/ColinIanKing/stress-ng
 
 comment "stress-ng needs a toolchain w/ threads, headers >= 3.3"
-	depends on !BR2_nios2 && !BR2_arc
+	depends on !BR2_arc
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
index 84b6ace47f..8bf58344b3 100644
--- a/package/swipl/Config.in
+++ b/package/swipl/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
 	default y if BR2_m68k
 	# BR2_microblaze has only FE_TONEAREST
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	# BR2_nios2 has only FE_TONEAREST
 	default y if BR2_or1k
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9a5386c7dc..851b91aeba 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	default y if BR2_m68k
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_nios2
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default y if BR2_sparc || BR2_sparc64
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bf70a3d187..28091a72a6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -111,11 +111,6 @@ ifeq ($(BR2_OPTIMIZE_FAST),y)
 SYSTEMD_CFLAGS += -O3 -fno-finite-math-only
 endif
 
-ifeq ($(BR2_nios2),y)
-# Nios2 ld emits warnings, make warnings not to be treated as errors
-SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
-endif
-
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
 endif
diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index d4e81e70bc..faaff3fe2e 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
-	# linker issue with pre-6.x toolchains
-	depends on !(BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_6)
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index eeaa7890fb..e767723eef 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -37,7 +37,6 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
-	depends on !BR2_nios2 # gtkmm3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz -> gtkmm3
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
 	select BR2_PACKAGE_GTKMM3
@@ -45,7 +44,6 @@ config BR2_PACKAGE_TRANSMISSION_GTK
 	  Install transmission GTK-based GUI interface.
 
 comment "transmission-gtk needs libgtk3 and a toolchain with NLS enabled"
-	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS
 endif
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index e9c7edb218..d897a6bc17 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -232,8 +232,8 @@ $(eval $(host-generic-package))
 
 MKIMAGE = $(HOST_DIR)/bin/mkimage
 
-# mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
-# NORMALIZED_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
+# mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
+# NORMALIZED_ARCH can be arm64 arc arm blackfin m68k microblaze mips powerpc sh sparc i386 x86_64 xtensa
 # For i386, we need to convert
 # For openrisc, we need to convert
 # For others, we'll just keep NORMALIZED_ARCH
diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index d2639fce1e..e4706953b1 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_nios2 # libvncserver
 	select BR2_PACKAGE_LIBVNCSERVER
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
diff --git a/package/z3/Config.in b/package/z3/Config.in
index 8cd3128687..3afb8a6a22 100644
--- a/package/z3/Config.in
+++ b/package/z3/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_Z3_ARCH_SUPPORTS
 	default y if BR2_m68k
 	# BR2_microblaze has only FE_TONEAREST
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	# BR2_nios2 has only FE_TONEAREST
 	default y if BR2_or1k
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
