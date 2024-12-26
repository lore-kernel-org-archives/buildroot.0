Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08237E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 15:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FABE4049F;
	Thu, 26 Dec 2024 15:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4BEcYn3RQyl; Thu, 26 Dec 2024 15:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44266404A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44266404A4;
	Thu, 26 Dec 2024 15:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B081F15
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A81B80E03
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGzMRkILxlUd for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 15:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B985580E02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B985580E02
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B985580E02
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 15:39:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D0D61BF203;
 Thu, 26 Dec 2024 15:39:14 +0000 (UTC)
Date: Thu, 26 Dec 2024 16:39:03 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241226163903.19f35469@windsurf>
In-Reply-To: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735227555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObYwMPQpqqAn5j9AgKfMCQroKL4plEFlEiPQ1C9JaGI=;
 b=H8g3NIxO2/ldv9SJnJh+SjnUrFxrZG+PC+OCLWYFg+Bz0ngCLsWZqdLUxp3wQMtByqAOv1
 7ZSdJVX/7DfEe+MadEQ3ODNpOemozc5PiF9g927CSH7fyhwNaLSxUDUXC12QYVFrWFRKoA
 ChAOjbEdzH1I3XL/YcHWvZsnd018QEN8RNZpDmPEQ0pKlHTaopHGGYQgYvWkwLrXzUH7Ro
 8zWznzQQpVJXgJq5IrhnfziwvOYyTptZva2+/fyS1d2u8+uGaa+eRzILf7xZwL+ud3iGtH
 kN+dRyQAqpk1XbJRvk0alJ+OoTB0OXuoibqTXdU3c2fG+DVKhUm0WmkFgnJ/oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H8g3NIxO
Subject: Re: [Buildroot] [PATCH] package/mpv: use meson instead of waf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sat, 21 Dec 2024 18:19:21 +0100
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> Waf has been entirely removed from mpv since commit f2cce5f [1] in favor
> of meson.
> 
> This commit is a rework of mpv makefile to use meson.
> 
> Note that the meson package compilation itself supports the
> static/dynamic compilation setting.
> 
> Fixes:
>     https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77/
> 
> [1]: https://github.com/mpv-player/mpv/commit/f2cce5f38f4031bf1a4b4919ec90e4e8f8c66a77

This commit log needs to be extended with some details of since when
this starting happening, due to which commit (now that you have found
this information).

>  # Some of these options need testing and/or tweaks
>  MPV_CONF_OPTS = \
>  	--prefix=/usr \

--prefix /usr is already passed by meson-package, so keeping it here is
not needed.

>  ifeq ($(BR2_REPRODUCIBLE),y)
> -MPV_CONF_OPTS += --disable-build-date
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
> -else
> -MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static

Did you test a build of mpv with BR2_STATIC_LIBS=y after your change?

>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  MPV_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
>  endif

Did you check that this still has the desired effect after the
conversion to meson?

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
