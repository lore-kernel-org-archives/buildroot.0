Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A40C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB633415A4;
	Fri,  5 Aug 2022 16:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB633415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGb1k39RNMwg; Fri,  5 Aug 2022 16:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA18C4155F;
	Fri,  5 Aug 2022 16:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA18C4155F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7981BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE826F9AB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE826F9AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgCCCrRp7pCN for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA036F9A9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFA036F9A9
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:57:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9129019F749;
 Fri,  5 Aug 2022 18:57:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 18:57:05 +0200
Date: Fri, 5 Aug 2022 18:57:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220805165705.GH3621445@scaer>
References: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659718627;
 bh=fHctxS6WlhYbI5JDm4KK/ZtE+NXd+tXkYYWXdaBDzyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZObGdva4N1IlcxMTq61Wmxqw/fsFN3KUpjjodSfR4Fc5RLvITjk1ZjHYOgaGFqVc
 KEW8OlirML1ZBnOIwkTv3YnI4nU3hMjsHq/7jdD8cwhDsNU/lb3Tmj49I7qSWQN/Ao
 S1pG/kA9zntWDPn8KF5DI334RmrSyf2rz1PfQIIDPtWd1HW2mKC+hdZSB4EvYdvRrX
 FqvHjhNaW8iAVcQLiKzkZN9U1uR3LBohUCFreOj5eHMyfANcniEmoL2tVfgIyw1vhm
 XA/5+CRFaXQHklo9/+pMnFD7MQZem0ZhjtIaas+p1qrdprtLYOO5WHoLfM8gm0DMRU
 PJKI3Q92grBwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hZObGdva
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

Forgot to add in my previous reply...

Is a launcher mandatory? Should we en sure that at least one is present?
I.e. if dbus+systemd is not set, then select seatd?

Regards,
Yann E. MORIN.

> But weston provides an alternate way, based on the seatd daemon. This
> commit enables this possibility by adding an optional dependency on
> BR2_PACKAGE_SEATD and using -Dlauncher-libseat=true.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
