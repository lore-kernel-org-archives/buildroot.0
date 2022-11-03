Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 10:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A57D60FA8;
	Thu,  3 Nov 2022 10:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A57D60FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59ow1u4PzmsP; Thu,  3 Nov 2022 10:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466FF60FA3;
	Thu,  3 Nov 2022 10:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466FF60FA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60F4D1BF317
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4984F81F07
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4984F81F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMTOQ378KuzN for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 10:56:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1842A81F02
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1842A81F02
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 10:56:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D8E860011;
 Thu,  3 Nov 2022 10:56:45 +0000 (UTC)
Date: Thu, 3 Nov 2022 11:56:44 +0100
To: Da Xue <da@lessconfused.com>
Message-ID: <20221103115644.4d6abe5c@windsurf>
In-Reply-To: <CACdvmAh_sHZ3xwmhBa332f5Pg_9c=ZL5BxWbZO3tHn=mRDJJ7g@mail.gmail.com>
References: <20221102201858.555294-1-thomas.petazzoni@bootlin.com>
 <20221102201858.555294-2-thomas.petazzoni@bootlin.com>
 <CACdvmAh_sHZ3xwmhBa332f5Pg_9c=ZL5BxWbZO3tHn=mRDJJ7g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667473008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bS+Jm7OjPyqcL5nSk5gBbFq8ZmRebLgSmusL/nijQS4=;
 b=EqgbZa4900zQ6ldmH1pqkSyCenCYuF0vtHDpcaOAQlGc8WfKcnAnC7yxhm/m+EC0apKBMC
 iMx2QiwWchvGCOdHW0fGdiFpkAYmveIw5cv5TooooUh2ZWUSVm39+ri1Nkt6dPcap2NjV8
 xImsr7/NzprysshlhwJY2ahuQpmX/IJfZ0SeNz5evQUnJV1JHCChqS1qPG77Yv0eiAQXmr
 lZ88o7rBXHyHx3uL6Iihm/UAevjid4ivTV363A8y7XHI1Jdyn/DegPd8OHEl4IMAcm1GBw
 mGxeeZk/oK38OaNse5bxUbJY1wLQH6ojHIMs9ikKap9bEbMMmf76ukNlz68olQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EqgbZa49
Subject: Re: [Buildroot] [PATCH 1/3] configs/roc_pc_rk3399: remove defconfig
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
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Da,

On Wed, 2 Nov 2022 20:03:51 -0400
Da Xue <da@lessconfused.com> wrote:

> This is a Libre Computer only product in the future so the folder is wrong.
> I will re-create in the right folder and maintain these boards in the
> future.

Thanks for your feedback. Should we in the mean time remove the
existing defconfig? Or will you send a patch to fix it up, and rename
what needs to be renamed?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
