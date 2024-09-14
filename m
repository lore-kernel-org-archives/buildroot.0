Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4727C021A5
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E68081D68;
	Sat, 14 Sep 2024 16:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32Pd4SRdLhW7; Sat, 14 Sep 2024 16:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C81B81EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C81B81EC8;
	Sat, 14 Sep 2024 16:28:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE6ED1BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6D9408DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3K-Nf_HAqHok for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54029408DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54029408DD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54029408DD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:28:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55E4D78035B;
 Sat, 14 Sep 2024 18:27:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 18:27:55 +0200
Date: Sat, 14 Sep 2024 18:27:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <ZuW5i2Hudvb0rsK-@landeda>
References: <20240610154028.792440-1-foss@athaariq.my.id>
 <20240610154028.792440-2-foss@athaariq.my.id>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610154028.792440-2-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726331281;
 bh=nk9EICi7sPBMjmCKXBLsM2JbrrSlz7xYgrIFRRuUibs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1Jcyi6O/qMcFRaZuvfm0pSub6sEi5HwWXjU/BBBFq7XQ0R+Ot0bDBnBb1jcncHd9
 yPNJjG7rmIaL7cIevj6GVHFqsL2FLG5d8OtCWDW54iy5LSak/t7iGjEHvoLhm69EI8
 8r9xXObNvq+RAPJBXxl5p0eeX4cxp/5ponOPuA6v1QCXlzKHAR2Nm32XCIJ7e4eGoC
 QgEA/xpbuozadbUjh2M3BpnGp0P6Ztg6Z92Ql6uDuQ3xcbG8pXgjKerkjulCSwUayx
 20+wnebXLHOurZY7HqWEwuC9SlhgUODFwY9CNMr+Vwk3KxRccsmYAwS4hsWIUyrEjy
 ubHMTz5b/E5kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M1Jcyi6O
Subject: Re: [Buildroot] [PATCH 2/3] package/go: move source-specific to
 go-src
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
Cc: Thomas Perale <thomas.perale@mind.be>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Athaariq, All,

On 2024-06-10 22:40 +0700, Athaariq Ardhiansyah spake thusly:
> Some of package/go/go.mk includes source compilation specific
> requirements, which are not effective for prebuilt Go compiler option.
> Therefore, I moved some of source-specific conditionals and variables to
> the host-go-src before adding host-go-bin support.

In fact, a lot of those variables are going to be needed for both cases,
like GO_GOARCH, GO_GOARM, et al, so we do want to keep a songle place
where they aredefined, even if some of them are only used once in the
go-src case.

Regards,
Yann E. MORIN.

> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> ---
>  package/go/go-src/go-src.mk | 68 +++++++++++++++++++++++++++++++++++
>  package/go/go.mk            | 71 -------------------------------------
>  2 files changed, 68 insertions(+), 71 deletions(-)
> 
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index 1e061e20bc..a0c903282f 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -16,6 +16,67 @@ HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
>  
>  ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
>  
> +ifeq ($(BR2_arm),y)
> +GO_GOARCH = arm
> +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +GO_GOARM = 5
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +GO_GOARM = 6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +GO_GOARM = 7
> +else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +# Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
> +# but can still benefit from armv7 optimisations
> +GO_GOARM = 7
> +endif
> +else ifeq ($(BR2_aarch64),y)
> +GO_GOARCH = arm64
> +else ifeq ($(BR2_i386),y)
> +GO_GOARCH = 386
> +# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
> +ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
> +GO_GO386 = softfloat
> +endif
> +else ifeq ($(BR2_x86_64),y)
> +GO_GOARCH = amd64
> +else ifeq ($(BR2_powerpc64),y)
> +GO_GOARCH = ppc64
> +else ifeq ($(BR2_powerpc64le),y)
> +GO_GOARCH = ppc64le
> +else ifeq ($(BR2_mips64),y)
> +GO_GOARCH = mips64
> +else ifeq ($(BR2_mips64el),y)
> +GO_GOARCH = mips64le
> +else ifeq ($(BR2_riscv),y)
> +GO_GOARCH = riscv64
> +else ifeq ($(BR2_s390x),y)
> +GO_GOARCH = s390x
> +endif
> +
> +# For the convienience of target packages.
> +HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
> +HOST_GO_TARGET_ENV = \
> +	$(HOST_GO_COMMON_ENV) \
> +	GOOS="linux" \
> +	GOARCH=$(GO_GOARCH) \
> +	CC="$(TARGET_CC)" \
> +	CXX="$(TARGET_CXX)" \
> +	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> +	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
> +	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> +
> +# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
> +# set, build in cgo support for any go programs that may need it.  Note that
> +# any target package needing cgo support must include
> +# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +HOST_GO_DEPENDENCIES += toolchain
> +HOST_GO_CGO_ENABLED = 1
> +else
> +HOST_GO_CGO_ENABLED = 0
> +endif
> +
>  HOST_GO_SRC_CROSS_ENV = \
>  	CC_FOR_TARGET="$(TARGET_CC)" \
>  	CXX_FOR_TARGET="$(TARGET_CXX)" \
> @@ -25,6 +86,11 @@ HOST_GO_SRC_CROSS_ENV = \
>  	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>  	GO_ASSUME_CROSSCOMPILING=1
>  
> +else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +# host-go can still be used to build packages for the host. No need to set all
> +# the arch stuff since we will not be cross-compiling.
> +HOST_GO_CGO_ENABLED = 1
> +
>  endif
>  
>  # The go build system is not compatible with ccache, so use
> @@ -52,3 +118,5 @@ define HOST_GO_SRC_INSTALL_CMDS
>  endef
>  
>  $(eval $(host-generic-package))
> +
> +include $(sort $(wildcard package/go/go-bootstrap-*/*.mk))
> diff --git a/package/go/go.mk b/package/go/go.mk
> index dfcb633aa7..489d749d46 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -26,75 +26,6 @@ HOST_GO_COMMON_ENV = \
>  	GOBIN= \
>  	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
>  
> -ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> -
> -ifeq ($(BR2_arm),y)
> -GO_GOARCH = arm
> -ifeq ($(BR2_ARM_CPU_ARMV5),y)
> -GO_GOARM = 5
> -else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> -GO_GOARM = 6
> -else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> -GO_GOARM = 7
> -else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> -# Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
> -# but can still benefit from armv7 optimisations
> -GO_GOARM = 7
> -endif
> -else ifeq ($(BR2_aarch64),y)
> -GO_GOARCH = arm64
> -else ifeq ($(BR2_i386),y)
> -GO_GOARCH = 386
> -# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
> -ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
> -GO_GO386 = softfloat
> -endif
> -else ifeq ($(BR2_x86_64),y)
> -GO_GOARCH = amd64
> -else ifeq ($(BR2_powerpc64),y)
> -GO_GOARCH = ppc64
> -else ifeq ($(BR2_powerpc64le),y)
> -GO_GOARCH = ppc64le
> -else ifeq ($(BR2_mips64),y)
> -GO_GOARCH = mips64
> -else ifeq ($(BR2_mips64el),y)
> -GO_GOARCH = mips64le
> -else ifeq ($(BR2_riscv),y)
> -GO_GOARCH = riscv64
> -else ifeq ($(BR2_s390x),y)
> -GO_GOARCH = s390x
> -endif
> -
> -# For the convienience of target packages.
> -HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
> -HOST_GO_TARGET_ENV = \
> -	$(HOST_GO_COMMON_ENV) \
> -	GOOS="linux" \
> -	GOARCH=$(GO_GOARCH) \
> -	CC="$(TARGET_CC)" \
> -	CXX="$(TARGET_CXX)" \
> -	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> -	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> -	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
> -	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> -
> -# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
> -# set, build in cgo support for any go programs that may need it.  Note that
> -# any target package needing cgo support must include
> -# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -HOST_GO_DEPENDENCIES += toolchain
> -HOST_GO_CGO_ENABLED = 1
> -else
> -HOST_GO_CGO_ENABLED = 0
> -endif
> -
> -else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -# host-go can still be used to build packages for the host. No need to set all
> -# the arch stuff since we will not be cross-compiling.
> -HOST_GO_CGO_ENABLED = 1
> -endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -
>  # For the convenience of host golang packages
>  HOST_GO_HOST_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
> @@ -130,5 +61,3 @@ define GO_BINARIES_INSTALL
>  endef
>  
>  $(eval $(host-virtual-package))
> -
> -include $(sort $(wildcard package/go/*/*.mk))
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
