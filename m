Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751D4EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086634168D;
	Tue, 22 Aug 2023 22:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086634168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peSlklePEnWl; Tue, 22 Aug 2023 22:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 158E441684;
	Tue, 22 Aug 2023 22:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 158E441684
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C94301BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 22:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 770BA403A9
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 22:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770BA403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZGY7eihs0vb for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 22:02:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7736A40003
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 22:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7736A40003
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9653EC0004;
 Tue, 22 Aug 2023 22:02:22 +0000 (UTC)
Date: Wed, 23 Aug 2023 00:02:21 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230823000221.50e0eb15@windsurf>
In-Reply-To: <20230327170604.22854-2-neal.frager@amd.com>
References: <20230327170604.22854-1-neal.frager@amd.com>
 <20230327170604.22854-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692741743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzKzc1OcnhGgk+49kSW9Or1v73yrHQj1SqHcDULGx/E=;
 b=g7owO5FUuN6phoJMZyGg71n5vQwOhwZDmOzZoI/HVTHPviYJ3se/CODElbLb26wshtigpl
 f1U4e/lMK/oIT5pSIjjGIovUlAUw31CDB1FlsjJav4OwoP1YJDpErbvzPMrfjBWd0/izgx
 d9NopattsH+SNM+CB1j/DGUTkh4E58+4hWJjagOk7bvLfi+xO/HDH3PdXHzWF8yHNLSME6
 hxmi80RA7FouDDaShtL51w/1Z6vxQ66gydrUOeDNtNrNRJ+zRxUipoFn/Kis8hGxK4XecB
 eLbQl0AmbQd4MdbNpPeJblQcAq1hYo5p7HpBYYACxL1Lhr3gM5frmvQOoBSqjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g7owO5FU
Subject: Re: [Buildroot] [PATCH v2 2/2] boot/uboot.mk: new zynqmp pmufw
 build option
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Mar 2023 18:06:04 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> -config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> -	string "PMU firmware location"

The removal of this option will require Config.in.legacy handling.

> +choice
> +	prompt "zynqmp firmware source or prebuilt"
> +	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
> +	bool "Build zynqmp PMU firmware from source"
> +	depends on BR2_PACKAGE_ZYNQMP_FIRMWARE
> +	help
> +	  This option instructs u-boot to build the zynqmp pmufw using
> +	  the zynqmp-firmware package.  u-boot will then include this
> +	  pmufw.elf in the generated boot.bin.
> +
> +	  This feature requires U-Boot >= 2018.07.
> +
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	string "Pre-built zynqmp PMU firmware location"

We can have choice between a boolean option and a string option? Does
that work?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
