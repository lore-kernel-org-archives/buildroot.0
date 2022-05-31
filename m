Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AEBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 14:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB9484121;
	Tue, 31 May 2022 14:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEI5zRL651Ua; Tue, 31 May 2022 14:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3DE840D7;
	Tue, 31 May 2022 14:40:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBBB81BF4E2
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 14:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A937040D35
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 14:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBINjebvUjf3 for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 14:40:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 907FE40CE4
 for <buildroot@buildroot.org>; Tue, 31 May 2022 14:40:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC54A240007;
 Tue, 31 May 2022 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654008049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joUgBFtSE/K3OE92Pqdf/ESGzR6FPR9TcZPy8491w4Q=;
 b=VRYMoF+jT8OwjeoSFQ672ryeLgvRjIP3Pl2F7WCFfdYD1yPRkZ9QyyXYaEG1vbZmWG+YzG
 im2GGnI85XJ65Qu2gwvCjA3xZko7FP8zHymLh9sv8rIQUcDbvAaTVkkD/lYw9UTmIETPGf
 eNfUqv1psKSaNUeRjeJ1TeJaDbMyyYwDF7lhwwSye0smQ4svfTMODnWBpoSOem9Iw1aEm6
 VIXMWb5rGZ11sfOihzmqM5AF5OURImPZok0OqBGwKjxivKkfqRFr5UJ4EI/S2DmROZXTGA
 G1Rc5olNExtMMfMjf/oU54Om7ABfFe7U7EAuOjWVIfES4Zk+5aUbdeOdcVx67A==
Date: Tue, 31 May 2022 16:40:46 +0200
To: kory.maincent@bootlin.com
Message-ID: <20220531164046.1b0c6429@windsurf>
In-Reply-To: <20220531143502.464179-1-kory.maincent@bootlin.com>
References: <20220531143502.464179-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package: Rename and update
 arm-gnu-a-toolchain to arm-gnu-toolchain
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
Cc: sunil@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 31 May 2022 16:35:02 +0200
kory.maincent@bootlin.com wrote:

> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> arm-gnu-a-toolchain is now deprecated to be replaced by arm-gnu-toolchain.
> This patch rename the package and update to the new version.
> It also update TF-A package that depends on it.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Perhaps we could point to:

  https://developer.arm.com/downloads/-/gnu-a
  https://developer.arm.com/downloads/-/gnu-rm

that indicate that these toolchains are deprecated, and both pages
point to the same toolchain:

  https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain

as being the replacement.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
