Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014CC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1A25436D6;
	Fri,  5 Jan 2024 12:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A25436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqEQZsRI0ZWD; Fri,  5 Jan 2024 12:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7028E436F1;
	Fri,  5 Jan 2024 12:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7028E436F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2B71BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F7A41F9B
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F7A41F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHss5nrJCc7c for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:49:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE08241F9A
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE08241F9A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19AEE1BF208;
 Fri,  5 Jan 2024 12:49:44 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:49:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105134944.52f8413a@windsurf>
In-Reply-To: <20240103071141.6147-1-bernd@kuhls.net>
References: <20240103071141.6147-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+cwlDkMpvl64nMJyC6gxWdl7pDj2aGfjQFln2z50gc=;
 b=WxXKGk8IuXh6ODSOrZYu/VcgNYDwNbuJ9E2VtrUbyVFHoNhjPlB9OQs/4Okx1iTpb+1Sey
 Oh+zeg+PtJBIjUai7DcEQWItNPGQ5KwfynrFpZ3CHZ9LObekkQ7nW6fGPF/eW8xFziR5Wy
 kzhBpBtNrcHPMCoSHlh1Lf1mTpomz0+veA0Z8kDPDMahiIC7BqHkYK9I0a9LS6aeJ7b5lC
 FnMwEYtXlYMPvow4S3T3nNh6hU3+9KMqC2UvvMPjpMwDOawhD/pzGoDHWQNHX28gNE4u8g
 +3q1ewwJ+1iY+NwyEH9upSuoV5WiakZ3Edz5Eosh78Bx9GR3AUryWtfQaTH5gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WxXKGk8I
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.119
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

On Wed,  3 Jan 2024 08:11:41 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-December/003438.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
