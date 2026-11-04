Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E814606EEA1
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C/uAZvqJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3FC80BD2;
	Wed,  4 Nov 2026 22:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECZfKH4vMI-l; Wed,  4 Nov 2026 22:09:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2DE9811E1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830171;
	b=iTGVSD8aiO0iBel8CIGOcPsmhD92MdkfY/MKknRjTcqrcBDzSuQ8Koc8acooynrrQn0x
	 fohxrgoXRPozQv1XxWPq1xsiSkMK/MfZyogaavn9WVmxanclgnh/hbqGvbiQFR0DB5k1t
	 5TWckLbEMu677S75QEUdnB1al+thNNzdEnM5B1lf/gZ+wCLGL2DW/RLFmAhSIEByI5iij
	 sQfYtSAIuohuPUfJfSi5dWMyg3LVz0fXS6qA1KOxAvMTpwCXksdjnH3AV/qvxeh7pdQ9I
	 TvfKrQpYKbFCrEYLaokdGwzE2d2nbRFcXuZ3yM3uXoLV23qPWsg0T8lbu2N8BBjISkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ztRYaT2SvtCPnW4VB1IFKHCyD+iKMP8RcvrI88EH1HQ=;
	b=dgLmYfbmpjRVlEL9nAlUgpCTVZbM74+SABDsXqKhZ5hBG+NHIfMYny+t3JpYbcfeisGD
	 FJmL9/HBeGwWK+6WpXATvktH6A6gTIqiUdbkSM+cYTVkBL3oXbgIRbkfRfgiliGIlH5WQ
	 H4DMPkR36dbMlnC0DCT8GPnP5B3mDkE7dSQJK5ZBVSECJ9xsS4Fmq18LfoYnSJZoyj4Zl
	 0Na0yG8QnT3hv6KdXgr+c16s4fjT8p85QSjIXh466crYeKOPGnovs32q+e+VfrfTWuY0o
	 rfYLPKAO8hfgSjT2cWhsaPSekJiaifD1KzR5bnGFpfXZbxPoWZTL7/VDgFlK/ZcrV6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830170;
	bh=ztRYaT2SvtCPnW4VB1IFKHCyD+iKMP8RcvrI88EH1HQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C/uAZvqJCG3j9vK9/aUYni5iKU3cz87OnRiTs6wYA2iGcq3Wd5XV46kgVWIIKzvQo
	 8gOmToMuhFnXoMHuvuJTAF0SGq/NrJplFvmh55+tOIdQeTnd2NVvuWCvAudkwtHgx4
	 TzdQtdrc+9Vk8hQBQztW5CCsMULtFPHe5tSUT94sac3K8j5JUozk1T/sQaSZemmHXA
	 NFW+pDE9zJw0sUB7MxMAg+FfaraczRifKFci2X5LhbYMsw4iWc2xF2397aulFySBmI
	 gUULbBKdP1ObyLztApWh7UwiICkypy4We3smYC8l20ISHXNYgQoTrsTrY21hLX3pC4
	 MTPkCYdpqsd5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DE9811E1;
	Wed,  4 Nov 2026 22:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF70937B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDB3407E4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev-DA4eQhgH2 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3F07A407E0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F07A407E0
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:09:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3A5FD1A03C4;
 Wed,  4 Nov 2026 22:09:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 083935FD65;
 Wed,  4 Nov 2026 22:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDEEA1032925B; Wed,  4 Nov 2026 23:09:19 +0100 (CET)
Date: Wed, 4 Nov 2026 23:09:18 +0100
To: Joseph Telaak <joseph@telaak.dev>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <auusDZ8yOtO-Gebo@windsurf>
References: <20261102224915.69302-1-joseph@telaak.dev>
 <20261102224915.69302-3-joseph@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102224915.69302-3-joseph@telaak.dev>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: add WPE Platform
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 05:49:15PM -0500, Joseph Telaak wrote:
> WPE Platform is the newer embedding API of WPE WebKit: the application
> creates a WPEDisplay and WebKit renders through it, without libwpe or
> a WPE backend.

Again, silly questions from someone not familiar with wpewebkit: what
is "WPE backend" in this context, and how does "WPE backend" map to
what we have (or don't have) in Buildroot?

In Buildroot as far as I can see, wpewebkit always depends on
wpebackend-fdo, which depends on libwpe. Does this mean that we are so
far only using "libwpe" and never "WPE backend"?

> In 2.50 it is only enabled by default in developer
> mode, so add an option for it, with sub-options for the DRM and
> Wayland platforms. The headless platform has no dependencies and is
> always built.
> 
> WPE Platform uses libmanette for gamepads when it finds it, so build
> libmanette first when it is enabled.
> 
> The DRM platform needs libinput and libudev. It also needs GBM and
> libdrm, which the existing USE_GBM and USE_LIBDRM blocks handle. It
> imports buffers for scanout with GBM format modifiers, which not every
> GBM provider supports, so, like cog, it depends on
> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT, the
> closest feature symbol. It does not use gbm_bo_get_fd, so unlike cog
> it does not need the DMA_BUF feature.

So far, so good.

> The Wayland platform selects wayland and wayland-protocols even though
> wpewebkit itself selects them today: that is only for wpebackend-fdo,
> and the Wayland platform needs them on its own.

But if wayland/wayland-protocols are only for wpebackend-fdo, why
isn't wpebackend-fdo selecting them, instead of wpewebkit?

> Every WPE Platform display compiles an XKB keymap with libxkbcommon.
> Without the xkeyboard-config data this fails and the application
> crashes, so select xkeyboard-config.
> 
> Pass ENABLE_WPE_PLATFORM explicitly in both cases, as upstream
> enables it by default starting with 2.54.
> 
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Otherwise, looks good to me. Probably no need to resend, just provide
a little bit more details on the questions asked on PATCH 1/2 and 2/2
and that should be good.

Adrian: here as well, your review would be appreciated :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
