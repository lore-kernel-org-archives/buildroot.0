Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD9C25B07
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE7141B90;
	Fri, 29 Jul 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE7141B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vm-qDCgwaNO0; Fri, 29 Jul 2022 11:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B080E4151E;
	Fri, 29 Jul 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B080E4151E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE871BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 315D640BCF
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315D640BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fN0I6TcveAe0 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:25:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 332B540BA0
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 332B540BA0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A441F868F0; Fri, 29 Jul 2022 11:11:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 13:25:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 642bb93c9fdbab56ae5b460f139dc4806f13721a
X-Git-Newrev: c7dbd08b59bbe652458ae29c14443abcf70998b9
X-Patchwork-Hint: ignore
Message-Id: <20220729111130.A441F868F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: bump version to 2.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7dbd08b59bbe652458ae29c14443abcf70998b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop local patches that have been upstreamed
- Remove AUTORECONF since configure.ac patches have been upstreamed
- Add --disable-asciidoc to avoid generating manual pages that require
asciidoctor leading to build failure

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Add-check-program-for-symver-attribute.patch | 56 ----------------------
 ...002-configure.ac-replace-argp_usage-check.patch | 40 ----------------
 package/cryptsetup/cryptsetup.hash                 |  4 +-
 package/cryptsetup/cryptsetup.mk                   | 10 ++--
 4 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch b/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
deleted file mode 100644
index 04f59a2050..0000000000
--- a/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7c6ec620de3f99d4212f4a54aa576df1b97020ab Mon Sep 17 00:00:00 2001
-From: Ondrej Kozina <okozina@redhat.com>
-Date: Wed, 2 Feb 2022 11:34:57 +0100
-Subject: [PATCH] Add check program for symver attribute.
-
-Fixes: #709.
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- configure.ac               | 11 +++++++++++
- lib/libcryptsetup_symver.h |  8 +++-----
- 2 files changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a0e5990d..b052f8cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -554,6 +554,17 @@ if test "x$enable_static_cryptsetup" = "xyes"; then
- 	PKG_CONFIG=$saved_PKG_CONFIG
- fi
- 
-+dnl Check compiler support for symver function attribute
-+saved_CFLAGS=$CFLAGS
-+CFLAGS="-O0 -Werror"
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-+	void _test_sym(void);
-+	__attribute__((__symver__("sym@VERSION_4.2"))) void _test_sym(void) {}
-+]],
-+[[ _test_sym() ]]
-+)],[ AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 to use __attribute__((symver))])])
-+CFLAGS=$saved_CFLAGS
-+
- AC_MSG_CHECKING([for systemd tmpfiles config directory])
- PKG_CHECK_VAR([systemd_tmpfilesdir], [systemd], [tmpfilesdir], [], [systemd_tmpfilesdir=no])
- AC_MSG_RESULT([$systemd_tmpfilesdir])
-diff --git a/lib/libcryptsetup_symver.h b/lib/libcryptsetup_symver.h
-index 2a804b6a..3558310d 100644
---- a/lib/libcryptsetup_symver.h
-+++ b/lib/libcryptsetup_symver.h
-@@ -67,11 +67,9 @@
-  *   under CRYPT_SYMBOL_EXPORT_OLD(int, crypt_func_X, ...) macro
-  */
- 
--#ifdef __has_attribute
--#  if __has_attribute(symver)
--#    define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
--       __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
--#  endif
-+#if HAVE_ATTRIBUTE_SYMVER
-+#  define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
-+     __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
- #endif
- 
- #if !defined(_CRYPT_SYMVER) && defined(__GNUC__)
--- 
-2.25.1
-
diff --git a/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
deleted file mode 100644
index 66e3be350c..0000000000
--- a/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 21515ad7a3b000ee6038f82bbb428ab527002bbd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Apr 2022 19:47:53 +0200
-Subject: [PATCH] configure.ac: replace argp_usage check
-
-Replace check for argp_usage by argp_parse as argp_usage is not used by
-cryptsetup. Moreover, this will fix the following build failure raised
-with argp-standalone in version 1.4.0 and
-https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
-
-/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
-cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
-/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
-cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'
-
-Fixes:
- - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.com/cryptsetup/cryptsetup/-/issues/737]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d31fb0a7..e47179f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -413,7 +413,7 @@ if test "x$enable_ssh_token" = "xyes"; then
- 	AC_CHECK_DECLS([ssh_session_is_known_server], [], [], [#include <libssh/libssh.h>])
- 	AC_CHECK_HEADER([argp.h], [], AC_MSG_ERROR([You need argp library.]))
- 	saved_LIBS=$LIBS
--	AC_SEARCH_LIBS([argp_usage],[argp])
-+	AC_SEARCH_LIBS([argp_parse],[argp])
- 	AC_SUBST(ARGP_LIBS, $LIBS)
- 	LIBS=$saved_LIBS
- fi
--- 
-2.35.1
-
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index dce2686d31..5f59b30560 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.4/sha256sums.asc
-sha256  fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507  cryptsetup-2.4.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.5/sha256sums.asc
+sha256  9184a6ebbd9ce7eb211152e7f741a6c82f2d1cc0e24a84ec9c52939eee0f0542  cryptsetup-2.5.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 20cf5d6346..01902c3f6a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.4
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION_MAJOR = 2.5
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
@@ -18,12 +18,8 @@ CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
 
-# 0001-Add-check-program-for-symver-attribute.patch
-# 0002-configure.ac-replace-argp_usage-check.patch
-CRYPTSETUP_AUTORECONF = YES
-
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
-CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
+CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2 --disable-asciidoc
 
 # cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
 # nettle, libnss or kernel crypto modules instead
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
