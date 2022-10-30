Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2085ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC6C40156;
	Sun, 30 Oct 2022 20:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC6C40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoJxzUHWbU48; Sun, 30 Oct 2022 20:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C12740120;
	Sun, 30 Oct 2022 20:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C12740120
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8ADA1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A443581255
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A443581255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rg_AqixSAUqx for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:58:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F7E80DA8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F7E80DA8
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:58:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA7A1FF802;
 Sun, 30 Oct 2022 20:58:00 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:57:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030215759.0d848e58@windsurf>
In-Reply-To: <20221029082510.61178-1-fontaine.fabrice@gmail.com>
References: <20221029082510.61178-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667163481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqFBzo/l9SvKRA2FAYpGUkv2zoe3HAdPfGaeNtvxWCg=;
 b=GpAu8Y0CMlr4gBkhkJullYhwdq2wtmPrJjBGOPT8wNaByMl+FVHd1MItc8qPd0pxBEgTiT
 q0MHh9rFgy9mUzkIEaZSFN6foYfPUR2po2oV13+hJbXECLnBXQ3pLg929AwrlGYoXD9oxI
 BWhJ7d5ufZ0RINImpuckJM9vZ7zA+9LewTKthBUnwfqhNwXyiMaaK6vLB0gKmIDsjhixdP
 fuPw2jCTdot2xdPc2wIcpP5jm749z8qbVxkBIzMOGigjNYeqWqKhsj+/pGmS4K7woIm9hv
 rYkdPKl1VYDXNnR0TaRe43U90R3zqWD6cCHLrso6oMdo6oSTL+jVdMobDAlqyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GpAu8Y0C
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: bump to version 1.24
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 29 Oct 2022 10:25:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.24
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We have zillions of build failures for host-pahole:

  http://autobuild.buildroot.net/?reason=host-pahole%

Is this version bump fixing them? If not, do we have an idea on how to
fix this build issue (I didn't investigated myself)?

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
