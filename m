Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCE0C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D486812C3;
	Fri,  7 Aug 2026 12:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFEc7Ml1vPuf; Fri,  7 Aug 2026 12:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E4C81248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786106044;
	bh=32oX2iqvE2ruX+upxF6FOYZmLZlggeRA+W1QGhwaZG4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KXhVL2WrZSvtawlQ12Awm1m0gEi/NBS/U7OAnANGgzTdi4DFKgjf+fh/HlIAYrdxb
	 1Jp15jews35q4jZJh+oF/ajS/fX2jCcjWZHjuAhg990DafjdnfM6I/l8DwbrOEHqKU
	 boa3Yet2sklwk38l5MAI1pnkGji0jPuU0ty+ucGAn5NyxOj5SHd0WvPGM9Swh3JuZn
	 eJa4XsGG/T6hSHzLgNEmoCD+uoU3A1qd1R7VDB9Sl6wThkbzWoSOESRJUEk56bBmUF
	 CfsJcuUU3DDez33L3jLiKnIvYcBwZCEfta0angijXOxYeSRie1ucHcy+ty8CA/dqST
	 iDJ7BEIBBR3FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E4C81248;
	Fri,  7 Aug 2026 12:34:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2326A259
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2087640270
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gj3Se8IPzbP for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E57740105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E57740105
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E57740105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:34:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 246051A14A4;
 Fri,  7 Aug 2026 12:33:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC45F603F0;
 Fri,  7 Aug 2026 12:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB05911C377A4; 
 Fri,  7 Aug 2026 14:33:53 +0200 (CEST)
Date: Fri, 7 Aug 2026 14:33:53 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <anXQGyU9dHYRMR0I@windsurf>
References: <20260807002109.2479876-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807002109.2479876-1-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786106034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=OT6WncRi/3b3DCsdTNw4GpgjgK9jz8QHA3JyVATOi6M=;
 b=kkfJCv7MTE7iYOMBfXHHIq+OekGP3SlW0pbkhupjBCYBwxFrPZVq6PQBHLo5hodWaqGWu7
 K7cSzfwI8DGSZF58EWSJ43rko5YGC23ksxFg42nMV3peIPPnZZiglmDOndvHzzV9ykY1vy
 8I1H+iHfUGAIu+zIk5XgOCpPxq3bBnBZ/P2veFC7g4Qu9dVKwoBxT0sgTiPhIUz42hGfsi
 wDftpIQRifGGrkX9IFmeDkpfbJUtu8/A7oaKIWWeLJ40wFlfF7Jxcsx4iXZvZex0vc37hk
 K07sJ8+PCEnHat2uBIDGNNudXpjABoQ3s6AuN9RqUFyHUQGvZ59UvmeJObgEDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kkfJCv7M
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: build libxkbregistry
 when libxml2 is available
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

Hello Alsey,

On Thu, Aug 06, 2026 at 08:21:09PM -0400, Alsey Coleman Miller wrote:
> libxkbregistry is the keyboard layout catalogue half of the library. It
> parses the XML layout registry and so needs libxml2, which is presumably
> why it was disabled unconditionally rather than wired to a dependency.
> 
> wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
> wayland-client, wayland-scanner, xkbcommon and linux/input.h before it
> will build the Wayland driver, and wine.mk passes --with-wayland for any
> build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
> error:
> 
>   checking for wayland-client.h... yes
>   checking for wl_display_connect in -lwayland-client... yes
>   checking for wayland-scanner... .../host/bin/wayland-scanner
>   checking for xkb_context_new in -lxkbcommon... yes
>   checking for wayland-egl.h... yes
>   checking for wl_egl_window_create in -lwayland-egl... yes
>   configure: error: Wayland development files not found, the Wayland
>     driver won't be supported.
>   This is an error since --with-wayland was requested.
> 
> Every other term of that test passes; only XKBREGISTRY_LIBS is empty, so
> wine and wayland together could not be built on any architecture.
> 
> Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
> meson.build takes dependency('libxml-2.0') unconditionally once
> enable-xkbregistry is set, so a target without libxml2 would fail to
> configure.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

The patch obviously looks good and relevant. However, I have two
comments:

- Shouldn't this be associated with a change in the wine package to
  select BR2_PACKAGE_LIBXML2 when wayland support is enabled?

- We would need your commit log to be extended to indicate since when
  this problem exists. Indeed, since your change is a fix, we will
  have to figure out whether we need to backport it to our LTS branch
  2025.02.x. And for that, we need to understand if 2025.02.x is
  affected by the problem or not.

Thanks a lot in advance for your feedback!

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
