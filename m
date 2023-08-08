Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA9DC001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2897B8212C;
	Tue,  8 Aug 2023 22:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2897B8212C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_TN3N0IESm3; Tue,  8 Aug 2023 22:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6917182127;
	Tue,  8 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6917182127
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A7F1BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 583DF4175E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583DF4175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cV6ZXDgbIdD for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:19:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11D4440987
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D4440987
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28C5CE0003;
 Tue,  8 Aug 2023 22:19:14 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:19:13 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230809001913.0695be0b@windsurf>
In-Reply-To: <20230808184809.4470-1-dalang@gmx.at>
References: <20230808184809.4470-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691533154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xkw86QN0TtwIwuNAtKxFPWWUucYQ9WnLdOr7KpN2zzs=;
 b=niQRtMKXKixqRGcHO3iW50PQIlcFG2GEKqiODJcRb1wv8QW1N2lX0tKcFdGCFGHfZbLpx+
 1Fca7QtqUnzO2/252fK7CskRKjg0qhl9szRplaUywT3pG4IU1FJEvbPMKbztfvGHzYNbJI
 ohtdX7iWB+s/BxLvRah+taDwPbkuwJo0QbnmlNB4b0QlvkjOyCwX6jglOB4Sv8uto/SOVl
 PUuFBhFgrFFP++nzIFTzvjqG3TDFKpgOes99LBPEIlNVU8jvzoHMoXZAV2HtkhrZlGwsID
 j0zWm9BVT8w4t+jtrnnptOkOGEKmbpnn/ZyuBZsCGU/Oou6mTuwZofzN3Jx3ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=niQRtMKX
Subject: Re: [Buildroot] [PATCH] package/log4cxx: add CPE ID
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

On Tue,  8 Aug 2023 20:48:08 +0200
Daniel Lang <dalang@gmx.at> wrote:

> apache:log4cxx is a valid CPE ID:
> https://nvd.nist.gov/products/cpe/detail/BFD3FB55-EE37-4297-BB3F-DD0A051DAD65?namingFormat=2.3&orderBy=CPEURI&keyword=log4cxx&status=FINAL
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/log4cxx/log4cxx.mk | 1 +
>  1 file changed, 1 insertion(+)

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
