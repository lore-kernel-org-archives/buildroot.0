Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC654EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC2F60F5D;
	Sat,  1 Jul 2023 14:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC2F60F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfMqezGUel6F; Sat,  1 Jul 2023 14:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6BEA60F30;
	Sat,  1 Jul 2023 14:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BEA60F30
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9491BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03733414C0
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03733414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM5Er2tane1N for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEC1E414A2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEC1E414A2
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:43:55 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2D0B240006;
 Sat,  1 Jul 2023 14:43:52 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:43:51 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230701164351.394d8891@windsurf>
In-Reply-To: <20230619141707.1011210-1-dario.binacchi@amarulasolutions.com>
References: <20230619141707.1011210-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688222633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTsDPpgmnyQx0cSkmMKu2lKgFKAbcLVPZz+Te+ZbGuQ=;
 b=JSghIxqXlGuywXOLb27aWLiZwPyWvmjg3L7eEI4lcxYwmc+r60KuYtMjo/B8Iv2GBGR3x/
 RZ1hIrZGrYhwxIghhDRghY1Kw9NUCR/kKL8fRkmBnDAJnVyXgIBExIY8BSQRBYwhPRqL8l
 x/I9yqOn8U/GoCEUWtXsHR65RvTM6WGyT7mprJ+eRt2d6Q6j/STKdhugQi2H9XVu2/v7ub
 SRI48S9IbssuMOORl3okYcHApM2m4IziLVxcxYEMPxhs1yHARQqiln8AoiCQ43rC0wmA7f
 ZA2iQgtE2Rw5ItMgHU+qvSqAn6AN03d8fsF+OS5KKEJtJrxnrqbIRZCBZwfmLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JSghIxqX
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.104
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

On Mon, 19 Jun 2023 16:17:07 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.104
> 
> The changes to README.md are not related to license modifications.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 4 ++--
>  package/uuu/uuu.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
