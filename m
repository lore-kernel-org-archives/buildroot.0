Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371E9C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E726E60F82;
	Tue,  6 Feb 2024 13:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E726E60F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1DzN1tKhaVI; Tue,  6 Feb 2024 13:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A3C660B8E;
	Tue,  6 Feb 2024 13:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3C660B8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47BD21BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED37E41E65
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED37E41E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPPs0N8Zza7g for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:25:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA30E41E63
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA30E41E63
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43967C0008;
 Tue,  6 Feb 2024 13:25:50 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:25:49 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206142549.2ad91f3b@windsurf>
In-Reply-To: <20231219121508.1695768-5-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-5-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707225950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oeu1ay52QFm9oHchlc2OwfL9sF0aQruC9E8oVyuyWuI=;
 b=ij1LRjUlz21Z+wV8npk8IywSHo77Ug5GdoHyY3kT4yGpaxFd3X1L1cWZVStDhJmRI/s/jV
 9r4Iob8e74MwokhjDh/OVWtqR2vKC06RtdEyCF62JZqZkTJeVFD7l/iH1TYD1+joRw6BN1
 FPNOF6I2RMW5RbNwlEImO86X9yQispwU9o6wqW1vxJmhIraB0h8IhlkL0SFneuMtLd7neO
 NibuIYr6FsixmdOpoSFRIG+DjgreYB858oRABVMYfMYe5uLcy576sN3C/bcnI1pY+6Whe6
 4pSYkUtyt4vqOMTSjk1Xz6/HQe3+Qn6zqRjC+jHo3U+8tKn3unS+qGiI+BbNmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ij1LRjUl
Subject: Re: [Buildroot] [PATCH 4/7] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marleen,

On Tue, 19 Dec 2023 13:15:05 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> Patch 0001-feat-build-add-support-for-new-binutils-versions.patch as
> found in v2.8 patch dir has already been applied in lts-v2.8.13
> Patch 0002-build-tools-avoid-unnecessary-link.patch from v2.8 has
> been included as 0001-build-tools-avoid-unnecessary-link.patch for
> lts-v2.8.13
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  boot/arm-trusted-firmware/Config.in           |  6 ++
>  .../arm-trusted-firmware.hash                 |  1 +
>  ...1-build-tools-avoid-unnecessary-link.patch | 77 +++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 boot/arm-trusted-firmware/lts-v2.8.13/0001-build-tools-avoid-unnecessary-link.patch

Thanks a lot for this patch. However, I don't think we want to add
explicit choice options for all "random" versions of TF-A. Instead, if
you want to use this lts-v2.8.13 version for STM32MP1 defconfigs, you
should simply set BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
to lts-v2.8.13, and have a BR2_GLOBAL_PATCH_DIR with the patch that you
need to apply on top of it.

Due to this, I will mark your patches 4, 5 and 6 in this series as
Changes Requested. If you have the chance to do this update and send a
new iteration, it would be nice!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
