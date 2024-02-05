Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DFBC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBE6417B7;
	Mon,  5 Feb 2024 14:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBE6417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjL8ivgch-f8; Mon,  5 Feb 2024 14:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C9D4185D;
	Mon,  5 Feb 2024 14:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C9D4185D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2860A1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E039040A49
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E039040A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YiBLVSrWPoy for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:57:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BC8040377
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC8040377
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9800FE000D;
 Mon,  5 Feb 2024 14:57:16 +0000 (UTC)
Date: Mon, 5 Feb 2024 15:57:15 +0100
To: Andreas Naumann <anaumann@ultratronik.de>
Message-ID: <20240205155715.77215856@windsurf>
In-Reply-To: <20240117130522.628211-1-anaumann@ultratronik.de>
References: <20240117130522.628211-1-anaumann@ultratronik.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707145036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ang75BlHdGsl3tNIq+XslTBl69h6XMLApNqHpvh5h4=;
 b=So/GkTuXrOIHobBTqvl+ZiwIJn1msH/XeqqUj5Oko5Ft4V8Nc4++LMGbsnbHfXEtWsn5JN
 udb3+3KUgVzFZ2BYdxJOItF/uApqbiXvhSw3eR5ytQzsva1F7kqUEFtiGn2LJFvfsCsCMX
 llAHX+5D0jKsR2Mp+K3f8uCTo3gisFWLT1CMiRpu5phCSkq3SPJsAak79t4pqPcPO48p+v
 7R+RO/s9bngTXhLFw+ETVaWIq5/gwcoDSYuhGNUb2xPQ6fL5K2bPDl3ibvBW1A+ZCTqYfo
 By2GRCpLSUOFD2OHAVSKsdA/Ivknw4FFlG6Haujhtxg3A5ErFmlHxvU6Io40iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=So/GkTuX
Subject: Re: [Buildroot] [PATCH 1/1] package/libevdev: bump to version 1.13.1
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

On Wed, 17 Jan 2024 14:05:22 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/libevdev/libevdev.hash | 6 +++---
>  package/libevdev/libevdev.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
