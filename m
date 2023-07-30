Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A094EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92B56102E;
	Sun, 30 Jul 2023 21:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92B56102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOSjN_lR_HNi; Sun, 30 Jul 2023 21:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032BC61028;
	Sun, 30 Jul 2023 21:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032BC61028
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7085D1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5702D61021
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5702D61021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mnuin-wat1DW for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:38:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15707605EA
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15707605EA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 009D6E0002;
 Sun, 30 Jul 2023 21:38:01 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:38:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730233800.0ce60d19@windsurf>
In-Reply-To: <20230730210523.2327588-1-bernd@kuhls.net>
References: <20230730210523.2327588-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690753082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMacyn160UY7TSJi8ad9Wp8Mv3mFbg31e6vEp8L33Y0=;
 b=XqUv9Q6y+/hvzUMuatmyAA2GJgRHy9atXrnSs+Z0NnVxMfdUYijjF0BojOP9TBKBeyQmMm
 NYyeRat+wbmvMF2cuZrL11XAh9jHdYcit9BV2Jkyw0DKOqgp7Wd1ExkUcAh0kFGpYRyo82
 psU1NOg+sJiCqJlj2XJA8atUVi9bhPEo7hwUjpHHwXafubQPr2vlxENybodRwPTcdksOul
 H3rVXIiaHOb+dI8yypQqbU/f+9Hq5YbWeukJzT9efjyMmWkiWmmTmWSvq6z04h7wH4bFaV
 PAspcdDrqBeDRQNQhg/8mbOFksq9sFwBrTILtAN09vadgked9C1LgSHQOPn4ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XqUv9Q6y
Subject: Re: [Buildroot] [PATCH RFC 1/1] package/xenomai: disable -Werror
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 30 Jul 2023 23:05:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> This is a quick'n'dirty fix for the build error which is only visible if
> you issue the build commands manually and remove ">/dev/null 2>&1".
> Since this is my first patch for Xenomai I am unsure the fix would be
> accepted upstream so I would like to discuss it here before sending it
> upstream. Therefore I did not add an Upstream: tag.

I guess upstream would prefer to fix the actual issue rather than
dropping -Werror.

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
