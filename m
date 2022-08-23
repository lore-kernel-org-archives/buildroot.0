Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF3C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE49B40A49;
	Tue, 23 Aug 2022 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE49B40A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2BVuX5er49l; Tue, 23 Aug 2022 21:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D22EB409DD;
	Tue, 23 Aug 2022 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22EB409DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D88811BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A537D410C4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A537D410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_5XorqbW9xe for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:30:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB2F410C3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB2F410C3
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:30:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 322EE1BF209;
 Tue, 23 Aug 2022 21:30:14 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:30:12 +0200
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <20220823233012.513e0bf8@windsurf>
In-Reply-To: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
References: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661290214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODHSV/ZU5XJE92bSy3oYpdZbqITTL3ugQPFHglWv6rM=;
 b=L7E/dOgum44Hwc9aQHfg/F4OEqM/udmHCE4/S8yyiEU8iS3DC3JJD0r3kC/rB4AKpj3GDZ
 Gu3NFyhZv3zi76J1TnhANtRgJ2En5tEQK7llqW2A9lBbEKIM4l3sX8+t7Bv3UMRB5Mw8ha
 CL5NsCdUpiHeAoIX1Z/U4mf+xSPUl2lBXVaWf2+fyClRyRVt4fOpErKDyXnn1yrc9CS51s
 t2j8fAFkDDKcCqffPXxemT2Dof9VHl8l9XgL4FhD7LTJrjdcGgTu+STzWLP+cqdw2j2aUC
 ygEhJWLoYMKOQ936nCfhuSEQZnq8QluAM0H5v+LzEXpnq+I/LjXuF0f5HMwKTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L7E/dOgu
Subject: Re: [Buildroot] [PATCH 1/2] board/freescale/common/imx: align
 u-boot-spl to 4 bytes
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

Hello Bram,

On Tue, 16 Aug 2022 14:07:17 +0200
Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:

> When enable DM for SPL binary, the DTB part of SPL may not 4 bytes aligned.
> If u-boot-spl is not aligned, the offset of the DDR firmware is not 4
> byte aligned when u-boot-spl-ddr.bin is created. This causes the ddr
> firmware to not be loaded correctly at boot.
> 
> See imx-mkimage commit bba038d893046b44683182dba540f104dab80fe7 for
> implementation in imx-mkimage.
> 
> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> ---
>  .../freescale/common/imx/imx8-bootloader-prepare.sh  | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks. Even though your patch was marked PATCH 1/2,
there was no PATCH 2/2 posted on the list. Was this a mistake?

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
