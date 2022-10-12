Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB6BC433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5372A605A4;
	Wed, 12 Oct 2022 20:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5372A605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ3a_US_fLDs; Wed, 12 Oct 2022 20:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6366B60592;
	Wed, 12 Oct 2022 20:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6366B60592
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 880D21BF2AA
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60293826FB
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60293826FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ib8kLQS5UU8a for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 20:33:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE45F8176E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE45F8176E
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 20:33:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DC291C0007;
 Wed, 12 Oct 2022 20:33:16 +0000 (UTC)
Date: Wed, 12 Oct 2022 22:33:15 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221012223315.68f43720@windsurf>
In-Reply-To: <20221012175426.32367-1-neal.frager@amd.com>
References: <20221012175426.32367-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665606797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xt8JTD6P0bzxSUuFUU+ft+z8freNk3AmUjnwDWI2BAk=;
 b=ncFIYtHF6krVM6ft/G/Oeh1pX3d1OhhP+hc92Df2hPEwB64ndJN0FvjNjG/GMrqcCacoif
 +jqoN3Pnc545Qv/PHczXDrqQMnPLs3v1p+7AuzvSHkfBKmU8OAXtjZU9J+5NBmabNA/6tx
 vovC6hsnbJPpQnxvujmleY5ZBiU3f5U3gCg06Hbwbx0luRc7MdYOWTF5rOO4T5caCEJApB
 aY8ma3ixfGmSW4vA+E1joW9M75V0QFcNcY/jsQWbA2IdUAgRZslsM/takJkW2qeoXCkcVz
 zQS0vTEALnwKvldt6hWC9PpVsRRdp0muPkCzdAoCvx39LwW6YboyIKhRgGFXeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ncFIYtHF
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>,
 kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 12 Oct 2022 11:54:26 -0600
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds support for zynqmp pmufw.elf files.
> It will allow buildroot to use pmufw.elf binaries directly
> from the Xilinx git repository built by petalinux.
> 
> https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware
> 
> It will solve the problem of the pmufw built by the
> zynqmp-pmufw-builder where soft resets crash.  Details of the issue
> can be found here:
> 
> https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/
> 
> Instead of using a pmufw binary built by the zynqmp-pmufw-builder, this patch
> enables a pmufw binary built by petalinux to solve the issue.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I think the whole commit log is a bit confusing. What this commit
allows is to use a PMU FW as an ELF binary in addition to allowing to
use a PMU FW provided as a raw binary.

And indeed, this will allow using the PMU FW provided by Petalinux in
addition to the ones of zynqmp-pmufw-builder, which is the motivation
for the change.

> +UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
> +UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))

Spaces around = sign.

> +
> +ifeq ($(UBOOT_ZYNQMP_PMUFW_SUFFIX),.elf)
> +UBOOT_ZYNQMP_PMUFW_CONVERT=y

Ditto.

> +endif
> +
>  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> -	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)")
> +	$(if $(UBOOT_ZYNQMP_PMUFW_CONVERT),
> +		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)

You could also write this like this:

	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)

and get rid of UBOOT_ZYNQMP_PMUFW_CONVERT entirely.

I was wondering if the usage of objcopy was correct or whether
$(TARGET_OBJCOPY) would be more correct. But in fact none of them is
perfect I guess: the PMU FW is a Microblaze ELF binary, while
$(TARGET_OBJCOPY) will be an ARM64 objcopy, and plain objcopy will be
the machine native objcopy, very unlikely to be a Microblaze one :-)

So overall, I guess using objcopy is fine here.

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
