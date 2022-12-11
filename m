Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A8CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02D1760BBD;
	Sun, 11 Dec 2022 17:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02D1760BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgkCKCmusSTf; Sun, 11 Dec 2022 17:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCA860B49;
	Sun, 11 Dec 2022 17:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCA860B49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA49A1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B174A40863
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B174A40863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwG2qnjt1257 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:04:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 462DF40510
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 462DF40510
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:04:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45EEC240002;
 Sun, 11 Dec 2022 17:04:48 +0000 (UTC)
Date: Sun, 11 Dec 2022 18:04:47 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221211180447.3a31201b@windsurf>
In-Reply-To: <20221207154634.48866-1-neal.frager@amd.com>
References: <20221207154634.48866-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670778288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJLdNC2gx1/Y5f3NHPMsvJRgY/3XDDkuF/AeSm/T51U=;
 b=N4MGnqOQNrOHomPqofMLdMIGg88ADMPAS/70khTzHJ86rAIlv1TvZx44ekdWokP22wN5fU
 8bPqX+NiSESxNHHVYujdDAh3q2Tvv7UXQzR3SOXH6xT78x7/Lckc5YUMGkW4m5aR/iFEf5
 NIjln0uycmADLimcZOOeN+FG87mQ4ru0l89keSvypQLeK7WXZKNbNYAeyX4LGvDz7dwuoL
 GBaFFSADsUowOAsgWah0HMsTINRq0cbA2WifuvIjovftDoEw6rZ2OxVZeE16ng5z4BcHbF
 YqK8jKhpMtgqXZCpm4sY86uuJIKi8mFbiqc35hCQs3dYhABKxWxl2GJbHqEM5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N4MGnqOQ
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 correct u-boot.dtb in boot.bin
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Dec 2022 08:46:34 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch fixes a problem in the vck190 boot.bin generation as it should be
> using the u-boot.dtb as the u-boot device tree and not the Linux system.dtb.
> While both dtbs are basically the same, it is better not to mix this up.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/versal/post-image.sh      | 2 +-
>  board/versal/uboot.fragment     | 1 +
>  configs/versal_vck190_defconfig | 2 ++
>  3 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 board/versal/uboot.fragment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
