Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D53EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37A1061020;
	Sun, 30 Jul 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37A1061020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alI8nFaFjoho; Sun, 30 Jul 2023 21:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883386101E;
	Sun, 30 Jul 2023 21:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883386101E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE99F1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D068179A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D068179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fi_5c0_tonP1 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:33:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57C158161D
 for <buildroot@busybox.net>; Sun, 30 Jul 2023 21:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C158161D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D8711C0002;
 Sun, 30 Jul 2023 21:33:03 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:33:02 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230730233302.1a8b9d2b@windsurf>
In-Reply-To: <20230521082858.500-1-guillaume.bressaix@gmail.com>
References: <20230521082858.500-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LSUeV2cF5XP5GAD3VS2C5FeEnlg8XES0CC+SLR0ZIs=;
 b=RJ8DbAIukyyHlCZs0e5LFj1VgIQyYDOwG1XZqcPnbsIrNxPITHAgEllM1dXo8GmUqyF4dH
 Hg6pt+faa9jNKwxIHla8L1SNoTLvdDL3O93nNjj2fz3cTHwKPvgtcFrOggAF8/wo26GKux
 MwH+EsI0GJmno9JhPMYpqvBkqWHkIcrqHEzGQQBKyz5z149IkxXh5Oh9QbTMdmmDrefXBE
 y8YROawoMFdnoJ9FM5rklfqdrExKHwzy5depDTiGJAg27jO9WFw0iQlFPyoLHu/eaGLbye
 C0DfSnngZ+0z4VqzPUNEN0lXLiuuCGn8yQ/MqCsWX6qugIDywj7hNC9kVqqiqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RJ8DbAIu
Subject: Re: [Buildroot] [PATCH 1/1] package/pixiewps: bump to version 1.4.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Sun, 21 May 2023 10:28:58 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> -PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
> -PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> +PIXIEWPS_VERSION = 1.4.2
> +PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,v$(PIXIEWPS_VERSION))

Hum, I'm sorry but this doesn't look like a bump. If we look at the
commit history of pixiewps (most recent commits first, older commits
last):

464326fbcc499ac92d4f04c3990a9cc9c5124e86 (HEAD -> master, origin/master, origin/HEAD) Update gitignore: add pixiewrapper binary
85af251806ab24454372134e7055823adebd5afa remove gmtime()-related code duplication
c1dd3a9ff6618b5f2e3535855cee9ffb10788b81 use gmtime_r() to mute code analysis tools (gmtime() is non-mt-safe)
a6b3fa514c0c9a6ad5dc931040218451c64ce150 add pixiewrapper
8964527b85f558465341d9daa8da8d8a94eb0967 add --cstart/cend switches for time_t range
9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59 endianeness.h: fix logical bug which broke big endian   <--- we are currently here
28f68e694bdf5774300a1451c970578de0e19ce0 (tag: v1.4.2) Bumped version to 1.4.2                   <--- you propose to get back here

So in fact, you're proposing to go one commit back in time. Maybe it's
OK but you should explain why. And a "fix logical bug which broke big
endian" seems useful to have in Buildroot.

Could you clarify?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
