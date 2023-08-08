Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04651C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B11E24044A;
	Tue,  8 Aug 2023 16:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B11E24044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxvhO8i7fN1I; Tue,  8 Aug 2023 16:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E722F40C1B;
	Tue,  8 Aug 2023 16:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E722F40C1B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B91E61BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9973040348
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9973040348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QEvtUJvKmTk for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:48:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DDF440347
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDF440347
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1952760008;
 Tue,  8 Aug 2023 16:48:42 +0000 (UTC)
Date: Tue, 8 Aug 2023 18:48:42 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230808184842.67ee8f0b@windsurf>
In-Reply-To: <20230808162027.100470-1-zgyarmati@zgyarmati.de>
References: <20230808162027.100470-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691513323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnTfhsLhYPOgfi4VDbN4KrK05PhSJUVNwC9oynIAIQA=;
 b=IOnwXARlhw/j6SCEChmVYi06KM3lKu5cmiBY2TouDmV6Ukfrgmavrk+PzKtLAv6Z6tE7iU
 QuPa84mNX14ZIpI/1JNvIYqmkYj/eSrRUiO7ya0GqmMVxe/VIYQRvVpuOXE/+Sp4/B86qe
 8pvEaV4hGf2DhYK2evHDosgBM7OwxkBWuYbQhnm/qFdvh+7YOZ553VWVGYGRARAVcsTTEo
 RCU4uEi/kEsTU/XaH5yhMBhS0453MZXeALtWYLUZtqVi2jMBJsmRJMwkI75/G7KMUIN1rj
 4EMBbbK3fmkF+NQOjCzieUBq/lnY7SybB+Ft1md7fr4yRpq2f6pICDWVU6Dcdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IOnwXARl
Subject: Re: [Buildroot] [PATCH 1/1] package/quazip: bump to 1.4
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

On Tue,  8 Aug 2023 18:20:27 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/quazip/quazip.hash | 2 +-
>  package/quazip/quazip.mk   | 2 +-
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
