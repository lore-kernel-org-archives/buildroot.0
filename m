Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE0EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B3AD4051C;
	Sat,  1 Jul 2023 20:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3AD4051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csyXpB4cj-nE; Sat,  1 Jul 2023 20:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B5C402F7;
	Sat,  1 Jul 2023 20:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B5C402F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B151D1BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBC6402F7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBC6402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8qEnxwhltiq for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:53:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E294010C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02E294010C
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:53:13 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8F621BF203;
 Sat,  1 Jul 2023 20:52:09 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:52:08 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230701225208.59d26569@windsurf>
In-Reply-To: <20230612170110.1550878-1-bernd.kuhls@t-online.de>
References: <20230612170110.1550878-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688244791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGycneUidayQ2C+S4OE252W81J/sUshjejRErixJ+AM=;
 b=YLmNFoO/dAHbu8cwALt32ObK41wV5NENzSbPqTSq3+0zUT19YcRlwvQ5talunidgNHA80/
 sac0WUfPQeEyvfDAXlgoP203K9GIkKAUlpYPLUYUMPiiPMcXb/VkjB/5H1llLJuvEcZ3UL
 BQIUxwW24aNmqoQ7kGXJuCWjlxmQ0Z/p+ZrE26pf+kekjCgDvavWl9PWYOta5xKvbCzos5
 ctimv/mb48pCjh3Ipz5Ax3ywf7FQhYhdkJQNB3YZ+9eirqrLhwY9FoZaUlzVx64b+QXqqY
 cwW0run8u1MJKunI45ANV4lBeH3zEzr0VZRnSNaCh6Vhqot84D0cFr3gFJxZKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YLmNFoO/
Subject: Re: [Buildroot] [PATCH 1/1] package/assimp: needs gcc >= 7
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

On Mon, 12 Jun 2023 19:01:10 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/d6c/d6caf3c2c0fd670e70950d3e89629df39f8ce596/
> 
> After adding various fixes for the autobuilder error and subsequent
> build errors this build error can only be fixed by using gcc >= 7:
> 
> output/build/assimp-5.2.5/code/AssetLib/Obj/ObjFileParser.cpp:55:23:
>  fatal error: string_view: No such file or directory
> 
> Usage of string_view was added in version 5.2.5 by upstream commit
> https://github.com/assimp/assimp/commit/f6bcb160d08af267778fbc59b480ce5d9c52c92c
> which was added to buildroot by commit
> 7d843d9cc0064d6690cfc000e579f575e2c0cc4d
> 
> Removed BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is only valid for gcc < 7
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/assimp/Config.in | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

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
