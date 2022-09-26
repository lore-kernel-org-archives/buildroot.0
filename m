Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7EAC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A61D40904;
	Mon, 26 Sep 2022 12:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A61D40904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aB2uaWLeT0cT; Mon, 26 Sep 2022 12:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 500C74028E;
	Mon, 26 Sep 2022 12:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 500C74028E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD3951BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88DF160F6F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88DF160F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEBCkUJn1uZ0 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:02:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E01160DC6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E01160DC6
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:02:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D9FD240014;
 Mon, 26 Sep 2022 12:02:53 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:02:52 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20220926140252.2f775240@windsurf>
In-Reply-To: <20220926101724.1989377-1-titouanchristophe@gmail.com>
References: <20220926101724.1989377-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664193773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvW0xsZ+/CC0j8LRGlsnGK9cTnAy8HyMxtcr964xk/k=;
 b=hGOktyuuD0G/aqSoRGfong/btHAIrJaNyXw8IuORDKiJW06bfARg9AuEW9tbMdoLiIJPR6
 UXN7KXLbGiflxc5amfiQvBRco9kF/GXDk18uITLRMHKf9jZY4oLa3St9X2Szq5H9yK0wl/
 PKRkjV8ssBeSSOG2xZ0gGJDtX2DPmqRC0YERj/nDA0rERtQKXx/WGV5b0YR5j1C4jhJr7i
 5Iavs1O8ryxSC4J0w5t8qK5BFOAlkguL5ANtnDsoPe9nOyN67JBnjhI56DzEvrIgjgYCW1
 YjUj3tizzvaVYJCPRfDafBl3TdeZoqreFcV5FvS6xyyArF1jK/Rt2RYAR/teJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hGOktyuu
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.5
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Sep 2022 12:17:24 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> (https://github.com/redis/redis/blob/7.0.5/00-RELEASENOTES)
> 
> ================================================================================
> Redis 7.0.5 Released Wed Sep 21 20:00:00 IST 2022
> ================================================================================
> 
> Upgrade urgency: SECURITY, contains fixes to security issues.
> 
> Security Fixes:
> * (CVE-2022-35951) Executing a XAUTOCLAIM command on a stream key in a specific
>   state, with a specially crafted COUNT argument, may cause an integer overflow,
>   a subsequent heap overflow, and potentially lead to remote code execution.
>   The problem affects Redis versions 7.0.0 or newer
>   [reported by Xion (SeungHyun Lee) of KAIST GoN].
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
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
