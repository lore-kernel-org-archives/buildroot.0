Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E98C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E50417B8;
	Wed, 23 Nov 2022 22:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03E50417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dx3U3VvK_eZy; Wed, 23 Nov 2022 22:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6BD4174C;
	Wed, 23 Nov 2022 22:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6BD4174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 669421BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F33B404DD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F33B404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddnodKIAC268 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CE940116
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37CE940116
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:00:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E5C0FF803;
 Wed, 23 Nov 2022 22:00:22 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:00:21 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123230021.1a58f3f1@windsurf>
In-Reply-To: <20221123195304.1582783-5-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-5-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEcI7aUMbIOaNcGswH6vQOSYGuPfW5fqKSCk5aWWwBE=;
 b=hQWDtgu7O8MhveSnK6H/XI5zDv8dz17MYstdpNZnuS3VY1Os6bFwbxATollrmhVN4LmCqq
 Y6LQrAHAIt9MXUknmq7Qavw0u+4zJyx40bf7dSOuyAcPcFtXLRF0963eB8TAgeLwsGJuuU
 6WtN1jwlybcJjXd9g85YiLIY+AvwPHZoUIkCtY/kZpd/r78/hL3HN16Mypi59/P8ETtjS5
 uUhXROgzYhBUjNXOR/CVja1PpYYySrvZywpadE+i1B1d4SEeOkzuR49DtgSA/VWB1oHJNv
 knntMDb//6J8Vox55t0eIkHAx1GnWUk/Eb09MWpw6VKZ7F78r0VVzmyGfne72A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQWDtgu7
Subject: Re: [Buildroot] [PATCH 5/7]
 package/freescale-imx/imx-vpu-hantro-vc: bump version to 1.9.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Wed, 23 Nov 2022 11:52:55 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> - To match NXP 5.15.52-2.1.0 release.
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v39.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  | 6 +++---
>  .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks. Two questions:

 - Shouldn't this package have a "depends on
   BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP" since it only makes sense
   on i.MX8MP ?

 - Could you add yourself as maintainer for this package, and perhaps
   other package/freescale-imx/ packages that don't have a maintainer
   in the DEVELOPERS file? imx-vpu-hantro-vc was added by you,
   imx-vpu-hantro was added by Gary, and we don't have entries for
   these packages in our DEVELOPERS file.

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
