Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2621C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63CB6408BB;
	Tue, 16 May 2023 04:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CB6408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbX-6Alrilz5; Tue, 16 May 2023 04:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66AF340588;
	Tue, 16 May 2023 04:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66AF340588
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D926A1BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF11881E14
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF11881E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPUPDB0XjKXo for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:50:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560B481DF4
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 560B481DF4
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:50:20 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id E77F6440EA6;
 Tue, 16 May 2023 07:50:05 +0300 (IDT)
References: <20230516044418.21419-1-neal.frager@amd.com>
User-agent: mu4e 1.9.21; emacs 28.2
To: Neal Frager <neal.frager@amd.com>
Date: Tue, 16 May 2023 07:49:24 +0300
In-reply-to: <20230516044418.21419-1-neal.frager@amd.com>
Message-ID: <874jocc22f.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1684212606;
 bh=NE4AbL0kOhD6GQQ6zUHoKpAh0cq+CWoFqzOqryN6zK4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=V3ewblVXeChyaCIJPlYJN0Lpxnq2jFMkreC0xyoRClUYcSobD7oyoFlrCBJcvIO5h
 TqlvUtAYxvViMe+v3JesOAHM8a3CiK+k8GKibhMhV/SLTnp4P1mdLeH7YBIzU0qnR0
 vhvRAtdV6tyf1CjfEI2yeV2VSkWhK7RAQ2iZE+eet4GECvhw8yt9anIEN8NnOgAw36
 2TvsbJK/PbRIE260SPWjLGqAZfjm6SNQIMFvaQZT0z7+AkyPdZlSDSY3brV1v5oAp/
 IVQsrxOheKzEuOKYDq/JoVhi0zJFiPL6XqARyZy1v8ogRXS7XYnerGlAsWJxUnHfuj
 qONBpk8LNKuuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=V3ewblVX
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bootgen: bump to
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, May 16 2023, Neal Frager wrote:
> This patch bumps bootgen to version xilinx_v2023.1.
> The patch for build machines with modern flex is no longer needed.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>   - Added patch file remove to commit
> V2->V3:
>   - Fixed file name in bootgen.hash file
> ---
>  ...x-build-on-machines-with-modern-flex.patch | 133 ------------------

The patch should also be removed from the .checkpackageignore list.

baruch

>  package/bootgen/bootgen.hash                  |   2 +-
>  package/bootgen/bootgen.mk                    |   2 +-
>  3 files changed, 2 insertions(+), 135 deletions(-)
>  delete mode 100644 package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
>
> diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
> deleted file mode 100644
> index ea82f5e70c..0000000000
> --- a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Fri, 18 Mar 2022 09:02:31 +0100
> -Subject: [PATCH] Fix build on machines with modern flex
> -
> -Bootgen embeds an old version of flex, but uses the system include syntax
> -(#include <>) to reference it, causing conflicts on systems with the
> -development headers for a modern flex version installed, leading to build
> -issues like:
> -
> -../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
> -../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' (operand types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::istream*' {aka 'std::basic_istream<char>*'})
> -
> -Fix it by using normal local #include statements by:
> -
> -sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
> ----
> - FlexLexer.h         | 6 +++---
> - bif.yy.cpp          | 2 +-
> - bifscanner.h        | 2 +-
> - cmdoptions.yy.cpp   | 2 +-
> - cmdoptionsscanner.h | 2 +-
> - reginit.yy.cpp      | 2 +-
> - reginitscanner.h    | 2 +-
> - 7 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/FlexLexer.h b/FlexLexer.h
> -index b115b5d..1c0386f 100755
> ---- a/FlexLexer.h
> -+++ b/FlexLexer.h
> -@@ -33,15 +33,15 @@
> - //
> - // If you want to create multiple lexer classes, you use the -P flag
> - // to rename each yyFlexLexer to some other xxFlexLexer.  You then
> --// include <FlexLexer.h> in your other sources once per lexer class:
> -+// include "FlexLexer.h" in your other sources once per lexer class:
> - //
> - //	#undef yyFlexLexer
> - //	#define yyFlexLexer xxFlexLexer
> --//	#include <FlexLexer.h>
> -+//	#include "FlexLexer.h"
> - //
> - //	#undef yyFlexLexer
> - //	#define yyFlexLexer zzFlexLexer
> --//	#include <FlexLexer.h>
> -+//	#include "FlexLexer.h"
> - //	...
> - 
> - #ifndef __FLEX_LEXER_H
> -diff --git a/bif.yy.cpp b/bif.yy.cpp
> -index 7dd0841..9e09267 100644
> ---- a/bif.yy.cpp
> -+++ b/bif.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - 
> - #define yytext_ptr yytext
> - 
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - 
> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/bifscanner.h b/bifscanner.h
> -index a6ec9e4..ded78da 100755
> ---- a/bifscanner.h
> -+++ b/bifscanner.h
> -@@ -28,7 +28,7 @@
> - #if ! defined(yyFlexLexerOnce)
> - #undef yyFlexLexer
> - #define yyFlexLexer bifFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - 
> - // Override the interface for yylex since we namespaced it
> -diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
> -index 6ee80de..1acfcce 100644
> ---- a/cmdoptions.yy.cpp
> -+++ b/cmdoptions.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - 
> - #define yytext_ptr yytext
> - 
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - 
> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
> -index a48af09..e02c1f1 100755
> ---- a/cmdoptionsscanner.h
> -+++ b/cmdoptionsscanner.h
> -@@ -29,7 +29,7 @@
> - 
> - #undef yyFlexLexer
> - #define yyFlexLexer reginitFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - 
> - // Override the interface for yylex since we namespaced it
> -diff --git a/reginit.yy.cpp b/reginit.yy.cpp
> -index 8422867..ff088f9 100644
> ---- a/reginit.yy.cpp
> -+++ b/reginit.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - 
> - #define yytext_ptr yytext
> - 
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - 
> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/reginitscanner.h b/reginitscanner.h
> -index 4e78af9..23177be 100755
> ---- a/reginitscanner.h
> -+++ b/reginitscanner.h
> -@@ -29,7 +29,7 @@
> - 
> - #undef yyFlexLexer
> - #define yyFlexLexer reginitFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - 
> - // Override the interface for yylex since we namespaced it
> --- 
> -2.30.2
> -
> diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
> index 5d77c164f3..937509c859 100644
> --- a/package/bootgen/bootgen.hash
> +++ b/package/bootgen/bootgen.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acbb3  bootgen-xilinx_v2022.2.tar.gz
> +sha256  2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea8e  bootgen-xilinx_v2023.1.tar.gz
>  sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
> diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
> index 88bc73b604..d83980d925 100644
> --- a/package/bootgen/bootgen.mk
> +++ b/package/bootgen/bootgen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOOTGEN_VERSION = xilinx_v2022.2
> +BOOTGEN_VERSION = xilinx_v2023.1
>  BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
>  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
>  BOOTGEN_LICENSE = Apache-2.0


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
