Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332DDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75A760681;
	Tue, 20 Dec 2022 08:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B75A760681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwJ8-DOr-lN0; Tue, 20 Dec 2022 08:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF36B60881;
	Tue, 20 Dec 2022 08:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF36B60881
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1E741BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8E8F60881
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E8F60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_J8bbNzAPsa for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD901607D0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD901607D0
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:47:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4DA055FFB6;
 Tue, 20 Dec 2022 09:47:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 09:47:52 +0100
Date: Tue, 20 Dec 2022 09:47:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221220084752.GF2909@scaer>
References: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671526075;
 bh=ZauoB2bHfms63YDUPjAmtEPadiGjeVzqRTxhP32fNdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4J2IcUGYMilZ40DQHQKpI9PnQo1Z4B4nArYF6bj/5NcgPJaQ4HDrP+8s8MRWE3fB
 0ApScYZocH2D6Oc5AEwEh2uNrERjOpEwvakndpsLIHzJyX/p9IFvD70MP38euR/xAq
 SbBe95fYNwSm+fZZZPAqMzAR1QDzqYp6esE3Bgr5llPhUZZli4a10kkNw0/865Fz1U
 z4XdVifX0rLvgXf1zggXLzuQcP0ecatYicIjq+juFnRb00zsRqlaTm30QUB9Q31qov
 9QPNax9w+6eniq+hI4pmKnl7PeQwVdWq3i06/S/LsS8aLArmh2r32an8chK9pSRFUd
 56fiwUvR+6z6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H4J2IcUG
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

Should it be marked with  __attribute__((unused))  or some such?

Regards,
Yann E. MORIN.

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
