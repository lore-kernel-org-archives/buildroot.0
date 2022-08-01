Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7652EC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB85404EB;
	Mon,  1 Aug 2022 15:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBB85404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hyi4KnjewgcB; Mon,  1 Aug 2022 15:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F381040393;
	Mon,  1 Aug 2022 15:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F381040393
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9F6A1BF343
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C277E40393
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C277E40393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ystAot2UzCt4 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 15:12:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5E240352
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A5E240352
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 15:12:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 90A0619F72F;
 Mon,  1 Aug 2022 17:12:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Aug 2022 17:12:08 +0200
Date: Mon, 1 Aug 2022 17:12:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220801151208.GA3168@scaer>
References: <20220801133041.2150607-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220801133041.2150607-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659366731;
 bh=LQy7o65kgolgUa/WqJ70yMLkJGX6d6jMMljd45+snsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=soSBCc7swmdcS+e5ZijlB99u2WPEhyizW3gLjWSjKMttvg4FGSEU6Ti24bIfKGZqu
 LaYqdR8l8nmRHXTSNoM0VP/6UzM4gapeQm3nvqpSYiDTA1KGTcRnaQP8bAqZnG7ek1
 AOMd7uPq/H4BDuTcl5vep29B4rPcPG0DCCi40acltywn678NtX3vIp8ll0QR82P9yG
 LNuYAA3sXYp3KqhQTi3GXdjGZd+tqfcNu01bmy2mqyjI6UpJgzxs/IBikt9nhUAy/T
 Q3ITZSKtfGu/w9/6BalvYOnkDHWAOMXDMYrxXIS6VwFlyeoHz6hukolgOtuBD8evcG
 8/xCExRNbDCtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=soSBCc7s
Subject: Re: [Buildroot] [PATCH] Makefile: make printvars target print all
 variables if no VARS set
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-08-01 15:30 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> VARS is not defined by default, meaning the filter will not return
> anything which ends up making `make printvars` also return nothing.

In fact, this is the expected behaviour, see fd5bd12379dc (Makefile:
printvars: don't print anything when VARS is not set).

> Fix this by setting VARS to '%' - which is the match-all pattern - in
> printvars using a conditional variable assignment operator, such as
> what's currently done for show-vars.

And see da4cb17aa165 (Makefile: introduce show-vars, a json-formatted
equivalent to printvars) for the reason why show-vars defaults to VAR=%

So, I've marked this patch as rejected.

Regards,
Yann E. MORIN.

> Fixes: 5c54c3ef3db2 ("Makefile: workaround make 4.3 issue for 'printvars and 'show-vars'")
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index a743e42f91..f1b5494726 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1057,6 +1057,7 @@ endif
>  # Note: we iterate of .VARIABLES and filter each variable individually,
>  # to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
>  .PHONY: printvars
> +printvars: VARS?=%
>  printvars:
>  	@:
>  	$(foreach V, \
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
