Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48291C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5CB240A38;
	Sun, 17 Jul 2022 08:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5CB240A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKlJuZWEZxej; Sun, 17 Jul 2022 08:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD8B040A20;
	Sun, 17 Jul 2022 08:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD8B040A20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4161BF369
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5271740A49
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5271740A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4_RJZbfZblh for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 08:34:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F72340190
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F72340190
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 08:34:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 95A4F780519;
 Sun, 17 Jul 2022 10:34:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 10:34:12 +0200
Date: Sun, 17 Jul 2022 10:34:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717083412.GD2543@scaer>
References: <20220714095701.746554-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714095701.746554-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658046855;
 bh=1+7REjpFeGpgSeW1Tvr9Wn4kzS3S0d9gSyjd26jJHTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8xPoHzFNRqQt2jmlvJNfOcmnlWaxL++BCdnItAbDZiSuZ4kLRrUVg1K2OC99lX7U
 v0LWDKm+lDIMz2Hci/35H7obdDGcS0856yop4ovCqvEjKUJhL7/e462d1qHH02K6Ry
 6S2mZqUyeOD+h3rkIoecMDGC+xMrmgqKMVnGdFxSBS8eO2xTij9wfKNX6WI59lStdl
 DsT4ajIeoQtM2onarXmHrfstOAMrAlzkt2K5IvL2lutIqrhWiG1EvQwXxCqS1ydXpm
 h5zp/0/Rjh3IOyqSboYFTJjBp16dDUGueSFjux/gfwKNRsi8VgQCOOANPpK3/ft7sa
 KHnfIjPuy0xDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F8xPoHzF
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: add linux-pam optional
 dependency
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-14 11:57 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lxc/lxc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 9311dc8775..abe4f0804a 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -51,6 +51,13 @@ else
>  LXC_CONF_OPTS += --disable-liburing
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +LXC_CONF_OPTS += --enable-pam
> +LXC_DEPENDENCIES += linux-pam
> +else
> +LXC_DEPENDENCIES += --disable-pam
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LXC_CONF_OPTS += --enable-openssl
>  LXC_DEPENDENCIES += openssl
> -- 
> 2.35.1
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
