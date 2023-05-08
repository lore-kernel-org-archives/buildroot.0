Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6495C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 18:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CB8C8452C;
	Mon,  8 May 2023 18:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB8C8452C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQLYNAASYyyW; Mon,  8 May 2023 18:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E928440E;
	Mon,  8 May 2023 18:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E928440E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC6381BF342
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61428452B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61428452B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAeEb-D2nqt4 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 18:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC8B84411
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CC8B84411
 for <buildroot@buildroot.org>; Mon,  8 May 2023 18:23:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C54932003C3;
 Mon,  8 May 2023 20:22:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 20:22:54 +0200
Date: Mon, 8 May 2023 20:22:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230508182254.GA252090@scaer>
References: <20230508181850.21256-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508181850.21256-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683570178;
 bh=zIuWJAryB4tGQm+qZDDDYI1gNk1Tisx+A/WptwiPhUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swC5O8X/7KwO07lA2R7zV/ODritCTy6pD6m8Dp1XDlbr1y5Ln6bomR4WrGuvbFoe0
 dFa1DUidR0i2UzqiWpt3NuZ1EgHdgV0Zp+j5wweq9/8Hb/gH2LViEsZ7TwRavcKiwO
 kTZWvUp/pxP8vYguJXZSr597620HDxAxrGNbOlMoa0ibLhuLjSsN2y9scrKUFwb68M
 uwvdu1n2pPPilacQahzGYuCLEovzjVMDBZeQoEEDECFYRBjDjK9w0MKl0YHHx9JtMv
 TIpgY7s7umev1oDL8Ev9WPg1hUvz7T0ijEZ1nkR5RB49IR47R8djrag5XRnD88wZmj
 XS/62Ti9ialHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=swC5O8X/
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove entry for
 optee-benchmark
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-05-08 20:18 +0200, Julien Olivain spake thusly:
> optee-benchmark package was removed in commit cf39b596e7
> ("package/optee-benchmark: remove deprecated package") but forgot to
> remove the associated DEVELOPERS file entry.
> 
> Using the get-developers script on any file generates a warning,
> for example:
> 
>     utils/get-developers DEVELOPERS
>     WARNING: 'package/optee-benchmark/' doesn't match any file, line 865
>     git send-email --to buildroot@buildroot.org
> 
> This commit fixes the issue by removing the entry.
> 
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5658dfa14b..efb2907d1b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -862,7 +862,6 @@ F:	package/python-kiwisolver/
>  
>  N:	Etienne Carriere <etienne.carriere@linaro.org>
>  F:	boot/optee-os/
> -F:	package/optee-benchmark/
>  F:	package/optee-client/
>  F:	package/optee-examples/
>  F:	package/optee-test/
> -- 
> 2.40.1
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
