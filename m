Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667FBC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFAF84035D;
	Wed,  3 Aug 2022 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFAF84035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKc2G0VQq4hO; Wed,  3 Aug 2022 20:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D088E4021C;
	Wed,  3 Aug 2022 20:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D088E4021C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 706A01BF25B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 492594033C
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492594033C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LpWJJ-PnD9i for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:59:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E6D40330
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99E6D40330
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:59:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c944:63a3:5f2a:bb6f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7F663780511;
 Wed,  3 Aug 2022 22:59:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 22:59:26 +0200
Date: Wed, 3 Aug 2022 22:59:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220803205926.GA3321867@scaer>
References: <20220803192400.208270-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803192400.208270-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659560369;
 bh=QUti6QW71PdQqrCJA1HVscB/QmqLAckK+eFP3EsxD4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKyviMPJo4GST3NwXZgZPwZiNxykyjcDfOfpxqxpHTUtsc0/ksmbTwkPDmT9eVTWp
 HMxwrNodroHQgACbv1U1tHKybNQ9mgls19BXg5cPPq1xabv248NEF6mbQ4Am9CZlFg
 pOgbSYzpPwaUYLGyzajTFGPuvBPONNqXhK/Ws+JqHXd9Nvi6Nm0mAJ2gxD7Ut90s/7
 k22JJH8m8PuYS7QvIgRtg23aCJWL791DYo9IeFLQgC/TxS2sWIlrY/VhpxOO5ByTqp
 eBv/bR4BVre4xZVRtsz84gyCQsF9d/WHQVyouj8tisqQBbG2ElRrUdIFt/Jc2mxQsO
 cF4DzXnExts+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UKyviMPJ
Subject: Re: [Buildroot] [PATCH] Makefile: ignore *.orig and *.rej in
 check-package target
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-03 21:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> When one is applying patches, it is pretty common to end up with .orig
> and/or .rej files lying around. Unfortunately, our 'Config.*' match in
> check-package ends up matching those files, causing false positives
> when running "make check-package". To avoid this, this commit
> excludes *.orig and *.rej files for the find logic used in the
> check-package target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 5f266e36b2..14b7ecd475 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1253,6 +1253,7 @@ check-flake8:
>  
>  check-package:
>  	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
> +		-a -not -name '*.orig' -a -not -name '*.rej' \

I was wondering if we could have easily used 'git ls-tree' like is done
in check-flake8, but that is not so trivial. Indeed, check-flake8
filters absed on the content of files, so it needs to find all of our
files, while check-package filters on filename, and so the filtering
would become a bit more convoluted with 'git ls-tree' than it is with
'find'.

Applied to master, thanks (and of course, I forgot to add the above to
the commit log before pushing).

Regards,
Yann E. MORIN.

>  		-exec ./utils/check-package --exclude=Sob {} +
>  
>  include docs/manual/manual.mk
> -- 
> 2.37.1
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
