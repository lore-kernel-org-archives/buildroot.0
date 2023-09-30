Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB91E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295CA813B1;
	Sat, 30 Sep 2023 09:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 295CA813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bPXkoV_z-Gm; Sat, 30 Sep 2023 09:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4374283CDA;
	Sat, 30 Sep 2023 09:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4374283CDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AB281BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C88C683C66
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88C683C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KD9bI_RMHPlT for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:00:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4705A81E3E
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 08:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4705A81E3E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 245D91C0003;
 Sat, 30 Sep 2023 08:59:52 +0000 (UTC)
Date: Sat, 30 Sep 2023 10:59:52 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230930105952.0b05d8b9@windsurf>
In-Reply-To: <20230314185805.220145-1-francois.perrad@gadz.org>
References: <20230314185805.220145-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696064393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxHYjqTKaHHg8Om6tm8W1YlxApSyMPWjru9z/QQc548=;
 b=I5vKTsIGhsBTeemzApWm4b378jdJHwdSdN1tgoU8Lty5YC4LpSexffhzcL4d6kClvL5eB8
 1sxnlV6km7VWG3sgIbUvD9Y/7WCU5EaRhld7/BXoHkQzvhDfPXRlw+f3a5diqz0IxEi54h
 kh6zPo4LOlJ6Vd/qjX8C442lTTwJdbZc1hzj/wBPVQVQ0ho3+z1a3MNK0eRGDItjORS1yw
 bsZ5o0JjMfUQT+MWSdswbNWoTC2N/5JWoho0kBzic+j2ZWNj/PWQDJqjP0mLIGSVw4cClJ
 C0fe7rAgYQJwsseeulEqu9MTAC8ZJPx1yOJKG00bhIy0RBCYO5O4xWW5/0p9tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I5vKTsIG
Subject: Re: [Buildroot] [PATCH] docs/manual: rename *.txt as *.adoc
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 19:58:05 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> by using this standard extension `adoc`,
> these files are rendered on gitlab & github
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---

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
