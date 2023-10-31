Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25881C4167D
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20E842CFE;
	Tue, 31 Oct 2023 12:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20E842CFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhDVme3GfBAO; Tue, 31 Oct 2023 12:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D5B42CEE;
	Tue, 31 Oct 2023 12:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D5B42CEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 913841BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72D80612E6
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D80612E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBhgQIVt2xyu for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:54:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F337610EF
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F337610EF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67005E0009;
 Tue, 31 Oct 2023 12:54:20 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:54:19 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031135419.56b25f1c@windsurf>
In-Reply-To: <20231020114236.4129636-5-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698756860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07WfnGyeiBu/LcONrCVLczsFsLQ4flevZjbDcrjrOJI=;
 b=XK1yrBMi/A877/RqG+LYK6lOu5Aw5bue82dmZMuhsObW9tAkmEyFIOj79FqZgdgp66nS38
 5K/A/TxOji8gEFeCp0XhMI4KEzn/hdJQeyOCoNyAAbWq3iKA73QszwpF035ZIh+3EYxI6o
 m4W5BqyWd1sC+GbVESjW7rRgYiksIdUSHUUi6m3h9ejY5XKB6quabwYTV0GHOBB0U4ZzWu
 FHVSATcCSpfw1uiamt19VrnXXHfB0GhSkfiXKNfkuJ+zeZ04B4C2kdbBIkcrbVOE2YXcg3
 6NG74VN/DriR2gIce5kHJq6r2FdF4BQI0Cfpxz/CDPgkXshBGkDaXzxR+LOKOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XK1yrBMi
Subject: Re: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot
 firmware
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

Hello,

On Fri, 20 Oct 2023 12:42:31 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> new file mode 100644
> index 0000000000..29c652d6ef
> --- /dev/null
> +++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> @@ -0,0 +1,115 @@
> +From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Mon, 24 Apr 2023 12:53:25 +0100
> +Subject: [PATCH v1 1/1] pmufw: misc/Makefile: specify sequential Makefiles

No patch numbering (1/1). This is normally reported by "make
check-package".


> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_LICENSE = MIT
> +ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
> +ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
> +ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
> +ZYNQMP_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal

This should be host-toolchain-bare-metal-buildroot. Otherwise your
toolchain-bare-metal-buildroot virtual package is useless.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
