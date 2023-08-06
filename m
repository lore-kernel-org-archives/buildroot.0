Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A25C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8D5819F6;
	Sun,  6 Aug 2023 12:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8D5819F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXXIGWLvRdoM; Sun,  6 Aug 2023 12:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A45481746;
	Sun,  6 Aug 2023 12:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A45481746
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 344441BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9A6381E75
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A6381E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlNOtQnxKlHk for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:12:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3375080C09
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3375080C09
Received: by mail.gandi.net (Postfix) with ESMTPSA id 263491C0008;
 Sun,  6 Aug 2023 12:12:14 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:12:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806141213.52d5b1c1@windsurf>
In-Reply-To: <20230802175407.537056-1-bernd@kuhls.net>
References: <20230802175407.537056-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZZE6p1dmrRQ8dJhHi+NWlQ4cxdIFhHTTqTQtkb0vvI=;
 b=B2SM4YEr7VoCx9yeykM18nnOLSMk1jtUsQ75UJ1q/ht78UoBZ1HOyMY9zQPPtrPFc9mr79
 mhVVGFNpdz7eQD3CtW+RWWWZI/KwTb4mvfPXcOFX/nLLWC/oudkKDEmt5noqsN0n1la8oq
 d7HvYuN/HhbfPH9qADBHtH4ZE5smYPGo4Ve375CIq4binFnr7KrrfXILqKBBTS7x6GkSj6
 D0II2lMWAF8MbIjxHIzF0h6xCJApJAHSxSCneJRfAIRzg3xINxDMn2SYgmDZ30LO8EOSHc
 944qOpkaaoAqF2/IPkTZPXbHW3PA6m+kp32H+lhavP32xLm7vasqFWd1kvHQjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B2SM4YEr
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump version to 9.2.1
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Aug 2023 19:54:07 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/OSGeo/PROJ/blob/master/NEWS
> 
> Switch package to cmake, add json-for-modern-cpp dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/proj/Config.in |  7 ++++---
>  package/proj/proj.hash |  6 +++---
>  package/proj/proj.mk   | 14 +++++++-------
>  3 files changed, 14 insertions(+), 13 deletions(-)

Marked as Changes Requested following the feedback from Zoltan.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
