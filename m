Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236DAECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE9D40529;
	Mon, 31 Oct 2022 14:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE9D40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8AqCt--cafV; Mon, 31 Oct 2022 14:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F00D3404E0;
	Mon, 31 Oct 2022 14:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00D3404E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E31B11BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE4E8400F3
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4E8400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nla5hbGPPhwK for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:43:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B11400EF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B11400EF
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:43:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 841754000E;
 Mon, 31 Oct 2022 14:43:29 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:43:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031154328.36373f6b@windsurf>
In-Reply-To: <20221022211858.166130-1-fontaine.fabrice@gmail.com>
References: <20221022211858.166130-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667227410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmTjBToH+0/qtGiiPoCBbq/ZdBhMglXpp3nvZyS3fOg=;
 b=mzDdYv/s3udTLc8x2oPF2z35Rrs5WyFJuwaAQtXDeMwLy8sh5sdB9u0vd5rj5g0VgPdwDF
 Zjf2zOZ4DGDwwBSUm1nTR2YAgqpgAcgPsKHU/KyFREsYdb1Gfa9VJVjxjXpxpW6PcwlQNF
 oUoPwAY1CTURVJmx36PwUL7ILJ0euYIj+AGXiQNqVArqvd9qgqsgi5R00ItSHrK2HmK43T
 FnAOjnAiNY6SS2dNADJV0IReBXf5AcBV8IQvvk+j30ZWAe9LxyZzK/iWJrkEiQApanIXuC
 asesbwe9JASfbNskRLdQHgHOM1Ov5cs0MPSuRdQfytMvOfVWK/8zvzABPj5HLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mzDdYv/s
Subject: Re: [Buildroot] [PATCH 1/1] package/stress: bump to version 1.0.5
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

On Sat, 22 Oct 2022 23:18:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch to an active fork:
> 
> "The original stress went unmaintained; the source of the last version,
> 1.0.4, was imported from Debian. After, patches from Debian and other
> changes were applied to create the 1.0.5 release. The details of each
> release are registered in the ChangeLog file. Now, stress is maintained
> by volunteers under Resurrecting Open Source Projects."
> 
> https://github.com/resurrecting-open-source-projects/stress/blob/1.0.5/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stress/Config.in   | 2 +-
>  package/stress/stress.hash | 3 +--
>  package/stress/stress.mk   | 6 ++++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

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
