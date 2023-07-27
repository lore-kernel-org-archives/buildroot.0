Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181AEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 885A782ACA;
	Thu, 27 Jul 2023 21:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885A782ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rVjr6XpQ14m; Thu, 27 Jul 2023 21:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA66C81E43;
	Thu, 27 Jul 2023 21:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA66C81E43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA83D1BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C15DD404D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C15DD404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzEnoPoTwFCh for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:16:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F24D4020B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F24D4020B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F70B1C0003;
 Thu, 27 Jul 2023 21:16:20 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:16:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727231619.02861138@windsurf>
In-Reply-To: <20230727192219.1634755-1-bernd@kuhls.net>
References: <20230727192219.1634755-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690492585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kz8sbsAzwMIOA0s/2wxNPwHGvwJS38BzbOqEAv9Qgxk=;
 b=bqD59PE742U5MpIaV4X2HzGhT12wqmmZwKd+RAkGrcvH3jNJ0g7VxnUx6LvB7o8TwExbBJ
 yxFh3/5AxQWdSWIHANk8qgznWwZqOaGc3io5QYaSCwDjpK6WkDQhC22V4kqk3YjHq6LbF0
 Mw842f96RpQD465QsoYfIfkHkNoXQFLsMOEhF6cIwRRPXwsaaOLfX92l0c1SPIh8Cc6fHU
 nnpB+Mz/xe2cHfKUP+juQGe6X+Z7naZ7aSXrRgB0XFX0afLi15yo7CscvTrYUd+tevUE83
 jNY58AxSTcJFlwTzgMt+KfnoqHa9mBNl45DRe3ZO08FC4tlqMAo6bMMW7d0x1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bqD59PE7
Subject: Re: [Buildroot] [PATCH 1/1] package/make: bump version to 4.4.1
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

On Thu, 27 Jul 2023 21:22:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed all patches, they are included in this release.
> 
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00011.html
> https://lists.gnu.org/archive/html/info-gnu/2022-10/msg00008.html
> https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  2 -
>  ...pport-GLIBC-glob-interface-version-2.patch | 31 --------
>  ...b-Do-not-assume-glibc-glob-internals.patch | 70 -------------------
>  package/make/make.hash                        |  8 +--
>  package/make/make.mk                          |  7 +-
>  5 files changed, 6 insertions(+), 112 deletions(-)
>  delete mode 100644 package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
>  delete mode 100644 package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch

You forgot to explain the license file change in the commit log, so I
added that and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
