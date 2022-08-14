Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C5C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EB41404ED;
	Sun, 14 Aug 2022 10:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EB41404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Il8_mZEeU5uM; Sun, 14 Aug 2022 10:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A8BD400D8;
	Sun, 14 Aug 2022 10:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A8BD400D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5D61BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBEB34109B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBEB34109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cFsCSpRqnyi for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:07:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F155409BC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F155409BC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:07:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B808240006;
 Sun, 14 Aug 2022 10:07:03 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:07:02 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20220814120702.22061ebc@windsurf>
In-Reply-To: <20220812145652.24342-2-nicolas.cavallari@green-communications.fr>
References: <20220812145652.24342-1-nicolas.cavallari@green-communications.fr>
 <20220812145652.24342-2-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660471623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFdD5shW5n4ryKW1YZFQt2bI582ItpsfJubMShjDUko=;
 b=hrmCdq7XixAjd7Hsom73tMC1vIwwgQy+2UrHVB8ljc1DdQBpnYzpmPuUTPRx4qbw4bgQsP
 r+285/JzilovL6t93aI1qjwYYQVpGTxW9XWoFHWgeWYpyJcMRJ/qq4faW1H4MHtk1PXfgI
 TQg8fkgXy3bcwkP4yp1C1hXV3LPSWSkhjLgn7d4wo8pPbNwJYWYA4poX6y/9UezeIaxi9g
 1JyckKqWOC+CN0ktFMILBMg+FCCNJ5XuDGsv07UfV+PNDfEOANsPqClyOcy7NravwXOnCZ
 vVXaBNIlKpejRkB9TAilCOWCyplAwFuIP4kfGJz9Q5VeFpCX2RQvNPaGxQRN9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hrmCdq7X
Subject: Re: [Buildroot] [PATCH v3 2/2] package/libgit2: bump to 1.5.0
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

On Fri, 12 Aug 2022 16:56:52 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> It includes an option to build a command line program that can be used
> to replace git in simple cases.
> 
> The upcoming sha256 repository support made them steal the sha256 code
> from RFC6234, hence the license change.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> ---
> v2 -> v3: link executable with -latomic
> Tested with test-pkg on top of af972178b

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
