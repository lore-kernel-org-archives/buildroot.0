Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CEEC5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100326061E;
	Sun,  9 Aug 2026 20:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7Qor3NxYX_A; Sun,  9 Aug 2026 20:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9C460603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786307324;
	bh=hctpWlgKccL7nV6Ec+v4HasvTTNLNlIKG+iCYgwj8Ws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPtbE/kfambUEl3XLDyIgp34WxLMSkvs/JUDl2wLo6GB3z14SfiFywCcInJGDOs5q
	 GcgtQtUuCcfXOHoUhZzPI2nO0gG29/3olfHJ6aSZCgYyOJP9SrKQID8J+JZeFxkxuG
	 J5UgZJhndZB9nC+hyO0WBuR82iU4RXFTCPC2aZlMT83UbLs6ta4sclWLkCGyhBc2/f
	 CgzolidQg36qbLOGeiWpfgDS5tBCLRgDNyyt1h6llWVyRFk0cCG6/ZUxQhWCevKxnV
	 ansaj80PmWMIje0DFgV+c1IbLUGZdEsXX1iPSu4QBwfaswptH7c8NtFzU8n9HNq5Wp
	 jeGXrGoO0uL2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9C460603;
	Sun,  9 Aug 2026 20:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4330D259
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28E63404EF
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocq1QGtmSYCy for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B52C404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B52C404C1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B52C404C1
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:28:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CB3241A150E;
 Sun,  9 Aug 2026 20:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 912576033B;
 Sun,  9 Aug 2026 20:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7022111C494E7; 
 Sun,  9 Aug 2026 22:28:33 +0200 (CEST)
Date: Sun, 9 Aug 2026 22:28:32 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <anjixKjxRvjrCYok@windsurf>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260809201403.3855903-1-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786307314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ntsp8JFzUiKvGFFqpxBKzOTNM5uEfvWYz+g+Ewc+5Qc=;
 b=y2iiUmHjIUGAvDyaNsYTlVjLBWwKkTES9Wn8vl/WXbnZL1p9FggKk2O7iK1nSZNdkGx1F5
 /gcM/IaLJejUgTDi/O5ylha4053tzf30f0iVSvAr122zlAGefYaKr1cHeqEQaWJM/FUWdm
 eXcULXU6pF3IK3Zm1nR5vFjhbAttH8qfgwQC1FGuDFTLsTKLJyP6HAfr7mwP7hsb2t8Dty
 po1qQ8t+Rv9axCYphiD2pRJyG4ioOgvJ8+WZG1mUM6cwx7k2X/hI65Fo0SA2lGQGtFB42t
 zO9+cDQRGuYAb9JUU6+CgPskGfIUUsZc3fSYn6c65NQJxZhZM7inxCKqTXnUHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y2iiUmHj
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

Thanks for this new iteration!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
