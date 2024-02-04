Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5A0C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7AD34055F;
	Sun,  4 Feb 2024 21:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7AD34055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kd2N9za_wvNV; Sun,  4 Feb 2024 21:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81DCC405A9;
	Sun,  4 Feb 2024 21:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DCC405A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73CEA1BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5C8416FA
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5C8416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9UE5giJ30Ez for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:19:15 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 409F0416B7
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409F0416B7
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E324819F553;
 Sun,  4 Feb 2024 22:19:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 22:19:09 +0100
Date: Sun, 4 Feb 2024 22:19:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb__TQTWLxi3Wpkh@landeda>
References: <20240204182514.1663508-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204182514.1663508-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707081553;
 bh=C+anEhSYGp9pvtHEsG080GxKItJX/tPFLOY2mj003ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6NOmyFS8niogpLlQUK/LH2eykVO3f+s8H0QpBR+1xtc4djt8UyfCuhlSA/QyBaNo
 rMZrdVFNXYW4RDNZ0vSXsVlXJWPGIptSStv09zYeI/wyzI76SB7FTmzwuuLPSGYxuj
 dt0A+b0fiEgThLi0Jk3YXL2qjX2tOfjzkmqHk9uYYiD4K3A+ojfaIRHgbAhwG2DvHt
 h6ueCNZ9fLc9YVsvbvRQ3jCO49nhR8cso6R5mH8L3Gjmq/Ro+O45PF7ZBGoo0+SB25
 jCQNczib/8BOYp4H1osmJKtftIN0w1O6JSBzoRpAl1sIWfbIk3hCTKVADc48+Sre+/
 oYTmAW8pwywoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C6NOmyFS
Subject: Re: [Buildroot] [PATCH 1/1] package/yasm: add YASM_CPE_ID_VENDOR
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-04 19:25 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:tortall:yasm is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/2E6C9C2F-A057-4083-BC90-095403EF138E
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Regards,
Yann E. MORIN.

> ---
>  package/yasm/yasm.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
> index b294bd3aee..cdb8e15bee 100644
> --- a/package/yasm/yasm.mk
> +++ b/package/yasm/yasm.mk
> @@ -8,6 +8,7 @@ YASM_VERSION = 1.3.0
>  YASM_SITE = http://www.tortall.net/projects/yasm/releases
>  YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
>  YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
> +YASM_CPE_ID_VENDOR = tortall
>  
>  # This sed prevents it compiling 2 programs (vsyasm and ytasm)
>  # that are only of use on Microsoft Windows.
> -- 
> 2.43.0
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
