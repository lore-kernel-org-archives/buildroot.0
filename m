Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE637E6FE26
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 13:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E31382139;
	Fri, 22 Sep 2023 13:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E31382139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rf0vRH7b830X; Fri, 22 Sep 2023 13:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B83581EB4;
	Fri, 22 Sep 2023 13:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B83581EB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 444451BF301
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BEA1418B5
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BEA1418B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HTZDy1Une71 for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 13:08:36 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F04417B8
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 13:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F04417B8
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7D125D5402
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:53:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DE751C0007;
 Fri, 22 Sep 2023 12:52:38 +0000 (UTC)
Date: Fri, 22 Sep 2023 14:52:36 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922145236.027dc287@booty>
In-Reply-To: <20230904100443.1613306-1-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695387201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNL4duAMkukdQU5MEabBghXI1TRosrG7M3DyjLxdNK4=;
 b=pqPfoqIdJonD15PSOlzJ9uEzlo9h67pMXyRfzNDg3Lr+HhUqM5F4MfDw9AAQf+UNGFgP7V
 SqEgj7CeZJM5A3X043SmqkfEuzriY49CQvz02eqe7B1LkgBT1TYwV8rVX2be1ojQ31rVRz
 Pz9abukRkaOnA/xiOWGDCD3rkPb0xeCR2Unnkjb6xrBV6GSwuPBlOp01ljYiQQGK/StWHG
 YOTxceMv4rVOmr5wEWyLdoqth+1FSU01c7NxcYBtgdAgQpxaS51q1FEEph617xhTcyR5r8
 Opng8MnbbT3Wisle8OPbHU2PqAKQtijupK9PKvS3LO37ptIDZQoOzHbpwnm3yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pqPfoqId
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal, Ibai,

thank you for your persistence in working on this!

The overall patch set appears pretty clean, except for a few remarks as
you can read in this and the other replies. 

I had a small hiccup while trying to apply your patches using 'git
am' from my inbox:

  error: cannot convert from y to UTF-8

This is probably due to this weird header value:

  Content-Type: text/plain; charset="y"

Probably some dirt in your git config. However the mbox file as
downloaded from patchwork did apply without issues. I don't think you
need to resend the series just for this.

On Mon, 4 Sep 2023 11:04:38 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.
> 
> When configured for the Xilinx microblaze architecture, all of the binutils
> patches that are applied to the Xilinx distributed toolchain will be applied
> in order to generate a toolchain that is equivalent to what Xilinx distributes.
> 
> Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

...

> diff --git a/package/binutils-bare-metal/Config.in.host b/package/binutils-bare-metal/Config.in.host
> new file mode 100644
> index 0000000000..036698d418
> --- /dev/null
> +++ b/package/binutils-bare-metal/Config.in.host
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +	bool "host binutils-bare-metal"
> +	help
> +	  binutils-bare-metal is a host utility for a
> +	  bare-metal toolchain

"a host utility seems a bit of an understatement, I'd rather say "Build
to GNU binutils for a bare-metal toolchain" to clarify this is building
no less than the GNU binutils.

> +
> +if BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION
> +	string
> +	default "2.39"
> +
> +config BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_EXTRA_CONFIG_OPTIONS
> +	string "Additional binutils options"
> +	default ""
> +	help
> +	  Any additional binutils options you may want to include

Do we really want this without a valid use case?

The same question could apply to the _VERSION setting, however I feel
it's reasonable to keep it...

This applies to patches 2 and 3 as well.

> diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
> new file mode 100644
> index 0000000000..fd983abc93
> --- /dev/null
> +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
> @@ -0,0 +1,56 @@
> +################################################################################
> +#
> +# binutils-bare-metal
> +#
> +################################################################################
> +
> +HOST_BINUTILS_BARE_METAL_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_BINUTILS_BARE_METAL_VERSION))
> +ifeq ($(HOST_BINUTILS_BARE_METAL_VERSION),)
> +HOST_BINUTILS_BARE_METAL_VERSION = 2.39
> +endif # BINUTILS_VERSION  
> +
> +HOST_BINUTILS_BARE_METAL_SITE ?= $(BR2_GNU_MIRROR)/binutils
> +HOST_BINUTILS_BARE_METAL_SOURCE ?= binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
> +
> +HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
> +HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
> +HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
> +
> +HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
> +
> +# if toolchain is for microblazeel-xilinx, apply Xilinx patch set
> +ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")

The toolchain-bare-metal is added in patch 4, thus this series as-is is
not bisectable. I don't see any obvious solutions as
toolchain-bare-metal selects binutils-bare-metal so I guess some maintainer
can provide some hints on how to handle this.

The same issue applies to patches 2 and 3.

> +HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS = https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2023.1.tar.gz

This is not a huge download (500 kB compressed, 5.6 MB  uncompressed),
but we use the binutils patches only, which account for 10% of the whole
archive. I wonder whether there is a way to download only a
subdirectory from github.

And looking at the patches themselves, I wonder how many are actually
needed. At a cursory look, some don't really look like production code.
Are those changes being mainlined?

> +define HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES
> +  mkdir -p $(@D)/patches
> +  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz --strip-components=5 -C $(@D)/patches meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutils/binutils

Please split this very long line. e.g.:

  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz \
    --strip-components=5 \
    -C $(@D)/patches
    meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutils/binutils

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
