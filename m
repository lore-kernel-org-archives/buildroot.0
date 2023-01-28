Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E29FC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4156D81E9F;
	Sat, 28 Jan 2023 21:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4156D81E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3p2YTQG4L_RY; Sat, 28 Jan 2023 21:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7147D81E06;
	Sat, 28 Jan 2023 21:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7147D81E06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78CA31BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5282541703
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5282541703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hpGsW4eUPpL for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:24:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BAB41688
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04BAB41688
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:24:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 231D220003;
 Sat, 28 Jan 2023 21:24:02 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:24:02 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230128222402.67f81606@windsurf>
In-Reply-To: <20230124184243.7351-1-heiko.thiery@gmail.com>
References: <20230124184243.7351-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674941043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVSZZrdib8nt5oqRWCuAUkeq+1GBlzWYJ0WblOB3vnk=;
 b=KqEx37q84pZdec2kp/Ua+x33L1nLaRDISV93vxSrcAT14pq1VCbfhGOalRugphjBlqU1Jy
 WmOLQjGTFJ4o7kMI75xQNHoqpVHJA10tvggxbiuiuetdVRPQCPDEAK03r3YdX5Gsb3MIr/
 2JSyALvZCSQ2Ele4PzeEJOgKyX8dVH2dUjHhssFSXPS/RXl+MrR17yuA/62Q0Yo8kpZ+f7
 qE8UWmtBQIslxpzr5ET3dBfPp3Af6I8/HpHY1us2mfYRIKfKnRUtn+OX3atf57AJAwIdNi
 T7o4mGoasg7hQ2z9/60q3Cfo3QYxzE3hIUyVhhsbtupFW7UQmhSqfmLyEcGFDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KqEx37q8
Subject: Re: [Buildroot] [PATCH] package/mobile-broadband-provider-info:
 bump version to 20221107
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

On Tue, 24 Jan 2023 19:42:44 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  .../mobile-broadband-provider-info.hash                       | 4 ++--
>  .../mobile-broadband-provider-info.mk                         | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
