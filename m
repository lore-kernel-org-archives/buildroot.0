Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D2CC04AB7
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E0A82133;
	Wed, 20 Sep 2023 20:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E0A82133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpN0EK2mDq0j; Wed, 20 Sep 2023 20:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B87F82142;
	Wed, 20 Sep 2023 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B87F82142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E14E1BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A0A882133
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A0A882133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHpBMayZSS0Y for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:26:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3B28208B
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3B28208B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BAF4FF803;
 Wed, 20 Sep 2023 20:26:29 +0000 (UTC)
Date: Wed, 20 Sep 2023 22:26:28 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920222628.6eb43e25@windsurf>
In-Reply-To: <20230918204405.2654720-1-fontaine.fabrice@gmail.com>
References: <20230918204405.2654720-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695241589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbpLPibD7qAl+X3MOkvGBxF+0WjxbSKclnhxajCNPpk=;
 b=KhZZ9lYo2yVW8INYRMi2Bvzs0jI/8qsfulEXPQoISh9MZOYLw5+20NTMBmdZ4UoYDtW9vB
 XMjdncwliRf8UM1o5Kw9I/g+2ybXIzOgBQY+SBH7bwcldg8lL+PaQZhAmQjnjFe/QMQIlG
 1SMH9oBZ70ZIVB8F7zsFJ40zWYeD2soZrggJoBcTuZIGiMNVbYqXQgHaoa5DzeKK9287J/
 ugXz+rtecqU9+pnRIzseWxy+8TzuvB/nBznqpfMJlcSuv+7yzqN/INEfvDAmWZCOyJL2Fz
 g2pkiMQacFe9pmRSbjhurpiLByTN62EKD81MkSVh4JnLCQRvO2Rcgn2pN7sysg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KhZZ9lYo
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: needs headers >= 4.16
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 22:44:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> NLMSGERR_ATTR_MAX has been added in kernel 4.16 with
> https://github.com/torvalds/linux/commit/dc2b9f19e3bdaa87a7c3d123b8bba8a42d96d942
> resulting in the following build failure since bump to version 2.6.4 in
> commit a46ac2346558d05afe405dda3730169df4b677d2 and
> https://github.com/OpenVPN/openvpn/commit/e34437c26b764851555e4acbe2ccca6bec235c7e:
> 
> dco_linux.c: In function 'ovpn_nl_cb_error':
> dco_linux.c:303:27: error: 'NLMSGERR_ATTR_MAX' undeclared (first use in this function); did you mean '__CTRL_ATTR_MAX'?
>      struct nlattr *tb_msg[NLMSGERR_ATTR_MAX + 1];
>                            ^~~~~~~~~~~~~~~~~
>                            __CTRL_ATTR_MAX
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69b9737913ac0b5cd2c117d526602874da3ee487
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openvpn/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
> index 5aa2386d36..16fc93efae 100644
> --- a/package/openvpn/Config.in
> +++ b/package/openvpn/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_OPENVPN
>  	bool "openvpn"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16

I think that's a bit brutal. Looking a bit at the OpenVPN code, it
looks like NLMSGERR_ATTR_MAX is only used by the DCO code added in
commit e34437c26b764851555e4acbe2ccca6bec235c7e, and this code can be
disabled using --disable-dco. Which we actually already support:

ifeq ($(BR2_PACKAGE_LIBNL),y)
OPENVPN_CONF_OPTS += --enable-dco
OPENVPN_DEPENDENCIES += libnl
else
OPENVPN_CONF_OPTS += --disable-dco
endif

So I guess the correct fix is rather:

ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
OPENVPN_CONF_OPTS += --enable-dco
OPENVPN_DEPENDENCIES += libnl
else
OPENVPN_CONF_OPTS += --disable-dco
endif

Could you check this?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
