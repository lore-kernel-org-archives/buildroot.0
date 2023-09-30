Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA0E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99DE181350;
	Sat, 30 Sep 2023 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99DE181350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeZcTOnTEf7l; Sat, 30 Sep 2023 12:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D023581340;
	Sat, 30 Sep 2023 12:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D023581340
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE5BB1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9784B60D90
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9784B60D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFvYoRHUPXsI for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:40:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65DB6606D3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DB6606D3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 269B1E0002;
 Sat, 30 Sep 2023 12:40:01 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:40:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230930144000.6c348c98@windsurf>
In-Reply-To: <20230626181531.2312002-3-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696077602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcai6cP9YCRosC0jEWWdAJrXLqAwRpiMDDjrMgCsh2A=;
 b=Q8mHZ+kp3J8J8h2kxZxFl5LZ7YvN/JtuzZS9vJcWv/QsfvpZVO5uRwJG8BYXExT6ZGUTVy
 pa5fmcCnhwrW0Ejkj5ST+QZ+Vx8Gpm7j/waf4aapRxJbU30/ad3Vcljx4ogArpqBrAUhai
 0EG1yZJKRD4zhRaZjwv10oDgZqc1IVyiNywZOl1LqT7ukqQGiPny4s/o5jh21lEQrCCQHz
 0JCuj+agRNKi39UuL2gEo9MKBmHoVN4xRMxKaTZIsTKshKqisWFrwEch3KklCjSLClsttm
 0q+t8myysRSsvPYjBTgqWfRH2hj5DgbWJpbkwiBOeoHJqONw71U3n7ZjmyOrBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q8mHZ+kp
Subject: Re: [Buildroot] [PATCH 3/5] package/python-pybind: bump to version
 2.10.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Jun 2023 12:15:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pybind/python-pybind.hash | 2 +-
>  package/python-pybind/python-pybind.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

A more recent patch of yours, bumping to 2.11.1	was merged as
commit 75ceac87d4051c0155e9ea82f1e7ba0af1b18ed1 in the mean time, so I
marked this one as Not Applicable in patchwork.

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
