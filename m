Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC060C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 15:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AAA340A00;
	Wed,  9 Nov 2022 15:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AAA340A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0KrFBUvDYES; Wed,  9 Nov 2022 15:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 963FA4054A;
	Wed,  9 Nov 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 963FA4054A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2B781BF29A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF4C4054A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF4C4054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnsZRNeEMgR8 for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 15:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69ACE404F4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69ACE404F4
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:45:53 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B668820002;
 Wed,  9 Nov 2022 15:45:50 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:45:49 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221109164549.309f3c89@booty>
In-Reply-To: <20221019051823.26706-3-neal.frager@amd.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
 <20221019051823.26706-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668008751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pb4/AXPG4YOe4/jYYFrzcvbU5+OBq+VBFwTCx+oA6QA=;
 b=c5pvgJpA5bavb4zLJ31HvSY+17G6F8hWTuXhAvCb3BTK3VR2HAN/Z9Q1rYJq04cgUo1IN2
 e1gLJi0521wNxP+lrP04qxHWAfaxyOOv5dvZI2Kvi1UGrrjeIZgz5OvisPtEa990Bnl/5E
 PdwHITAnbWi+EVxVKkanTZxFc9bZkHypDdR9z7GEuT9tzp2jnr8sJBz2tKxJHD0rrPimBr
 7PfOBwMd2rODhONSdIH6KMoOnyXKDSZOyxegzpXfLzuvfuljgV2vfCcaXCrHDPO+KBR0ee
 iU3gLyOnwvBx14IX3t25aEFABqQntCaMxV2CIl4oOMujGgm1r4zB6JTWFox3kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c5pvgJpA
Subject: Re: [Buildroot] [PATCH v1 3/3] configs/zynq_zed_defconfig: bump to
 Xilinx 2022.2
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
Cc: ju.o@free.fr, buildroot@buildroot.org,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Oct 2022 23:18:23 -0600
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zed to Xilinx release 2022.2.
> 
> Xilinx 2022.2 includes:
> - U-Boot 2022.01 bug fixes
> - Linux bump to Linux 5.15.36 with bug fixes
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
