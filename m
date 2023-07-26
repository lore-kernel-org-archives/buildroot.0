Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2826BC0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE760612B8;
	Wed, 26 Jul 2023 21:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE760612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_cfc6Jd2_rh; Wed, 26 Jul 2023 21:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACEB612BD;
	Wed, 26 Jul 2023 21:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DACEB612BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDAB1BF980
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA18240A59
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA18240A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvJDMdpdFcpx for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:41:36 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66C0840609
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C0840609
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89e8:4a89:fcd4:1b18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0BFD25FF9D;
 Wed, 26 Jul 2023 23:41:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jul 2023 23:41:26 +0200
Date: Wed, 26 Jul 2023 23:41:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230726214126.GC3544423@scaer>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
 <20230726180433.7561-2-kilian.zinnecker@mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726180433.7561-2-kilian.zinnecker@mail.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690407693;
 bh=Kb88qdWd1hk+RS4JrPh/QYgb8KvTh/g4xs+6dZ/dbb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGZxPmfYiszXWr/Z5XXSmDjXOPVjC8NvxQPTeL8ZsE/E72l85dfDPZBT5aQn22rgg
 Oo2UanmpnZxSvKKRmymRBZ7MnMTZqRBe2vb8OhAmT3cmvVx4P4q0hmUQ5TSJxzYEDF
 NYDq1gPDgK3tMO8YcsRMtpQfDnI6KZIwN46kxkXhVmYGikMk9MCIVL0HURJGp/AbC0
 pZyIvH6cvG4964DeqplJ1OC4OiJweeh6l+49v7WX5egzJoaF8WiDzhMf/DGflYWBId
 QmvcEPaqNU45RbA4ghDGeoy2SIDMyhScgWrsRIj/pXVVAWzGnl09GCTvIxDXt78C9U
 CwUJ6h0U7/Qfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cGZxPmfY
Subject: Re: [Buildroot] [PATCH v8 1/3] package/rockchip-rkbin: new package
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Killian, All,

On 2023-07-26 20:04 +0200, Kilian Zinnecker via buildroot spake thusly:
> This patch adds a package for the Rockchip ATF binary blobs. These
> binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
> RK3588). One can config a custom version and manually define which
> blobs (for bl31, tpl and optee) to use from the repository.

So, there was no rationale about why we sould need a custom version [0],
and the defconfig you provided was actually using the same version as
the predefined one, so we did not have any usage for it in-tree.

[0] yes, I read your reply about the question from Thomas, but
discussing with him we conluded that we indeed did not want to have a
custom version for now. So I dropped it.

If and when the need arises, then it will be time to add it back; see
below.

> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
[--SNIP--]
> diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
> new file mode 100644
> index 0000000000..85c30c3745
> --- /dev/null
> +++ b/package/rockchip-rkbin/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_ROCKCHIP_RKBIN
> +	bool "rockchip-rkbin"
> +	depends on BR2_arm || BR2_aarch64
> +	help
> +	  This package provides Rockchip SoC binary blobs for U-Boot.
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +	bool "Use a custom version"
> +	help
> +	  This option allows to use a specific version.
> +if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
> +	string "Rockchip rkbin version"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION

So, BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE is guarded twice:
once by the if-block, and once be a "depends on". That's sure a strong
guard! ;-)

Nonethless, I've dropped it.

[--SNIP--]
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> +	string "Rockchip rkbin tpl file path"
> +	help
> +	  Full path to the tpl file inside the rkbin repository. The

I've driopped the "Full" qualifier, because that is not a full path, as
it is relative to the top of the rockchip-rkbin directory.

Ditto for the other help texts.

[--SNIP--]
> diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
> new file mode 100644
> index 0000000000..cb71226556
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br1.tar.gz

I've added a hash for the license file. Please check with:

    $ make legal-info
or:
    $ make rockchip-rkbin-legal-info

> diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
> new file mode 100644
> index 0000000000..74787585e8
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# rockchip-rkbin
> +#
> +################################################################################
> +
> +ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
> +ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> +ROCKCHIP_RKBIN_SITE_METHOD = git
> +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> +ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE

Since the license file was only recently added, it should not be defined
except for the known version.

Furthermore, I think hadling the custom version, if we re-introduce it
later, should be done with:

Config.in:

    config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
        bool "Use a custom version"
        help
          Some binaries for older hipsets mey get pruned from the
          latest revisions of the repository. Say 'y' here if your
          SoC uses such older binaries.

    config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
        string "Custom version"
        depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION

rocjchip-rkbin.mk:

    ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),)
    ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
    ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE
    else
    ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE))
    ifeq ($(ROCKCHIP_RKBIN_VERSION),)
    $(error blabla check config blabla)
    endif
    BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_RKBIN_SOURCE)
    endif

> +ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
> +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> +
> +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME),"")
> +ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
> +endif

No need to test before setting the variable.

> +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME),"")
> +ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
> +endif
> +
> +ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME),"")
> +ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
> +endif
> +
> +define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
> +	$(if $(ROCKCHIP_RKBIN_BL31_FILENAME), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_BL31_FILENAME##*/})
> +	$(if $(ROCKCHIP_RKBIN_TPL_FILENAME), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TPL_FILENAME##*/})
> +	$(if $(ROCKCHIP_RKBIN_TEE_FILENAME), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TEE_FILENAME##*/})

I've simplified this with a $(foreach...)

Applied to master with these changes, thanks.

Regards,
Yann E. MORIN.

> +endef
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
> +$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
> +endif
> +ifeq ($(BR_BUILDING),y)
> +BR_NO_CHECK_HASH_FOR += rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
> +endif
> +endif
> +
> +$(eval $(generic-package))
> -- 
> 2.34.1
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
