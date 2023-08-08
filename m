Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D571C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2560340C2A;
	Tue,  8 Aug 2023 16:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2560340C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMQZnn5ZH7CM; Tue,  8 Aug 2023 16:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63A6940C1B;
	Tue,  8 Aug 2023 16:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A6940C1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2411BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D379D813C4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D379D813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-yjKXeOHiX2 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:48:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A983881393
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A983881393
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B2A7C0003;
 Tue,  8 Aug 2023 16:48:39 +0000 (UTC)
Date: Tue, 8 Aug 2023 18:48:38 +0200
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20230808184838.0005daf4@windsurf>
In-Reply-To: <20230808151103.5597-1-paguilar@paguilar.org>
References: <20230808151103.5597-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691513319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCwrv1dLRd7pIc9jif+SH5b8Sc/Zrcs1yFTL2VWFep4=;
 b=Pm7MV3u8f/Ok7OvuZ2wIhHEqP5yUM7FFUndKHWQ3xNfQmBDOoOZ4jdCc/oM+MTCKI087TR
 d3dUuKxlFhsZA9/ROMloX9PuP9avxzlNOk0uumYCGzelvB31VkHCjfGBQm9Ny4ZmsdkaM7
 e7G4pBKqWDGDQMFzK8zeXCIxJEOy3badIW1gwS+bvepG6Z1+NdYooLugFBC1xPkNhOKxgq
 gUHcynmYwv7uWTqwM0JhCL6AfE89fXqR3jojKawWc0ysGnfgpJHQWluh/lvWBDHlfGCJFX
 MEl+/DsowsmF1VpF0WI5rvP3qj34cjiYraMzupWpJlS7wsPr1E7WRXOlJFxC0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pm7MV3u8
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: Bump to version 8.2.4
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

On Tue,  8 Aug 2023 17:11:03 +0200
Pedro Aguilar <paguilar@paguilar.org> wrote:

> Release notes: https://github.com/ivmai/bdwgc/releases/tag/v8.2.4
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/bdwgc/bdwgc.hash | 2 +-
>  package/bdwgc/bdwgc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
