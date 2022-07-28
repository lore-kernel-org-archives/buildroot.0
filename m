Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CBCC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0C78128F;
	Thu, 28 Jul 2022 21:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0C78128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxTsCvCuZavD; Thu, 28 Jul 2022 21:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D8B80D9A;
	Thu, 28 Jul 2022 21:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D8B80D9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3483D1BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D05340327
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D05340327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCjKiu7fSjIF for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0598D402F2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0598D402F2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9BB841C0008;
 Thu, 28 Jul 2022 20:59:44 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:59:43 +0200
To: John Keeping <john@metanate.com>
Message-ID: <20220728225943.5ec6944e@windsurf>
In-Reply-To: <20220728175036.3262606-1-john@metanate.com>
References: <20220728175036.3262606-1-john@metanate.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+SlUBMPa2xC+yKuWqFxH4JPZL/r/nesillQrU4zqzc=;
 b=c2IRWCxScJg1UqqBig2NEEhWNq3nZol7pdOWFZRUWc3VgvBuJPVr6IVsUI7G2fEbosPKUu
 R/4gPU0jzKv+8jW7AtE6XP4eO0LqBI7GrujAdCzACaqlsMQ5eqEKPWQb+wKxumrPee8CX9
 EIKGdVR5PL+l06fy2lWxjJzVDvCt8QwcrRXnb3QpQur5UKQGmFWgwTcMZ3Zv8FJxLW+fag
 n1fQjxNMCFSm/k0sksguxzfDDTlStdK3fSN/kjMRK/8fY/8nA4YMPkWyzwSCY3gyMotxEu
 YaK65WjB/bzZhp5xXg8hUH2d/1ZaP4sXuCKay9aSpTfmOZFMd3dCc7mD0pnV6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c2IRWCxS
Subject: Re: [Buildroot] [PATCH] package/connman: add an option to disable
 stats generation
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 18:50:36 +0100
John Keeping <john@metanate.com> wrote:

> By default connman periodically saves network interface statistics into
> an mmap'd round robin file.  These are not accessible over the D-Bus
> interface and the only method to interact with this is ResetCounters()
> which is marked as experimental.
> 
> Continually writing statistics will increase drive wear and may not be
> desirable in some devices with limited flash erase cycles, so add an
> option to disable this.  Statistics are enabled by default to avoid
> changing the behaviour of existing configs.

Based on this description, I have chosen to not make it "default y". It
is unlikely that it is useful to anybody, and seems potentially
problematic.

So applied, after removing the "default y".

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
