Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9389DCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E89C60BA5;
	Wed, 18 Oct 2023 09:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E89C60BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AT5MlELO7i9U; Wed, 18 Oct 2023 09:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA4E60BBD;
	Wed, 18 Oct 2023 09:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA4E60BBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8EC1BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5148641BC3
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5148641BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-naBp7cn0VV for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 743FA41A04
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743FA41A04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B6C485D61; Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Oct 2023 11:37:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 487761a5b294ae1806030b935faa97c1f1fd1820
X-Git-Newrev: 032601efa71f24e87b16cd688c942caf8db94f33
X-Patchwork-Hint: ignore
Message-Id: <20231018094228.5B6C485D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: bump to xilinx_v2023.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=032601efa71f24e87b16cd688c942caf8db94f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump bootgen to xilinx_v2023.2.

With version xilinx_v2023.2, the flexlexer patch has been fully applied:
https://github.com/Xilinx/bootgen/commit/8e6702bb5064b806e45028486de7376962470a36

Thus the flexlexer patch can finally be removed from buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lds-on-machines-with-modern-flex-versions.patch | 69 ----------------------
 package/bootgen/bootgen.hash                       |  2 +-
 package/bootgen/bootgen.mk                         |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch b/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
deleted file mode 100644
index b13dd2b03b..0000000000
--- a/package/bootgen/0001-Refix-builds-on-machines-with-modern-flex-versions.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 29a4e487527d109f517fc47a7c284b7732b27a10 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 12 Jun 2023 21:04:25 +0200
-Subject: [PATCH] Refix builds on machines with modern flex versions
-
-Bootgen embeds an old version of flex, but uses the system include syntax
-(#include <>) to reference it, causing conflicts on systems with the
-development headers for a modern flex version installed, leading to build
-issues like:
-
-../bisonflex/cmdoptions.yy.cpp: In member function 'virtual int CO::FlexScanner::yylex()':
-../bisonflex/cmdoptions.yy.cpp:1362:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
-
-http://autobuild.buildroot.net/results/293/2936d9b054269b7055e66ab5a7f7c1f7f4926d48/build-end.log
-
-Fix it by using normal local #include statements by:
-
-sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
-
-Notice: This was already fixed on master with:
-https://github.com/Xilinx/bootgen/pull/20
-
-Notice: The patch was not applied, instead a different patch with the same
-content was applied to master:
-https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed
-
-This patch was not applied to the xlnx_rel_v2023.1 branch, instead most
-of the content was included in:
-https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a
-
-But the cmdoptions.yy.cpp and reginit.yy.cpp hunks were accidently dropped:
-https://github.com/Xilinx/bootgen/commit/bfba91b2c84160dc203ff09f0e930d82ed06a83a#diff-e0287adb420dbecc112acdf7d4a1efba8ea6cbf06401e4e8679b8ffd22a091d8
-
-Upstream: https://github.com/Xilinx/bootgen/pull/24
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cmdoptions.yy.cpp | 2 +-
- reginit.yy.cpp    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
-index 38fed35..4e940ab 100644
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
-diff --git a/reginit.yy.cpp b/reginit.yy.cpp
-index d830734..dede473 100644
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
--- 
-2.30.2
-
diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 937509c859..6f34b2b850 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
+sha256  aa8120369d8a6016c731a3338188045c82833602e8ea955b53130a16560e5eb3  bootgen-xilinx_v2023.2.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index d83980d925..70338090f4 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2023.1
+BOOTGEN_VERSION = xilinx_v2023.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
