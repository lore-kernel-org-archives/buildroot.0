Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C4C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7322F8146C;
	Sat, 22 Jul 2023 21:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7322F8146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV3MTWkGbHDX; Sat, 22 Jul 2023 21:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6162381516;
	Sat, 22 Jul 2023 21:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6162381516
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C37891BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F38405F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F38405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vblKK1PRU7xt for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:13:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE81A40500
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE81A40500
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EF411C0004;
 Sat, 22 Jul 2023 21:13:37 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:13:36 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230722231336.760d74ea@windsurf>
In-Reply-To: <20230711220849.1702358-4-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-4-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6qmC5SBivg86Itw9Ku3FdC30uVrSHDZLCc+DPFOaOw=;
 b=V41UXWXnIR3WA2gP9u9D4TtsmEFo2JunC85O6WMb3K4G7OeS1v7qSom43p8YfgeS61Q1eD
 oWch4PTCyKodT3ouVqFCdbbS5QuTf5X9Qsnfy4P6AdirfnKEMVVWhGhIxROkIJyX2SEfsA
 U37lXyY+K3pJQVuosbHdNruk2VnZm+GkdlfsLj8FCjkl5s86CbJu/fz+90oZuiYElg0us6
 GdpTNxwdPkVFEJXtoNDsIpXIqX6ze9FzAuGKJSM0M4P/AzJ7hVaj4U0qHvoM8WwOg/ItKf
 AizicU9ipb4dIc5R+zdPHzxNznWF9h7A0e+AgaISJ0AgIM52MQBCOU1rTukJ/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V41UXWXn
Subject: Re: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue, 11 Jul 2023 15:08:49 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
> compiled Go version to use to build from source.
> 
> https://golang.org/doc/install/source#bootstrapFromSource
> 
> The process for "bootstrapping" the Go compiler in Buildroot is:
> 
> 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
> 2. Build go-bootstrap-stage1 (which is Go 1.4.x and written in C)
> 3. Build go-bootstrap-stage2 (which is Go 1.19.x and written in Go)
> 3. Build go 1.20 (written in Go) using go-bootstrap-stage2.
> 
> go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstrap compiler
> is compatible with x86, x86_64, and arm (32 bit) only.
> 
> This patch adds a fallback to require a host Go compiler to build host-go when
> BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS is not set.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

I understand the need, but I'd like to explore other options, namely
using pre-compiled Go compilers, which we would also like to support in
order to have the ability to run "make legal-info", or build Go
packages without necessarily having to build a Go compiler from
scratch. Like what we do for Rust, where you can chose to either use a
pre-built Rust compiler, or build your own with Buildroot.

For Go, I think we could imagine two options:

(a) You use a pre-built Go compiler as a replacement for package/go.
    This would work for architectures/configurations for which
    pre-built Go compilers are available. We would then move package/go
    as a virtual package, with package/go-src being the provider that
    builds the Go compiler from source, and package/go-bin being the
    provider that downloads/installs a pre-built Go compiler.

(b) You use a pre-built Go compiler as a replacement for
    package/go-bootstrap-stage2, i.e you still build the final Go
    compiler from source, but all the bootstrapping is skipped by using
    a pre-built Go compiler for the host. Would this option also
    resolve your use-case of building on ARM64? In other words, is
    there a Go compiler available pre-built for ARM64?

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
