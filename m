Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18CC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BE0F40B47;
	Thu, 28 Jul 2022 07:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BE0F40B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7Pju2qkuh_j; Thu, 28 Jul 2022 07:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EDAC40136;
	Thu, 28 Jul 2022 07:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EDAC40136
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19C901BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012DC4012E
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012DC4012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaZc4XksWxT9 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9793A40136
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9793A40136
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:35:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57B511C0006;
 Thu, 28 Jul 2022 07:35:01 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:35:00 +0200
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20220728093500.46be560e@windsurf>
In-Reply-To: <20220727222716.1407968-1-m.niestroj@grinn-global.com>
References: <20220727222716.1407968-1-m.niestroj@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658993701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YpqXUjpK/soPjb/a/SIgFulJKjopaauy6ALoe+lroI=;
 b=Mo2L0VG7y58ODHvhxrYZ3STeeo06xiNOIFNPVkZFgnRcqkSyPpv4c6P4eM6KwvEZhK1SvE
 /SO5Ag8OqC4ujctyOAWPn9FCCLK1I8t1Y7eXB3PqRYPGxq+f0t80ZVYBfFy6x2YZjtKEfl
 hgXU9fMRlpOffk+n1Xq1ksvS4kT/2obSyloxgOEoxuCS5gh/KpdJ2xMD1PDzC+tP7xHM/G
 c/EC4jiJTRhqcKYkaN6zqnDJAJCBmNo2pPvhNopFoZQY6O8BUd0jOEsVmfbdoUBOavAPKZ
 buHFUYZTcf6y66Zmq4rhCAkmGFvSUjiOCmcxj107cCaRvHpwF9GnW8ngmCxvog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mo2L0VG7
Subject: Re: [Buildroot] [PATCH] configs/orangepi_zero_plus_defconfig:
 switch to mainline TF-A
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

On Thu, 28 Jul 2022 00:27:15 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Use the same TF-A as orangepi_zero_plus2 board.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001176
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  configs/orangepi_zero_plus_defconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

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
