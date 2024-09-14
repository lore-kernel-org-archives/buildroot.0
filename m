Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69B7C021A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5BC81F1F;
	Sat, 14 Sep 2024 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KogjO1pfoul6; Sat, 14 Sep 2024 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 529C981EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529C981EC8;
	Sat, 14 Sep 2024 16:31:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2E11BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8953181EC8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fnc9iKFdgwTV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5275C81D68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5275C81D68
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5275C81D68
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:31:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5BA1F78034D;
 Sat, 14 Sep 2024 18:31:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 18:31:03 +0200
Date: Sat, 14 Sep 2024 18:31:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <ZuW6R60yT66lkK4I@landeda>
References: <20240610154028.792440-1-foss@athaariq.my.id>
 <20240610154028.792440-3-foss@athaariq.my.id>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610154028.792440-3-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726331470;
 bh=OqK+L67KZxl8+yupduD/XlAURk7yYfAKevOxaYDOhQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JtPXhIGISBtf8ZUZXz8jcIXxOVBWzBaGqDX8oRytDWGuKlvqZZqv0t2+8btoFZKDz
 dM/DV66jLufcgz3XP+CA817oO4VBozDE514vBJoseB2WbFHWwWN3kUMILR2TqggwyF
 zNodUvnSF3tmaKgtHW4T+592WpLS1TAmvsfviHUFtBlQ9D83Xb5HYZVeoxuFmg8xpq
 Sdmvo4llgquM5L9s5+4Pa8Knjfmci/zIlqqubkV5U9FsUZwG7+04/ls7OLxFSj1o4G
 FifUwCbFrtrn2myVtF/I1JP7kp6mTzD5RYPw6EDtYMFWXrR0TYZl5HVTl5bS3b7J6n
 8r+ytj3QPF0Vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JtPXhIGI
Subject: Re: [Buildroot] [PATCH 3/3] package/go: add prebuilt Go compiler
 option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Athaariq, All,

On 2024-06-10 22:40 +0700, Athaariq Ardhiansyah spake thusly:
> According to the TO-DO list, the prebuilt Go compiler is considered as
> important to be implemented. So, I'm trying to help you to add the
> prebuilt Go compiler support into Buildroot.
> 
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

Thank you for your proposal. However, Thomas Perale had been working on
his series and just respun a new iterartion of their patch, that is
musch closer to a solution we were expecting.

Thank you for the effort nonetheless, it is still much appreciated!
Maybe there are a few other, maybe-simpler topics you can have a look
into.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/go/Config.in.host     | 22 +++++++++++++++-
>  package/go/go-bin/go-bin.hash |  8 ++++++
>  package/go/go-bin/go-bin.mk   | 47 +++++++++++++++++++++++++++++++++++
>  3 files changed, 76 insertions(+), 1 deletion(-)
>  create mode 100644 package/go/go-bin/go-bin.hash
>  create mode 100644 package/go/go-bin/go-bin.mk
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 32483871e7..ffd2594a80 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -32,6 +32,16 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	default y
>  	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
>  
> +# Only required for prebuilt Go compiler
> +config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	bool
> +	default y if (BR2_HOSTARCH = "arm" && BR2_TOOLCHAIN_SUPPORTS_PIE)
> +	default y if BR2_HOSTARCH = "aarch64"
> +	default y if BR2_HOSTARCH = "powerpc64le"
> +	default y if BR2_HOSTARCH = "s390x"
> +	default y if BR2_HOSTARCH = "x86"
> +	default y if BR2_HOSTARCH = "x86_64"
> +
>  # Go packages should select BR2_PACKAGE_HOST_GO
>  config BR2_PACKAGE_HOST_GO
>  	bool "host go"
> @@ -52,12 +62,22 @@ config BR2_PACKAGE_HOST_GO_SRC
>  	help
>  	  This package will build the go compiler for the host.
>  
> +config BR2_PACKAGE_HOST_GO_BIN
> +	bool "host go (prebuilt)"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	help
> +	  This package will download the go compiler binary for
> +	  the host without build process.
> +
> +comment "host-go-bin doesn't support $(BR2_HOSTARCH) host architecture."
> +	depends on !BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +
>  endchoice
>  
>  config BR2_PACKAGE_PROVIDES_HOST_GO
>  	string
> -	# Default to host-go-src
>  	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
> +	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
>  
>  endif
>  
> diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
> new file mode 100644
> index 0000000000..52b6c6355f
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.hash
> @@ -0,0 +1,8 @@
> +# From https://go.dev/dl
> +sha256  fefba30bb0d3dd1909823ee38c9f1930c3dc5337a2ac4701c2277a329a386b57  go1.22.3.linux-386.tar.gz
> +sha256  8920ea521bad8f6b7bc377b4824982e011c19af27df88a815e3586ea895f1b36  go1.22.3.linux-amd64.tar.gz
> +sha256  6c33e52a5b26e7aa021b94475587fce80043a727a54ceb0eee2f9fc160646434  go1.22.3.linux-arm64.tar.gz
> +sha256  f2bacad20cd2b96f23a86d4826525d42b229fd431cc6d0dec61ff3bc448ef46e  go1.22.3.linux-armv6l.tar.gz
> +sha256  04b7b05283de30dd2da20bf3114b2e22cc727938aed3148babaf35cc951051ac  go1.22.3.linux-ppc64le.tar.gz
> +sha256  2aba796417a69be5f3ed489076bac79c1c02b36e29422712f9f3bf51da9cf2d4  go1.22.3.linux-s390x.tar.gz
> +sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
> new file mode 100644
> index 0000000000..cb320f44fa
> --- /dev/null
> +++ b/package/go/go-bin/go-bin.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# go-bin
> +#
> +################################################################################
> +
> +# Translate Buildroot's arch enumeration to Go's arch
> +ifeq ($(BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS), y)
> +
> +ifeq ($(BR2_HOSTARCH), "arm")
> +GO_GOARCH = "armv6l"
> +else ifeq ($(BR2_HOSTARCH), "aarch64")
> +GO_GOARCH = "arm64"
> +else ifeq ($(BR2_HOSTARCH), "powerpc64le")
> +GO_GOARCH = "ppc64le"
> +else ifeq ($(BR2_HOSTARCH), "powerpc64le")
> +GO_GOARCH = "ppc64le"
> +else ifeq ($(BR2_HOSTARCH), "x86")
> +GO_GOARCH = "386"
> +else ifeq ($(BR2_HOSTARCH), "x86_64")
> +GO_GOARCH = "amd64"
> +else
> +GO_GOARCH = $(BR2_HOSTARCH)
> +endif
> +
> +endif # BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +
> +GO_BIN_SITE = https://storage.googleapis.com/golang
> +GO_BIN_SOURCE = go$(GO_VERSION).linux-$(GO_GOARCH).tar.gz
> +
> +GO_BIN_LICENSE = BSD-3-Clause
> +GO_BIN_LICENSE_FILES = LICENSE
> +GO_BIN_CPE_ID_VENDOR = golang
> +
> +HOST_GO_SRC_PROVIDES = host-go
> +
> +ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> +ifeq ($(BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS), y)
> +
> +define HOST_GO_BIN_INSTALL_CMDS
> +	$(GO_BINARIES_INSTALL)
> +endef
> +
> +endif # BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +
> +$(eval $(host-generic-package))
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
