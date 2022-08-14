Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A67C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0A240474;
	Sun, 14 Aug 2022 10:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0A240474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unxGwi1pcYfa; Sun, 14 Aug 2022 10:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CA14024B;
	Sun, 14 Aug 2022 10:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CA14024B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9A91BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ACD660A8A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACD660A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a96jlTK1xa3h for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:29:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A7F608B7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A7F608B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:29:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5AC881C0003;
 Sun, 14 Aug 2022 10:29:54 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:29:53 +0200
To: Alistair Francis <alistair@alistair23.me>
Message-ID: <20220814122953.75fb9f0c@windsurf>
In-Reply-To: <20220812111651.329130-1-alistair@alistair23.me>
References: <20220812111651.329130-1-alistair@alistair23.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qajr8dzGyatWlhOVDJNm65PbwG7jYvbqPeeB3zDKvAQ=;
 b=k4WNa2H5pGuzqRje5tExxvuCdfTNRTuV3RODN/suvFn48hyese6Milit+d9IXlBk2E47ai
 /fgNplQtdUFz+atd/M5HxMkMFTrRRFgYZWe833CxXCOJAbe+lHWRd7UWDHbYVUTLAFAOtV
 mpZvn5kxkp2OzHK6NzA30/su95cZKB6vZPZS3VhEGoj2SDwYxy4WfG8RZK14xcinISkpyB
 UhWgjELMpmeq4FvhE5axxstx9eb7fENutP+eN8mZVG9ssKY5jEytM4bKNA4JvFw/HAjD5w
 bAGhs6O8uQauyQtGf68jk3RO4KjRMGKw0RJl2acWdUdPcN/jTMxSU//A7Oi4Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k4WNa2H5
Subject: Re: [Buildroot] [PATCH v2] pine64_sopine_defconfig: Use mainline ATF
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 21:16:51 +1000
Alistair Francis <alistair@alistair23.me> wrote:

> Use the mainline ATF as it supports the Pine64 SoPine module.
> 
> Fixes:
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  configs/pine64_sopine_defconfig | 7 +++----
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
