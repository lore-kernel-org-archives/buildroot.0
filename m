Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A24C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 644B781776;
	Mon,  1 Aug 2022 20:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644B781776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7CxT8zzOq7ix; Mon,  1 Aug 2022 20:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9291181756;
	Mon,  1 Aug 2022 20:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9291181756
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 247391BF293
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A2D81763
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A2D81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gp4Ar3lHF-sY for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:09:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEAC781756
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEAC781756
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:09:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33A14240003;
 Mon,  1 Aug 2022 20:09:38 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:09:37 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801220937.5fef4ced@windsurf>
In-Reply-To: <20220727181304.440002-1-bernd.kuhls@t-online.de>
References: <20220727181304.440002-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659384578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kawFNzPQngR+KTX4ungPbFEREVnh1A+ijQDxgT62E5M=;
 b=PbGckux+U5a0GF/nuXPIhDMM73iTEr3NVwFKxxO/n3lAprbJ/c89wi2bTNeEAy2skWGJ0f
 MeXaTFVj4tO7tVigJea1YlWyroTWUg0t4m61Vq0tG1IzOf41odn2zT/yuz+9c7Fx/uPgCF
 idUqCxNUx+CXW6EkLY99iV9CsLPZ8/L1bRneqRdjWtgbt9nKqtcwcF6+raegZPwaKe1IZw
 2ZGOh3kQg4EwqUJ7O80scCz44yakWkLHxmw2Op0Qe+VhcCAkbdTN35S3WEWRZWqn8k4Lzc
 /nfi3aI14KFXsBXAbIHiIBQkdaotyWecR9G/aXJhUIxeGBEsxfxs2J1DyDxN8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PbGckux+
Subject: Re: [Buildroot] [PATCH 1/4] package/libutp: bump version
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 20:13:01 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Follow transmission switching from branch post-3.3-transmission to
> branch post-3.4-transmission:
> https://github.com/transmission/transmission/commit/745adf8332b9686afa55407f9be20de21002a187
> 
> This branch contains a copyright year bump for the license file:
> https://github.com/transmission/libutp/commit/365254427e5358a0c390aa5a60df5f449b9c0f00
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libutp/libutp.hash | 4 ++--
>  package/libutp/libutp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
