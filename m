Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F60C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 08:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF5D60E83;
	Thu,  3 Nov 2022 08:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF5D60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPwehSUZUqOw; Thu,  3 Nov 2022 08:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C102607CE;
	Thu,  3 Nov 2022 08:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C102607CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A90651BF381
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 08:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B5F080E48
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 08:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5F080E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igqGKKQf3_Wl for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 08:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6106E80E42
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6106E80E42
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 08:19:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CC8C2CD300
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 08:14:38 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD4611BF20A;
 Thu,  3 Nov 2022 08:14:32 +0000 (UTC)
Date: Thu, 3 Nov 2022 09:14:31 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221103091431.5e57a65b@booty>
In-Reply-To: <20221024142216.31273-2-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221024142216.31273-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667463273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYBzARS90vvxxbxKtwkCtyVodQ0Qs/FV2ll7VfGF3hE=;
 b=HGIfRHtBDVlLkQk2CyN+LdJ2CbCJQIRvAyDXzXM/VKEfSdOygMap8dw7MDXlHPC9mHVvp8
 I7eWRG0cMTua9mOV7QN7Jlx6cZ1CqJkwfj6x40t9yeUUuI1yManutYEq/8laTKOPDYlg81
 b8CVLFxoLh5CM/psgiRHVELpovHdp6RWEEoJgRGLIokWcS8KxguN9PZi5GVJPotQmPWVar
 MfU5xWSP8EZzUyi5bsuNr9Lx7hZCjrN3Kem2+W1TvknD7jdZlb3Uam7ZKdg8i7v9nNDq3F
 ZEUYbKl9Idyu6XMVCAEzv12K3XopMfuEgTHsHAJcBwVqJXZnXSblm7U6hoWpig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HGIfRHtB
Subject: Re: [Buildroot] [PATCH v1 2/3] add board/versal
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
Cc: terry.oneal@amd.com, kris.chaplin@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 24 Oct 2022 08:22:15 -0600
Neal Frager <neal.frager@amd.com> wrote:

> --- /dev/null
> +++ b/board/versal/genimage.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"boot.bin",
> +			"system.dtb",

system.dtb is stored in the FAT partition...

> --- /dev/null
> +++ b/board/versal/post-image.sh
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +
> +# By default U-Boot loads DTB from a file named "system.dtb", so
> +# let's use a symlink with that name that points to the *first*
> +# devicetree listed in the config.
> +
> +FIRST_DT=$(sed -nr \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               ${BR2_CONFIG})
> +
> +[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
> +
> +BOARD_DIR="$(dirname $0)"
> +BOARD_NAME=$4
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
> +	the_ROM_image:
> +	{
> +	image {
> +		{ type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
> +		{ type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
> +		{ core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
> +	}
> +	image {
> +		id = 0x1c000000, name=apu_subsystem 
> +		{ type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }

...and also in boot.bin. What's the reason for this? One copy is for
U-Boot and the other for the kernel?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
