Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17927606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nia87X8o
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F7280BD1;
	Thu,  5 Nov 2026 00:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvT63hM5z2-b; Thu,  5 Nov 2026 00:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC3A880BBE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793838215;
	b=O4DJBhxPo2bd2OaBiR7JBDiK199YwV3gmiv5z/Hbv5iK7m4mGlDio1YJKX6eidI/HTpN
	 LSNCcdPUKmdQnvY7n7eoBs+CMTS8UtMdZSMTXGczFV3S1odcAeE7BgcFvChKNe1cx7cR7
	 NA0ptDUI5q0DfMHvRjH5SNfVec9PL6kyXkmBKM8YU1LkTDMI9f8wXLtiLat8P9YyTtHES
	 y45UUiqGPXlXspxSjev8aT8MXcwhkA3vCVNMzGJcZZ9aEn9shSTYxG1p8zth1BesS00sn
	 q3XNDWiK/3Oqoxew7uYtX/2dHpyEP6VcgjiEf7+KdKF9ZUeU5R0OzuyfgbVIzzkJyyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793838215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Received:X-Received:MIME-Version:References:In-Reply-To:From:
	 Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VpiNcPWSsonBiDsD19OutrA9nPr9dOzkLRSlqzQ3Ios=;
	b=SstujRIoYo7xbDMisiC3huEf+M14z0/5ltlYoSs4EyTcMZgkYux/eo+hrc5KkB3fbhKe
	 Gh1vnenJdmH7ujxsWwayWu95fmVCclJ0Uy/zKkPC67moksfivR6LfiVFvHp6VZhyabIVq
	 35X9ipxznnbmI+Bm/3LO7pxrWQwoh6kPHYQLyAQ/kzf7uNTwFf7ZS1dwWZXBfNoyHTUnC
	 cVzvu6ikaeerxvzeEky46sXur9wRjnBErIRopcpQ/fCCujgt7l5qfUC1qS2hTErmAA86p
	 QS4h3ICvAI3uNIXCX5UkOeaGnx6qr8SfRs5GhOowR7P7iEcVEvVseimhAgA38fROf/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=telaak.dev;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793838215;
	bh=VpiNcPWSsonBiDsD19OutrA9nPr9dOzkLRSlqzQ3Ios=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nia87X8o1bmvoz9PbEUnBMSaIIt2nF3ZxvvsvbRxaolooiePLnzZouLldiJLqoNh0
	 uDOhU5tPZ/uKfda+qKZny+uKw7ytsiCMDfIaKIdlWCGgYm4nUW4m7UFPdj7es4JRdC
	 hdRn7uFOnSQIVF394xpl6B9umKU6/osPJM/fApvmRCnlMExifJ9L3BE9T75LN8NZq6
	 cbM61Sh+WGX/0TsEfs/9iLakSZjqwXh/tN+4CvJ15w0ogfo/JtkaJYO7/7UB+kShHf
	 qzm85VVDIqZX7GBnVvm3bDzHxNPJFJVI/AxvDiLF43WgamK5rkgRQ2zH3WqCHu9XYG
	 AE7UC3dX8WM6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC3A880BBE;
	Thu,  5 Nov 2026 00:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5354631F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5043E80BBE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaVIIoAWmdlH for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 00:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F7C780B86
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=209.85.214.181
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.214.181;
 helo=mail-pl1-f181.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F7C780B86
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:23:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2e987b4a710so607335ad.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 16:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793838210; x=1794443010;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TTxvNV1oxgHtUjuvPIjslS/ChjROMkfE7D6106abuFI=;
 b=p1ZTabzNE4Yr1MRjZe5TmCf0xfaDB9MQc34T8yJynVQ3/ika6xwJHj3MYx1MISnm2S
 Xl/KbegEC+S9WhjlMdjVTP6v9ubD2I5ODWRb3fryLVuAv4pXBYPlJQuYPRfDyfh9DIiv
 4FcrBRhScoNeKZ2E2jpg3caleqZB0TaykL/91fOW7iuVFBMKEQ96dEYhgoKUIiSNp3jN
 BhWiSX7W1XHyO1UcYEHCqcVpA7d4C/qr+rVEZrvrsn4srpMGDoBYYTPSAwnBmK+HwQeU
 oTZzMHWXmkvXNmFpG1gZjEAXUxWiyVEFtYvc5stVx12HQn8ul1Vi7JQ6Exv8buwPeewc
 5WNA==
X-Gm-Message-State: APuU4Z8qZkg8WEwRVIFmJ6AJbZvaRy5RLrEM9RPv9UYqt+5q40fTwdi3
 yia3zRQZKssi+A0kJV4gHwKSOT0U3jx3Qyc/zu61GNhjlh944dH4FAWglF2uIHFY
X-Gm-Gg: AYBFou3riEim3Jzvo2WoRrOuiqV4YT/ViGANG+NMM9iePSC0EH8GFmMhP0kRroy2Na1
 ZNcUDNEyoIX3/6QjOaLuaEpO4k0RKmyjDR84jy0i/oI/uBFu0HV94W8QYVZI5RZsmAYdptsKGFz
 N6flaxOO0o1jnlZ+8Jr0RXlTAxfQWwmzySejw6RCXcGtFLpRlCGOJ9IO3sStKzn/mkd+jB5ZcAT
 qdvDpmzGbnn7rF3fxdAApSVJsKhc54pHx+NRClF8J0x6gQFnorSJ5XcoMLNox78JIMcdRLO3X7X
 3nnp0gH/8opg76WZpNeJ/S3ulviAZri/zy6Ou07j4ColCqgmrdp65hXWSaHalztOT5VzlhGTrQt
 AINREC3YoP5SADDRhSZAxbpakTR6Uu2Gpkk1Lm8fJhEgqF3LsQdN9eW0vxp5aMvRw/UsTP+ATw6
 gjVSCOikFGm6a2BxMcdKGVtdAucvP/lkaf5IcUs0G7MjxOvA57DJioT/wtG9QB9K+lQJdhVF6h+
 max0n7/Hkv3v5JOsM54Z498Lyekw9PkSO8tKZ9z5uy5MJ5tvvm3xcZJ5LX5G3S+gtCyNN4cbkhs
 usGU15PTtqqknEUEhskVoD1g4gaeaaeDdez2KKgQ0fQwoVmil+JxJS3yTG0t2Pel4a8nXKnAYk4
 AyCun/J6hIDntvjelB4dL8rXg4sMFtH1CfwRcs28=
X-Received: by 2002:a17:90b:1dce:b0:3ab:8288:b8ce with SMTP id
 98e67ed59e1d1-3b0afc52c81mr622570a91.24.1793838209521; 
 Wed, 04 Nov 2026 16:23:29 -0800 (PST)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com.
 [74.125.82.41]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b3160634sm1029375a91.6.2026.11.04.16.23.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 16:23:29 -0800 (PST)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-1438d9363fbso154611c88.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 16:23:29 -0800 (PST)
X-Received: by 2002:a05:7022:e88d:b0:144:eb3f:563a with SMTP id
 a92af1059eb24-1b24f4bd92fmr1488243c88.15.1793838208625; Wed, 04 Nov 2026
 16:23:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102224915.69302-1-joseph@telaak.dev>
 <20261102224915.69302-3-joseph@telaak.dev>
 <auusDZ8yOtO-Gebo@windsurf>
In-Reply-To: <auusDZ8yOtO-Gebo@windsurf>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:23:17 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5YYj5KhuX6B9_W+GD1+RBxOmSduPM1UC0EHTdWnHaMzA@mail.gmail.com>
X-Gm-Features: AclHuK9gDM8wIn71JswSMjehXN6vL0oAx4dLGqXhfurvmfaf9bGVCMeNbvCjK-k
Message-ID: <CAPY4CJ5YYj5KhuX6B9_W+GD1+RBxOmSduPM1UC0EHTdWnHaMzA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Thomas,

On Wed, Nov 04, 2026 at 11:09:18PM +0100, Thomas Petazzoni wrote:
> Again, silly questions from someone not familiar with wpewebkit: what
> is "WPE backend" in this context, and how does "WPE backend" map to
> what we have (or don't have) in Buildroot?
>
> In Buildroot as far as I can see, wpewebkit always depends on
> wpebackend-fdo, which depends on libwpe. Does this mean that we are so
> far only using "libwpe" and never "WPE backend"?

We use both: wpebackend-fdo is the WPE backend.

libwpe is only an interface. WebKit is built against libwpe, and at run
time libwpe dlopen()s a backend library that implements it. The
application names the backend with wpe_loader_init(), or libwpe falls
back to libWPEBackend-default.so. The backend has one part in the web
process, where WebKit renders, and one in the application, which
receives the frames. wpebackend-fdo is the freedesktop.org backend: its
two parts talk over a private Wayland protocol, which carries the
rendered buffers. It is the only backend packaged in Buildroot; others
exist outside it (WPEBackend-rdk, vendor backends).

WPE Platform is the alternative to both. The DRM, Wayland and headless
platforms are built into WebKit itself (libWPEPlatform), so no backend
package is needed; other platforms can be added as modules. In 2.50
WebKit still links libwpe, since the libwpe API is still built, but an
application that uses WPE Platform does not go through it.

> But if wayland/wayland-protocols are only for wpebackend-fdo, why
> isn't wpebackend-fdo selecting them, instead of wpewebkit?

Good point, and my commit log is wrong there too. wpebackend-fdo
already selects wayland itself. It does not use wayland-protocols, as
it carries its own protocol files. In 2.50.5, WebKit only looks for
wayland and wayland-protocols for the WPE Platform Wayland platform
(and for its test tools and MiniBrowser, which Buildroot disables).
The selects on BR2_PACKAGE_WPEWEBKIT date back to the original package
in 2019, so they look like leftovers. That is why the Wayland platform
selects them on its own.

If you fix the log when applying, that paragraph could read:

  The Wayland platform selects wayland and wayland-protocols itself:
  WebKit only uses them for this platform. The main wpewebkit symbol
  also selects them today, but nothing needs them there.

Adrian, do you know of anything that still needs these selects? If
not, I can send a separate patch to drop them, and wayland-protocols
from WPEWEBKIT_DEPENDENCIES.

Thanks,
Joseph
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
