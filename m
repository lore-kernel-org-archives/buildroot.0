Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F361EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 16:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB2AC405F1;
	Sun, 18 Jun 2023 16:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB2AC405F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Vdhl33Z07vR; Sun, 18 Jun 2023 16:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FAC405D1;
	Sun, 18 Jun 2023 16:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FAC405D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7E11BF5A2
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 16:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56E6281EE9
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 16:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E6281EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVgb9ZDirExh for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 16:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D9581EDD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D9581EDD
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 16:20:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a4e:c651:9894:ba33])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BA4AEB00565;
 Sun, 18 Jun 2023 18:20:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Jun 2023 18:20:30 +0200
Date: Sun, 18 Jun 2023 18:20:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230618162030.GA2754@scaer>
References: <20230507142319.1001150-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507142319.1001150-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687105233;
 bh=LS+Wzo6gHUwJSI2UGOI7rD6XXw1iuCuZ0bL7OqqGpfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exfqzjd0LLktHpLtHzBkh71HeGgIyklVooGyA2iZT38/5YrrhF5EWH/oqFw6rm4Vj
 Zhs0uEt5eb2XF7FN7MbUoSgY5Zr5RWIEiafZ2TFvUjxXaHy/WCxuTaOvicGjyhybsJ
 kmySMsOKYIbFv/MLnOtPPAjN+KXYo7itN/wbCDy0FwTln71T9ZDwcZus6ZZ0w2T6lE
 eWXFhPgVlIgKFH/NG8R6J05KM/YjP0spud9ijuQcZhSSGFZ6PrqDq39D6P34osGt7e
 Zc2R05SVNAcgMLYQ75n80I6r1YRpBHinrsEFrBv4TkPKYo0zmAh0tVIbLhZQM4J2at
 RGjz6MoNbj8UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=exfqzjd0
Subject: Re: [Buildroot] [PATCH 1/2] package/hwdata: install to staging
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-07 16:23 +0200, Bernd Kuhls spake thusly:
> Build-time dependency for the new libdisplay-info package.

I've substantially expanded on the commit log, to explain _why_ it needs
to be installed to staging.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/hwdata/hwdata.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index 755a9c93f1..cbac3a22d4 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -8,6 +8,7 @@ HWDATA_VERSION = 0.369
>  HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>  HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>  HWDATA_LICENSE_FILES = COPYING LICENSE
> +HWDATA_INSTALL_STAGING = YES
>  
>  HWDATA_FILES = \
>  	$(if $(BR2_PACKAGE_HWDATA_IAB_OUI_TXT),iab.txt oui.txt) \
> @@ -15,7 +16,22 @@ HWDATA_FILES = \
>  	$(if $(BR2_PACKAGE_HWDATA_PNP_IDS),pnp.ids) \
>  	$(if $(BR2_PACKAGE_HWDATA_USB_IDS),usb.ids)
>  
> +define HWDATA_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
> +endef
> +
> +define HWDATA_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) hwdata.pc
> +endef
> +
>  ifneq ($(strip $(HWDATA_FILES)),)
> +define HWDATA_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/hwdata.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/hwdata.pc
> +	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/share/hwdata
> +	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/share/hwdata \
> +		$(addprefix $(@D)/,$(HWDATA_FILES))
> +endef
>  define HWDATA_INSTALL_TARGET_CMDS
>  	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/hwdata
>  	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/share/hwdata \
> -- 
> 2.39.2
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
