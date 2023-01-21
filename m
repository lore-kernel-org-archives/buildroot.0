Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA52C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36EDC60E44;
	Sat, 21 Jan 2023 18:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36EDC60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gc2X9aaNlLje; Sat, 21 Jan 2023 18:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A06F60BBB;
	Sat, 21 Jan 2023 18:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A06F60BBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7501BF406
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559BF41878
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 18:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559BF41878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOxq7s0TFzhO for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 18:07:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE07941862
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE07941862
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 18:07:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B6C015FFAA;
 Sat, 21 Jan 2023 19:07:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Jan 2023 19:07:31 +0100
Date: Sat, 21 Jan 2023 19:07:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Casey Reeves <casey@xogium.me>
Message-ID: <20230121180731.GE558596@scaer>
References: <20230118194925.254654-1-casey@xogium.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118194925.254654-1-casey@xogium.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674324456;
 bh=w/LtXFOw7N5jTJAeM0lQWGDgUV9yOH4v7Lsyw2ow7AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPKNNTh3zzlu+YITqMybQXXp2GReUjKqMuMExjb1IGzS0DeFUhSVCt6XVwWtwzk9+
 +kTwbdzDdop4rfrclTfeNRWnbWxKodWZCc+CNgrAofPgV6xktnlUfRRm8q10xa/Me9
 XEjMkkuKXUbveb03ojS2KSOsekdCjaCmHfsomnrnUHUGYJPM8F3gxnh0rBOKRJnCQp
 YcpCuFbUnNAYSp9uXYIzsljgrOezDOoSXyJTqEImJuKK1WVY9zA0nspFzoGvjv8gC3
 F9PVgBeUI179Izao6W/2JnIALQpHPmzMa96sXV1UeBUTHTS9gk1aQoZj+Wj1kkUi5p
 sr3krpHS+uKTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hPKNNTh3
Subject: Re: [Buildroot] [PATCH v2] package/systemd: reenable utmp support
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Casey, All,

On 2023-01-18 20:49 +0100, Casey Reeves spake thusly:
> This patch provides a way to enable utmp support when using systemd,
> with it disabled by default, as some security concerns may apply. Still,
> there are cases where having utmp is desirable, even though it is rare,
> so let's make this configurable.
> 
> See commit 32f53bdfb482d0d78308e548c654898089b5c183.
> 
> Signed-off-by: Casey Reeves <casey@xogium.me>

I've extended the help text with the actual blurb from the systemd-utmp
manpage, and a reference to the upstream URL, like for the other
configurable items.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> - Make this a configurable option rather than hardcode it to forcefully
> disabled or enabled
> ---
>  package/systemd/Config.in  | 16 ++++++++++++++++
>  package/systemd/systemd.mk |  9 +++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 45a9e2d644..daa72b65b1 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -518,6 +518,22 @@ config BR2_PACKAGE_SYSTEMD_USERDB
>  
>  	  https://www.freedesktop.org/software/systemd/man/systemd-userdbd.service.html
>  
> +config BR2_PACKAGE_SYSTEMD_UTMP
> +	bool "enable utmp support"
> +	help
> +	  When this feature is selected, systemd will manage the
> +	  support of utmp.
> +
> +	  Utmp keeps track of what users do on the system (where they
> +	  logged from, on which terminal, ...) along with a general
> +	  status of the system (list of reboots, current uptime, current
> +	  number of users logged in).
> +
> +	  You should only enable this if your system requires actual
> +	  users to log in.
> +
> +	  https://man7.org/linux/man-pages/man5/utmp.5.html
> +
>  config BR2_PACKAGE_SYSTEMD_VCONSOLE
>  	bool "enable vconsole tool"
>  	default y
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b96873b73f..f191542866 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -87,8 +87,7 @@ SYSTEMD_CONF_OPTS += \
>  	-Dtelinit-path= \
>  	-Dtests=false \
>  	-Dtmpfiles=true \
> -	-Dumount-path=/usr/bin/umount \
> -	-Dutmp=false
> +	-Dumount-path=/usr/bin/umount
>  
>  SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
>  ifeq ($(BR2_OPTIMIZE_FAST),y)
> @@ -331,6 +330,12 @@ else
>  SYSTEMD_CONF_OPTS += -Dbinfmt=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_UTMP),y)
> +SYSTEMD_CONF_OPTS += -Dutmp=true
> +else
> +SYSTEMD_CONF_OPTS += -Dutmp=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
>  SYSTEMD_CONF_OPTS += -Dvconsole=true
>  else
> -- 
> 2.39.0
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
