Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB537C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BD981F48;
	Wed, 23 Nov 2022 14:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BD981F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07hDfzFqauUN; Wed, 23 Nov 2022 14:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C685A81F3F;
	Wed, 23 Nov 2022 14:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C685A81F3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9498C1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D96481F28
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D96481F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwPGKDSvuZmC for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:37:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50A8881F3F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50A8881F3F
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:37:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22DF3100012;
 Wed, 23 Nov 2022 14:37:11 +0000 (UTC)
Date: Wed, 23 Nov 2022 15:37:10 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221123153710.71a2056b@windsurf>
In-Reply-To: <20221122215912.824599-1-ju.o@free.fr>
References: <20221122215557.789750-1-ju.o@free.fr>
 <20221122215912.824599-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669214231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pUHnCn1gOTcr9J6OiTbt3znrxLC6uJocjMnc+ysmYI=;
 b=Javz01Ugj1slFMtBfI9U+GbToSBAC1eHZFzEWz38Qbo/BvIrx7mEKtG5k20JSxU4X+Cik2
 H8Wmy23BttFspYoNO33fqtkHqkaHQSjpNy2qYiTGRcz0UFbb9zAapN+6oJ30tMhVgUItTf
 2OjmGh6u+TBa8SJq6cUuxN/PVtpcQIyl7RvHKkyIgaa8jKBEYvfSEsk5PFeO2rQ9Ws/McT
 NmSIwJdYQofr/DZj+bI7NGoUdPJcI4bQGGTgFQNEW6UmysU7kQ/ScNCsEOAndqT0i3g0IQ
 xGeVRd3L6eSg+iV4pn0dPtovV1vwSKb5qIjsVpH/NruCma+2iUeRsLYIcwoyNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Javz01Ug
Subject: Re: [Buildroot] [PATCH next 2/2] package/libjxl: new package
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

Hello Julien,

On Tue, 22 Nov 2022 22:59:12 +0100
Julien Olivain <ju.o@free.fr> wrote:

> diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
> new file mode 100644
> index 0000000000..456305083c
> --- /dev/null
> +++ b/package/libjxl/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBJXL
> +	bool "libjxl"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
> +	depends on BR2_INSTALL_LIBSTDCPP # highway
> +	depends on BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
> +	select BR2_PACKAGE_BROTLI
> +	select BR2_PACKAGE_HIGHWAY
> +	select BR2_PACKAGE_LCMS2
> +	help
> +	  libjxl is the reference implementation of JPEG XL (encoder
> +	  and decoder).
> +
> +	  https://github.com/libjxl/libjxl

Missing:

comment "libjxl needs a toolchain with C++, gcc >= 7"
	depends on ...


> +LIBJXL_DEPENDENCIES = \
> +	brotli \
> +	lcms2 \
> +	highway
> +
> +LIBJXL_CONF_OPTS = \
> +	-DJPEGXL_BUNDLE_LIBPNG=OFF \

So which libpng gets used? None?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
