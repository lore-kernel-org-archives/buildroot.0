Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B2C43217
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 13:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F80611A0;
	Thu, 13 Oct 2022 13:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F80611A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_IesLn-agip; Thu, 13 Oct 2022 13:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60CD61188;
	Thu, 13 Oct 2022 13:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60CD61188
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7AFF1BF425
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E20761188
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E20761188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23X9lSP-SvPi for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 13:18:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB0B61133
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CB0B61133
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 13:18:39 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D584E000C;
 Thu, 13 Oct 2022 13:18:35 +0000 (UTC)
Date: Thu, 13 Oct 2022 15:18:34 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221013151834.60d4a353@booty>
In-Reply-To: <20221013064931.60174-1-neal.frager@amd.com>
References: <20221013064931.60174-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665667117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRy5tWl/eAyywQzfqg3QHZoJdsZ2Lf982Tiq+rbOvIU=;
 b=b5/S579oFGj64FvvZu0rTtO2Ytntf4a0lWTiwVfKTBQhdCRgwZoXfwUe9Zlk88zrk6ZzOB
 CC/rDuIW9VOiuMEusk9Ox9mFgqTKIBu6hPqf+WgbaxStAKdNk+BWUOf6uL5ccU8wLVznEl
 aR1fcYVTuSIodNSlZOQZjfDBdw1tyqEv3I/HY1Oy1ZNL/YQo2OhqePb8c875w5g26ayxw7
 UkYZ6Pk0D8xESFIsePNdG4ch69FkcfK1c55rqKUGKAS1uGNWjdqgMaUqFqzY2V7Thld5pL
 BLEoqYmTZ78eRvImyCvM+imzQaupLKqDVSsGvTi1hwK0s26gUjpVAzy5Y293uA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b5/S579o
Subject: Re: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add pmufw.elf
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, kris.chaplin@amd.com, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Thu, 13 Oct 2022 00:49:31 -0600
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for zynqmp pmufw.elf files.
> It will allow buildroot to use pmufw.elf binaries directly
> from the Xilinx git repository built by petalinux in
> addition to still supporting pmufw.bin binaries built
> by the zynqmp-pmufw-builder.
> 
> https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thank you very much for working on a solution to this unpleasant
situation. I still would like to address it, but spare time is not
easily available... however I'm always happy to received patches for
zynqmp-pmufw-builder! ;-)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
