Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A022CFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48B644038E;
	Mon, 31 Oct 2022 10:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B644038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJ41R-K7UQoe; Mon, 31 Oct 2022 10:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7558F403E0;
	Mon, 31 Oct 2022 10:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7558F403E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8201A1BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65E5B60B33
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E5B60B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYB8MMWn0o6p for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:00:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B8FA60B2A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B8FA60B2A
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:00:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ACF80B0053E;
 Mon, 31 Oct 2022 11:00:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:00:26 +0100
Date: Mon, 31 Oct 2022 11:00:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221031100026.GU1058960@scaer>
References: <20221030212529.364240-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030212529.364240-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210429;
 bh=zMrwMBvgNREnH4scgB5/79yAFK/cJOMq1/KlNPG5QiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNhzgDCyRZmmP2dC72vNNv+9OO8OLcRyPGjqIF6CL8xcEtVQQ3RS30sO4E4Nf0Dkw
 MsVNr5t1S0Q8laQBnCZFnW4v3dkiPn3oWk6GohnNKU5G34/mUQJnK+rwrHM8yp3g1E
 0wD6OUNj4+cbsKJGnkdJswdi9GmV3oPdlA59njrNZfI07eD2W6ROQeZi7m0cldr+p1
 5TMn3aEWuF0sJqNuV9d7LBWvCUOLgWx4iygpuoSOo/z1yCRF2+UaWev0tdqDvtMVdH
 21TblAVBEiVjBoF7BDwreRBVumbvEvlNp4PdAGQFD+vKDw67ER86OXk0Sz7dM7eyxu
 JmwJrl/rSGEHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cNhzgDCy
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: fix typo in comment
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

Bernd, All,

On 2022-10-30 22:25 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exim/exim.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index e0fcd83fb0..9c54eeec44 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -20,7 +20,7 @@ define exim-config-change # variable-name, variable-value
>  		$(@D)/Local/Makefile
>  endef
>  
> -# Comment-out a variable. Has no effect if it does not exits.
> +# Comment-out a variable. Has no effect if it does not exist.
>  define exim-config-unset # variable-name
>  	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
>  		$(@D)/Local/Makefile
> -- 
> 2.34.1
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
