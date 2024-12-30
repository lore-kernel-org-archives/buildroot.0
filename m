Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B8E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D288A80B9C;
	Mon, 30 Dec 2024 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNzHzTmUrPPj; Mon, 30 Dec 2024 21:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29B480B9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29B480B9D;
	Mon, 30 Dec 2024 21:35:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC91EE0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CC074023C
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQddCvlyW3B0 for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A63840133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A63840133
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A63840133
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:35:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B442D1C0002;
 Mon, 30 Dec 2024 21:35:40 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:35:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?=
 <jan.kundrat@cesnet.cz>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241230223540.024da7f1@windsurf>
In-Reply-To: <20241230113710.679717-4-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
 <20241230113710.679717-4-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735594541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z05fZwGTEg/hrjiH1h2vqnYuC9z1oXZN6lk9bQgI5T4=;
 b=T9Im2mUcSh0DJuruPUnkBcN5I2opYPULbjFm1mEWtKvuGz+OBXAHMnnDE9p8/wKB+qIhFX
 Tyib+fEmTKGhB2Q8I6ROi9NjdjalnSgkCi3fNSbs1OrH9HP69UheCcALWgDZTpARMtYT0x
 6CuqMYescz5qRgparNMopjctIzN+L2SIOWghbaT420kQMDFo+gT4JSsp3IGEbYu6WR9Tns
 kN8ibiK/jXbkuM7QqcPXfbDdds4O0XOCtbPzCWQa4WtR7IWqaeRElHA70junf0ex1boUeY
 5arSAUHnJRirqRq+KJOZ6stn9+wNflVcKN9ZMugyZoXBa9thWYLZx2niR41qbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T9Im2mUc
Subject: Re: [Buildroot] [PATCH v3 3/6] package/sysrepo: bump to version
 2.11.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

Minor comment below, but since a v4 is anyway needed.

On Mon, 30 Dec 2024 12:37:11 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add new config options to enable/disable binary tools/daemon. By default
> this options are enabled.
> 
> Also some sysv init script shellcheck warnings are fixed.

A pedantic person would have said those shellcheck warning fixes should
have been made in a separate patch. Also if you fix shellcheck
warnings, isn't an update of .checkpackageignore needed, i.e remove:

package/sysrepo/S51sysrepo-plugind Shellcheck lib_sysv.Indent

 ?

> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
> index b1535bed9f..ff75575952 100644
> --- a/package/sysrepo/Config.in
> +++ b/package/sysrepo/Config.in
> @@ -16,6 +16,27 @@ config BR2_PACKAGE_SYSREPO
>  
>  if BR2_PACKAGE_SYSREPO
>  
> +config BR2_PACKAGE_SYSREPO_SYSREPOCFG
> +	bool "enable sysrepocfg"
> +	default y
> +	help
> +	  Enable sysrepocfg.
> +	  Build binary tool sysrepocfg

These two lines of help text are quite redundant with each other... and
with the prompt of the option.

> +config BR2_PACKAGE_SYSREPO_SYSREPOCTL
> +	bool "enable sysrepoctl"
> +	default y
> +	help
> +	  Enable sysrepoctl.
> +	  Build binary tool sysrepoctl

Same.

> +config BR2_PACKAGE_SYSREPO_PLUGIND
> +	bool "enable sysrepo-plugind"
> +	default y
> +	help
> +	  Enable sysrepo-plugind.
> +	  Build binary daemon sysrepo-plugind

Same.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
