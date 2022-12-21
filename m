Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9262C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07D2C40441;
	Wed, 21 Dec 2022 12:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D2C40441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UWjeT719Dp2; Wed, 21 Dec 2022 12:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19C9A404C1;
	Wed, 21 Dec 2022 12:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19C9A404C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFAD91BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA92740382
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 12:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA92740382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcZM_8XVgJJ3 for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 12:50:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EBF2402A8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EBF2402A8
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 12:50:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a2ac:472c:b44e:1236])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55DB078034E;
 Wed, 21 Dec 2022 13:49:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Dec 2022 13:49:55 +0100
Date: Wed, 21 Dec 2022 13:49:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221221124955.GL2909@scaer>
References: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671626998;
 bh=e5R0BC8YSR1qODqnGNVdOYb+by4XyyGxWtnHnHs0iMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fdVUNVONYk2JwFz8WBWeP+FpEqa9tY0BEdayaiaJiTN4dcMu0pppXxhCjsE9kmM55
 ipl013uqUUMpEEukQlEXfHT5pz3FEryoWjHa0xcMGKmRZYKWFs6nDQoEQQd9V3/Hr7
 sSryokXOvHPLJAXoF0myQCwALJ7ju5eJPNs8La/TThqKWqaGHdwYBI9ctHYl7MJm2o
 j+tZ8GCG6Yd6Rr2S96WnKSMMp1tJnpftn6fpFoe0bj1mG00KtoW3OPrMiF564f6Gp5
 iF+FhAilc52/pmCUOj+lKpv0MoAh+wS5D2/xKIxdivCGAMhJ+78KTSWFDInENEpHQn
 GCbi14EZa613g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fdVUNVON
Subject: Re: [Buildroot] [PATCH 1/1] package/lightning; fix build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-19 23:58 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 2.2.0 in
> commit af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
> http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:
> 
> jit_disasm.c: In function 'fprintf_styled':
> jit_disasm.c:57:27: error: parameter name omitted
>    57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
>       |                           ^~~~~~
> jit_disasm.c:57:35: error: parameter name omitted
>    57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-lib-jit_disasm.c-fix-build.patch     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> 
> diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> new file mode 100644
> index 0000000000..f0bedc1817
> --- /dev/null
> +++ b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> @@ -0,0 +1,41 @@
> +From 6d3ba4fb38ef3af61d8b7fc5c7781ed244ccf9fe Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 19 Dec 2022 23:36:48 +0100
> +Subject: [PATCH] lib/jit_disasm.c: fix build
> +
> +Fix the following build failure raised since
> +http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:
> +
> +jit_disasm.c: In function 'fprintf_styled':
> +jit_disasm.c:57:27: error: parameter name omitted
> +   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
> +      |                           ^~~~~~
> +jit_disasm.c:57:35: error: parameter name omitted
> +   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
> +      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to lightning@gnu.org]

Although I think we could have been a better fix, this has now been
applied upstream, so we can just argue that any remaining issue will
have to be fixed with another (set of) patches.

Applied to master after making it a proper backport, thanks.

Regards,
Yann E. MORIN.

> +---
> + lib/jit_disasm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
> +index 58a269b..68c966d 100644
> +--- a/lib/jit_disasm.c
> ++++ b/lib/jit_disasm.c
> +@@ -54,7 +54,7 @@ static FILE			 *disasm_stream;
> + #endif
> + 
> + #if BINUTILS_2_38
> +-static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
> ++static int fprintf_styled(void * stream, enum disassembler_style style, const char* fmt, ...)
> + {
> +   va_list args;
> +   int r;
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
