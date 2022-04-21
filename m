Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF93C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 324D141729;
	Thu, 21 Apr 2022 19:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JxRW899MqzG; Thu, 21 Apr 2022 19:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9347841716;
	Thu, 21 Apr 2022 19:36:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3FF1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D13842F8
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ronI6bXAwCCi for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:36:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE34C813B8
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:36:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67D615FF95;
 Thu, 21 Apr 2022 21:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650569766;
 bh=l2pjqzkobgrVeoh3UwP82DDrdLIIHAaupaso/zNov+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWnTfxNrconOijlC9zPO6Z8MetFfc2vP/zYzYNU94ni8H1ttlF6NAqtiYfCh8mrJd
 DkEnSGtv0KjWv8vUqIizoIqhco1MgvP+KCeYxOW0eGPkpQorzIvxqXYAgWwW6fFouO
 2j5XC27R6vi4QNeuL464FVhc9a693rpwxxw6kt2FIaxusfFt9BlhucCkONk9yKy+B1
 9fCBAKY71WeNgI78EGi9HIlVMJQTXcgoPnDUqDBP0S9gPjQ6tHSGCGpWtxKzAqBiM6
 36wWdHdvaYLOcuvuz7l1D35y7vczVCV26ljJlPehSst1pinJLYu2N8Aa2YFM01MSFs
 35+gW4KSzt12Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Apr 2022 21:36:04 +0200
Date: Thu, 21 Apr 2022 21:36:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220421193604.GQ2730@scaer>
References: <20220418222033.1279730-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418222033.1279730-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: disable backtrace on
 internal bind
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

On 2022-04-19 00:20 +0200, Fabrice Fontaine spake thusly:
> Disable backtrace on internal bind to avoid the following build failure
> since commit 0c8dd6ebd656e06cf99a63eb93343715f4853503:

I've expanded that part to also reference commit 700674b45c86
(package/bind: disable backtrace support) where the same was done to the
official bind.

> /nvmedata/autobuild/instance-15/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/10.3.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /nvmedata/autobuild/instance-15/output-1/build/dhcp-4.4.3/bind/bind-9.11.36/lib/isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/074786f3f1e7ffc858dcb1de1855ee138793869e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dhcp/dhcp.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 6ac9ed0147..e6f4c419f4 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -29,7 +29,8 @@ DHCP_BIND_EXTRA_CONFIG = \
>  	BUILD_CFLAGS='$(HOST_CFLAGS)' \
>  	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
>  	BUILD_LDFLAGS='$(HOST_LDFLAGS)' \
> -	RANLIB='$(TARGET_RANLIB)'
> +	RANLIB='$(TARGET_RANLIB)' \
> +	--disable-backtrace
>  
>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>  
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
