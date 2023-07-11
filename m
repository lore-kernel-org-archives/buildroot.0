Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F707EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0801841E75;
	Tue, 11 Jul 2023 21:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0801841E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P1pgzSeRfVk; Tue, 11 Jul 2023 21:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90CD41E70;
	Tue, 11 Jul 2023 21:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90CD41E70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31CFC1BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B91A4000B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B91A4000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgytXiYG4pGZ for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:44:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A31402F2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9A31402F2
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:44:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11DC620007;
 Tue, 11 Jul 2023 21:44:07 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:44:07 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <20230711234407.3c2177a6@windsurf>
In-Reply-To: <20230706222607.287386-1-alexander.sverdlin@gmail.com>
References: <20230706222607.287386-1-alexander.sverdlin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689111848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeOZTr655PFNjfLXgMAdCNfCU4WT3SqGAUkL++eVDUI=;
 b=Dza9/4ox0MmBNXMUFcGZiN8cw5nYXfhdxnNSPQxKRQAl4axm405lgamBVnzEJkL8mSNsBP
 px4wpB01QWlHj/WztooMgKRvxSDey3wOAJUovYXc9y5OMyCYHOSB7SHqhaYX/bCbVla/Dk
 nZDJ0RvxHLQqCZiy34W5lVhimxsKgB7coxt4uDKleuxtWaQbRxG/Ppfd6BqlkgdzLhGJLV
 QwbBurxfyK6bijHNxJzi0uakjbNACS/uhIuzmWwrZlHzPJ7059iHD6a/P/NSm/KIrZ84iz
 NOrJmNxwVn73JJ9irdPIne6jcTNdEC20rhn8dAnZxyA+RaEf+gD9tZpcWjLWfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dza9/4ox
Subject: Re: [Buildroot] [PATCH] linux: add support for vendor dirs for
 appended DTBs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  7 Jul 2023 00:26:07 +0200
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> Take the basename of the appended DTBs to workaround the following problem:
> 
> (cd .../arch/arm/boot; for dtb in cirrus/ep93xx-edb9302
>  do if test -e ${dtb}.dtb ; then dtbpath=${dtb}.dtb
>  else dtbpath=dts/${dtb}.dtb ; fi
>  cat zImage ${dtbpath} > zImage.${dtb} || exit 1; done)
> /bin/sh: line 1: zImage.cirrus/ep93xx-edb9302: No such file or directory
> 
> Necessary to support ARM Linux starting from commit 724ba6751532
> ("ARM: dts: Move .dts files to vendor sub-directories"), i.e. Linux v6.4+.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
