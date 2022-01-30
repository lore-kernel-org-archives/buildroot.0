Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8492EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEE960EA4;
	Sun, 30 Jan 2022 22:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIjNQQTCBuUP; Sun, 30 Jan 2022 22:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE6D606EC;
	Sun, 30 Jan 2022 22:44:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F08D1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D9F640352
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17uCUxDlnEJn for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:44:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63B4540350
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:44:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6167240003;
 Sun, 30 Jan 2022 22:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643582682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn6EgOAhM2/7jxB29UwjwykMGCxZk9EhQzt8gSKjJuU=;
 b=f2Pq71pB4KBudxkFlBPu3PjkD2qanTTrKnc9vVIXs5Azhyc0qEzuBvjueheig2frKI9B2p
 v2hhqMqwxyxVVQmCNHSpRWHlAjXgesIDMIEfCliZdi+RvNv6WR6klAT7BvMcYBEBTK1DOn
 v7o1UJZ/ruwDJBkv78tmBntFk/x3wUULBfCN8z98fDlTh564iPtn6eM1G1jHjVFAXus4Ig
 kAYXdVP3K2FahvGwiV5pz1xabK6HufnmroGgl5vV+1puwA8JKr8/bwjdviIk61w9rndY5K
 GZDjxOr4rjcIgxy0frvmsFL8GH5txpK3t3qIcOyMOCjwMmqjloL7c3Qwk41YQQ==
Date: Sun, 30 Jan 2022 23:44:41 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220130234441.52a7ff99@windsurf>
In-Reply-To: <20220130215729.2653219-1-james.hilliard1@gmail.com>
References: <20220130215729.2653219-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 5.16.0
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

On Sun, 30 Jan 2022 14:57:29 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/iproute2/iproute2.hash | 2 +-
>  package/iproute2/iproute2.mk   | 2 +-
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
