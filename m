Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C312C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4F541956;
	Wed, 21 Sep 2022 18:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D4F541956
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xV1hxURUVARk; Wed, 21 Sep 2022 18:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6DC94198F;
	Wed, 21 Sep 2022 18:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6DC94198F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7A241BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B27E782F14
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27E782F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-bBV2HoTxmA for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AC7C82EF1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AC7C82EF1
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 18:09:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44273240003;
 Wed, 21 Sep 2022 18:09:29 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:09:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220921200928.49ce92b0@windsurf>
In-Reply-To: <20220920190320.3688689-1-francois.perrad@gadz.org>
References: <20220920190320.3688689-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663783769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/hkNiO/LJwTTSUfxJu6eS1MiZ8h32cBg80sQqi/jU8=;
 b=ikDErwdqQ6VQe3WzgoucwWFPDYULcnJhL3qX91PphDbgAk6UGwuK0mPr+GcRDtDTcHLcOl
 EbNGXjFB7vRlo0ch7mfOedSWsLilKKBoZ0LK7hrPO90qDtNi/92U+SGVTuwA/BifrGR9wu
 GhVvI6xRCqvPwGTHT5wTPpRNn4L3gP/4K13A47vrk7f4HEz97DK8Q89sRwvV9C0oDpGkXo
 DRcFfdKuu1/C1+QQypKcYnYLQ9uZcL11YA9JbAzQM8jtBWv7ST3ur12EImNPXY5lF9JiXs
 SWivbRcuAkoqcDqPHtsnE15+TMvnopWtyV1pwjfWP4wnbapD0QBYYPfGRTD9bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikDErwdq
Subject: Re: [Buildroot] [PATCH] package/libatomic_ops: bump to version
 7.6.14
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 21:03:20 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libatomic_ops/libatomic_ops.hash | 4 ++--
>  package/libatomic_ops/libatomic_ops.mk   | 2 +-
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
