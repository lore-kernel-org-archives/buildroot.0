Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811E9EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B85E40B5D;
	Mon, 21 Aug 2023 22:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B85E40B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n44bVdW8JskQ; Mon, 21 Aug 2023 22:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E4AB40B53;
	Mon, 21 Aug 2023 22:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4AB40B53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C94AA1BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D6781B52
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D6781B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10wzABDIa04t for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:16:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 927F681B35
 for <buildroot@busybox.net>; Mon, 21 Aug 2023 22:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927F681B35
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D93EE0007;
 Mon, 21 Aug 2023 22:16:07 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:16:06 +0200
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20230822001606.699382b1@windsurf>
In-Reply-To: <20230815075702.4177-1-jubalh@iodoru.org>
References: <20230815075702.4177-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692656168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfMras5lMyMVWKom3z177upDyCXUwAZr1eCALP60OZM=;
 b=O+RmZy5Y8Hhu5zNCbO48TnZ2bB9S0Oi+eZU84ehwzc2CY3eFTZW5Y795mFuHyJsQe3hRRX
 Ae/EpW4Pc0262UjHHB7O0GCyRNpBQDAsYXRpo6pqZr8rw6bPepid0j4Cq3xrCdyRfrG8tJ
 dUll4ffxdfwU9rx9vuY8ifbzeusI8fTpenlJKF25FbZjg2h0DsAVhH2n3i73sM2SLvlWkl
 bGxcjM099LGrF+ncrs+jihZPbHwcoVHvh2Os7S8SF3Sj2iKJ5PgMFs5SsNYOAy5DFbmea4
 y6sSi61U6hD/IP+atOpPotRXFQ6QktTO4qfKRV6RvJufOzk6VweEUfKv6fCaoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+RmZy5Y
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.12.3
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

On Tue, 15 Aug 2023 09:57:02 +0200
Michael Vetter <jubalh@iodoru.org> wrote:

> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/libstrophe/libstrophe.hash | 2 +-
>  package/libstrophe/libstrophe.mk   | 2 +-
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
