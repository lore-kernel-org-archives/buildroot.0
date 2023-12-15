Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB0C4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 16:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CD6423EE;
	Fri, 15 Dec 2023 16:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CD6423EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ad3Sik6jxoF; Fri, 15 Dec 2023 16:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE48F41503;
	Fri, 15 Dec 2023 16:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE48F41503
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 716C71BF418
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1425E83E4F
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 16:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1425E83E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ea_54EOW1btj for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 16:56:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94F2583E4D
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 16:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94F2583E4D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EA8E20003;
 Fri, 15 Dec 2023 16:56:22 +0000 (UTC)
Date: Fri, 15 Dec 2023 17:56:21 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231215175621.21f8c37d@booty>
In-Reply-To: <20231213134849.2822206-1-neal.frager@amd.com>
References: <20231213134849.2822206-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702659383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyNoJV9wAf7ZkEPe/NQ7jfDlnXUkfHa8PsEMveN1Jg8=;
 b=F4qlB//xjw+JzhtA3Aqa2Qs9+uq6nCEKAr0niMD/E0Un9SeB5lJAFCKBEhJA3SuUNfpEpQ
 LR1/Uip5HkUyB/rdlgJISFNhD+DUQM10FrKRB4K6Q3KWy3ZRgx7IS5gFdj4optnnMCetZi
 V2V08JuyzKmZ8VUQmAWsS7KnqQqMOmmiQUu8xX0N7UN/BEHSLB1f32GpaHXwWarvVrzOo/
 jG5jtx527b6ouGuMkGZ93G0Ak4kwTmJXu4W1FqdK+T+dLZ8AFcv5elyVWSrpEo9fBgB8aW
 7oNYeoGtHHWm5QbGnS9xWrllxPf4YqnDZpa2Y2rxzk1bA+0KPcs4ZsbVwTWZKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F4qlB//x
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kd240_defconfig:
 new defconfig
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

On Wed, 13 Dec 2023 13:48:49 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Kria KD240 starter kit.
> 
> KD240 features can be found here:
> https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key
> boot config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus
> hard configured for QSPI flash. A pre-programmed boot.bin comes
> with every Starter Kit. U-Boot can then find the Linux kernel and
> file system on the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash
> can be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this
> reason, Kria Starter Kits will use a separate extlinux.conf file
> from other ZynqMP evaluation boards.
> 
> 3. The KD240 has a USB to SD card bridge, so the Linux kernel
> and file system are found on /dev/sda1 and /dev/sda2.
> 
> 4. The following patches have been submitted upstream to u-boot.
> Without these patches, the usb, sd card and ethernet peripherals
> do not work correctly.
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
> https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
