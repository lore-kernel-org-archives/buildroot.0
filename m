Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C3DC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8266072A;
	Mon,  1 Aug 2022 20:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A8266072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAjxxhxs0j8a; Mon,  1 Aug 2022 20:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93780605B7;
	Mon,  1 Aug 2022 20:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93780605B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E21D41BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8E718140B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8E718140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7oJLWWCUkEr for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:37:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDA9813BB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BDA9813BB
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 20:37:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDA8320005;
 Mon,  1 Aug 2022 20:37:17 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:37:16 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801223716.047dc5df@windsurf>
In-Reply-To: <pan$ececc$42d5a99c$43b7bc8f$13a84de7@ID-313208.user.individual.net>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
 <20220730174036.48ca64aa__27858.7368129351$1659195663$gmane$org@windsurf>
 <pan$ececc$42d5a99c$43b7bc8f$13a84de7@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659386238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uvaqovw7ZE+8T5qEXWTGejIoO9N5lXSpLyYnNsUI0Ro=;
 b=Mng0OE1vimd+bSwLWfgbNCqUWAb5dsMafxyP6qsSU3Cj2aZbLP+DuF9cWkl8mHIIYEQO7r
 cPkWRUc+7X+jJM/hfXaw4kjcj/DMHFK1/fvqCBfKwRHuHUB6PLFObzTiFrN91VXmRStGfG
 RMvTH2wa/OZF6x7qftxHyUEqRafK3xLHeUP6+gcIizKen3iEwJHo7uXJP6Kev7B10WPk8O
 7JDorQ7Qw40j41syv0Vy8yG1I6BAiS2OMs1xKAmI6dBiJYF0qJEMsgQOXiCMs3zi4qcQuy
 TZQqwfQeXQXZdSgg9lR4lRvyLfumCVJ234CwlGfGBoh+xFbRkg9mT2n+YnGibg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mng0OE1v
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Jul 2022 18:41:00 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> from the perspective of the build system, yes, libvpx is an optional 
> dependency. When it comes to the user perspective of the transcoding 
> feature, tvheadend by default includes codec-specific profiles, which 
> include vp8:
> https://github.com/tvheadend/tvheadend/blob/master/data/conf/transcoder/
> profiles
> 
> So users who enable the transcoding option are expecting vp8 support, 
> therefore I enabled it in Config.in:
> https://git.busybox.net/buildroot/commit/package/tvheadend?
> id=a9a14dc4357d32f705a52a5da73c782576ce6bc8

Thanks for the extra explanation, it would have been good to have it in
the commit log in the first place. Indeed, we normally prefer to keep
dependencies minimal in Buildroot in general, but I understand that
sometimes dependency that are optional from a build perspective are in
fact somewhat mandatory to make the package usable in practice.

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
