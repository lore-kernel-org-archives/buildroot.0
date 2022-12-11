Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EBCC4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755B3813C2;
	Sun, 11 Dec 2022 16:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755B3813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGmQIItU_pvb; Sun, 11 Dec 2022 16:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A70D68146B;
	Sun, 11 Dec 2022 16:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A70D68146B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28F911BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048DA4026A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048DA4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqIEFjpYIH96 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:51:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B3940241
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6B3940241
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:51:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E854340004;
 Sun, 11 Dec 2022 16:51:25 +0000 (UTC)
Date: Sun, 11 Dec 2022 17:51:25 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20221211175125.76dd4700@windsurf>
In-Reply-To: <20221207052143.18521-1-fido_max@inbox.ru>
References: <20221207052143.18521-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670777486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxtxkL0nYI8NE5e3nxZvyLYkBr+pZxksO20Ml7gN0f0=;
 b=e+4e3U3JgfiiB73IQxoE3dogngS878bRyA6/o4S1RwmbTetH01hZIS33gX97uBaVK4lH1p
 hnCs3J4W5Q5NdSC+3smlDoDcSa63qCiwqcU9he1eTnYYVCsOwjSka4xFO8jRDUKVjL35qW
 1rDpJTUQmmneeZFP1PuIwjlP9CnHqWwg5+a7z8j7F42IlKTY7MwjzTZAILLVXAy3U2S5OI
 saM0HypwTkyxSDIGp2Vv4Z6f0dGWRx0lMKJw9wYTwTHaUoK2PvWbzu6na8F3epAUg5Zgqu
 KEGHXWaeltH0J6cmcfl9ceCtrX1o4nxi8q6BU9jQd/zqjcdIyhiHmoGRZMhdUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e+4e3U3J
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 14.6
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Dec 2022 08:21:43 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release notes: https://www.postgresql.org/docs/release/14.6/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
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
