Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C01C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ADA360D88;
	Sat,  4 Nov 2023 20:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ADA360D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEbO8tVPfAUx; Sat,  4 Nov 2023 20:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F0260D71;
	Sat,  4 Nov 2023 20:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F0260D71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E93C1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B0FC60D71
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0FC60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as8S5SI2S3ny for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:43:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34858607D0
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34858607D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C402240005;
 Sat,  4 Nov 2023 20:43:11 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:43:10 +0100
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20231104214310.176ffba7@windsurf>
In-Reply-To: <20231004065835.2190872-1-laurent@vivier.eu>
References: <20231004065835.2190872-1-laurent@vivier.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIL9zyhwE6yAMffAtiTrNwvg+eM1aoajTQZmztPISvQ=;
 b=QQUogES8Y/vJA4XYsK2gVTyauVtBepyB4jel1nuKKTmpbykHnk2TbT1a/fG66+aBARckPb
 9N8//50PwJpiRiQcrDpUT4pczTocVnqHrsQc4galqFXx07LvlL1BS9e+yU3hsL3oSjWl7Z
 bK5fZxIBETwcsFCZ47xtbpm1Wv/eqH3hFTKfZv0Nk8M5fRNwheCitvVPVw7hhWMvvn5cgg
 ATILObc8+xicrI5aqxoLesEkk7q87X6smJFXP6wFhc7ed62wTpAfpsClVlq0d6GkJKIyUT
 zTVHCo4QpIrR5DkMb6VAFXyYLG+VWhrXN5Si+lS2RO841L0pZ/d4c8zUFwlKLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QQUogES8
Subject: Re: [Buildroot] [PATCH] package/petitboot: bump to version 1.14
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
Cc: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 08:58:35 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  package/petitboot/petitboot.hash | 2 +-
>  package/petitboot/petitboot.mk   | 2 +-
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
