Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C91C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE09A402F2;
	Wed,  8 Feb 2023 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE09A402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3B7lOa2P5-VG; Wed,  8 Feb 2023 19:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 432E3402F5;
	Wed,  8 Feb 2023 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432E3402F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D94B1BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E8AB408A8
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8AB408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNvP6EuOGvgF for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96154408AC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96154408AC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:24:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C124C000A;
 Wed,  8 Feb 2023 19:24:30 +0000 (UTC)
Date: Wed, 8 Feb 2023 20:24:29 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230208202429.03b41674@windsurf>
In-Reply-To: <20221230054005.1281050-1-giulio.benetti@benettiengineering.com>
References: <20221230054005.1281050-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675884270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJNd45lLwWS7e2OP+S33jt5KRjayr5XnA7heg/tdR7Q=;
 b=oWlkgI4gsBHNWJwJRaHnQ0iCscJfBPmHjs6rEVZwM+jg/JG7ClqlI6+JssDPWpHj4WobOj
 VmMR1cucWRRRfINe41ZTXBqXqyImyaqpvL8naVzUPLEVbIOYB4UZfKPCl7Zqfyw47OpLRv
 ud+InEsghyPxz4+wKFTv7+a7eWgisG4U8OPszjRIx6iml0sHWC3LsHFoRpskTqU5EL/ttC
 Z1Xq1HlG9KebunKnSrMd5DeL5JAtb+cbSw6YFW1HQtIbRsMli59svLm/t1FAagy64v5w6W
 IPN4d/Qyf4uSiMN547W2CUNS7OP0Ux7Sj+aBPKuAabM1OdApbYiueykSbtkSsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oWlkgI4g
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to 2022-12-30
 version on branch master
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Dec 2022 06:40:05 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.1
> 
> Fixes:
> Still not reported
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
