Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7822AE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DD083E07;
	Sat, 30 Sep 2023 12:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01DD083E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOhgD9QEtvbj; Sat, 30 Sep 2023 12:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377A783DFA;
	Sat, 30 Sep 2023 12:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 377A783DFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 367981BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA4C83DF7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA4C83DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkFBzZSEqNv8 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:42:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7287F83DF2
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 12:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7287F83DF2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38BA020003;
 Sat, 30 Sep 2023 12:42:41 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:42:40 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230930144240.6b7b793c@windsurf>
In-Reply-To: <20221002082651.29673-1-guillaume.bressaix@gmail.com>
References: <20221002082651.29673-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696077761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcTvbAlJrSWjFhUgEbZLtMdrcuTADW+84OezS5U6hFs=;
 b=Y9YD8E3LQsk7fOZxrK0C4eBBv85RnaKCD+NQn3Mva3g9Y5GuEmX+oBNnDR4aNv3o7PHIHu
 Ds/ADP5XznDZB/Xr3szu+r5HZt16gfF4pE3B0J8OxrA9zCyQJJhVsA1sOk9qFrSCKWo9mP
 +1FQP6cyblmDJ58kqFe+r/J01gPZ0yvqVFa5tDGyvrWu01f0+Zf8wZGhwomgohuIy3pj50
 FrBdF7IX3PrlL18qEJGMSxzeqH2TqGw4VDiZdDr0elW7diAoFT7qVO9DH5GKqYOiuqNIt1
 9NGz/x+yzHv512K9rFC6eTK/rqMIOcGZYpr2G+x1OZoVdbKgg949TveNk/9teA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y9YD8E3L
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-scipy: bump version
 to 1.9.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Oct 2022 10:26:51 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> scipy.tar.xz is no longer released.
> 
> A new "python.h" missing header build time failure arised,
> it is fixed with a new -I cflag.
> 
> New runtime/linking errors appeared on architectures that need
> libatomic, an -latomic linker flag solves them
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> 
> ---
> Scipy is expected to move to a meson build infrastructure
> by the next release
> Once 1.9.2 is out, we know we already have my V3-1.9.1 patch
> serie that builds "fine" with meson, it involved a minor tweak
> (hopefuly solved by this time). The test script no longer did pass though,
> this serie is not 100% ready to go
> ---
>  package/python-scipy/python-scipy.hash |  2 +-
>  package/python-scipy/python-scipy.mk   | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)

Thanks Guillaume for the patch, and sorry for the very long delay. In
the mean time, James has posted a more recent update, which uses the
meson infrastructure, so we've applied that as commit
42127f01bc08211e1dbba2cac7425488dee7dc3a.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
