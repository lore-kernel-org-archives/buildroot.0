Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF3C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 22:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947AC60F00;
	Fri,  8 Dec 2023 22:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947AC60F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 177PrblHKxxz; Fri,  8 Dec 2023 22:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D0060BDF;
	Fri,  8 Dec 2023 22:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D0060BDF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 017E81BF593
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC07183E97
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC07183E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ORINIijAivM for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 22:54:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC97B83E96
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 22:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC97B83E96
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7D3A113F81D;
 Fri,  8 Dec 2023 23:53:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 23:53:59 +0100
Date: Fri, 8 Dec 2023 23:53:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZXOehwwVDyiGPpRf@landeda>
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702076042;
 bh=HHc/hRuL7N4jcOcxFQzFk/FvQne4Hv8Nrkfi8MJ0m3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3CD3QifoTJe5EAv1p+Fwhcmaaif9bjoZE+aLRhKldAet6v8WT9r4sP2CHbBhDlWs
 rT3oRVDzXJg0F5qHjLueQ00fdH6cJheCm683P4MjiXmC6ied/iPUzsCHcG4acoV5Oe
 /efX2x9NgjyO34njk7zZyH1blcMQG2d4LVQ0VVqchbG6fRIlakoCE5fOdr+nRtjA0/
 7MIP4vbr1EPjfEaORr5nwW4TEoErsLLA5nFd0tLtxF38NR/dLUOlN7/X3hILN8AMQV
 P3NgYttWE9Rp17ySVTQhBacO+fUokwLgC0JXs3mXYofXdgS2O+bb+CHsX0IKDPQ2nH
 0s4hnecSNUIjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G3CD3Qif
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-12-07 23:09 +0100, Fabrice Fontaine spake thusly:
> Pass CC=$(TARGET_CC) to make to avoid the following build failure raised
> since bump to version 6.20 in commit
> a743087593a5fd5b33e2650591cada09929c27a6:
> 
> gcc -m32 -x assembler-with-cpp -c -I../boot -o boot/startup.o ../boot/startup32.S
> gcc: error: unrecognized command-line option '-m32'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/15ece19703bb21c1326ff353aa79f3550a01f648
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/memtest86/memtest86.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
> index c0f85755fe..51d5805e0a 100644
> --- a/package/memtest86/memtest86.mk
> +++ b/package/memtest86/memtest86.mk
> @@ -20,7 +20,8 @@ endif
>  endif
>  
>  define MEMTEST86_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) \

CC=$(TARGET_CC) is already present in TARGET_CONFIGURE_OPTS, so why is
it not accounted for?

Regards,
Yann E. MORIN.

> +		-C $(@D)/$(MEMTEST86_BUILD_DIR)
>  endef
>  
>  define MEMTEST86_INSTALL_IMAGES_CMDS
> -- 
> 2.42.0
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
