Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C9606AB3E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NEE/7pCR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8DC812BE;
	Wed,  4 Nov 2026 20:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjUd45Lq8YWq; Wed,  4 Nov 2026 20:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A39BE812BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824474;
	b=HdO0d8keTWG3NJp+gG9JRYkK3QbCqxp0GKRuDXEYHwKy8a3Vtvnt7xvHG8ir5DK2ZaPA
	 lzIvzJjBfxg0t0hPoMmd+nLaXZKqb5y0ZfiOn9mY3zsM/jbyJJckvrVyijzVTxCacuQzx
	 IHnbcQk3Anc2VAywko+Y4CajlSTM3JMPf5XNbxrqW4lKPu/W9DKuhk+qROrkflOxOyJS9
	 N0qAOlc0U3YPUBzvwHgk9jTedImvRDgZ1brKZXh3gWTL9Rocqe4I5Ul8w+548jM5wkELM
	 EQwjicVkBCGgwyIl0TvXnHV8uQYpwA4Is1Gx1nu6TXL8Z5YP9o30C5BayEIB6fqS0Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uFi9ptxpzE4cFLWYCL4bhRWM/y+rUz9BvEfrpw/WadU=;
	b=Y2y4QFELY7tA6uDSZ2xaAX//+r6K/OF4RYmcB5MayZxt/e5NjRBjMq/ngANnc/mxZ/vN
	 g2SMJssHJ2kvzAFLAztk9uH9xuolUHc3DTl81+rfRYAZn5L9+46z8Gq9AM1sZz3GYZltk
	 3wMadrmmYTBuSzF+IkGYVdIyRQQC3K96+jo1M3jb/bAW8ijA2l4B8G1uTWfgRuT6utUp8
	 I+htFFqKKW7dSJMwWguBvaPQEZufomh1DSK9Vj+XtONnCiGOrwOcx50+2C9sllJyh+ZYp
	 vjQFZ5BYcPf00qaEZ/lvnNXVo5/9+enFud4G4V7jJTnFVjKWdU/U+tiiINPLxdyjCkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824474;
	bh=uFi9ptxpzE4cFLWYCL4bhRWM/y+rUz9BvEfrpw/WadU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NEE/7pCRY3Um+rTiFrdgLSC/T9dD3qBF8dKRwU4glhu2Rohxame//G0DviWEGWtX9
	 J8P+Rzb56wau90Iq2AdLu9541coLv0uYTBuvdyoxr4E4kzfw1v9H1D2TUtRYXAbFHk
	 WMh4w+iPzP0ofVJ3SjWcH1d0Q1i49OFjxNVYfxzbbnZa8rbkdQxl/1NgTFCxb0JVIO
	 6K7G7PSDMmiBF2fVUde7/obN99ygo/KCEJIBoVJSJWtlrb6/YSstN3ajbTIp3+Qtau
	 8rT8XFqxz3FJYhvjodIs2qOTIZPmVkbdqyQJG6Cq5O9X/kfHpzjsjbkZ5yb4FlfMZP
	 GeRIr/vNgPItA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39BE812BF;
	Wed,  4 Nov 2026 20:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEB2BD3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C029D407F9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVxk7dpzqW3a for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2ECD407F8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2ECD407F8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:34:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5F55D4E4017E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:34:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 196B85FAEB;
 Wed,  4 Nov 2026 20:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 870F110329262; Wed,  4 Nov 2026 21:34:23 +0100 (CET)
Date: Wed, 4 Nov 2026 21:34:23 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, fontaine.fabrice@gmail.com, 
 Copilot <223556219+Copilot@users.noreply.github.com>
Message-ID: <auuWSHnhQQkIunzF@windsurf>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
 <20261102160505.1754919-3-thomas.devoogdt@barco.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102160505.1754919-3-thomas.devoogdt@barco.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libgtk3: add missing direct
 dependencies
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 05:05:05PM +0100, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas@devoogdt.com>
> 
> GTK3 links directly against fribidi (mandatory) and harfbuzz
> (auto-detected).

Wait, does this mean that harfbuzz is not mandatory? If it isn't
mandatory, it shouldn't be an unconditional dependency of libgtk3.

My quick reading of the meson.build seems to indicate that it is
mandatory when the x11 or wayland backends are used, but not with the
broadway backend.

So perhaps the BR2_PACKAGE_LIBGTK3_WAYLAND and BR2_PACKAGE_LIBGTK3_X11
should select BR2_PACKAGE_HARFBUZZ, and libgtk3.mk should contain:

ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
LIBGTK3_DEPENDENCIES += harfbuzz
endif

Could you double check this?

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
