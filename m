Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0DBC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64DDC82001;
	Mon,  3 Jul 2023 20:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DDC82001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fG5mavAiZrVD; Mon,  3 Jul 2023 20:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE63381F31;
	Mon,  3 Jul 2023 20:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE63381F31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87B931BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55273410C8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55273410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8eeflXG2GNF for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D31B4138D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D31B4138D
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:00:04 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F385C24000F;
 Mon,  3 Jul 2023 20:00:02 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:58:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230703215852.62cdcb0d@windsurf>
In-Reply-To: <20230703191617.1338283-3-giulio.benetti@benettiengineering.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
 <20230703191617.1338283-3-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqN8ZRc3vadZ3xyFszdvRv9Ds2goxyk3b9I2DS3rLgw=;
 b=KYUSi2JVrv4EDeuHJjCwkaC7/3LcHpPxuBQks6doOQYq9whL/W6QikF1ZGmCV8Uz8qBeM9
 PeUg2VtM6pvVZKziQ/fz64QWxFLPfn5zx8tgEo8agli3FJxqsX2NOEYW1bJPKeazX6Q5g4
 navl/FJm0d9pbgfsVJBCvEkZq2WSSEVbvWr9Jnp9nWzNta6jvm6EuzOS0L2apLw93lUibk
 k+AsAK/M01R0nkuEfxyMndM2b+uWb4GTvnT1oEYQpD8qiBuZxHvL5HCwnFAbjq0q4iz57i
 y4sRfdcckkpyuAx0NuOhGha9da25HnMuhCS+3z3k+i35Yna4uwQ9hNFvAVxHHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KYUSi2JV
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2023-06-24
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 21:16:17 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With this version we can build with Linux 6.4.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8821cu/rtl8821cu.hash | 2 +-
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
