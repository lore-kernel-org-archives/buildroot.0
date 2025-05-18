Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1DC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6549540562;
	Sun, 18 May 2025 12:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FznFMpuBmrNL; Sun, 18 May 2025 12:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBB0402DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBB0402DD;
	Sun, 18 May 2025 12:15:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A14C1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1086D40146
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GaFu-souDxW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 787CF40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787CF40142
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 787CF40142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:14:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03E1D432FA;
 Sun, 18 May 2025 12:14:52 +0000 (UTC)
Date: Sun, 18 May 2025 14:14:52 +0200
To: Tom Wambold <tom5760@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250518141452.4f6ea693@windsurf>
In-Reply-To: <20250331153438.4103-1-tom5760@gmail.com>
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevveduieevjeevhfekheetleffhfegvefffeefgeehueeuhfejgeffhffgvdehnecuffhomhgrihhnpehgohdruggvvhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhomhehjeeitdesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohept
 ghhrhhishhtihgrnhesrghpvghrthhurhgvrdhushdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747570493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=os5dOjAe1L3aGA5DO9+xkSGVo94pVTu7Ss8y+8y3q9I=;
 b=b6o1cPhoL/6+slwU9H/uKu5uLgI2TGnnXDftNrEZc7nnpzbXrNRYSdc5XSSRVEYOyLnza6
 MewcxT8FZ0MqHdlPxgT1xgNg5eQa7694TNlPegsu4tFF7YRaamwxNyVI5WkyXXGvTBVpXd
 L/OKCeGExzjmEtNG9wxdvQimlIIEm11sJY7RAvzRrSJ8u0tmh/6qREiRBA8ijewrSJzD/1
 6cE/hOrP5wOIkBVWVZzsjDpJsBcw5tim56Ipw08WiMXeRnK7+/d4Q/3KtdqQsI+Nflb3QH
 IYQAyUI37M/GvsaxuYP6rxDO/HM1rQ3VXwifgicq8LOd1xzJDvQai8/f5paXnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b6o1cPho
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
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

Hello Tom,

Thanks for your patch! I must admit for this change I really would like
to have the feedback from Christian. Christian, could you review and
provide your feedback? This patch allows to use Go packages on ARM64
hosts, where the go-bootstrap1 -> go-boostrap2 -> go-bootstrap3 ->
go-src solution isn't available as go-bootstrap1 is only supported on
i386, x86-64 and arm (32-bit).

Tom: I however have a comment below.

On Mon, 31 Mar 2025 11:34:37 -0400
Tom Wambold <tom5760@gmail.com> wrote:

> The BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS configuration symbol is
> used to determine if we can build Go packages for the target
> architecture.  Previously, this depended *only* on the
> BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS symbol, which is true
> only if the host system can bootstrap the Go compiler.
> 
> The go-bin package makes it unnecessary to bootstrap the Go compiler.
> Also, some host architectures (i.e. arm64/aarch64) don't support
> bootstrapping the compiler anyway.
> 
> Add a new symbol BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS to let
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS depend on either being
> able to bootstrap the compiler *OR* using the go-bin package.  This
> fixes being able to use the Go compiler to build target packages on an
> arm64/aarch64 host system.
> 
> Signed-off-by: Tom Wambold <tom5760@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Added missing Signed-off-by
> ---
>  package/go/Config.in.host        | 2 +-
>  package/go/go-bin/Config.in.host | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7e354b3298..f9b27cc4d8 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,7 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
>  	# See https://go.dev/doc/install/source#environment
>  	# See src/go/build/syslist.go for the list of supported architectures
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
> diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
> index 6312c1b950..5fe1686fef 100644
> --- a/package/go/go-bin/Config.in.host
> +++ b/package/go/go-bin/Config.in.host
> @@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
>  	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
> +
> +config BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""

I think you don't need the new
BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS, which is actually
misleading as this option doesn't represent which target architecture
are represented.

And in fact if you look at BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
it's defined like this:

config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
        bool
        default y
        depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
        # See https://go.dev/doc/install/source#environment
        # See src/go/build/syslist.go for the list of supported architectures
        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
                || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
                || BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
        depends on !BR2_ARM_CPU_ARMV4
        # MIPS R6 support in Go has not yet been developed.
        depends on !BR2_MIPS_CPU_MIPS64R6
        # Go doesn't support Risc-v 32-bit.
        depends on !BR2_RISCV_32
        # Go requires the following Risc-v General (G) features:
        depends on !BR2_riscv || (BR2_RISCV_ISA_RVI && \
                BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA && \
                BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD)

The "depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS"
allows to verify that we are on a host where bootstraping is possible.
And then the remaining dependencies are about making sure the target
architecture is supported.

So I think I would rather do:

config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
        bool
        default y
        depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
        # See https://go.dev/doc/install/source#environment
        # See src/go/build/syslist.go for the list of supported architectures
        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
                || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
                || BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
        depends on !BR2_ARM_CPU_ARMV4
        # MIPS R6 support in Go has not yet been developed.
        depends on !BR2_MIPS_CPU_MIPS64R6
        # Go doesn't support Risc-v 32-bit.
        depends on !BR2_RISCV_32
        # Go requires the following Risc-v General (G) features:
        depends on !BR2_riscv || (BR2_RISCV_ISA_RVI && \
                BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA && \
                BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD)

This basically extends the thing to say: "In order to build Go packages
for the target, we need:

1. A compiler that runs on our host: either bootstrapped, or pre-compiled (go-bin)

2. A target architecture that's supported
"

Tom, Christian, what do you think?

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
