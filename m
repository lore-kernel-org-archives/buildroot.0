Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8EFC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB0560737;
	Mon, 31 Jul 2023 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DB0560737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lu1WQgb_X1rP; Mon, 31 Jul 2023 20:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B34F607C7;
	Mon, 31 Jul 2023 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B34F607C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 699991BF25B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D116F60BCF
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D116F60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUqUxX4PKQ_b for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:35:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8186060812
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8186060812
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F72460003;
 Mon, 31 Jul 2023 20:35:54 +0000 (UTC)
Date: Mon, 31 Jul 2023 22:35:52 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230731223552.6d2187cf@windsurf>
In-Reply-To: <20230731221843.61feafea@windsurf>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
 <20230428152211.20394-2-flaniel@linux.microsoft.com>
 <20230731221843.61feafea@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690835754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vVx/R7P4yG09jDzbQYnHItpgQpuIupAytMUgIdbkmk=;
 b=aKgVkF9Wp8xi1T2ZwypP+X4/V+ApABsOwKgssAcgRYuqP0dEfGg1ASIDBLcdzIsSf3mjwR
 N+Gsx9wH7OUqlcPdEKGF3fol2xnRcOMjKzDBRnw9pIyU172+kEVlbtsujK1gGkfcXVwKxz
 FKHjv6dk+YIWFn/UgGBGuEOt7+I/DYNnk/h01WtZDQU6y2IVjt+LVRyRxr/JFOfCq5EFih
 3XVXIvhdtqVRVuzBUJcikr5xTRrNHiVXZwX19mxx7pxWSoTgzifz238UyERFH7BMx2wJqh
 SR3rgbHnn8TXUZ5XImL5jvKZI1nElN1XjHHqc+68K+/RytE7bDE6a8umUvqp8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aKgVkF9W
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/sysdig: bump to version
 0.31.4
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 22:18:43 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> By the way
> -DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson is truly
> horrible, because if valijson gets updated to another version... like
> it has:
> 
> VALIJSON_VERSION = 0.7
> 
> then this doesn't work anymore.
> 
> It needs to be VALIJSON_SRCDIR.
> 
> Curious that we can build sysdig today (I verified, it builds) with
> this mistake. Probably means this option is irrelevant.

(1) There is no build dependency on valijson, so I don't see how it
    could be relevant anyway.

(2) There is no reference to VALIJSON_INCLUDE anywhere in the code
    base, as far as I can see

This really needs to be cleaned up. Very soon.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
