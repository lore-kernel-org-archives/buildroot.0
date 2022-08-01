Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C7C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D4244056C;
	Mon,  1 Aug 2022 18:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D4244056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TScTMP_VvqkK; Mon,  1 Aug 2022 18:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1526740116;
	Mon,  1 Aug 2022 18:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1526740116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 845BF1BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5129C81396
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5129C81396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWyghBignZKH for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:55:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EA8A8138B
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EA8A8138B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:55:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81496200004;
 Mon,  1 Aug 2022 18:55:53 +0000 (UTC)
Date: Mon, 1 Aug 2022 20:55:52 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801205552.20a46fa2@windsurf>
In-Reply-To: <eb4cf15f-6e4d-43ca-f34d-a391044f430e@t-online.de>
References: <20220731111240.12145-1-bernd.kuhls@t-online.de>
 <eb4cf15f-6e4d-43ca-f34d-a391044f430e@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659380154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sjN2f+ZQLEKJDR0nU4+c3qcp+ekB8Du8wCUQBWJrJI=;
 b=DiWSuMd/6MiFB7aufFF1s/ikeogjyXyVLHY42o0Lo+xaH+bMBz/gRqmkG3PVhjuLo+NdG7
 N92U9OEldNxC5rP9KWW6liKnqbdXUnuVVOysG+xxaBRbQlYxM4yruJUBuY/mfWTd3j5HGy
 IEqgWaDKhtV4Cnj17Qf5eDsovIc+wZOGG2MqtLHZeSgFDeeZXUILql7dvkA0u9goGsoMhJ
 ezghRjWCJzeoC5N2RCUWV+3fJPRGretL6EnM3V7Tqi05q+vYE5TOgqXC9nx7w9HTTnhGfv
 IEl4ehidBUD68IEm2jytWy9BqQJToFxIDzi8lGUViYK+zNtaSshr3139D+QpjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DiWSuMd/
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon, 1 Aug 2022 20:05:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> my understanding of the CVE/CPE stuff is rather limited but I guess 
> these CPEs show up for us because the database entry does not contain 
> any version number:
> 
> cpe:2.3:a:apache:http_server:-:*:*:*:*:*:*:*
> 
> What about ignoring such version-less entries in buildroot?
> 
> Thomas suggested to get the NIST database fixed:
> https://lists.buildroot.org/pipermail/buildroot/2022-August/648210.html
> 
> but these entries can show up again and again... And providing proof 
> that a disputed entry from 2007 should be removed from their database is 
> beyond my capabilities...

Not really, you just have to e-mail nvd@nist.gov, and provide some
evidence that the issue has been fixed in commit XYZ, which was merged
in release ABC.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
