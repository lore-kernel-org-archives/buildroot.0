Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD84C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 939D082042;
	Sat, 29 Jul 2023 22:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 939D082042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVIrHYKbA9dw; Sat, 29 Jul 2023 22:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDA18202B;
	Sat, 29 Jul 2023 22:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCDA18202B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D22961BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EB8F4016B
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB8F4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4O5nu5ULenE5 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:15:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A233F400FD
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A233F400FD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4020D40002;
 Sat, 29 Jul 2023 22:15:15 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:15:12 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20230730001512.159bd156@windsurf>
In-Reply-To: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
References: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV+0Fg6Q+GYpsufODG1t7OXUh4TliK35So2SExB1q+c=;
 b=biFv5ekz1EpDmhPV0Mrk0dQzBKvkaLIpjRU7t68YNxY8wNJTeGJerBdrCRzoEvMYSOk4L6
 f/7KF+Mq8jtqc0fSADZntRgGRogMZes+y5Tv8qWsTUoaQ5bZg1+rBKfbHTbR+jPG5EtHds
 oqCAc8Qbef6p3J9J+g+OPniFcrZDC+dWy3y6/z2zcO7sQx8P29bfRWbAqBtj+JGgXgItHN
 DMGM0S8boBQyN2txfAiQ/ihwJkBH4pRdJpsDL+/PwZphElaKe790cjfKLHub0NKSfFZv0f
 q7Xbal7dA20rE591fCZ8+U8b2etEVEK+5G9iHrlMy8CvjV4lLZ0FI6MII6mPTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=biFv5ekz
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Mar 2023 18:58:15 +0100
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Add a patch to fix the build if only yescrypt is enabled.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/df6a16a55bf02cf2d7377f9636913f0b3bca574f
>  - http://autobuild.buildroot.net/results/758d4fd297fbd77ef846d3a3d4c207021f866752
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  ...-sflg-for-USE_YESCRYPT-in-newusers.c.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch

I have applied Bernd's patch instead, which has been accepted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
