Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18859CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88EC44000B;
	Mon, 16 Oct 2023 10:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88EC44000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsaaH6sQ2PHi; Mon, 16 Oct 2023 10:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B4954154D;
	Mon, 16 Oct 2023 10:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4954154D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF191BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7128481F75
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7128481F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2czwpm3sLj0 for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:11:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA47C81F79
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA47C81F79
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A87240002;
 Mon, 16 Oct 2023 10:11:13 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:11:11 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121111.480b6b4c@booty>
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rscDwWyIDhf+URXolFK5/GYK4OhSWQg5zPXdlREJjA=;
 b=M0vAcrGFF6ap62neAifbGJqj7vdoec4uPzDVh2pSjNspb1MXU6fMTwCRoE5ND3CEXxQ6gL
 RCUsR0e346AsUpJhfVUFaXizJJ1PFD+fWTVCvJ19MPw0BvwUAGcwQBEqgLzwx/TlVVPQEp
 N72L63qqBQm+o58QmugrbNvbGXcS79T7CeaFg0uvdhH6NkuYajFApMKU4Jvu0xaNsGywps
 8WF63s5zbkgyFL0E2wFyHcnLUpTmzEa4hzKL9nktBjA3FV70LGj4+FZyaWIID1qOtCMefq
 t0tjG+KoDgCyLfstt8GJ7sdzrHJ4Q/wyygI1H5hDu0PY64v+UMLh3HE+mB/TEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M0vAcrGF
Subject: Re: [Buildroot] [PATCH v4 01/10] package/binutils-bare-metal: new
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

Hi Neal, Ibai,

On Sun, 24 Sep 2023 16:11:56 +0100
Neal Frager <neal.frager@amd.com> wrote:

> +# if toolchain is for microblazeel-xilinx, apply Xilinx patch set
> +ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")
> +HOST_BINUTILS_BARE_METAL_EXTRA_DOWNLOADS = https://github.com/Xilinx/meta-xilinx/archive/refs/tags/xlnx-rel-v2023.1.tar.gz
> +
> +define HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES
> +  mkdir -p $(@D)/patches
> +  tar -xf $(HOST_BINUTILS_BARE_METAL_DL_DIR)/xlnx-rel-v2023.1.tar.gz \
> +      --strip-components=5 \
> +      -C $(@D)/patches \
> +      meta-xilinx-xlnx-rel-v2023.1/meta-microblaze/recipes-devtools/binutils/binutils
> +endef
> +HOST_BINUTILS_BARE_METAL_POST_EXTRACT_HOOKS += HOST_BINUTILS_BARE_METAL_EXTRACT_PATCHES

I think all the patches needed to build zynqmp firmwares are now in
mainline, right? (which is a great thing!!) If it is the case, then you
should probably remove all this tarball mangling and just add the
relevant patches as regular package/*/*.patch files, both for binutils
and for gcc.

> +
> +define HOST_BINUTILS_BARE_METAL_APPLY_LOCAL_PATCHES
> +	$(APPLY_PATCHES) $(@D) $(@D)/patches *.patch;
> +endef
> +HOST_BINUTILS_BARE_METAL_POST_PATCH_HOOKS += HOST_BINUTILS_BARE_METAL_APPLY_LOCAL_PATCHES
> +endif #ifeq ($(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH),"microblazeel-xilinx")
> +
> +# Don't build documentation. It takes up extra space / build time,
> +# and sometimes needs specific makeinfo versions to work
> +HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
> +HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
> +HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
> +
> +HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
> +	--target=$(BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH)-elf \

As pointed out in v3, this patch series is not bisectable due to the
chicken-egg loop on BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH, which
is added in patch 4 and used in patches 1-3. I don't know how this
could be better handled, thus if the maintainers have no objections I
also won't have any.

Otherwise LGTM.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
