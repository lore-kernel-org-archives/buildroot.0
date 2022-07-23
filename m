Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D264DC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FAF041A10;
	Sat, 23 Jul 2022 16:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FAF041A10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yORhoCCu-4LJ; Sat, 23 Jul 2022 16:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1848418A9;
	Sat, 23 Jul 2022 16:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1848418A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAB871BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE54418A9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE54418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMa5eg_tUMjT for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:47:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2103C4188F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2103C4188F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:47:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:a82c:98de:96c7:ec71])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7EBCF19F73A;
 Sat, 23 Jul 2022 18:47:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 18:47:27 +0200
Date: Sat, 23 Jul 2022 18:47:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220723164727.GG2641@scaer>
References: <20220722101653.7475-1-nolange79@gmail.com>
 <20220722101653.7475-2-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722101653.7475-2-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658594849;
 bh=cnDPTU7J+a+DcItouL0Vi8NwC+Nh4SNe93CV/goUQ7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TGsZ1ulGrq5R3K9P+781MbSf5422wK0zIio/c/zJD6+B+yHZcukQCtFeq1+wCXYak
 u6Luc9fkD/aVR67xli+MXVx3Sd/a2FnWsaf2lGcd0NUSL2gTRcjHc+l2cIgSqahQs4
 6Lvcho2isjcdtrpEQcdUpuxMGHxl7Wl2/NvSweYxunxS3ZRXGP/70D304g9IDX6VM+
 oK65JNc2638x1ek6t+FI4pCZe+f3h1ucUAp0MXbR+jfPtet1QzCUEdJpnlT0rL2Pno
 EbtwD7RCQlWDHPrQ3770f+P+iaAWQJA7FALtWUDqPLNsHex7EkGRKXSM6pqnvwDNOt
 wpisQg9EMJvpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TGsZ1ulG
Subject: Re: [Buildroot] [PATCH v4 2/4] package/systemd: allow empty systemd
 default target
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

Norbert, All,

On 2022-07-22 12:16 +0200, Norbert Lange spake thusly:
> Currently, we forcefully require that a default target be specified.
> However, systemd does install a default target, but it's not
> possible to just use that target.
> 
> Allow the user to blank-out the config setting to not override
> whatever systemd installed and keep that.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b5628f5155..bacde5221b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -583,17 +583,20 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
>  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
>  endif
>  
> +ifneq ($(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET)),)

As I suggested in my previous review, we traditionally introduce an
intermediate variable that holds the qstrip-ed value, and this is also
already used a few times in systemd.mk, so I did the same here.

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

>  define SYSTEMD_INSTALL_INIT_HOOK
>  	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
>  		$(TARGET_DIR)/usr/lib/systemd/system/default.target
>  endef
>  
> +SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_INIT_HOOK
> +endif
> +
>  define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> -	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK
>  
>  define SYSTEMD_INSTALL_IMAGES_CMDS
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
