Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F7DC77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 14:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D5E41D83;
	Tue, 16 May 2023 14:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D5E41D83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6kgGBxdJB_d; Tue, 16 May 2023 14:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B71B441496;
	Tue, 16 May 2023 14:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B71B441496
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1815E1BF947
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 14:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAD6241496
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 14:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD6241496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGUoE3QDZX7P for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 14:49:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76500410EC
 for <buildroot@buildroot.org>; Tue, 16 May 2023 14:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76500410EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60A5E8678A; Tue, 16 May 2023 14:49:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 16:48:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fb6fe5ddf613faf8b6278fdf8ece6059ea825932
X-Git-Newrev: e4ac14e09a57667168278187331cdf7238b80324
X-Patchwork-Hint: ignore
Message-Id: <20230516144917.60A5E8678A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bootgen: bump to
 xilinx_v2023.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4ac14e09a57667168278187331cdf7238b80324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps bootgen to version xilinx_v2023.1.
The patch for build machines with modern flex is no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   1 -
 ...01-Fix-build-on-machines-with-modern-flex.patch | 133 ---------------------
 package/bootgen/bootgen.hash                       |   2 +-
 package/bootgen/bootgen.mk                         |   2 +-
 4 files changed, 2 insertions(+), 136 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 13f67695f5..81cf1afe6b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -242,7 +242,6 @@ package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstre
 package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
 package/boinc/S99boinc-client Indent Shellcheck Variables
-package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch Upstream
 package/botan/0001-Add-superh-alias-needed-by-Debian.patch Upstream
 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
deleted file mode 100644
index ea82f5e70c..0000000000
--- a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 18 Mar 2022 09:02:31 +0100
-Subject: [PATCH] Fix build on machines with modern flex
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
-../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
----
- FlexLexer.h         | 6 +++---
- bif.yy.cpp          | 2 +-
- bifscanner.h        | 2 +-
- cmdoptions.yy.cpp   | 2 +-
- cmdoptionsscanner.h | 2 +-
- reginit.yy.cpp      | 2 +-
- reginitscanner.h    | 2 +-
- 7 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/FlexLexer.h b/FlexLexer.h
-index b115b5d..1c0386f 100755
---- a/FlexLexer.h
-+++ b/FlexLexer.h
-@@ -33,15 +33,15 @@
- //
- // If you want to create multiple lexer classes, you use the -P flag
- // to rename each yyFlexLexer to some other xxFlexLexer.  You then
--// include <FlexLexer.h> in your other sources once per lexer class:
-+// include "FlexLexer.h" in your other sources once per lexer class:
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer xxFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //
- //	#undef yyFlexLexer
- //	#define yyFlexLexer zzFlexLexer
--//	#include <FlexLexer.h>
-+//	#include "FlexLexer.h"
- //	...
- 
- #ifndef __FLEX_LEXER_H
-diff --git a/bif.yy.cpp b/bif.yy.cpp
-index 7dd0841..9e09267 100644
---- a/bif.yy.cpp
-+++ b/bif.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/bifscanner.h b/bifscanner.h
-index a6ec9e4..ded78da 100755
---- a/bifscanner.h
-+++ b/bifscanner.h
-@@ -28,7 +28,7 @@
- #if ! defined(yyFlexLexerOnce)
- #undef yyFlexLexer
- #define yyFlexLexer bifFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
-index 6ee80de..1acfcce 100644
---- a/cmdoptions.yy.cpp
-+++ b/cmdoptions.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
-index a48af09..e02c1f1 100755
---- a/cmdoptionsscanner.h
-+++ b/cmdoptionsscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
-diff --git a/reginit.yy.cpp b/reginit.yy.cpp
-index 8422867..ff088f9 100644
---- a/reginit.yy.cpp
-+++ b/reginit.yy.cpp
-@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
- 
- #define yytext_ptr yytext
- 
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- 
- int yyFlexLexer::yywrap() { return 1; }
- int yyFlexLexer::yylex()
-diff --git a/reginitscanner.h b/reginitscanner.h
-index 4e78af9..23177be 100755
---- a/reginitscanner.h
-+++ b/reginitscanner.h
-@@ -29,7 +29,7 @@
- 
- #undef yyFlexLexer
- #define yyFlexLexer reginitFlexLexer
--#include <FlexLexer.h>
-+#include "FlexLexer.h"
- #endif
- 
- // Override the interface for yylex since we namespaced it
--- 
-2.30.2
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 5d77c164f3..937509c859 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
+sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 88bc73b604..d83980d925 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2022.2
+BOOTGEN_VERSION = xilinx_v2023.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
