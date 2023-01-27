Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237BEC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 18:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D15F82BF5;
	Fri, 27 Jan 2023 18:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D15F82BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15YUCaZdeV77; Fri, 27 Jan 2023 18:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7DED83139;
	Fri, 27 Jan 2023 18:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7DED83139
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194901BF387
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 18:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFA8140C7B
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 18:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA8140C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vQb2sI_ApQl for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 18:22:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223FF40912
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 223FF40912
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 18:22:44 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BCBCB20002;
 Fri, 27 Jan 2023 18:22:41 +0000 (UTC)
Date: Fri, 27 Jan 2023 19:22:40 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20230127192240.096828b2@booty>
In-Reply-To: <20221228095626.2976f2b3@booty>
References: <20221222133350.13402-1-neal.frager@amd.com>
 <20221228095626.2976f2b3@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674843762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1jgkMjlsU095INAMyTa7vL37WM5MYjplVMz54+HtLs=;
 b=UdwotO1cZHno2zLZyENZJYwomyh4g7kkPVnvVHmwErc/Q1hc0Z2WVS+DnBT/IHnvZ2wXeT
 8Fau8WGZTJo2+0IeGgi6BLuvwpYsp8jjFGCbHkpAgXjiM7GFlLEfxhfH5UtqrZlcyKp3Hu
 8miFsrusw0uC4BeLv6akoDg/zudWn/X0s4yVRSEj5hbM5ZjFxAb5Vggc26Y8eNBc1fs3FI
 L74xd7OUl2JDruBvVEMZIH13QezDxavywbrAuoH5dMQ2KtnJMzzaoEpBuJOFWn6TEN/GqO
 fbu3bbkcyQldLOXr0XJ/rrEz3uK7oZIoqW3npGqCy+nt0lUWrSSvzuhlqZAhRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UdwotO1c
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_kria_kr260_defconfig:
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
Cc: michal.simek@amd.com, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 28 Dec 2022 09:56:26 +0100
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> On Thu, 22 Dec 2022 13:33:50 +0000
> Neal Frager <neal.frager@amd.com> wrote:
> 
> > This patch adds support for Xilinx Kria KR260 starter kit.
> > 
> > KR260 features can be found here:
> > https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> > 
> > While the Kria SOM is based on a ZynqMP SoC, there are some key
> > boot config differences from the other ZynqMP evaluation boards.
> > 
> > 1. There are no boot switches on Kria SOMs. The boot mode is thus
> > hard configured for QSPI flash. A pre-programmed boot.bin comes
> > with every Starter Kit. U-Boot can then find the Linux kernel and
> > file system on the SD card.
> > 
> > Optional instructions for updating the boot.bin in the QSPI flash
> > can be found in the readme.txt file and the link below.
> > 
> > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM
> > 
> > 2. Kria SOMs use UART1 for the console instead of UART0. For this
> > reason, Kria Starter Kits will use a separate extlinux.conf file
> > from other ZynqMP evaluation boards.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

The dependency patch got applied to master, so this one should be clear
to go.

Strange however, I can't find this one in patchwork.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
