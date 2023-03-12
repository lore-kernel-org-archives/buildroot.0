Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FDC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE6541C06;
	Sun, 12 Mar 2023 22:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE6541C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9v-QwG56T41; Sun, 12 Mar 2023 22:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37EF409AA;
	Sun, 12 Mar 2023 22:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37EF409AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12EE01BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A26FD416B5
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26FD416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I60HuJa1QwHn for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB9764148D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB9764148D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:58:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D646F240004;
 Sun, 12 Mar 2023 21:58:06 +0000 (UTC)
Date: Sun, 12 Mar 2023 22:58:06 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230312225806.0bf4b0fd@windsurf>
In-Reply-To: <20230215073256.186476-1-christian@paral.in>
References: <20230215073256.186476-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678658287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cfORzdKVMxrT6F/DGAJZWO/kj1mjhcX0FHAJ8/nMqw=;
 b=UyNO3c/1pyWArW8MfcpyUgqQT30SuycYgmxYkjmYOz/w1CQUhEfaOmMVdS0eoBa4fmAKgp
 DJuzAn+aMiE4MVRRKNF29PDwNrmeqhwCyWZzCgGSEM5pAjpwk5RG+Gts4dSf/vfmvyL+Vd
 GKvQ663Mz7O+UH9PkJluehM0L5ZTtyissPXWD0YkXlNUjg5rKkEhNYYTXxZIHdmc8RBXkT
 GamMqJbBozthSaVItELTCb6t6pobqVraMwzNsqIKLWuQQQS9bT1i55Wt+S2jfkrPdlJGcF
 J/pYUrQLxJBr2PnwK5rC737YljqJHtluWR08SRdbJx+iEn2Zr08OMH1g8hi+5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UyNO3c/1
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

Thanks for working on this. I think we are not far from a good solution
that can be merged. However, I have a few comments/questions. See below.

On Tue, 14 Feb 2023 23:32:54 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> +# Use last C-based Go compiler: v1.4.x
> +# See https://golang.org/doc/install/source#bootstrapFromSource
> +GO_BOOTSTRAP_STAGE1_VERSION = 1.4-bootstrap-20171003
> +GO_BOOTSTRAP_STAGE1_SITE = https://dl.google.com/go
> +GO_BOOTSTRAP_STAGE1_SOURCE = go$(GO_BOOTSTRAP_STAGE1_VERSION).tar.gz
> +
> +GO_BOOTSTRAP_STAGE1_LICENSE = BSD-3-Clause
> +GO_BOOTSTRAP_STAGE1_LICENSE_FILES = LICENSE
> +
> +# The toolchain is needed for HOSTCC_NOCACHE used to compile the Go compiler.

This doesn't make much sense. Why would the toolchain package be needed
for HOSTCC_NOCCACHE ? We have several packages that use HOSTCC_NOCCACHE
before the toolchain is ready.

The original comment in go-bootstrap.mk was:

# To build programs that need cgo support the toolchain needs to be
# available, so the toolchain is not needed to build host-go-bootstrap
# itself, but needed by other packages that depend on
# host-go-bootstrap.

and this made a bit more sense (even though I'm wondering why it's
host-go-bootstrap that carries this dependency, and not host-go).


> +	# Set all file timestamps to prevent the go compiler from rebuilding any
> +	# built in packages when programs are built.
> +	find $(HOST_GO_BOOTSTRAP_STAGE2_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;

So we have to do this for bootstrap-stage2 but not bootstrap-stage1 ?


> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
> +	# See https://go.dev/doc/install/source#environment
> +	# See src/go/build/syslist.go for the list of supported architectures

This comment looks good, but is unrelated. Separate patch?

>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
>  		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
>  		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
> @@ -28,4 +30,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c38ae0b99c..b0dd002712 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -12,7 +12,7 @@ GO_LICENSE = BSD-3-Clause
>  GO_LICENSE_FILES = LICENSE
>  GO_CPE_ID_VENDOR = golang
>  
> -HOST_GO_DEPENDENCIES = host-go-bootstrap
> +HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
>  HOST_GO_ROOT = $(HOST_DIR)/lib/go
> @@ -121,12 +121,12 @@ HOST_GO_HOST_ENV = \
>  	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
>  	CGO_LDFLAGS="$(HOST_LDFLAGS)"
>  
> -# The go build system is not compatible with ccache, so use
> -# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE.
> +# See https://github.com/golang/go/issues/11685.

Why is this comment being changed, with a typo added?

>  HOST_GO_MAKE_ENV = \
>  	GO111MODULE=off \
>  	GOCACHE=$(HOST_GO_HOST_CACHE) \
> -	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
> +	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
>  	GOROOT_FINAL=$(HOST_GO_ROOT) \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> @@ -154,7 +154,6 @@ define HOST_GO_INSTALL_CMDS
>  	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
>  	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
>  
> -	# There is a known issue which requires the go sources to be installed

Why is this comment being removed?

>  	# https://golang.org/issue/2775
>  	cp -a $(@D)/src $(HOST_GO_ROOT)/

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
