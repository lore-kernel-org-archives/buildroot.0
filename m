Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA0CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57E91416D2;
	Mon, 16 Oct 2023 10:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57E91416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNuaLdG6wZdO; Mon, 16 Oct 2023 10:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 232A64000B;
	Mon, 16 Oct 2023 10:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 232A64000B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA2221BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93BD281F7B
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93BD281F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyaAPbjdDuW0 for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:11:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8521581F79
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8521581F79
Received: by mail.gandi.net (Postfix) with ESMTPSA id 849D0FF815;
 Mon, 16 Oct 2023 10:11:33 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:11:32 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121132.739ddd8e@booty>
In-Reply-To: <20230924151205.2099293-3-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4y3NxyZJqkqvFsxvt0IyhVCpKOrNFygE0Rg3n0hRs6M=;
 b=Cnzr8PqkweiyLzQF/QgH0OORgs+3eThx+56YwGc1HB0yhGXYoHY7M6tWd+JzALOKTEznrt
 ny8U8wNlWeKp1IqbrpXuBEfoW8LqjR8S0c4877MIdrKn4IY4NadKN0gJ2YAgCr+pRg+kuc
 Pu1pbhYXORHcHTj7QeS0YtGbqU9Om9sf1rtTd9L0U5AXarQILggrV+cSebdB7PVkHvgVO+
 bjEnmw14iH6VBLlPpCy1b1R4b0i3+5KV9ZEjfEeMJZ68u2KanHqnmKYqtO/DMd58MTVygQ
 ZsAdUwX9TyYEwbpc21X9gB5ealeHHIdW75iRyxrv9wIsAp05gnRR549XwWsoWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cnzr8Pqk
Subject: Re: [Buildroot] [PATCH v4 03/10] package/newlib-bare-metal: new
 package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:11:58 +0100
Neal Frager <neal.frager@amd.com> wrote:

> --- /dev/null
> +++ b/package/newlib-bare-metal/newlib-bare-metal.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# newlib-bare-metal
> +#
> +################################################################################
> +
> +HOST_NEWLIB_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_NEWLIB_BARE_METAL_VERSION))
> +ifeq ($(HOST_NEWLIB_BARE_METAL_VERSION),)
> +HOST_NEWLIB_BARE_METAL_VERSION = 4.1.0
> +endif
> +
> +HOST_NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib
> +HOST_NEWLIB_BARE_METAL_SOURCE = newlib-$(HOST_NEWLIB_BARE_METAL_VERSION).tar.gz
> +HOST_NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal

Missing _LICENSE.

Otherwise LGTM.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
