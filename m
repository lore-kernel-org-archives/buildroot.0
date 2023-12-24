Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E3C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C94740572;
	Sun, 24 Dec 2023 18:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C94740572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JB6hEnjib_W1; Sun, 24 Dec 2023 18:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B7A340591;
	Sun, 24 Dec 2023 18:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B7A340591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1E51BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D8B60B44
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D8B60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqbqxAItueL7 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:18:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 062AB607B5
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062AB607B5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97E2460002;
 Sun, 24 Dec 2023 18:18:49 +0000 (UTC)
Date: Sun, 24 Dec 2023 19:18:48 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231224191848.20c7bea7@windsurf>
In-Reply-To: <20231212190123.7226-1-ju.o@free.fr>
References: <20231212190123.7226-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703441930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXJ0Q2MjQeaVhH4T51f9vhCzomRPx9t2e33o+Yd07ZY=;
 b=htRGrQPuNl6N1ltElhRVfeu2AY6eTVhRrlWzHAMBVzvvCg24Gx7DDFYdKEbMZRw9ZfZpa7
 /LRCzmt7hAIbmquPf/giv2QzJ9Pa2YeDKG1LGhe7lg2wp+Ir57qQcGuwjnAKloLSB80WHq
 wdWZfSL8GAyCflWkjcca2djf1ThjZaGU0wjNbXl8j9l/lh14RAYuAEyX748BmnCaFm134i
 8in9DIhGNEEsukrG+tInWxqScbLJq8MgV4Fy94+ncil7f9Bg/eijumLvP48QgErdKQb/6X
 zkuAqE0CtSJ1Rum4vsTU89tR6LO8ea2RWH4HnMwFhoKkvf/rA7eN2UNobdv/uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=htRGrQPu
Subject: Re: [Buildroot] [PATCH 1/1] package/perftest: bump to version
 23.10.0-0.29
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

On Tue, 12 Dec 2023 20:01:23 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/linux-rdma/perftest/releases/tag/23.10.0-0.29
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit b79fb3c with commands:

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
