Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF670C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7824E60E38;
	Tue,  8 Nov 2022 19:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7824E60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCu3VFPD93zk; Tue,  8 Nov 2022 19:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E45960E2C;
	Tue,  8 Nov 2022 19:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E45960E2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36B511BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EDF24168C
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDF24168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIyBORe76IF0 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:28:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C308741682
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C308741682
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B197C88235; Tue,  8 Nov 2022 19:28:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 14:08:32 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: f9d9c271ff3f439caaa7736fa933446e06596729
X-Git-Newrev: 63570947e47e66aec8876a94bae062a81a6e1b65
X-Patchwork-Hint: ignore
Message-Id: <20221108192825.B197C88235@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libtasn1:
 security bump to version 4.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=63570947e47e66aec8876a94bae062a81a6e1b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Drop patch (already in version) and so autoreconf

https://gitlab.com/gnutls/libtasn1/-/blob/v4.19.0/NEWS

Fixes the following security issue:

- CVE-2021-46848: GNU Libtasn1 before 4.19.0 has an ETYPE_OK off-by-one
  array size check that affects asn1_encode_simple_der.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 308678e528a382ea4c27c33baf92b25871d47415)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-fuzz-Makefile.am-do-not-force-static.patch | 35 ----------------------
 package/libtasn1/libtasn1.hash                     |  4 +--
 package/libtasn1/libtasn1.mk                       |  5 +---
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch b/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
deleted file mode 100644
index 1f1abc7d9d..0000000000
--- a/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cf1b20f3d881a1cfbf8cae1f615f45a5a4fbb3b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Apr 2020 18:35:55 +0200
-Subject: [PATCH] fuzz/Makefile.am: do not force static
-
-Don't force static when linking corpus2arry to libtasn1 otherwise the
-build will fail if libtasn1 has been built only as a shared library:
-
-  CCLD     corpus2array
-/home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/8.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `../lib/.libs/libtasn1.so'
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/gnutls/libtasn1/-/merge_requests/61]
----
- fuzz/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fuzz/Makefile.am b/fuzz/Makefile.am
-index c6310d1..1fb7152 100644
---- a/fuzz/Makefile.am
-+++ b/fuzz/Makefile.am
-@@ -26,7 +26,7 @@ AM_CFLAGS = $(WERROR_CFLAGS) $(WARN_CFLAGS) $(CODE_COVERAGE_CFLAGS)
- AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes -I$(srcdir) \
-  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl -DSRCDIR=\"$(abs_srcdir)\" \
-  $(CODE_COVERAGE_CPPFLAGS)
--AM_LDFLAGS = -no-install -static
-+AM_LDFLAGS = -no-install
- 
- LDADD = ../lib/gl/libgnu.la ../lib/libtasn1.la $(FUZZ_LIBS) $(CODE_COVERAGE_LIBS)
- 
--- 
-2.25.1
-
diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index fa39dd2c73..4bcb6a3feb 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.18.0.tar.gz.sig
-sha256  4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898  libtasn1-4.18.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz.sig
+sha256  1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a  libtasn1-4.19.0.tar.gz
 # Locally calculated
 sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 11ab223962..3af1bcdcbb 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.18.0
+LIBTASN1_VERSION = 4.19.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
@@ -12,9 +12,6 @@ LIBTASN1_LICENSE_FILES = COPYING doc/COPYING doc/COPYING.LESSER
 LIBTASN1_CPE_ID_VENDOR = gnu
 LIBTASN1_INSTALL_STAGING = YES
 
-# We're patching fuzz/Makefile.am
-LIBTASN1_AUTORECONF = YES
-
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
