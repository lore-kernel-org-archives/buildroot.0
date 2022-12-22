Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B6C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE654179E;
	Thu, 22 Dec 2022 13:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE654179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbEUG4TxXkcP; Thu, 22 Dec 2022 13:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8442D4177F;
	Thu, 22 Dec 2022 13:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8442D4177F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 480311BF577
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 228898209F
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228898209F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxxkajUgescw for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 13:27:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AEF8209C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3AEF8209C
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:27:53 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19373100012;
 Thu, 22 Dec 2022 13:27:47 +0000 (UTC)
Date: Thu, 22 Dec 2022 14:27:45 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221222142745.5c577c79@booty>
In-Reply-To: <20221222063710.4324-1-neal.frager@amd.com>
References: <20221222063710.4324-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1671715669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zyprw10X1CMc8uf04c2XYRQmub8w+fx3J4YAYWo5tiI=;
 b=B5UooCeEMhMR9bMOPfC3mkul5c01NEwSwrg8DX0BFsvbiEXx2ztOxIGXIw+kagdz4ijmwS
 5wPZl/RU6YeB1E3HJKrvX0k8ycECXjvCZRHOBxqmIX4xuIuU8aA6eczyYbfArftp1iV0de
 HDrF1uJVmRDxKTq7WcArXNj3VQ7uNldqxgxWlWixy61Fo0sJZhvwiVWR0yeremzVokVPik
 dyIdlUDYo+Ev96YQD9NHVdTKmva7NUCnheMA6DZZAjHhQyTSiaW7T11Zz1kb9y7bXj8tzm
 RtkjiHzDK+NBOfoJzmD91biDoWDaRCQKGXo+7qUD5WSMFRDMbN9Eia/rFxOIJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B5UooCeE
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 use CONFIG_MULTI_DTB_FIT
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
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Thu, 22 Dec 2022 06:37:10 +0000
Neal Frager <neal.frager@amd.com> wrote:

> When using the buildroot compiler, it builds the u-boot.itb immediately
> after building the fit-dtb.blob.  This causes a build failure when using
> the CONFIG_MULTI_DTB_FIT build configuration.  This patch adds the necessary
> dependency to guarantee that the fit-dtb.blob has finished building before
> trying to build the u-boot.itb.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
> 
> This patch has been submitted to u-boot mainline:
> https://lore.kernel.org/all/20221221075446.47141-1-neal.frager@amd.com/

And also approved by a maintainer, so

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
