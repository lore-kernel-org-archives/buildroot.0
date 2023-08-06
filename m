Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB98C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86DC409FD;
	Sun,  6 Aug 2023 19:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E86DC409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EazCRhC0PQyQ; Sun,  6 Aug 2023 19:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE423409B6;
	Sun,  6 Aug 2023 19:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE423409B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 049541BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E344160B1F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E344160B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VB2hzHbnMH09 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:46:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B78860C06
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B78860C06
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6894FF804;
 Sun,  6 Aug 2023 19:46:15 +0000 (UTC)
Date: Sun, 6 Aug 2023 21:46:14 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230806214614.04dffa8b@windsurf>
In-Reply-To: <20221005091032.3014-4-br015@umbiko.net>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-4-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691351175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXT6TwEmnkrVwNmeovNreciczzuKIKHJzKY0g8tDMoM=;
 b=G2rDZF4kdUFL/Kcqo7ZgnGJO3acZi1YXErwgLgCuwToMfUX//3++7k9GMtkT7XRZJykncD
 4SBywkUq+1Z6cZ3jgDeg7FBOmYsiMsKiyto2OobxZnPf8cI+TG20EUlsXY+oZAik1nmxJi
 ITrClRypEVkxhnZB4AI82WUcokUi3+Yolr+wjj9CD+oJ1bQ23t2zS+7Bzwg41w+CrgUZJY
 kGKAKDnKwW7903WQ88ihxSQlfTjaUeJYsu7CQwSoBI4i3drdg+nvkeYV7hXXnKgC+5eeIQ
 /1kxa7Z8jQlxjb+SGvqoabadcbPMYvGBpbb97f89+KLX1gSVR9vJXqBZ0rLBLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G2rDZF4k
Subject: Re: [Buildroot] [PATCH v2 3/4] package/mpd: introduce id3tag
 feature dependency
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
Cc: YANN E MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 11:10:31 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> id3tag is a sub-feature that is needed to extract information from mp3 files.
> It selects the corresponding library and handles config settings. Two other
> features need this sub-feature, but handle all library selections themselves
> and omit enabling the id3tag feature. In consequence, users have to remember
> to select both mp3 library and id3tag, otherwise the mpd executable will not
> process mp3 files.
> 
> Reflect feature dependency in mpd Config.in to make id3tag selection automatic.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
> Changes v1 -> v2:
>  - make this a separate patch 

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
