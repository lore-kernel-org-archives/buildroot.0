Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E85BC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1384B60BB9;
	Mon, 14 Apr 2025 18:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqpTBYQE9F69; Mon, 14 Apr 2025 18:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5C460DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5C460DFA;
	Mon, 14 Apr 2025 18:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C629205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43D34060B
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQLrYtUw3UOZ for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32A140543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E32A140543
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:19:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFDAE846A9; Mon, 14 Apr 2025 18:19:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 20:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81b049f829181b0bfef08db6f5c17e2482b4e5be
X-Git-Newrev: 76b4fd159bcdba97eefdbc4299a7ae9b0a4cd423
X-Patchwork-Hint: ignore
Message-Id: <20250414181937.DFDAE846A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfcgi: update to 2.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=76b4fd159bcdba97eefdbc4299a7ae9b0a4cd423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4

Notes:
- drop 0001-link-against-math.patch as it is upstream [1] (by @ffontaine)
- drop 0002-disable-examples.patch as it is upstream [2] (by @ffontaine), add --disable-examples now
- update LICENSE as the name has been changed [3]

[1] https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
[2] https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
[3] https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Julien: remove .checkpackageignore entries to fix check-package errors]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                          |  2 --
 package/libfcgi/0001-link-against-math.patch | 20 --------------------
 package/libfcgi/0002-disable-examples.patch  | 23 -----------------------
 package/libfcgi/libfcgi.hash                 |  4 ++--
 package/libfcgi/libfcgi.mk                   |  5 +++--
 5 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1a61aa1ac0..3affba382d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -630,8 +630,6 @@ package/libdvbcsa/0001-altivec-powerpc64.patch lib_patch.Upstream
 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch lib_patch.Upstream
 package/libedit/0001-check-bsd-functions-in-libbsd.patch lib_patch.Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch lib_patch.Upstream
-package/libfcgi/0001-link-against-math.patch lib_patch.Upstream
-package/libfcgi/0002-disable-examples.patch lib_patch.Upstream
 package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch lib_patch.Upstream
 package/libfm/0001-modules-fix-cross-compilation.patch lib_patch.Upstream
 package/libfreeimage/0001-no-root-install.patch lib_patch.Upstream
diff --git a/package/libfcgi/0001-link-against-math.patch b/package/libfcgi/0001-link-against-math.patch
deleted file mode 100644
index 909a295bd6..0000000000
--- a/package/libfcgi/0001-link-against-math.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Link libfcgi against the math library.
-
-Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
-[Louis: rebase on top of 2.4.2]
-Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-Index: b/libfcgi/Makefile.am
-===================================================================
---- a/libfcgi/Makefile.am
-+++ b/libfcgi/Makefile.am
-@@ -19,6 +19,7 @@
-                      os_@SYSTEM@.c
- libfcgi_la_CC      = @PTHREAD_CC@
- libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
-+libfcgi_la_LIBADD  = -lm
- libfcgi_la_LDFLAGS = @EXTRA_LIBS@ -no-undefined
-
- libfcgi___la_SOURCES = $(INCLUDE_FILES)       \
diff --git a/package/libfcgi/0002-disable-examples.patch b/package/libfcgi/0002-disable-examples.patch
deleted file mode 100644
index ccd01c0ce0..0000000000
--- a/package/libfcgi/0002-disable-examples.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
-Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
-Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
-Common subdirectories: libfcgi-2.4.0.orig/images and libfcgi-2.4.0/images
-Common subdirectories: libfcgi-2.4.0.orig/include and libfcgi-2.4.0/include
-Common subdirectories: libfcgi-2.4.0.orig/java and libfcgi-2.4.0/java
-Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
-diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
---- libfcgi-2.4.0.orig/Makefile.am	2001-12-22 14:05:39.000000000 +0100
-+++ libfcgi-2.4.0/Makefile.am	2014-07-19 16:56:21.935216540 +0200
-@@ -10,7 +10,7 @@
- 		aclocal.m4 m4/libtool.m4 m4/lt*.m4 Makefile.in install-sh missing ltmain.sh \
- 		COPYING INSTALL
- 
--SUBDIRS = libfcgi cgi-fcgi examples include
-+SUBDIRS = libfcgi cgi-fcgi include
- 
- include_HEADERS = fcgi_config.h
- 
-Common subdirectories: libfcgi-2.4.0.orig/perl and libfcgi-2.4.0/perl
-Common subdirectories: libfcgi-2.4.0.orig/Win32 and libfcgi-2.4.0/Win32
diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 83860a4f3d..ca660c6ebd 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc  libfcgi-2.4.2.tar.gz
-sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE.TERMS
+sha256  c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc  libfcgi-2.4.4.tar.gz
+sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index ee61c22c45..3c90b30e39 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.2
+LIBFCGI_VERSION = 2.4.4
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
-LIBFCGI_LICENSE_FILES = LICENSE.TERMS
+LIBFCGI_LICENSE_FILES = LICENSE
 LIBFCGI_CPE_ID_VENDOR = fastcgi
 LIBFCGI_CPE_ID_PRODUCT = fcgi
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
+LIBFCGI_CONF_OPTS = --disable-examples
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
