Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D09E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 07:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0704580ABC;
	Sat,  4 Jan 2025 07:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0m8iezTDWGS; Sat,  4 Jan 2025 07:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A45BE804BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A45BE804BA;
	Sat,  4 Jan 2025 07:22:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0905BF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB70960BC9
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0Ngf82fbGrw for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 07:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B60360BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B60360BC8
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B60360BC8
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:22:16 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 0D816240D48;
 Sat,  4 Jan 2025 08:22:15 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id DCD912603DD;
 Sat,  4 Jan 2025 08:22:14 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 5B4A7240A5B;
 Sat,  4 Jan 2025 08:22:12 +0100 (CET)
To: Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Chris Packham <judge.packham@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sat, 04 Jan 2025 08:21:12 +0100
Message-ID: <4622170.LvFx2qVVIh@kilian-laptop>
In-Reply-To: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4462
X-purgate-ID: 154282::1735975334-067782C4-B234DD4A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735975334;
 bh=2JxoKv+zAR1+bP3kePI+921K1/yCi3SXTESCv885prY=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=01uRi8R08SUyT8LicYNXGuGG0XsBOhHzeK3EYztaOQNBjiVpVS85NSWIKqZYIP6pi
 /GSORjx/kTsP+tYIxQuFS9GO8Y+F9CsD0GEwYjf3WiEivpsQjpbb1wFeuRvePnC4Ft
 YJxI1GyY3Oz6RpiOd2wm4kd01FLhBKgCdNJ0DR6NLnzV2WM2ClYkNnZ9itNMk7ebT9
 Gh2iSzSGxFFEAwDwyQ/ZqlOnpC56fL0Wm2VnIv+liHFmwR0NxGWe9U9SLm+DThDj05
 8SWj4NoE2URdThhpzsMRRbqScLVVmqWJLZF4UoiNOcu4dEFIhH6NGyHDFQAUyqdqSK
 EINocJvSF5NPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=01uRi8R0
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Friday, 3 January 2025 15:33:01 CET Edgar Bonet wrote:
> Since Linux 6.12, the Buildroot option BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
> does not work as expected on arm, arm64, mips and ricv.[1] These are the
> architectures that store the in-tree DTS files in vendor-specific
> subdirectories of arch/$ARCH/boot/dts/.
> 
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was introduced in Buildroot 2012.08
> (commit 69fc497df0ae "Rework support for the device tree"). At the time,
> the kernel kept all in-tree DTS files directly in arch/$ARCH/boot/dts/,
> and this is where Buildroot drops the user's custom DTS. Vendor-specific
> subdirectories appeared in Linux v3.19 for the arm64 architecture, and
> this scheme was later adopted by mips, riscv and arm.
> 
> For these architectures, Linux 6.12 (commit e7e2941300d2, "kbuild: split
> device tree build rules into scripts/Makefile.dtbs") made the DTB build
> infrastructure incompatible with the way
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is implemented. This infrastructure now
> expects all DTS files to be in vendor-specific subdirectories on the
> architectures that use this scheme. Fulfilling this kernel expectation
> would require a new configuration parameter for the name of the
> appropriate vendor subdirectory. It would also require changing the
> relative paths to included .dtsi files.
> 
> Let's add instead a rule to the top dts/Makefile for each DTB we want to
> build. This avoids breaking user's out-of-tree configurations.
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> 
> Reported-by: Chris Packham <judge.packham@gmail.com>
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
> Changes v2 -> v3:
>   - note, in the comment and in the log message, that this issue only
>     affects some architectures
>   - expand the log message with some historical context
> These changes were suggested by Romain Naour.
> 
> Changes v1 -> v2:
>   - define a hook for LINUX_POST_PATCH_HOOKS and LINUX_POST_RSYNC_HOOKS
>     instead of modifying LINUX_BUILD_CMDS
>   - use $(patsubst %.dts,%.dtb,$(dts)) instead of $(dts:%.dts=%.dtb)
> both changes suggested by Arnout Vandecappelle.
> 
> This was build-tested with an Acqua defconfig,
> in the same manner as v2:
> 
>     # Test with an old kernel: v6.6.30
>     make acmesystems_acqua_a5_512mb_defconfig
>     make linux
> 
>     # Test with a new kernel: v6.12.8
>     make linux-dirclean
>     git am bump_Acqua_kernel_to_v6.12.8.patch
>     make acmesystems_acqua_a5_512mb_defconfig
>     make linux
> 
>     # Test the OVERRIDE_SRCDIR case.
>     make linux-dirclean
>     git -C $HOME/src/linux checkout v6.12.8
>     echo "LINUX_OVERRIDE_SRCDIR = $HOME/src/linux" > local.mk
>     make acmesystems_acqua_a5_512mb_defconfig
>     make linux
> ---
>  linux/linux.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 12699b8ee4..e6e8a3c3bc 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -327,6 +327,17 @@ define LINUX_TRY_PATCH_TIMECONST
>  endef
>  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
> 
> +# On some architectures, kernels 6.12+ won't compile the custom DTS
> +# files we drop into arch/$ARCH/boot/dts unless we add specific rules to
> +# that directory's Makefile.
> +define LINUX_ADD_DTB_MAKE_RULES
> +	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
> +		echo "dtb-y += $(patsubst %.dts,%.dtb,$(notdir $(dts)))" 
>>
> $(LINUX_ARCH_PATH)/boot/dts/Makefile +	)
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_ADD_DTB_MAKE_RULES
> +LINUX_POST_RSYNC_HOOKS += LINUX_ADD_DTB_MAKE_RULES
> +
>  LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call
> qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH)) ifneq
> ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
>  LINUX_DEPENDENCIES += host-imagemagick

Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

I applied the patch and used it in conjunction with a work in progress version 
of a board support, which had an out-of-tree dts (see discussion and patch 
below). The build worked, which indicates to me, that Edgar's patch 
successfully handled the out-of-tree dts problem introduced by the kernel 
recently.

Discussion:
https://lists.buildroot.org/pipermail/buildroot/2025-January/769859.html

Patch series:
https://lists.buildroot.org/pipermail/buildroot/2025-January/769872.html



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
