Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD34C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B5440674;
	Tue, 18 Aug 2026 21:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FCvhSEXcVFx; Tue, 18 Aug 2026 21:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787087834;
	bh=wUREQSPq0rYlMHr52fKNMhuUmrBsu3/BIwca7KMEEoE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b/WushPb3rMVQDkNmmEbOuWTnJEhfgotQlY3BaZjL8g16pIn9Bzy+u7KCVepZ9Kn1
	 lS9QaGuxggX/Qztvivefw9jSM3zIN8XSseXuVzeso4zJrqzKd8IBuPQoBfOu2iKjpL
	 uUFJtLOdCc3tyL+HvFesWtjS+Qf0ITvxXEJPjEasj7OB8jl6aDZ2i0LyJUexJlNjtb
	 9TLOe1E5tggGr/i4trpIZjHjVlTLWZT+KqOG/5XMwoDOFbL/OUG9nMB72/D7RhXTTT
	 NSxi1tmZ4nXEMKrLgCFzND8Ky+WFIb+/x1P5N0p/qoIvGQAlGUWWv22WdJ9sd9t/Re
	 lkFvOGDwFAxWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C1E4081A;
	Tue, 18 Aug 2026 21:17:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E370265
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E896A80D3C
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De5zKWnudnQl for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1082180D9C
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EE49A4E41289;
 Tue, 18 Aug 2026 21:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C0D5660355;
 Tue, 18 Aug 2026 21:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D050711C74F8E; 
 Tue, 18 Aug 2026 23:17:03 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:17:02 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <aoTLv-5tIW2rk8n1@windsurf>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260809201403.3855903-1-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libxkbcommon: build
 libxkbregistry when libxml2 is available
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

Hello,

On Sun, Aug 09, 2026 at 04:14:02PM -0400, Alsey Coleman Miller wrote:
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
> Regarding since when this is broken, three pieces had to come together:
> 
>  - libxkbcommon has passed -Denable-xkbregistry=false since commit
>    1791bc30a5 ("package/libxkbcommon: bump version to 1.0.1", Sep 2020),
>    i.e. Buildroot 2020.11. libxkbregistry has therefore never been built
>    in Buildroot.
> 
>  - wine's configure gained the XKBREGISTRY_LIBS term in its Wayland
>    test in wine 9.0, with upstream commit d64ea8e4a6c9
>    ("winewayland.drv: Enumerate Xkb layouts and create matching HKL.",
>    Nov 2023).
> 
>  - wine.mk started passing --with-wayland in commit 7cb49e7712
>    ("package/wine: bump to version 9.19", Oct 2024), which is what turns
>    the missing XKBREGISTRY_LIBS from a notice into a hard error.
> 
> The breakage therefore dates from Buildroot 2024.11, and every branch
> since is affected, including the LTS one: 2025.02.x carries wine 10.0,
> whose configure has the XKBREGISTRY_LIBS check, together with
> libxkbcommon 1.9.2 built with -Denable-xkbregistry=false, and its wine.mk
> passes --with-wayland. 2025.05.x and 2025.08.x are in the same state.
> A backport to 2025.02.x is thus needed.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
