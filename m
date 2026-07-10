Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E9EC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02D340445;
	Fri, 10 Jul 2026 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wAJawHyeIhz; Fri, 10 Jul 2026 16:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B54E5408C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701019;
	bh=UrKuZgYaAybxkMnznDx63qw3n16R7k1ztWz3zU5dcDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CRQNQh3SAhMbajuhNwmLkj0PzobJS8OIo0fv/OJG8lPBIeazHvuZeffh8F4xzrCUF
	 HvH1nZt9IdU2BPmLOkfOc9XBQ8xlJn9fXbYwts7hfOvpMAUSRGaeAnolBDs9+RcdBr
	 W+q6O5AIvd87IpfPCC8uC3gCAqsygle3J6YoM8PTktU0GFzMXvdcMhSl6KCe0LAB9h
	 R6F599JuDZ67tvMgMS0TrKeyviZ/gT3G9V8CuGbMsyC3dgtoWS8kzJnDWVqC+c84Gz
	 fZSq74JNGT/PNKLKXDMVd0vAgx405Hd8Cj7xJX/BBjDJDHDpmfYfvCVIl3l1QeoYgn
	 2HMXFGd093acQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54E5408C1;
	Fri, 10 Jul 2026 16:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B37BB320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A07380FEF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMELNsIuOlSO for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACBC480F24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACBC480F24
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B22D38869F; Fri, 10 Jul 2026 16:29:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:29:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a6967d280be1bd8461f9c924852d47635348ef
X-Git-Newrev: c804ebff5502eac6e7d84129bfb2becc400898c6
X-Patchwork-Hint: ignore
Message-Id: <20260710162943.B22D38869F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/attr: security bump version to
 2.6.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c804ebff5502eac6e7d84129bfb2becc400898c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.nongnu.org/archive/html/acl-devel/2026-06/msg00000.html

Fixes CVE-2026-54369, CVE-2026-54370 and CVE-2026-54371.

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ....ac-add-detection-of-symver-gcc-attribute.patch | 75 ----------------------
 ...c-Add-missing-libgen.h-include-for-basena.patch | 32 ---------
 package/attr/attr.hash                             |  2 +-
 package/attr/attr.mk                               |  6 +-
 4 files changed, 2 insertions(+), 113 deletions(-)

diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
deleted file mode 100644
index ee029e9735..0000000000
--- a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 365426c28f8bf73d34d77cc06b7d5ffeae17f13a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 6 Feb 2024 15:33:15 +0100
-Subject: [PATCH] configure.ac: add detection of symver gcc attribute
-
-On non-ELF platforms, such as microblaze, builds will fail when trying
-to add symver information because  __attribute__((symver ..)) is not
-supported even though __has_attribute(__symver__) returns true.
-
-Support for symver needs to be detected via a compile test since
-__has_attribute can report false positives [0].
-
-Add a configure compile check for __attribute__((symver ..)) to ensure
-it is supported and define a variable to advertise support.
-
-[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c1
-
-Upstream: https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=943c776089dbb24ebbfb7432ba9841f1845bf95a
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Giulio: rework local patch for #if nesting]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- configure.ac       | 15 +++++++++++++++
- libattr/syscalls.c |  8 ++++----
- 2 files changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7e362e9..98477b5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -57,6 +57,21 @@ AS_CASE([$host_os],
- 	[linux*], [os_linux=yes])
- AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
- 
-+AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
-+	gcc_cv_symver_attribute,
-+	[cat > conftest.c <<EOF
-+void foo (void) {}
-+__typeof(foo) foo __attribute__ ((__symver__("foo@foo")));
-+EOF
-+	gcc_cv_symver_attribute=no
-+	if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
-+	    gcc_cv_symver_attribute=yes
-+	fi
-+	rm -f conftest.[cs]
-+])
-+AS_IF([test $gcc_cv_symver_attribute = yes],
-+      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver attribute])])
-+
- AC_CONFIG_COMMANDS([include/attr],
- 	[dnl
- 	rm -rf include/attr
-diff --git a/libattr/syscalls.c b/libattr/syscalls.c
-index 907560a..7ee6d39 100644
---- a/libattr/syscalls.c
-+++ b/libattr/syscalls.c
-@@ -31,10 +31,10 @@
-  * prefer symver attribute if available (since gcc 10),
-  * fall back to traditional .symver asm directive otherwise.
-  */
--#ifdef __has_attribute
--# if __has_attribute(__symver__)
--#  define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
--# elif __has_attribute(__no_reorder__)
-+#if defined(HAVE_SYMVER_ATTRIBUTE)
-+# define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
-+#elif defined(__has_attribute)
-+# if __has_attribute(__no_reorder__)
-    /*
-     * Avoid wrong partitioning with older gcc and LTO. May not work reliably
-     * with all versions; use -flto-partition=none if you encounter problems.
--- 
-2.34.1
-
diff --git a/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch b/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
deleted file mode 100644
index 304177257c..0000000000
--- a/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8a80d895dfd779373363c3a4b62ecce5a549efb2 Mon Sep 17 00:00:00 2001
-From: "Haelwenn (lanodan) Monnier" <contact@hacktivis.me>
-Date: Sat, 30 Mar 2024 10:17:10 +0100
-Subject: [PATCH] tools/attr.c: Add missing libgen.h include for basename(3)
-
-Fixes compilation issue with musl and modern C99 compilers.
-
-See: https://bugs.gentoo.org/926294
-
-Upstream: https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=8a80d895dfd779373363c3a4b62ecce5a549efb2
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- tools/attr.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/attr.c b/tools/attr.c
-index f12e4af..6a3c1e9 100644
---- a/tools/attr.c
-+++ b/tools/attr.c
-@@ -28,6 +28,7 @@
- #include <errno.h>
- #include <string.h>
- #include <locale.h>
-+#include <libgen.h>
- 
- #include <attr/attributes.h>
- 
--- 
-2.45.0
-
diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index f63c0e312a..be858a663f 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b  attr-2.5.2.tar.xz
+sha256  6c8a2148a7b85043b68492bce43316b0e2e214fc4e628c7ede078e76e216330b  attr-2.6.0.tar.xz
 
 # Locally calculated
 sha256  98f318493be6b08bff3cd295791cde06c54e17882a3c74a1ed245eaa02533d52  doc/COPYING
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 1d24144f46..f9bdfa930f 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-ATTR_VERSION = 2.5.2
+ATTR_VERSION = 2.6.0
 ATTR_SOURCE = attr-$(ATTR_VERSION).tar.xz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_CPE_ID_VALID = YES
-
-# Flag added for patch dealing with symver in configure.ac
-ATTR_AUTORECONF = YES
-
 ATTR_INSTALL_STAGING = YES
 
 ATTR_CONF_OPTS = --disable-nls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
