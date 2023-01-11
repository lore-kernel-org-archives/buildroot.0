Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B67C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 08:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1347A4048B;
	Wed, 11 Jan 2023 08:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1347A4048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Za5SWd8HoOT1; Wed, 11 Jan 2023 08:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55A0640526;
	Wed, 11 Jan 2023 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A0640526
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A24D61BF215
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72DC74197E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72DC74197E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmK10TGHZvs1 for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 08:55:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5D94097D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC5D94097D
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 08:55:16 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89A176000E;
 Wed, 11 Jan 2023 08:55:13 +0000 (UTC)
Date: Wed, 11 Jan 2023 09:55:12 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230111095512.12283fdd@booty>
In-Reply-To: <20221222103144.20516-1-neal.frager@amd.com>
References: <20221222103144.20516-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673427314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQxmMtI2UaHKx6yscmD5StwOB4/TXif44h63tm1Cb4w=;
 b=hIY1SlgPfMeVtk7A2jYuy+96BkeNiQLrjnaq1wyrJH9vPi28p7j3SiXSClIjywWs/fD8+M
 805VCV3zYw8ozJkXi3X4NW4W3wfcnt2ZIX1+10caOi7YsWSKF982uEvyc+ENHs3ZoHOOtS
 ODlGen+3dozPkfjhOJuYV12uHrhtEY4AyX/hXnAdktEUrODa6w5KT9p68SN5lh5QDSN4Kv
 1zTA4Nad8ZiglOmODUGXbcsgJhJy3aYBfIol/S9boigY5+CvOQP1DMJCRe2JRCGirK/ESF
 FCqfmzw+fTiuU78sNfBuQUK1/+L3UQsyFT9UgNOOQtzLOFPH7aGcyUNnfhxXSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hIY1SlgP
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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

On Thu, 22 Dec 2022 10:31:44 +0000
Neal Frager <neal.frager@amd.com> wrote:

> The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
> smk-k26-revA-sck-kv-g-revB has become zynqmp-smk-k26-revA-sck-kv-g-revB.
> 
> This DTS corresponds to generating the zynqmp-smk-k26-revA.dtb for the k26 som
> and applying the zynqmp-sck-kv-g-revB.dtbo for the kv260 carrier board.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506541
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
