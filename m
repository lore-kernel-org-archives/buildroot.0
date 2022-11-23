Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0047C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A16A40C61;
	Wed, 23 Nov 2022 22:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A16A40C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9slJ43GmcHIw; Wed, 23 Nov 2022 22:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84A79404DD;
	Wed, 23 Nov 2022 22:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A79404DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D19A1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53F1F40276
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F1F40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg18S7Ndgm49 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DB5A40263
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DB5A40263
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:01:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C672BFF806;
 Wed, 23 Nov 2022 22:00:59 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:00:58 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123230058.06fe2b3a@windsurf>
In-Reply-To: <20221123195304.1582783-6-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-6-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgCAKKx1HK3SDdbYLnGDOL+EVFcH2XTyIBaJlXRNISM=;
 b=K+aFEOWDdHVntoNbelKiCGPOT74Blgjy3KHXGHRJlHJpsQnTkGbRD9GeVVo4ZfsvUSNBhK
 zg8fzAF3xWv9miBVvpUNnbKyxJMCT/d7HSSzDmyRoV2eNBW9xO8Ou2gWk6EzAQoK+4CiGj
 DHuh1ftjErh+KwS2AoEvd59MRY8n5xcjHO/8+XipX1awZg0/bEJuuoy9Dh3GIn0aZ29nkW
 iaI5BnxjLVGcuABEEG8kRlQ0AOqbJQ5AaeFWN54/gng/vpve2bXtKIFNnbW7UgPlJjMWB0
 W9IVGm9lT6Juc2KJY0UnKuXUGCY9YuC1D8llrdaVG8heeG2x1sFNoLLvgmD5fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+aFEOWD
Subject: Re: [Buildroot] [PATCH 6/7]
 package/freescale-imx/imx-vpu-hantro-vc: add INSTALL_STAGING_CMDS
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

On Wed, 23 Nov 2022 11:52:56 -0800
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> Add an INSTALL_STAGING_CMDS define as libraries needed by
> imx-vpu-hantro-daemon.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to next with some small changes as we don't do:

$(INSTALL) -D -m 0755  $(@D)/usr/include/hantro_VC8000E_enc/*.h $(STAGING_DIR)/usr/include/

as this doesn't work if $(STAGING_DIR)/usr/include doesn't already
exist.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
