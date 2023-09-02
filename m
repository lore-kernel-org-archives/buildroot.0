Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25C5CA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9313405D3;
	Sat,  2 Sep 2023 07:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9313405D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6MYCACIj-RO; Sat,  2 Sep 2023 07:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09FC1405C4;
	Sat,  2 Sep 2023 07:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09FC1405C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D1C1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D59D9814B3
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59D9814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JTHLlXh-GR4 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A7D81496
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 07:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A7D81496
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50476E0003;
 Sat,  2 Sep 2023 07:39:10 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:39:09 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230902093909.2a500f68@windsurf>
In-Reply-To: <20230902070901.724634-1-francois.perrad@gadz.org>
References: <20230902070901.724634-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjrCnBx6W+llyVChZKSWFZni7PSU6RgS5iyK7JdHHrc=;
 b=GWGk6GD6P/+RjkQFaZTGq+V3UV3t9CP4S9b4zKLW9j/S+xCq6mb6UrYjsJQGHgC13Ki7Fl
 AzXtVc4qmsGivVojoPbxAbF3OMFTYEg5JecBwz0EYDEprkt8tsp+E2mZ9hyrYlI66Yg+aQ
 LHEsckdc4TdRAzEew7XGR5awAGL1vbwRdJak+JGp7cNIIMqxWSh8igTbs4kva907Q7H3aX
 o6Kga20FsYNj7rmwKSDySgoqYRNWt6inY+NdqhmdfyNlvqRgMEaNjlHGL2f21PJUtDkjeU
 RL+3ZwYFbMZxhyA8c9LVSzfY5ftEJUbpDJ7eATjpr2kjrzgeQYd22ccIekm4UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GWGk6GD6
Subject: Re: [Buildroot] [PATCH] package/freetype: bump to version 2.13.2
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

On Sat,  2 Sep 2023 09:09:01 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/freetype/freetype.hash | 6 +++---
>  package/freetype/freetype.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
