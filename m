Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC6D418D8;
	Wed, 23 Nov 2022 21:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC6D418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4cwFNdd0qlw; Wed, 23 Nov 2022 21:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8974176B;
	Wed, 23 Nov 2022 21:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8974176B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA271BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4208C4174E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4208C4174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYHkOm9oqLcL for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:51:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E254174C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0E254174C
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:51:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF4FDC0003;
 Wed, 23 Nov 2022 21:51:04 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:51:03 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20221123225103.16843388@windsurf>
In-Reply-To: <20221123173421.3371884-1-dario.binacchi@amarulasolutions.com>
References: <20221123173421.3371884-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJFQSqAfYLTMNz1I+PX2p4+eoVQh9T0RrS1wPZ863FI=;
 b=aEzDfCnnJMq14PT3K65ZOHpBGWnGKYA9i87wAjp7hUIrW5CjCK71HaLxOBGmrAfi2GQLAW
 Az5y2lBtZ+Bu2N41EefK2e+d58sAwPOBfXKJGxJuDLBtBey2qZ7EVpoUo8o2pwL/gFdFG/
 EaN1GIgHpSdvSZVxb6Q6gXMh0AV5PKpVmKjKd2T+GgjxLyYQA/KrZtqQnopPr/ZmCkHI9T
 SxUJzlbZQPk6qbyyVIMClRcGWO9xccAnnukXBn4qFRnw7k5ZqXqzERR7/ZTfP6Q7aaRf9t
 t6FjBtDiNO6dTKG+ypvEHCerzicO8PwPpuTGK+HuJJgPNdIFtmTKsM+iPYoi7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aEzDfCnn
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.11
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

On Wed, 23 Nov 2022 18:34:21 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - Add nvme_all build-in command
> - Add Write command to allow use mmc write to write image
> - Fixed race conditions of g_last_error_str and g_last_err_id variables
> - Add support for stm vendor fastboot
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
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
