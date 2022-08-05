Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A66C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED407405AD;
	Fri,  5 Aug 2022 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED407405AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYq-Cc8Mp6Kx; Fri,  5 Aug 2022 16:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA62540157;
	Fri,  5 Aug 2022 16:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA62540157
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0681BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6946840157
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6946840157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LeV973QeANca for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:53:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2795840147
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2795840147
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:53:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id ECF6019F732;
 Fri,  5 Aug 2022 18:53:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 18:53:38 +0200
Date: Fri, 5 Aug 2022 18:53:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220805165338.GG3621445@scaer>
References: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659718421;
 bh=/61QBc0/nTq34O1Owrvdm1slbsGjva8E7WMrKfJ49EM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXowxW8A9FWDFDRItJypUYDDp6isNGkEfDv9GY+pP6+O8gb3Fw54T/A4y22tbMIon
 V745EozODJG2S9iUou7QOQ3z3Hj23R+BgFs+eShngvuPugoOVWLCSlaZJech/IjzZ6
 6d7DFyT64cI0+LRJNyT0cutyXIgmNLUDJtIR7WuUKI9CFNnmHGvOO3amNBM4YEtOaz
 3UREWvKZSOE/WPeaiuLVV9CP+MUeEOwyL2ANM4PMrdNzKEflLvGcVekMf7UYDmm4AI
 khxFGTDFD9ECSTpUAkV85bcaRYAhN5c2RH9D+zNod88SUKM9T+hKsrH21jy5R4fe6e
 iB3Kt+Zz8zYDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tXowxW8A
Subject: Re: [Buildroot] [PATCH] package/weston: add option to build
 seatd-based launcher
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

Thomas, All,

On 2022-08-04 22:46 +0200, Thomas Petazzoni via buildroot spake thusly:
> Since version 10, the weston-launch command has been deprecated, and
> can only be built with -Ddeprecated-weston-launch=true, which
> Buildroot does not do.
> 
> So the only launcher currently available is logind, provided by
> systemd.
> 
> But weston provides an alternate way, based on the seatd daemon. This
> commit enables this possibility by adding an optional dependency on
> BR2_PACKAGE_SEATD and using -Dlauncher-libseat=true.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 76df9bf2dd..e6c54ee7aa 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -35,6 +35,13 @@ else
>  WESTON_CONF_OPTS += -Dlauncher-logind=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SEATD),y)
> +WESTON_CONF_OPTS += -Dlauncher-libseat=true
> +WESTON_DEPENDENCIES += seatd
> +else
> +WESTON_CONF_OPTS += -Dlauncher-libseat=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_JPEG),y)
>  WESTON_CONF_OPTS += -Dimage-jpeg=true
>  WESTON_DEPENDENCIES += jpeg
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
