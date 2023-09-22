Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AAFE6FE32
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E68F4211B;
	Fri, 22 Sep 2023 14:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E68F4211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQfHc_PqJM-k; Fri, 22 Sep 2023 14:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F62421BF;
	Fri, 22 Sep 2023 14:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F62421BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBBC81BF2F0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C410681E6C
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C410681E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xnb72pl5Gaph for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 14:10:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94A8E81CA7
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 14:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A8E81CA7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D8DCE000E;
 Fri, 22 Sep 2023 14:10:43 +0000 (UTC)
Date: Fri, 22 Sep 2023 16:10:42 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922161042.5c4bd39a@booty>
In-Reply-To: <20230903075427.738733-1-neal.frager@amd.com>
References: <20230903075427.738733-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695391844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ek9h+LWymjyzrU3vGeHbV2JVvGHyg14W2FKFp1c7xJg=;
 b=Ye2Yp9ud+Z1V07hMJlVRhYIKnrtzEstS/g+8q1OtK2HndrcBnKa5N073KT3VqAiBvBLP9k
 NjPVpvdZpK7YLwwIz126le8eGD1MnmGZkkMOhHAh+lAmDqerXL5NbFIUac8UOQpIrrH3gf
 uk7LNTp+wH2242WeuZu98gNVLcyqq9xlSXgVEIXAecZWPh9Y26BIHE3aH4So/RjGQWA6j9
 BEX/YdMBTnudJm0sia30tk5ZDlLXi8rf/Hoj2FCGgkOlgySR3BrhPncbG5ZSKOr8vJxTpc
 6vTZBQE3+KvvSEnDm9H8INop62fCzP2kQfKzmR+vCZS8htSg1Vk2wfT6vgKM+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ye2Yp9ud
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig:
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
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, david.evans@ebv.com,
 dylan.bespalko@amd.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Sun, 3 Sep 2023 08:54:27 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
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

The above 2 items are the same as the KV260, right?

> 3. The KR260 has a USB to SD card bridge, so the Linux kernel
> and file system are found on /dev/sda1 and /dev/sda2.
> 
> 4. The following patches have been submitted upstream for u-boot.  They are
> required for enabling the pinctrl of the tri-state registers, so that u-boot
> can detect the SD card connected via the USB to SD card bridge on the KR260
> carrier board.  These patches are temporarily included with buildroot until
> they have been applied upstream.
> 
> http://patchwork.ozlabs.org/project/uboot/list/?series=368369
> http://patchwork.ozlabs.org/project/uboot/list/?series=371196
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
