Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1D6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B3E60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4B3E60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78DD56060E;
	Sun, 25 Jul 2021 21:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VodpzevfziCx; Sun, 25 Jul 2021 21:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FD4600B6;
	Sun, 25 Jul 2021 21:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4E891BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903EB83033
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgRIRgTBJJlk for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:27:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ACDF83342
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7940A88FBC; Sun, 25 Jul 2021 20:53:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:27:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3529c0c3f5ed15e46fa2636c583a2204581bde0c
X-Git-Newrev: 6ef7a226b58e9b9e3611f048204897786b104b0b
X-Patchwork-Hint: ignore
Message-Id: <20210725205325.7940A88FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gumbo-parser: fix build without C++
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6ef7a226b58e9b9e3611f048204897786b104b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build without C++ fails since the addition of the package in commit
f6628763eb302f15f861e0ce7bfc44b34b066bea

Fixes:
 - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-build-without-C.patch    | 63 ++++++++++++++++++++++
 package/gumbo-parser/gumbo-parser.mk               |  1 +
 2 files changed, 64 insertions(+)

diff --git a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
new file mode 100644
index 0000000000..cf90e6f3b1
--- /dev/null
+++ b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
@@ -0,0 +1,63 @@
+From 968975107af5f4382e3e9410a635e32c14cea75f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Jul 2021 23:47:26 +0200
+Subject: [PATCH] configure.ac: fix build without C++
+
+Fix the following build failure raised on toolchains without C++:
+
+checking whether the C++ compiler works... no
+configure: error: in `/home/buildroot/autobuild/run/instance-0/output-1/build/gumbo-parser-0.10.1':
+configure: error: C++ compiler cannot create executables
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/google/gumbo-parser/pull/426]
+---
+ Makefile.am  | 2 ++
+ configure.ac | 6 +++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cb62459..5bebd92 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -105,7 +105,9 @@ gumbo_test_DEPENDENCIES += check-local
+ gumbo_test_LDADD += gtest/lib/libgtest.la gtest/lib/libgtest_main.la
+ endif
+ 
++if HAVE_EXAMPLES
+ noinst_PROGRAMS = clean_text find_links get_title positions_of_class benchmark serialize prettyprint
++endif
+ LDADD = libgumbo.la
+ AM_CPPFLAGS = -I"$(srcdir)/src"
+ 
+diff --git a/configure.ac b/configure.ac
+index 32dc9b9..172a36b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -9,8 +9,8 @@ AC_CONFIG_SRCDIR([src/parser.c])
+ AC_CONFIG_FILES([Makefile gumbo.pc])
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC_C99
++AC_PROG_CXX
+ 
+ # Checks for libraries.
+ 
+@@ -27,6 +27,10 @@ AC_CHECK_LIB([gtest_main],
+              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [true]),
+              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [false]))
+ 
++AC_ARG_ENABLE([examples],
++              AS_HELP_STRING([--disable-examples], [Disable examples]))
++AM_CONDITIONAL([HAVE_EXAMPLES], [test "x$enable_examples" != "xno"])
++
+ # Init Automake & libtool
+ AM_INIT_AUTOMAKE([foreign subdir-objects])
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+-- 
+2.30.2
+
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index aedc56cef1..8c9330ae70 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -10,5 +10,6 @@ GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES
 GUMBO_PARSER_AUTORECONF = YES
+GUMBO_PARSER_CONF_OPTS = --disable-examples
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
