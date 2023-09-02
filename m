Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93876C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4911E60F0D;
	Sat,  2 Sep 2023 17:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4911E60F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cE6wy_Cu-gFj; Sat,  2 Sep 2023 17:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8764160E86;
	Sat,  2 Sep 2023 17:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8764160E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CADA21BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3A4400D1
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3A4400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2e8shzkipPn for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:18:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B52C4002B
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B52C4002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29E6A1BF204;
 Sat,  2 Sep 2023 17:18:12 +0000 (UTC)
Date: Sat, 2 Sep 2023 19:18:10 +0200
To: Sebastian WEYER <sebastian.weyer@smile.fr>
Message-ID: <20230902191810.76a0f09e@windsurf>
In-Reply-To: <CADSVbUtYOeP2Fj3XppauCnPnMjgy-qGg32HaR+frta+hYF6+Qw@mail.gmail.com>
References: <20230716145003.339645-1-bernd@kuhls.net>
 <CADSVbUtYOeP2Fj3XppauCnPnMjgy-qGg32HaR+frta+hYF6+Qw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693675093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5hoOWFm7oKIBI/Geh+hP1Tk8FoIQq3fheU/8xTH5eU=;
 b=aTJheu13q0eUxaa5Igh0XmiiWIuDfeyQm/CppYQXi1hQ/bm9qfxnwAe4JkSVh3zUawRVDI
 jFFlTRt/bqCmcaBB3bt0nHincnfnkJW20zRiOpxxLc6r6TS0eGJoz2MIWajTGbg6WrgMOK
 oJC5us7bm2+K9kPWubiDFQRVqLqcA6cTcoAn3tEYDuueqaP9xNM2N1Qs/mk4zBH4H+m5US
 vAsa8MOi0RbkM8typVD/jWcZ3dH9obe99b4xAG4YTWCxOyrp98I0Yvg6Ly9e0DaMEyZe4f
 vfNTcJGHayVmAcXkIsAVU2o8Z6GoULmjStKM17uUGQK1cOYhH2Gox8jIHVQkRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aTJheu13
Subject: Re: [Buildroot] [PATCH 1/2] package/libdecor: new package
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
 Spenser Gilliland <spenser@gillilanding.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sebastian,

On Tue, 25 Jul 2023 10:54:34 +0200
Sebastian WEYER <sebastian.weyer@smile.fr> wrote:

> It seems like this dependency is only required for wayland support
> with the mesa3d-demos upgrade to version 9.0.0 in commit
> 80304d9911f34f8a0173a4f37d52f93177478cc7.
> 
> Version 9.0.0 of mesa3d-demos also includes commit
> ef24aae22978d4d357340074ca9a1c04d9cf81e6 which seems to have added a
> dependency on glu for the demos which is not yet reflected in
> Buildroot. Does this mean we have to have libglu and therefore xorg7
> and glx as a fixed dependency for mesa3d-demos?

I think this issue has been resolved by
https://gitlab.com/buildroot.org/buildroot/-/commit/39ae14faabb82703c2cee2ddf23e5925a0f0f251

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
