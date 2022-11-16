Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C635C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 07:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDD0540480;
	Wed, 16 Nov 2022 07:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD0540480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NRMxBRfaoYT; Wed, 16 Nov 2022 07:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D2B40292;
	Wed, 16 Nov 2022 07:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D2B40292
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8CAA1BF2AA
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1C881AA7
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1C881AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRg8lPbCeDV2 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 07:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD0D819ED
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DD0D819ED
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 07:54:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A47224000B;
 Wed, 16 Nov 2022 07:54:28 +0000 (UTC)
Date: Wed, 16 Nov 2022 08:54:27 +0100
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20221116085427.3525bbcc@windsurf>
In-Reply-To: <20221115235235.74897-2-abrodkin@synopsys.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
 <20221115235235.74897-2-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668585270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iltupdb3HkiyA1Xmy3+aPt7cyWftm4eYUS39NYfWa0c=;
 b=feI4LsO1Db3SNGKep6FMiMlcb+lNDl/PbEh1KT+XS06Cmd/OIammqQECrV+IOIRZS5+hCV
 MYBT4EG9i/jc7Zviw8sxOv0pQDGMf1rdHGkaILyNlT40tzZFJh556U1o4lH/RolE6PKmjE
 l0pCRLzYkV98Hq6hVWfctWfMXMevxFrQn4Z+QyDqS53CoSY2UjEdEXq6AQoefg+/I7xkcB
 p7Zg/+ByHro4rc33rW/QTjq2/LDH/Pj/cTLifQK6bY0M0k0GiUvS+VSdjUXUxaQ+PcwUEO
 amqq75pNpXDgNqXxRLZzaiMprxG3sGV05C7+6k97dKjrSz5Crzv8d4YpICnH8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=feI4LsO1
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: add support for ARC700
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
Cc: Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 00:52:34 +0100
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
> 
> Even though ARC700 glibc port is very close to ARCv2 port, it is formally
> another ABI that requires appropriate maintenance. That includes running
> extensive glibc test-suite and fixing discovered issues and regressions.
> That effort was considered impractical due to ARCompact ISA reaching EOL.
> Besides ARC700 processors are usually found on very resource constrained
> devices that tend to use uClibc if they run Linux.
> 
> On the other hand adding ARC700 glibc support still can be useful for
> development and testing purposes. This commit adds two glibc patches
> that enable ARC700 support.

Hmm, this commit only adds one patch. Also, what is the upstream status
of this patch? In order to make sure we can easily update glibc, I'm
not too fan to have patches that are not upstream.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
