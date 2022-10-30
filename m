Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35345C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C686E80B97;
	Sun, 30 Oct 2022 14:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C686E80B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8SN4He7hJWt; Sun, 30 Oct 2022 14:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0434480B3E;
	Sun, 30 Oct 2022 14:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0434480B3E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6C0D1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F5EF60ABA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F5EF60ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IO2VWeLq05jO for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4FA460592
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4FA460592
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D1CFFF805;
 Sun, 30 Oct 2022 14:06:21 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150621.153d0e8c@windsurf>
In-Reply-To: <20221029010036.1388698-1-james.hilliard1@gmail.com>
References: <20221029010036.1388698-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SA5wuAxxA12N+1dBl9R/Hwlv1lPn/oNjvS+8lWcB0uY=;
 b=Yy2ECl/ds+G1tI8H5CQRzudCoMuaFY4mP4y0Lur8n1G0lrpPfErZ196mhp9reecBxTVdkG
 Cvyg7Uk3HKNdj8jCPhhOJW9c4orooGEMDSIPCRhHWjjmJQr4GDPUoMRVRAIvC93edz8/ZW
 94QUHZc/Fp2+m9D/tOTl88wYScUQuuBFIiVrtYkFmupCGj1HT/5VEb3N9INEpegVJdPogp
 eOc7pAUbEOVAXPB7P/cmvmKCifx4gF9r5RbB7Br8hYU5X48P2FYejhmaONMiUoJREgdx9Q
 PA3QkSI2WCHwWvJXIWSC+PHoTN0to4m1WXvmvjio70G188c9+T/7x3I7l5OPng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yy2ECl/d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version
 5.5.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Oct 2022 19:00:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Switch to now supported system double-conversion library.
> 
> Disable built in strip so that stripping is handled by buildroot.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ujson/Config.in         |  3 ++-
>  package/python-ujson/python-ujson.hash |  4 ++--
>  package/python-ujson/python-ujson.mk   | 10 +++++++---
>  3 files changed, 11 insertions(+), 6 deletions(-)

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
