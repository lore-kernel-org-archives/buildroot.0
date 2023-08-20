Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA46EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0EF81FD2;
	Sun, 20 Aug 2023 14:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED0EF81FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKOuwNvBb1wX; Sun, 20 Aug 2023 14:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438C882157;
	Sun, 20 Aug 2023 14:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438C882157
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10A7F1BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCEC7409A0
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCEC7409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAPz9GKndLSK for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:21:47 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 904A340990
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 904A340990
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D698C19F553;
 Sun, 20 Aug 2023 16:21:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 16:21:42 +0200
Date: Sun, 20 Aug 2023 16:21:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230820142142.GK1778688@scaer>
References: <20230815095417.15951-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815095417.15951-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692541305;
 bh=3Qp1dGNKwLAH2m5owqOdkeiCqlrLRspoBkYEH72bElY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sS8WpfCTDkFkNHu3JU4iYxwoL5WW3D2NuAhmiaqJtdQ5BEKux/IJApl6U20BDnVqw
 OlG/kPMd8wG8ZT2shVjRZtYyEbudLPTpw+ijok8Q5vL1mMjypL/+MscAi17wib5d2X
 6XfPV1zol2T+nmxaSCz0YHmi+VHDz0R0OqfEyrjFposldIVcJc3TZ4uwtb/itApgZn
 LQ55zhRAhozcS2JNky4FImUtBPER/y0k+YEvmpn7K6n36C5jkpZQ0I5QS+PkKu3g7u
 +rV0OeaaO8Dz2F3jE6JzahwMQ+vk2opbCgwK32jV5Q7mHG9OOpKJJW8voDEBiU3DBg
 8CKeme7e7p9Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sS8WpfCT
Subject: Re: [Buildroot] [PATCH next 1/1] DEVELOPERS: fix entry for
 board/firefly/roc-rk3399-pc/
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

Julien, All,

On 2023-08-15 11:54 +0200, Julien Olivain spake thusly:
> commit b86adfb89a "configs/roc_rk3399_pc: new defconfig" introduced an
> incorrect DEVELOPERS file entry for the directory
> "board/firefly/roc-rk3399/". The correct directory name is
> "roc-rk3399-pc".
> 
> Using the get-developers script on any file generates a warning,
> for example:
> 
>     utils/get-developers DEVELOPERS
>     WARNING: 'board/firefly/roc-rk3399/' doesn't match any file, line 2584
>     git send-email --to buildroot@buildroot.org
> 
> This commit fixes the issue by putting the correct directory name.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thomas did not notice your patch before he pushed a fix of his own,
sorry.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 69ab723c0c..705aae9501 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2581,7 +2581,7 @@ N:	Robert Rose <robertroyrose@gmail.com>
>  F:	package/grpc/
>  
>  N:	Roberto Medina <robertoxmed@gmail.com>
> -F:	board/firefly/roc-rk3399/
> +F:	board/firefly/roc-rk3399-pc/
>  F:	configs/roc_pc_rk3399_defconfig
>  
>  N:	Rodrigo Rebello <rprebello@gmail.com>
> -- 
> 2.41.0
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
