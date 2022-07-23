Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6CAC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BFB40B13;
	Sat, 23 Jul 2022 17:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40BFB40B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odJCZoL34AIi; Sat, 23 Jul 2022 17:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F9A24055E;
	Sat, 23 Jul 2022 17:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F9A24055E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 725FD1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3404A84C07
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3404A84C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DM_3nKyFLytt for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:16:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B81784BA3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B81784BA3
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 17:16:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F1771C0003;
 Sat, 23 Jul 2022 17:16:17 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:16:16 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220723191616.21376155@windsurf>
In-Reply-To: <20220713143400.3131102-1-francois.perrad@gadz.org>
References: <20220713143400.3131102-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658596578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5s0+nqlRIEz28GEUTpIFJyuh5gXhbzmBY9fvatSpvs=;
 b=mGkdtN7Baq+tiqIjglcaWXTYF6rhdZTaQnkI9h5avuyXL7NFPLJ+idFEBsqPs2tyi6Wlqy
 R7tBzMM98TTATRNLUdlZJopbo8CiPngMBKc2XnK014DmFMv2kXS4+dQDZtIQFp9QmvrUMh
 SbKsJ5iPZduIHkIte2JTBOAPFWLXfojxLO88uQKibZmhF9vVKjoCaQ6WFhAgPdoEglcNmU
 eK0Pm8s/CmHcVRMz8IhOfw+SaTYWW8voFnQX2y7IrY6ikVzVerl8rGUVQ/UVf7CoIDPiuM
 XDojwD3LZgZwCXVUMNMOujzmYfEVNf8e531KqXrxJw2liTHtJfh64fdliu6k4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mGkdtN7B
Subject: Re: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot
 versions
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Jul 2022 16:34:00 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/mx6cubox_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
