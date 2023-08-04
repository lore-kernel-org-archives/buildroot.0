Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1632C001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1DB402A2;
	Fri,  4 Aug 2023 12:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1DB402A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K01zsgechwZl; Fri,  4 Aug 2023 12:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33DD40581;
	Fri,  4 Aug 2023 12:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F33DD40581
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697171BF844
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 12:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E15742996
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 12:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E15742996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uAO63eeXlD0 for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 12:35:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9A1A429B9
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 12:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A1A429B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F2D94000B;
 Fri,  4 Aug 2023 12:35:19 +0000 (UTC)
Date: Fri, 4 Aug 2023 14:35:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230804143516.4df34cfe@windsurf>
In-Reply-To: <20230804062307.227606-1-bernd@kuhls.net>
References: <20230804062307.227606-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691152519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jc//L/+lKRXz9bpbLprNiVbWrW+QQcTHnjtwGGQWFHo=;
 b=cHdQbruSgFweUV7ksedHr77WiVpCh0iK5CMbyDxH+RHraDFCsXXEtrBtdDJkXw5YYYu9dA
 90nHgNzDod6Pl3eSPjVP6PJzdv7XB9AANdB4gVMuD7CXLg9XgZdurqa4Wmewp1mLbngCpg
 JQ0YDEjphsPFV/6yGw82Lek7Lcfxe2K/6GEhEJqx5z7Tmv6l8UV13k22n6aBcfZ8sEHfnw
 QPYyuigO72/MVh5NwvHM4e38bpIZ7JRB3XPsF53jf23sISVgWjq+YJ2Y4eImfDar86h3ie
 69PKlbYA7yh5rb4YbnGMI/qNKR0YlBAam2RjGeQJflK8RxLho+5Ox/D+F8fTYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHdQbruS
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: handle host-php as
 an extract dependency
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

Hello Bernd,

On Fri,  4 Aug 2023 08:23:07 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/506/50658c50fde8145fac320e3b17004e98c78c6c4d/
> 
> Although composer has host-php as build dependency, in the case of
> BR2_PER_PACKAGE_DIRECTORIES=y host-php was not built during extract stage
> of the composer package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for noticing this. I indeed completely overlooked that when
reviewing/merging the composer patch. However, there is one thing that
I believe isn't ideal in your proposal, indeed it's kind of "half-way"
through.

You handle part of the problem in package/pkg-utils.mk, as if .phar
extraction was supported in the generic way in the package
infrastructure, but that isn't the case: it only works with the special
_EXTRACT_CMDS defined in composer.mk. So this .phar extraction would
not work for any other package.

So instead of your change in package/pkg-utils.mk, can you do:

HOST_COMPOSER_EXTRACT_DEPENDENCIES = $(BR2_PHP_HOST_DEPENDENCY)

in composer.mk ? This would make the entire handling of .phar
extraction a problem of composer.mk.

Of course, should we progressively have more and more of these, we
could look at making this generic. But right now, let's handle this as
a composer.mk specific concern.

What do you think?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
