Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2285DC43217
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 14:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B85CF405FC;
	Mon,  7 Nov 2022 14:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85CF405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWsTOBSKsXhX; Mon,  7 Nov 2022 14:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F15405F7;
	Mon,  7 Nov 2022 14:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08F15405F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1A861BF957
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 14:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7CFB817EB
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 14:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7CFB817EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roWzRsJwpX4A for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 14:32:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C324D817C3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C324D817C3
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 14:32:52 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F0C84000E;
 Mon,  7 Nov 2022 14:32:48 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:32:47 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221107153247.34da2ad0@booty>
In-Reply-To: <20221107131516.18488-1-neal.frager@amd.com>
References: <20221107131516.18488-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667831569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jh/7Bw8lH/QSv6IlKPKWuxh3DXp1vPfpekosK7uugjM=;
 b=Wt5FS8WZPBaGDfUls4lnMj7lpm9qGCTsERx6UwZzLJjqCpvhK7rMDKk4KaOb71q0fyI4z2
 HuZHQRBeCcgf56igK8KpiYZaEFrm65GQ95ehHa0B/e2hoGcwUFsppqfDg/XdLwDwm/x49D
 bccqKje3uKWshQwWdg4YUX5k1hSmDTjYw1Vm7bDOzGscLXylxWJGrHBVfsDmnBbNclgk5L
 ScEgxHeGV9xGFYPQ9MufD6W+1cmanu+N4TdmiVjL0m2TjJGKz0pP88y00L2GmkMku5M33O
 6rjlP3XZo95zJWo84ZxNVKQg7j5YCPXFXjOKvfdETd8BYIFdg1e7DLzTaEPPRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wt5FS8WZ
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
Cc: wesley@sonifex.co.uk, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Nov 2022 06:15:16 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the u-boot device tree definition
> from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> instead for the zynqmp_kria_kv260_defconfig.
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
