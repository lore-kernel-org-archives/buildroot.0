Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23516C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D627417B4;
	Wed,  3 Jan 2024 12:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D627417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oG8Afu7BoDW; Wed,  3 Jan 2024 12:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A809241721;
	Wed,  3 Jan 2024 12:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A809241721
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53CBC1BF409
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02DDA41721
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DDA41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mcc5xk_uNjHa for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:46:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E81F41719
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E81F41719
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26AF2240003;
 Wed,  3 Jan 2024 12:46:54 +0000 (UTC)
Date: Wed, 3 Jan 2024 13:46:54 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20240103134654.3240d15a@windsurf>
In-Reply-To: <87cyui613a.fsf@tarshish>
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
 <87h6ju62xg.fsf@48ers.dk> <87le9662dl.fsf@tarshish>
 <87cyui61o0.fsf@48ers.dk> <87cyui613a.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704286016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzHBecS0haeyLAO8YaI0Vnb/2EQ7yZLowwlx5kpE8qQ=;
 b=T5vpbp9HmMKxJuXNBDwyrvETobfLX5ZeMqGGohnM6puZJt252Zu8A/+oD5LNrs/vVBo0kn
 vLprVqyKIReakuQaK2vHsKlo/67vNtyGvjvkzk02Df6ao8DBFbmoNzmRm+4GcYsRHwnvLb
 0tkX6y6bIJnOPhBPYdOR07nEqePm2hfX+fQkU8Tckqw6p34JSEw64/daTmrn1WjtOSx48j
 POJvWmM0B6MSaBop7L+Fo/9imWWRZDiXLKgjhjs/DsOsHev0iccCKVLhrmFJl+b2uYVtc9
 zCxzjg1EK7jmV6aWadanGqHvSXzfrDuxDplYZVil0oXJkA2mIfchvSPaogxbww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T5vpbp9H
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 03 Jan 2024 14:39:18 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The last defconfig test report shows these failures:
> 
>   https://lists.buildroot.org/pipermail/buildroot/2023-December/681835.html
> 
> For example (solidrun_macchiatobin):
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758777

I guess:

	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"

should be:

	HOSTCC="$(HOSTCC) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)"

However, I don't understand how it could have worked for us without
this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
