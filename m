Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3135C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C92B8175C;
	Wed,  6 Jul 2022 21:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C92B8175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dG_-kodlzLdS; Wed,  6 Jul 2022 21:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A600B81756;
	Wed,  6 Jul 2022 21:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A600B81756
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEA4B1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFB34186A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BFB34186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eC5Wm1j9V0K0 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0F74186B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C0F74186B
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:43:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE9671BF204;
 Wed,  6 Jul 2022 21:43:30 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:43:30 +0200
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20220706234330.48b4150b@windsurf>
In-Reply-To: <20220629182923.26615-1-dmrauh@posteo.de>
References: <20220629182923.26615-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9c8oelKU4h8rKY5HKn/YCMRdIanTE8a+1z4BQ5iP6E=;
 b=nc5oJMpcP9oK4L6WFZt4Q6k3nsFAUFm3MjjdP4WKASwOlW7xsVTRgkGSinTmmAip+epoST
 FKdjEVI0dDu10g0cMmjxcoMGusHvJy6VqC+Ep6qr3gvb7v0t/A/Rh1LRtjbufIMxrOy6Db
 TwwMtMt2+QY9nGpCy/OJYWhvuZPBBehcAeHeOOxiVdtXdQQJjRkW0O1Rjf7PAjIwHTyNcB
 cEV3Ot39IbiBjRTx8PMhmLRkDt6y0UHcaHldd7TEXZcMSJ9kP3SsxFr7483kIwIJ3vzzsG
 /niP01iZ1DA/5fFOGd70X/XyVcocFtVzT9NHgumobB+CL5v4h9hJy4pLs2/D/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nc5oJMpc
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix info in
 Config.in.host help section
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Jun 2022 18:29:23 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> The help section of "BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT"
> refers to U-Boot configuration option "CONFIG_ENV_SIZE_REDUND" which is
> removed since U-Boot v2020.01, so remove this reference.
> 
> We may replace this with a reference to "CONFIG_ENV_OFFSET_REDUND" as
> another indicator that a redundant environment image should be created.
> 
> This also fixes a minor typo in the same file.
> 
> Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
> ---
>  package/uboot-tools/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
