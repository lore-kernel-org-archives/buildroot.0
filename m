Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B36CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE755416F4;
	Thu, 28 Mar 2024 19:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1qYnvI6hTuQ; Thu, 28 Mar 2024 19:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30FC9416CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30FC9416CC;
	Thu, 28 Mar 2024 19:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB3ED1BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C83AC60E97
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 19:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upUUbWwfOwnB for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 19:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DF660E96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2DF660E96
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 19:41:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A90C4843E4; Thu, 28 Mar 2024 19:41:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 20:34:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4878d530e8bbcf29173b62a725c66ac51849c65
X-Git-Newrev: f382de2b0f8a528a09bb975cc088a4342b663134
X-Patchwork-Hint: ignore
Message-Id: <20240328194126.A90C4843E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump version to 3.4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============8839234549212578053=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8839234549212578053==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f382de2b0f8a528a09bb975cc088a4342b663134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001 and instead added new configure option
--disable-multi-os-directory which was added upstream:
https://github.com/libffi/libffi/commit/877ea9bf9ac2c98cb858c12f5a6aeeec13cf978f

Removed patch 0003 due to various upstream fixes for mips soft-float
support since its addition in 2016:
https://github.com/libffi/libffi/commits/master/src/mips

Renumbered remaining patch.

Updated license hash due to copyright year bump:
https://github.com/libffi/libffi/commit/91739a1a912476adbf1e0e4dcb091b9a2c5007d9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  4 +-
 .../0001-Fix-installation-location-of-libffi.patch | 55 ----------------------
 ...001-Fix-use-of-compact-eh-frames-on-MIPS.patch} |  4 +-
 ...nable-hardfloat-in-the-MIPS-assembly-code.patch | 44 -----------------
 package/libffi/libffi.hash                         |  4 +-
 package/libffi/libffi.mk                           |  7 +--
 6 files changed, 10 insertions(+), 108 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0735b0c5da..b7d45df2a2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -594,9 +594,7 @@ package/libedit/0001-check-bsd-functions-in-libbsd.patch Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch Upstream
 package/libfcgi/0001-link-against-math.patch Upstream
 package/libfcgi/0002-disable-examples.patch Sob Upstream
-package/libffi/0001-Fix-installation-location-of-libffi.patch Upstream
-package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch Upstream
-package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch Upstream
+package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch Upstream
 package/libfm/0001-modules-fix-cross-compilation.patch Upstream
 package/libfreeimage/0001-no-root-install.patch Upstream
 package/libfreeimage/0002-fix-cpuid-x86.patch Upstream
diff --git a/package/libffi/0001-Fix-installation-location-of-libffi.patch b/package/libffi/0001-Fix-installation-location-of-libffi.patch
deleted file mode 100644
index 6ac9123730..0000000000
--- a/package/libffi/0001-Fix-installation-location-of-libffi.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 580f46a7bc6e9fea3a2227b5268cc3aed1d60e3b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 7 Feb 2013 22:26:56 +0100
-Subject: [PATCH] Fix installation location of libffi
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The libffi is currently declared as toolexeclib_LTLIBRARIES. In many
-cases, toolexeclib libraries will be installed in /usr/lib, so it
-doesn't make any difference.
-
-However, with multilib toolchains, they get installed in a
-subdirectory of /usr/lib/. For example, with a Sourcery CodeBench
-PowerPC toolchain, if the e500mc multilib variant is used, the libffi
-library gets installed in /usr/lib/te500mc/. This is due to the
-following code in the configure script:
-
-  multi_os_directory=`$CC -print-multi-os-directory`
-  case $multi_os_directory in
-    .) ;; # Avoid trailing /.
-    *) toolexeclibdir=$toolexeclibdir/$multi_os_directory ;;
-  esac
-
-Once the library is installed in /usr/lib/te500mc/, nothing works
-because this installation location is inconsistent with the
-installation location declared in libffi.pc.
-
-So, instead of using this bizarre toolexeclib_LTLIBRARIES, simply use
-the more standard lib_LTLIBRARIES, which ensures that the libffi
-library is always installed in /usr/lib.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[unfuzz for 3.2.1]
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0e40451..309474c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -104,7 +104,7 @@ FLAGS_TO_PASS = $(AM_MAKEFLAGS)
- 
- MAKEOVERRIDES=
- 
--toolexeclib_LTLIBRARIES = libffi.la
-+lib_LTLIBRARIES = libffi.la
- noinst_LTLIBRARIES = libffi_convenience.la
- 
- libffi_la_SOURCES = src/prep_cif.c src/types.c \
--- 
-2.5.3
-
diff --git a/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch b/package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch
similarity index 94%
rename from package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
rename to package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch
index c19e395f90..7786b984a2 100644
--- a/package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch
+++ b/package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch
@@ -15,6 +15,8 @@ Mips and compiler support it.
 Signed-off-by: Jérôme Pouiller <jezz@sysmic.org>
 [unfuzz for 3.2.1]
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
+[rebased for 3.4.6]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 10 ++++++++++
  1 file changed, 10 insertions(+)
@@ -23,7 +25,7 @@ diff --git a/configure.ac b/configure.ac
 index a7bf5ee..36cd0d4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -469,6 +469,16 @@ esac
+@@ -238,6 +238,16 @@ esac
  AM_CONDITIONAL(FFI_EXEC_TRAMPOLINE_TABLE, test x$FFI_EXEC_TRAMPOLINE_TABLE = x1)
  AC_SUBST(FFI_EXEC_TRAMPOLINE_TABLE)
  
diff --git a/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch b/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
deleted file mode 100644
index 168972a871..0000000000
--- a/package/libffi/0003-libffi-enable-hardfloat-in-the-MIPS-assembly-code.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 48bc37fabbc685b1e3293055bd33ca66c619305e Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 13 Jan 2016 14:49:59 +0000
-Subject: [PATCH] libffi: enable hardfloat in the MIPS assembly code
-
-This way it will be possible to build it for soft-float. This is only a
-temporary fix. The package needs to be fixed properly.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Update for 3.3-rc0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mips/n32.S | 1 +
- src/mips/o32.S | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/mips/n32.S b/src/mips/n32.S
-index c6985d3..dc842d5 100644
---- a/src/mips/n32.S
-+++ b/src/mips/n32.S
-@@ -44,6 +44,7 @@
- #endif
- #if !defined(__mips_isa_rev) || (__mips_isa_rev<6)
- 	.set mips4
- #endif
-+	.set hardfloat
- 	.text
- 	.align	2
- 	.globl	ffi_call_N32
-diff --git a/src/mips/o32.S b/src/mips/o32.S
-index eb27981..b653daf 100644
---- a/src/mips/o32.S
-+++ b/src/mips/o32.S
-@@ -42,6 +42,7 @@
- #define RA_OFF		(SIZEOF_FRAME - 1 * FFI_SIZEOF_ARG)
- 
- 	.abicalls
-+	.set hardfloat
- 	.text
- 	.align	2
- 	.globl	ffi_call_O32
--- 
-2.4.10
-
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 8d2349ec21..c2ef588f6b 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676  libffi-3.4.4.tar.gz
+sha256  b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e  libffi-3.4.6.tar.gz
 # License files, locally calculated
-sha256  2c9c2acb9743e6b007b91350475308aee44691d96aa20eacef8e199988c8c388  LICENSE
+sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 6249023eae..9c47cf3973 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,19 +4,20 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.4
+LIBFFI_VERSION = 3.4.6
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_CPE_ID_VALID = YES
 LIBFFI_INSTALL_STAGING = YES
-# We're patching Makefile.am
+# We're patching configure.ac
 LIBFFI_AUTORECONF = YES
+LIBFFI_CONF_OPTS = --disable-multi-os-directory
 
 # The static exec trampolines is enabled by default since
 # libffi 3.4.2. However it doesn't work with gobject-introspection.
-LIBFFI_CONF_OPTS = --disable-exec-static-tramp
+LIBFFI_CONF_OPTS += --disable-exec-static-tramp
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============8839234549212578053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8839234549212578053==--
