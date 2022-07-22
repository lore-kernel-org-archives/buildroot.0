Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC814C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39C0740AA2;
	Fri, 22 Jul 2022 20:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C0740AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-p6utFgyZRx; Fri, 22 Jul 2022 20:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FAB840164;
	Fri, 22 Jul 2022 20:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FAB840164
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CEBB1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6565F8468F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6565F8468F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1G2nO4pVNl2 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:41:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2C584672
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA2C584672
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:41:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60C6E1BF203;
 Fri, 22 Jul 2022 20:41:15 +0000 (UTC)
Date: Fri, 22 Jul 2022 22:41:14 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220722224114.24c1aeaa@windsurf>
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658522476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVg6gVbwMTQ8M7XajQyJkAYiOETIDGY7QwvQ06nThvQ=;
 b=KZsafI2yo3SElMVmhFFzgsbPnryxQs7FiwxGaQd2SE5KdCbj9I2wlGAzF02I4ZtWL0ytnU
 PNk15Bot10efJjg0RjvJ/ZvKULe+4zEA8soEvKMshA1Csa3S3jsFw0uasZ1c+g1F5tHfk7
 eK54tAGBQZGvN8QMlyR3tn+s7qfeqkc/KUKJpyf+4inSD3xq5J4rARQ/3mFk9eMYcCAYxv
 YgMS917QUohZMmV/3RnM3tP9XeWxj3JuNouAcwgN4LMpoTQnS37cFjiKnILcSbiK/excb/
 x8HCXHf768Wg3MGAREUyh8goXduBHC04KdkMEWAaLJtKX0ymqgIcnUmpuoNNOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KZsafI2y
Subject: Re: [Buildroot] [PATCH 00/16] Use single letter notation in
 genimage.cfg files for partition-type-uuid
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun,  6 Feb 2022 21:05:16 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This patchset convert partition-type-uuid to single letter notation
> *without* "".

I have sent a new iteration of this series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=310888

which makes some slightly different choices, after discussion with
Arnout. Feedback welcome.

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
