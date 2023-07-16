Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A528EEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 21:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA0960DFC;
	Sun, 16 Jul 2023 21:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA0960DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhGp-Lut9RtV; Sun, 16 Jul 2023 21:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C22760E24;
	Sun, 16 Jul 2023 21:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C22760E24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF46E1BF861
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98B1B8174A
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98B1B8174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rL7cNfl8jCYa for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 21:38:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE2A881746
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE2A881746
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:38:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CC0A1BF204;
 Sun, 16 Jul 2023 21:38:02 +0000 (UTC)
Date: Sun, 16 Jul 2023 23:38:01 +0200
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20230716233801.20454e60@windsurf>
In-Reply-To: <87lefkwl12.fsf@tarshish>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-6-grzegorz@blach.pl>
 <20230712230206.359c037e@windsurf> <87lefkwl12.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689543484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ea/ZcHzoyWRLfcnbtWp/8Z2vryskpvzI6QR0EPG7xsA=;
 b=R6lfZECVJ4ak140envpaNpz75kk+XPel5Va1X9ty0ggoSTyBo7Y+FonFhMb06FSX+0VQuX
 7dVbKhTk3+Zz/iKFKPEEnQvHVEJHL5D+/0YjrzQoQM1EjNVVzL+Zt8L6ASeh7FzRg0NmCh
 Z6yuhGYtYMMjdERPw/e3tHaO+T3sGAF2qC+TO8s5107vArP3+9X1f416XDI6ZGpq+l5NFv
 U0yggs9aA0vjLmbANxKUNtd+kNFPzCpFAvQ2okN9PyAKdBT2sO2qJdJ0eYn3/f6rhuZi6q
 4JgzhUGKZsO8EncKtJ2WAuFgG27/jf5EPrIRqQUG1+JjmpNk6P5fLcWM1Qs+fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R6lfZECV
Subject: Re: [Buildroot] [PATCH 6/6] package/python-rpi-ws281x: bump to
 version 5.0.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jul 2023 06:24:08 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Not in current master as of commit 587d392df7d1
> ("support/testing/tests/package/test_shadow: fix flake8 warning").

Indeed! Thanks a lot for spotting this mistake, I've now pushed the
commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
