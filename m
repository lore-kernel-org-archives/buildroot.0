Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3ACC3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131B08211E;
	Wed, 23 Aug 2023 21:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 131B08211E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFDM61Jk3K-N; Wed, 23 Aug 2023 21:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1221082127;
	Wed, 23 Aug 2023 21:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1221082127
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7082C1BF2A4
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A250402F7
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A250402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VqjDgNJicKz for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 21:04:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15774400BF
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15774400BF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A2FFF806;
 Wed, 23 Aug 2023 21:04:53 +0000 (UTC)
Date: Wed, 23 Aug 2023 23:04:52 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230823230452.4552936c@windsurf>
In-Reply-To: <695d398827606c825566d544ee8665c5@free.fr>
References: <20230822194922.71368-1-ju.o@free.fr>
 <20230822234113.12dd618b@windsurf>
 <695d398827606c825566d544ee8665c5@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692824694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRY4L41t2JzxvuNqVdbY/QNo3kPofvm7o+dMcQ3myoU=;
 b=l79bIYYLEkOkkasFZP1/gwYlcVVnC2wo8I6wHX1nUug96ukimAQ7LHZ/4D3GhjNUJAZ1e1
 /WNhgCDX1dKCLJIAO6ErCx2GUynumLEuKi1WLrbowY6WBA/xp37AJBwT6T4tzF2yYUgpPK
 9L+5YHJ/E72kgakUJjSyZ19V3xF3HOU8qpcNxt4xP0mUZJlWgPA+VOIou4U5sr88cgQpNS
 JN1sR+TQBCiSAeXk/PmOUV/hryZjLMnTOXFGNu6x6rr6p6xckSXhHk/XWHbDe8LD99kvHD
 9ODZmsiP+2Hdn7JIXpSFeyEKO6CFG1oEuje4VnmHQMnq6RNXen/1uak6YttTMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l79bIYYL
Subject: Re: [Buildroot] [PATCH 1/2] package/screen: security bump to
 version 4.9.1
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

Hello Julien,

On Wed, 23 Aug 2023 21:12:15 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This is not a mistake. It is more an unfortunate technical issue. My
> original series was including a new screen runtime test in patch 2/2.
> 
> I'll shortly explain, because this situation might happen again: my
> internet provider smtp (namely smtp.free.fr) decided few month ago to
> deploy an "AI based" anti-spam filter. Apparently, the thing was not
> trained enough on "git send-email" content. This generates many false
> positives, specifically on runtime tests. I'm working with the
> postmaster to solve the issue and complete this series when
> possible. Sorry about that.

Ah ah, so free.fr thinks you are spamming us with too many runtime
tests? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
