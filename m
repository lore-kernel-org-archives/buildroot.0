Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE2EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1653760757;
	Sun,  9 Jul 2023 16:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1653760757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lind-cAWEYTf; Sun,  9 Jul 2023 16:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57FF8606F5;
	Sun,  9 Jul 2023 16:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57FF8606F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF0B1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847054011C
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 847054011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgRPPO3C301j for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:47:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 612BE40017
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 612BE40017
 for <buildroot@uclibc.org>; Sun,  9 Jul 2023 16:47:01 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF57CFF804;
 Sun,  9 Jul 2023 16:46:58 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:46:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709184657.2658124d@windsurf>
In-Reply-To: <pan$c55d7$1b51cf8c$e75099b8$e4a39eb@ID-313208.user.individual.net>
References: <20230709095058.1547133-1-bernd@kuhls.net>
 <20230709182938.00cef6ca__21548.8254021452$1688920206$gmane$org@windsurf>
 <pan$c55d7$1b51cf8c$e75099b8$e4a39eb@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688921219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbpYKXEfX5iZLZAHzs8IKLtmjOMreS9p7E19J5H7a9Y=;
 b=gtHZUJZrG/z9kzdhkxwOBkXqUNWHPKmXRKukyUSmWIjEJw++jaBpOef3xpDraHOKwsfe+O
 hjhrMybBr8rGq5GwTqeRNw6Rt9sfGqR1GbXrCDWskKShcKROVT0RAo/TTlfsc/pjRLxcxM
 c4NDccOV6KhodWuOAWa0q3TKuXZ+S40fELDEp0Ta25u3TDAbkksljKN5pADrL1Me0ETDer
 /hDjVOhazw6xfkqmHhYsow/6kw8mAgB1iYETFwZjQy5tTAjMtVskMbz0fOABtpLKAe4jVt
 o3IXYqZKeZEbY4rd6WAqJOrfqv+jDC/GKDN1A5L9gQbMlJDS9eR4ttg6puLERA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gtHZUJZr
Subject: Re: [Buildroot] [PATCH 1/2] package/fwts: Fix build with
 BR2_OPTIMIZE_0
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

Hello,

On Sun, 09 Jul 2023 18:42:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> yes, back in 2017: https://bugs.launchpad.net/fwts/+bug/1687049
> 
> That bug report was solved by using -O2.
> 
> Investigating further I found https://gcc.gnu.org/bugzilla/show_bug.cgi?
> id=102502#c4 which, to the best of my limited C knowledge, indicates that 
> some assert code will not work with -O0 by design. At this point I 
> stopped my research and disabled -O0 ;)

Alright, thanks for the additional details!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
