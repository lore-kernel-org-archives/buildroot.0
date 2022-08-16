Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2B3C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F2A415EF;
	Tue, 16 Aug 2022 21:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F2A415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZHCZTRHtSv5; Tue, 16 Aug 2022 21:10:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2A5415DB;
	Tue, 16 Aug 2022 21:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC2A5415DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6046D1BF84C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B2FB8144B
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2FB8144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oT1KroDQB7o0 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4339681446
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4339681446
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 21:10:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e933:8a8a:6743:9483])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BFBA0780506;
 Tue, 16 Aug 2022 23:10:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 23:10:21 +0200
Date: Tue, 16 Aug 2022 23:10:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220816211021.GQ2854108@scaer>
References: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
 <5bf3b48f-bfae-444c-3c2e-73235a0d523c@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bf3b48f-bfae-444c-3c2e-73235a0d523c@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660684226;
 bh=JalpuKIFA1ti2qr4P3z0Oe8iWEHHgJLxFxkGag16WPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rfo4rCvyx1Zlfw7StYErdLj6nbhExQVcqO8UjHFeabmvZC+LJ4wgQJHlB2v8rcQG2
 V7WtmUsV89LLJnK2MsFTbSUq4DkGMWieQYnNikDSmcRfNwz4vo59Kx/bUEUj55nZXP
 Ed0+e1Xma3PvUeLP2B0P+ycykjqWcb4W8Dq9BXCWe3H2pVflgJz7pTCYhAIcAPmgEc
 wriMAed1tH6MDs6ziPiu0FvHA777zQynk0U9j1qFkMjsr3fgIzD5ksCeTDGwqYGG/c
 fzs5D0pITJt+f6KYbgKAWOQ1gt/ikWf2Ee39OhzjHOjUs8ZU6PufFPWYfC5plfYrUb
 7uiyHSX97jiRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rfo4rCvy
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-meson.mk: handle
 possibly non existing compilers
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, Arnout, All,

On 2022-08-16 22:54 +0200, Arnout Vandecappelle spake thusly:
> On 16/08/2022 12:37, Guillaume W. Bres wrote:
> >To avoid populating the cross-file with non existing compilers,
> >we tie them to /bin/false

Guillaume, you should probably have copied in the commit log, the
explanations I provided where I reported the suggestion from the
meson guys.

> >Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> >---
> >  package/pkg-meson.mk | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> >diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> >index 0632ab21cf..d675f7f733 100644
> >--- a/package/pkg-meson.mk
> >+++ b/package/pkg-meson.mk
> >@@ -68,15 +68,29 @@ else
[--SNIP--]
>  Perhaps we should do this in package/Makefile.in instead? I.e. define
> TARGET_CXX itself as false.
>  This does have rather heavy implications, but I *think* it should be
> fine... And anyway, the autobuilders will tell us :-)

Please, no. This goes contrary to what I explained in the other thread.

Disabling or forcing detection of a tool should be part of the
infrastructure. meson has its way (do not set it, or poison it with
/bin/false as suggested by them). auotools has its own way (set it to
no). cmake has probably a way of its own...

And even if they eventually come to be all use /binfalse except
autotools,  would still prefer that, because it semantically belong to
that buildsystem infra.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >+
> >  # Generates sed patterns for patching the cross-compilation.conf template,
> >  # since Flags might contain commas the arguments are passed indirectly by
> >  # variable name (stripped to deal with whitespaces).
> >  # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
> >  define PKG_MESON_CROSSCONFIG_SED
> >          -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> >-        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> >+        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
> >          -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> >-        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
> >+        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
> >          -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
> >          -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
> >          -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
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
