Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F73C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 15:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B67A81C21;
	Wed,  9 Nov 2022 15:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B67A81C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLiNod9Udxo7; Wed,  9 Nov 2022 15:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D8581B3E;
	Wed,  9 Nov 2022 15:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D8581B3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 757C51BF29A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4366781B3E
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4366781B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAsH4-KwIy5C for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 15:54:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12FCD81A34
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12FCD81A34
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:54:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4CE63CC153
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:45:31 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3674FF811;
 Wed,  9 Nov 2022 15:45:24 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:45:23 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221109164523.0ac2b5ed@booty>
In-Reply-To: <20221019051823.26706-2-neal.frager@amd.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
 <20221019051823.26706-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668008726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ut2BHnvpL2BmjQV8IvdUz5nxvf7mS8fUz2vLdoTogs=;
 b=k8Um8UeAOjml+6C8asvuxh4rCZXp+d29/+0SPGMRUU//OhglStc6R370c6UOz7Ve9nfJsb
 PFFkGT8KLRoXVLexEUHm26aswMeobX0XPDzjMn9I4A6zad8ZmZjMrXgBng39H7PUnh72Zc
 RlcCuxzIfJBIZsFEir28nwUNMh8nyjIrthw5wh7LdqU3ycjywp2L5Phken6T/kOuu2rNLB
 gAEg7qz3zcRhGaMAxmWtzyoRFeeLlkLaFayP9otMU3EVbkmf9KSyNne32gmwvgZT7D+fDl
 X1+Xnw+smegNZC3vzDCTCWs+J/LuM2Eu7BEqvWegKGsWU8NWK0IbOx1JvYmMrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k8Um8UeA
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_microzed_defconfig:
 bump to Xilinx 2022.2
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

On Tue, 18 Oct 2022 23:18:22 -0600
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the microzed to Xilinx release 2022.2.
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
