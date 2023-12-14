Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF29C4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0267783BE3;
	Thu, 14 Dec 2023 07:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0267783BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7gPm7YTI3CA; Thu, 14 Dec 2023 07:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6081C83BE0;
	Thu, 14 Dec 2023 07:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6081C83BE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5361BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F9FB4091F
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F9FB4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yL2TJnytQzfY for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:48:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D609240917
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D609240917
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF8C76000A;
 Thu, 14 Dec 2023 07:48:07 +0000 (UTC)
Date: Thu, 14 Dec 2023 08:48:06 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231214084806.329afc53@windsurf>
In-Reply-To: <CH2PR12MB5004A76EDFB561312927A1D4F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <CH2PR12MB5004A76EDFB561312927A1D4F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702540088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uo8z32Xp/NQScYutDVOftk1/ge4wLvYS1gWf453KaeY=;
 b=IyvBa1l2u6AmI8ou5j0gFZZST85jZV03vGBTjF3VDQyhsogd1d4hvUhCcvdHQbKhONUX5D
 AA5ObP9qMbsLfWANPOsmQKR9O7x2rQnInI/ZnFd2nXxH+1CDOKzM/9C20qfDt9GX915hxN
 xOFPBMLxO9pIlWyNb7hRKi5yyx04avoQNdDTGOzXo+XeZZ+IqbLWcD/iZiXdXoqoCC3L5k
 5/fpuuTzvebHX+cie20d3Scmu2kX8zVwQ24X/sF8QiXLPazrTuH3kHtwMZHj6430Bf+wXh
 gkIudzbRoKQdYV+Z2uboUNcIBrI3qkeaSBywk3wsaq9FIznI4AbPtXMGPHiLgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IyvBa1l2
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Dec 2023 07:10:39 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I just made a patch which removes my post install fixup with the
> newlib configure script patch.
> 
> Below you can find a pull request to apply it to your bare-metal
> branch: https://github.com/tpetazzoni/buildroot/pull/1

As replied to another e-mail, the newlib patch will have to be improved
to make tooldir configurable, as I don't think your patch can be
acceptable as-is in newlib, as it would break things for existing users.

Also, the way your formatted the patch is not correct: you have made
yourself the author of the patch, but you kept the original author of
the patch as the first Signed-off-by. Golden rule: the patch author
must *always* match the first Signed-off-by line.

So here two options:

- You want to keep the original author: he must appear as From: and
  first Signed-off-by, you add your Signed-off-by after, to indicate
  that you're conveying the patch

- You want to make yourself the author because you made substantial
  changes: you must appear as From: and first Signed-off-by, and then
  you can put a Co-Developed-By: or something like that to credit the
  original author.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
