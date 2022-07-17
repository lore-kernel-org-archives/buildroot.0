Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BF0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6639A417AF;
	Sun, 17 Jul 2022 13:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6639A417AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrfZz6sBYOVT; Sun, 17 Jul 2022 13:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA745416E9;
	Sun, 17 Jul 2022 13:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA745416E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1BC1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53E1C414CD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53E1C414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGjsuL3_hHEP for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:22:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F16A0410C8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F16A0410C8
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:22:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 272E678050E;
 Sun, 17 Jul 2022 15:22:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:22:40 +0200
Date: Sun, 17 Jul 2022 15:22:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132240.GI2249625@scaer>
References: <20220710213458.877978-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710213458.877978-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064163;
 bh=E3vKiMVe72WObBE4+yaD9moxsv8cTCM1lEnPAZ1Q2PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ORjt/xcTB+UWKbwtaFA3RQbfhzUFQh4drzkxjo73d7RLIzGFX4RLYfokBGvTI8/NZ
 imC8hjW4ANsF+g55dLlHY8qEaLqCQHuAmeEL7Wu3Z2WfyrjULiPYICaCwtMo4c8JpL
 sz4IfcIztB/8G+0pjlkHTdoypaQRVJJ4CNRmjH6LR1FPTuqpOV62FcZShS0FM9a3Xr
 PLMRCmi615n6Ybw9LGOgRY/yU3r7cINqzQKabIp6klQKQMyyHkAzzr8xYoI68n3zzG
 FYOD0cmXJE3SFrnBuzWo89zfUWynyUrNoqV21P89PD/E0HKjoHENYFLQLUj81C3/Ob
 i1bsyAlaLG0LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ORjt/xcT
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version
 0.10.3
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

Fabrice, All,

On 2022-07-10 23:34 +0200, Fabrice Fontaine spake thusly:
> https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.3/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gupnp-tools/gupnp-tools.hash | 4 ++--
>  package/gupnp-tools/gupnp-tools.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
> index 28a1d26ede..37983b0c92 100644
> --- a/package/gupnp-tools/gupnp-tools.hash
> +++ b/package/gupnp-tools/gupnp-tools.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
> -sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
> +sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
>  
>  # Locally computed:
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
> index 7b34de52a0..96bcbffa49 100644
> --- a/package/gupnp-tools/gupnp-tools.mk
> +++ b/package/gupnp-tools/gupnp-tools.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GUPNP_TOOLS_VERSION_MAJOR = 0.10
> -GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
> +GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
>  GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
>  GUPNP_TOOLS_SITE = \
>  	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
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
