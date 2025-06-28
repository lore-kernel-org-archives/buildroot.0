Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A2CC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 15:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CBE81D70;
	Sat, 28 Jun 2025 15:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAcj0F98Ugpm; Sat, 28 Jun 2025 15:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2AD81D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2AD81D9F;
	Sat, 28 Jun 2025 15:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B3D91C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6195160885
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFIVihQAI_ip for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC7560857
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC7560857
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F0E5847A3; Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 16:12:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da23be6338c1e82f39475d166407f97511e0b666
X-Git-Newrev: 5c18eb1a55dbec4b6bf4b7d0a9a4fa0337ccc5d8
X-Patchwork-Hint: ignore
Message-Id: <20250628152425.5F0E5847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gumbo-parser: bump to version
 0.13.1
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
Content-Type: multipart/mixed; boundary="===============1221006999528181443=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1221006999528181443==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5c18eb1a55dbec4b6bf4b7d0a9a4fa0337ccc5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://codeberg.org/gumbo-parser/gumbo-parser/releases

Release 0.11.0 onwards dropped the 'v' version prefix in the tarball
name, so drop it on our side as well.

The patch no longer applied cleanly and needed to be refreshed.
It was also submitted to the new upstream, the upstream link is
updated accordingly.
A local test build was done with the toolchain from the config that
originally triggered the build to fail due to lack of C++ support:
http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010

It is worth noting that we still build using autotools which is
deprecated in this version of gumbo-parser (in favor of meson).

The license file location was moved in a "doc" subdirectory, in upstream
commit [1]. This commit reflect that change.

[1] https://codeberg.org/gumbo-parser/gumbo-parser/commit/814e2b43f776e25ffe2089396ced63e6ceb4db06

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[Julien: fix license file location which has moved to "doc/"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-configure.ac-fix-build-without-C.patch    | 55 +++++++++++++---------
 package/gumbo-parser/gumbo-parser.hash             |  4 +-
 package/gumbo-parser/gumbo-parser.mk               |  6 +--
 3 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
index cf90e6f3b1..011b929a48 100644
--- a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
+++ b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
@@ -1,30 +1,49 @@
-From 968975107af5f4382e3e9410a635e32c14cea75f Mon Sep 17 00:00:00 2001
+From e6d9556775b0b8f597ce48dc18c908b3cc09e2a3 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Wed, 21 Jul 2021 23:47:26 +0200
 Subject: [PATCH] configure.ac: fix build without C++
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Fix the following build failure raised on toolchains without C++:
 
-checking whether the C++ compiler works... no
-configure: error: in `/home/buildroot/autobuild/run/instance-0/output-1/build/gumbo-parser-0.10.1':
-configure: error: C++ compiler cannot create executables
+  CXX      examples/find_links.o
+/bin/bash: line 1: no: command not found
+  CXX      examples/clean_text.o
+/bin/bash: line 1: no: command not found
+make[2]: *** [Makefile:1071: examples/find_links.o] Error 127
+  CXX      examples/positions_of_class.o
+make[2]: *** Waiting for unfinished jobs....
+  CC       examples/get_title.o
+/bin/bash: line 1: no: command not found
+make[2]: *** [Makefile:1071: examples/clean_text.o] Error 127
+make[2]: *** [Makefile:1071: examples/positions_of_class.o] Error 127
+  CXX      examples/serialize.o
+/bin/bash: line 1: no: command not found
+  CXX      examples/prettyprint.o
+make[2]: *** [Makefile:1071: examples/serialize.o] Error 127
+/bin/bash: line 1: no: command not found
+make[2]: *** [Makefile:1071: examples/prettyprint.o] Error 127
 
 Fixes:
  - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/google/gumbo-parser/pull/426]
+[Raphaël: refresh patch on top of 0.13.1, update description]
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+[Upstream status: https://codeberg.org/gumbo-parser/gumbo-parser/pulls/28]
 ---
  Makefile.am  | 2 ++
- configure.ac | 6 +++++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
+ configure.ac | 4 ++++
+ 2 files changed, 6 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index cb62459..5bebd92 100644
+index e3f9ed7..8a93854 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -105,7 +105,9 @@ gumbo_test_DEPENDENCIES += check-local
- gumbo_test_LDADD += gtest/lib/libgtest.la gtest/lib/libgtest_main.la
+@@ -96,7 +96,9 @@ gumbo_test_DEPENDENCIES += gtest/lib/libgtest.a gtest/lib/libgtest_main.a
+ gumbo_test_LDADD += gtest/lib/libgtest.a gtest/lib/libgtest_main.a
  endif
  
 +if HAVE_EXAMPLES
@@ -34,20 +53,10 @@ index cb62459..5bebd92 100644
  AM_CPPFLAGS = -I"$(srcdir)/src"
  
 diff --git a/configure.ac b/configure.ac
-index 32dc9b9..172a36b 100644
+index 5636a20..6d21b95 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -9,8 +9,8 @@ AC_CONFIG_SRCDIR([src/parser.c])
- AC_CONFIG_FILES([Makefile gumbo.pc])
- 
- # Checks for programs.
--AC_PROG_CXX
- AC_PROG_CC_C99
-+AC_PROG_CXX
- 
- # Checks for libraries.
- 
-@@ -27,6 +27,10 @@ AC_CHECK_LIB([gtest_main],
+@@ -28,6 +28,10 @@ AC_CHECK_LIB([gtest_main],
               AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [true]),
               AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [false]))
  
@@ -59,5 +68,5 @@ index 32dc9b9..172a36b 100644
  AM_INIT_AUTOMAKE([foreign subdir-objects])
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
 -- 
-2.30.2
+2.49.0
 
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index ee41f167a7..88c8fffa21 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d4fd158d998ab8302fa23bb01119b434bbfaf7139b59f9c74530a703176cb213  v0.10.1.tar.gz
+sha256  1a054d1e53d556641a6666537247411a77b0c18ef6ad5df23e30d2131676ef81  0.13.1.tar.gz
 
 # Hash for license files:
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  doc/COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index 76fcc876c5..dacd7c981e 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GUMBO_PARSER_VERSION = 0.10.1
+GUMBO_PARSER_VERSION = 0.13.1
 GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
-GUMBO_PARSER_SOURCE = v$(GUMBO_PARSER_VERSION).tar.gz
+GUMBO_PARSER_SOURCE = $(GUMBO_PARSER_VERSION).tar.gz
 GUMBO_PARSER_LICENSE = Apache-2.0
-GUMBO_PARSER_LICENSE_FILES = COPYING
+GUMBO_PARSER_LICENSE_FILES = doc/COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES
 GUMBO_PARSER_AUTORECONF = YES
 GUMBO_PARSER_CONF_OPTS = --disable-examples

--===============1221006999528181443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1221006999528181443==--
