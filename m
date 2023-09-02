Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C810C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C79A7405B3;
	Sat,  2 Sep 2023 15:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C79A7405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soBmPzvfETce; Sat,  2 Sep 2023 15:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 118824057C;
	Sat,  2 Sep 2023 15:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118824057C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5641BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D602D418C8
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D602D418C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJ9jGzJHKuiU for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:52:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 937C541621
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 937C541621
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9EB60002;
 Sat,  2 Sep 2023 15:52:41 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:52:40 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230902175240.717c7ec7@windsurf>
In-Reply-To: <20230827151828.515020-1-romain.naour@gmail.com>
References: <20230827151828.515020-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693669962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hpOXfEzt9BfVLdYE1/9Ml3udgsUTewRGOPyKyx/1nc=;
 b=PV4af7kRUCJ9I2LBVG0ZyUkMBHS5qIMUAefYQeULzYP2Tc2Y8iYk8IgiLKSUDdlp7arWVs
 Bxcgv2HarhEtgs0Th6QrYSaE64DPnn1MWelKtIJpgiz8eSvaNgCQmj66ER2aIVLEg94GVS
 xA/sHckj6exLtUP2RCRMfnbTdUY+2Pj6Zlmcj7NL1wHrqyjj1mNexKUTX9oeLj1n1o2iB0
 Bz8whAGaH8C1PlJuuqFCjzqCDetmbUm2mPwmucEeFoTHHHuyHcaaSerSerQAZIHNKl7ynR
 QH2zecGYp7matGfImR9rwCzfW7UMPlgd98XURkCuU2luUnhckTT/JYVwa36GOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PV4af7kR
Subject: Re: [Buildroot] [PATCH] package/mesa3d-demos: update optional
 opengl patch due to new glu dependency in util
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Aug 2023 17:18:28 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> matrix-code from es2gears has been moved to util in version 9.0.0 [1]
> so now es2gears is linked with mesa3d-demo libutil (idep_util).
> But at the same time the dependency on glu (dep_glu) has been added
> to libutil [2]. dep_glu requires opengl (FULL_GL) to build.
> 
> In order to keep the es2gears for egl only builds we have to
> split the libutil files list to build readtex.c and showbuffer.c
> only if opengl is available.
> 
> Add back dep_glu since it's used in util's meson.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042
> 
> [1] https://gitlab.freedesktop.org/mesa/demos/-/commit/c33e2f731c2eab86bbad7b6a028f8a90ea40a00c
> [2] https://gitlab.freedesktop.org/mesa/demos/-/commit/ef24aae22978d4d357340074ca9a1c04d9cf81e6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>  ...s-makes-opengl-an-optional-component.patch | 95 ++++++++++---------
>  1 file changed, 50 insertions(+), 45 deletions(-)

Applied to master, thanks. Any chance that we try to upstream this
patch to the mesa3d-demos project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
