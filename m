Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5313C25B0C
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 07:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F6C83449;
	Sat,  6 Aug 2022 07:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F6C83449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLBk2Vt8kFCC; Sat,  6 Aug 2022 07:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C858317B;
	Sat,  6 Aug 2022 07:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C858317B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 626B41BF4D7
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D48F8317B
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 07:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D48F8317B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ohl6qQh_YBK for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 07:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA11F81A27
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA11F81A27
 for <buildroot@busybox.net>; Sat,  6 Aug 2022 07:56:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cd3:e89a:3ed2:2a65])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DAC652003AE;
 Sat,  6 Aug 2022 09:56:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Aug 2022 09:56:25 +0200
Date: Sat, 6 Aug 2022 09:56:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220806075625.GA3751568@scaer>
References: <20220806070446.14508-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220806070446.14508-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659772589;
 bh=D6nL61YVshoyzSRvgaZER7aD4P2xFUkF6Gwa71YrzPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFBmJD0V1OkHVW+Rwcic4E4zQydI7FzW/rj9YNot4X9mKgJOy899N8j+ia9fSCDGH
 KttXJHQiMhLbbAlPNlTxO1+cn3pa02Kuv5HBZAWZjEU6doYSa5xl35AmBFHL1YtNVJ
 K4MqSIxc4u27nYqtirNwWtxMZA7ZvqQ0TcmyriQET96Ud+ieXmGY4IlXaI8EKyNVSW
 9DFD8w1aDWQ03NEcwIuI2U1sugZJkWsrJ59/tuiTWeKi9i0RhnGZBChiwElXPDnfdj
 iXeoXtgW1yHXwmsKJO3FmBC1VsC2KYan6jf55kCMolZP9bJsmVc5QLFPrF7QybIecz
 yGHng7wd3VSjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iFBmJD0V
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: enable refclock support
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillame, All,

On 2022-08-06 09:04 +0200, Guillaume W. Bres spake thusly:
> Enable --refclocks=all configure flag,
> to be able to use several synchronization sources (hardware).
> Pps tools is needed for PPS input (include/timepps.h)

I've extended the commit log with a little blurb about why we choose to
not have a fine-grained selection.

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> Refer to the official refclock documentation right here
> https://docs.ntpsec.org/latest/refclock.html

Thanks!

[--SNIP--]
> To have more granularity, --refclock="a, b, c" is how to describe
> the configuration. I don't know how to format such a string in our interface,
> I did not find similar thing is supported packages.
> Commas have to be properly placed and it must not be terminated by a comma

It's rather simple, and we use similar constructs quite a lot:

    NTPSEC_REFCLOCK_LIST = $(subst $(space),$(comma)$(space),$(call qstrip,$(BR2_PACAGE_NTPSEC_REFCLOCK_LIST)))
    NTPSEC_CONF_OPTS += --reflock="$(NTPSEC_REFCLOCK_LIST)"

But I don't think a fine-grained selection is needed: except for PPS
which needs pps-tools, no other refclock has an external dependency,
so the coarse-grained all(or(nothing is good-enough.

> diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
> index c81673481e..d31806c886 100644
> --- a/package/ntpsec/Config.in
> +++ b/package/ntpsec/Config.in
> @@ -29,6 +29,16 @@ config BR2_PACKAGE_NTPSEC_NTS
>  	help
>  	  Enable Network Time Security (NTS) support.
>  
> +menu "Refclocks"

No need for a sub-menu; I dropped it.

Applied to master with the above changes, thanks.

Regards,
Yann E. MORIN.

> +config BR2_PACKAGE_NTPSEC_REFCLOCK_ALL
> +	bool "refclock-all"
> +	select BR2_PACKAGE_PPS_TOOLS
> +	help
> +	  Enable all refclocks (hardware, sync source and discplined
> +	  clocks)
> +
> +endmenu
>  endif
>  
>  comment "ntpsec needs a toolchain w/ wchar, threads, dynamic library"
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index a0d0662947..3822b40dbb 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -53,6 +53,12 @@ ifeq ($(BR2_PACKAGE_NTPSEC_NTS),)
>  NTPSEC_CONF_OPTS += --disable-nts
>  endif
>  
> +# support all refclocks
> +ifeq ($(BR2_PACKAGE_NTPSEC_REFCLOCK_ALL),y)
> +NTPSEC_CONF_OPTS += --refclock=all
> +NTPSEC_DEPENDENCIES += pps-tools
> +endif
> +
>  define NTPSEC_INSTALL_NTPSEC_CONF
>  	$(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
>  endef
> -- 
> 2.20.1
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
