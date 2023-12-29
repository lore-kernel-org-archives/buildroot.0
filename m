Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CC2C4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7094240540;
	Fri, 29 Dec 2023 21:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7094240540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMvV2muK2sbA; Fri, 29 Dec 2023 21:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC371436C4;
	Fri, 29 Dec 2023 21:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC371436C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E30DC1BF239
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44EC9605A9
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44EC9605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4ryWYdQAIJf for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B310605C9
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B310605C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4964183914; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:14:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a8d669f8ea35a4c486834b49cca112e57125c93
X-Git-Newrev: b50c3a431a1e17beb5597d2516c1ac388ba3301a
X-Patchwork-Hint: ignore
Message-Id: <20231229211749.4964183914@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: bump to version
 1.30.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b50c3a431a1e17beb5597d2516c1ac388ba3301a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so drop autoreconf

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.30.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...sl-3-5-0-does-not-have-DSA_meth_set1_name.patch | 69 ----------------------
 package/pkcs11-helper/pkcs11-helper.hash           |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk             |  4 +-
 4 files changed, 2 insertions(+), 74 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7c14305284..fccfb82ade 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1063,7 +1063,6 @@ package/pigpio/S50pigpio Shellcheck Variables
 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch Upstream
 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch Upstream
 package/pixman/0001-Disable-tests.patch Upstream
-package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch Upstream
 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch Upstream
 package/pkgconf/pkg-config.in Shellcheck
diff --git a/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
deleted file mode 100644
index 21ce66ae79..0000000000
--- a/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 17d10b0dfb2b56a047db307687640adcd560e199 Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Mon, 2 May 2022 21:26:58 +0300
-Subject: [PATCH] openssl: libressl-3.5.0 does not have DSA_meth_set1_name
-
-while it does not expose the DSA_METHOD structure.
-
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/OpenSC/pkcs11-helper/commit/17d10b0dfb2b56a047db307687640adcd560e199]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog             |  1 +
- configure.ac          | 16 ++++++++++++++++
- lib/pkcs11h-openssl.c |  4 ++++
- 3 files changed, 21 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 716bb8d8..57697a3b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -300,7 +300,9 @@ if test "${have_openssl}" = "no"; then
- fi
- 
- if test "${have_openssl}" = "yes"; then
-+	old_CFLAGS="${CFLAGS}"
- 	old_LIBS="${LIBS}"
-+	CFLAGS="${CFLAGS} ${OPENSSL_CFLAGS}"
- 	LIBS="${LIBS} ${OPENSSL_LIBS}"
- 	AC_CHECK_FUNCS([ \
- 		RSA_meth_dup RSA_meth_free \
-@@ -344,6 +346,20 @@ if test "${have_openssl}" = "yes"; then
- 	)
- 	AC_MSG_CHECKING([for OpenSSL ec support])
- 	AC_MSG_RESULT([${openssl_ec}])
-+	# https://github.com/OpenSC/pkcs11-helper/pull/55
-+	AC_COMPILE_IFELSE(
-+		[AC_LANG_PROGRAM(
-+			[[#include <openssl/dsa.h>]],
-+			[[
-+				int foo() {
-+					DSA_METHOD *meth = NULL;
-+					sizeof(meth->name);
-+				}
-+			]]
-+		)],
-+		[AC_DEFINE([HAVE_DSA_METHOD_NAME], [1], [Have DSA_METHOD->name])]
-+	)
-+	CFLAGS="${old_CFLAGS}"
- 	LIBS="${old_LIBS}"
- fi
- 
-diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
-index 961c955c..38ee8e2d 100644
---- a/lib/pkcs11h-openssl.c
-+++ b/lib/pkcs11h-openssl.c
-@@ -235,9 +235,13 @@ DSA_meth_free (DSA_METHOD *meth)
- static int
- DSA_meth_set1_name (DSA_METHOD *meth, const char *name)
- {
-+#ifdef HAVE_DSA_METHOD_NAME
- 	CK_RV rv;
- 	rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
- 	return rv == CKR_OK ? 1 : 0;
-+#else
-+	return 0;
-+#endif
- }
- #endif
- 
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 0614e8aed4..bc9cf3478b 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  996846a3c8395e03d8c0515111dc84d82e6e3648d44ba28cb2dbbbca2d4db7d6  pkcs11-helper-1.29.0.tar.bz2
+sha256  4c5815ba910cabf26df08d449ca2909daf4538c9899aa7f7fadc61229d3488a9  pkcs11-helper-1.30.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index d1a1e38d4e..de192493ea 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.29.0
+PKCS11_HELPER_VERSION = 1.30.0
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
 PKCS11_HELPER_INSTALL_STAGING = YES
-# We're patching configure.ac
-PKCS11_HELPER_AUTORECONF = YES
 
 PKCS11_HELPER_CONF_OPTS = \
 	--disable-crypto-engine-polarssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
