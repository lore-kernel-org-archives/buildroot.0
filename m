Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A93AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A921840583;
	Sun, 20 Mar 2022 17:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yn7ianxegJkQ; Sun, 20 Mar 2022 17:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F0D6400D9;
	Sun, 20 Mar 2022 17:07:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDA41BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E00C4087A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWnY5bJIITaZ for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99D3F40296
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A04D9FF802;
 Sun, 20 Mar 2022 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lugs+suRUV927laZB022Qu4GPgy2YcU1Y1EqgJU1YDw=;
 b=gYntndkkcKEbBeEe6MdWZF8PZqsRo/E9BjoMtkMOb0vvMkcaCZnhviE0MrkZN9B3ZNKIDq
 J6P1dFtuFa+dYiiZHC35Qy6dPgSWvRLaRnvJ/eVADjI4Gwj2W6L6NdwZ9q8L8op46na9FN
 fsHKanTpVqzOO+RJbCyxgGPxmWC1axbvADgElH6zzjYkwJ45ZYiXb35dYCFHggihdhvT0t
 k7ELk+qgQSC5vItOUMRxUlA6esA2Zs/J969om9KMz69WvjQ/dV36z2sHc8wDrBVXN9cX7T
 7khTU9e7mFr6dFPuaIh/hM+cRgIWZxaf1YXz/iK68/4Jkt1j7mDarbFkvABYbQ==
Date: Sun, 20 Mar 2022 18:04:01 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180401.7821503b@windsurf>
In-Reply-To: <20220320124239.655081-1-bernd.kuhls@t-online.de>
References: <20220320124239.655081-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.8
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Mar 2022 13:42:39 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000666.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
