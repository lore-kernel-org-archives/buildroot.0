Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F24C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8E88214A;
	Mon,  5 Jun 2023 08:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8E88214A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6SrVnZ7Qa5G; Mon,  5 Jun 2023 08:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C0382065;
	Mon,  5 Jun 2023 08:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C0382065
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BADF51BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DCE082065
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCE082065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDmLnzsiJSzP for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF5A8204F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF5A8204F
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:23:54 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E17AE000A;
 Mon,  5 Jun 2023 08:23:50 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:23:49 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230605102349.40a39b17@booty>
In-Reply-To: <20230531111602.1623985-1-neal.frager@amd.com>
References: <20230531111602.1623985-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1685953432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RO+ah1hDHC667hrfpZ1fI9iqaMfSGjFESZpPzIiAxrg=;
 b=GF9U9b1FvHoD6vfF1TuWDsFf+ijpTME573qYSUc2J2megR6D9m5bgYAOfT9emqtFkHe8qd
 4T/it5ln+nZKF4tCKruFj5iWNeQ1JVedSE7cwNP05Y9JUoILWroxhh/D1bWSR8DaA4yHTy
 HTMAR1UExzwWiLAfsPxhnjXDeN7OmIJa09hw5wDuh9s132ZqMCfGXMSwOUk5mN2djaBCYs
 dqstIf9pfi8vHX83mkYVYzNs7kO7UZGfwNhF33veb6/FEAdvheUD4H4kL0VrY+TGZfSrq+
 a+NbiKs9YxW0KETZd4KNFXIvFBpreNmT8gEsAz/LpKJ/lhFjSIwgjA/NtOif3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GF9U9b1F
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig:
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
 kris.chaplin@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 david.evans@ebv.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, 31 May 2023 12:16:02 +0100
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
> 
> 3. The KR260 has a USB to SD card bridge, so the Linux kernel
> and file system are found on /dev/sda1 and /dev/sda2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
