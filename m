Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFDDC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 347184060C;
	Tue,  8 Aug 2023 17:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 347184060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oz_7ursRXXUe; Tue,  8 Aug 2023 17:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FAF40613;
	Tue,  8 Aug 2023 17:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FAF40613
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 892941BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C5AF40951
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C5AF40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRt_NsmxLaeP for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:27:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45DD640948
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45DD640948
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CBFC0003;
 Tue,  8 Aug 2023 17:27:24 +0000 (UTC)
Date: Tue, 8 Aug 2023 19:27:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230808192724.2600df8f@windsurf>
In-Reply-To: <20230808064107.29318-2-bernd@kuhls.net>
References: <20230808064107.29318-1-bernd@kuhls.net>
 <20230808064107.29318-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691515645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64ZQ/+MlhwghsJpx8OZb0rs1wCxdBNfRRSJZTGK/iGw=;
 b=lkJ2+cDKjB+cr2s8ZG5Bn6WUhEnMYM8pS+m9TeJFA/ExZ4uQ076fKqcwx8Hm/bfxgRZGGb
 QNHElY0TxSywIxPIlwOAox03amFlqwwnO6e+++5VO4P1lAyqmSiT+mzeC/SeK/Zn0//GSZ
 A6Hvo2CjhUvOXBSf0E9wFa8JEt9Y9yuXmiMEiHUp5y739uEn0/Ez3iFSA+S4AJ1srZT35e
 1YzkU84d8dVifz8w6Lot6I195PAfiZx6BmImg0OS4wiOqiiqdEYpF1CkeIk8iwgXGny1rQ
 8rz87zEQjOdZRLQN1Zha4ls/TEjImJjVchyN9l6Z4WG5TUP8valm0WdkfVPyXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lkJ2+cDK
Subject: Re: [Buildroot] [PATCH/next v4 2/2] package/onevpl-intel-gpu: new
 package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 08:41:07 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v4: bump to 23.3.1
> v3: bump to 23.3.0
> v2: bump to 23.2.4

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
