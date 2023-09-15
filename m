Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5754EE6452
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 10:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4C860F1D;
	Fri, 15 Sep 2023 10:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4C860F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftKEg0PZufEx; Fri, 15 Sep 2023 10:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B417760BE1;
	Fri, 15 Sep 2023 10:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B417760BE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D100F1BF575
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 10:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F7382BC3
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 10:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F7382BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU35Nu48jB1y for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 10:21:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 167A382B81
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 167A382B81
Received: by mail.gandi.net (Postfix) with ESMTPSA id A411B1BF20D;
 Fri, 15 Sep 2023 10:21:04 +0000 (UTC)
Date: Fri, 15 Sep 2023 12:21:03 +0200
To: Yanghao Cheng <yanghaobillcheng@gmail.com>
Message-ID: <20230915122103.41ff8af1@windsurf>
In-Reply-To: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
References: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694773265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYiPlVp/uF9pVqU5E7XRxAgBK02xwhq7QXMsHS+b9SA=;
 b=gcnm2Ty5mRqT8JBkTlI4aU5M3Hazm8K5UcSpGZCGgHrqUoXNHjr+PHbD5zGmy0jLRyMCmY
 86RfcF97Ja87usS0+mf/+Jtb9uPXda3q4O3s/XB4/cLutB7M+a+TIh4a/0SK0KUee/w12x
 TjrBRGfsmGeVcrHBjZ+sAPlscE4WlOvgPGgEGdVxvC89LG1XhZYjC0xvps8eeb2hxPdeBe
 Pf2LbzqzQF5sAfMji9gHzcREOarD/iMKcMKERp1tUXh7atPofGPM5RLTApNWOC+rkml+GQ
 xfJe5/Uzt0EjxBF6s1+Tz78izyc49OcCNwHTtFGk7MsE6nkhdRKBmLSxW0YDSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gcnm2Ty5
Subject: Re: [Buildroot] [PATCH 1/2] package/xserver_xorg-server: fix init
 script conflicts
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 14 Sep 2023 16:50:43 -0700
Yanghao Cheng <yanghaobillcheng@gmail.com> wrote:

> From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> 
> xdm package also installs a init script that utimately starts X server
> 
> Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

Thanks for your patch, see below one suggestion.

> ---
> Backport to: 2023.02.x
>  .../xserver_xorg-server/xserver_xorg-server.mk     | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 593bbd4276..e5df7f7e93 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -181,12 +181,14 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
>  endef
>  
> -# init script conflicts with S90nodm
> -ifneq ($(BR2_PACKAGE_NODM),y)
> -define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> -		$(TARGET_DIR)/etc/init.d/S40xorg
> -endef
> +# init script conflicts with S90nodm and S99xdm
> +ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
> +    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> +else
> +    define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> +        $(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> +            $(TARGET_DIR)/etc/init.d/S40xorg
> +    endef
>  endif

Can be simplified as:

ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
		$(TARGET_DIR)/etc/init.d/S40xorg
endef
endif

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
