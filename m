Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA6DC001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4963F81341;
	Sat, 29 Jul 2023 21:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4963F81341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pHYpzRUvA2u; Sat, 29 Jul 2023 21:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 966EF812AC;
	Sat, 29 Jul 2023 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 966EF812AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71ACF1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C1CF40951
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1CF40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0S1ZbMLWbVC for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:39:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086754089D
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086754089D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 362D7FF802;
 Sat, 29 Jul 2023 21:39:28 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:39:27 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230729233927.572fd26c@windsurf>
In-Reply-To: <20230607202439.188050-1-ju.o@free.fr>
References: <20230607202439.188050-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690666773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QD/oiMGyoPfBtVNXeUEDSMWhDWe4QDZqZcpvJThRT6s=;
 b=NOmdmdTRTNKMbKr9E28207zzl5B6nf5WBWLJnrjun5xLMXE6bTyx8biMl9vgBS8AONaSgu
 lpYIzGdgnbH+dwBgvt26CYE5mKFke8hF1PaPZx1MNsbQ/DwIiUxK1FQ2udUCeIXEEP9JJp
 F+UuugOH/rJ4echp3MFPe07dHfJdxQ4/kAvXpBNaGZEgYbLRuSY3Gd1GG6tQsMCLDF0rGG
 aMAJHV++fZcjgepQYLtBJBdZ0JyYG78Cmn29YvfjdT8bjhFNPaY1GMMYToxBxbj1uA6O9U
 Dr5ZhEnt1uWUrXp4PuXSIyGdoZyzF5VfmChab7ZhaSrXH5f6GfiC0qRqOC3DkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NOmdmdTR
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox-player: bump to
 version v2023.04.05
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

On Wed,  7 Jun 2023 22:24:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> License hash changed due to copyright year update.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/glslsandbox-player/glslsandbox-player.hash | 4 ++--
>  package/glslsandbox-player/glslsandbox-player.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master. Nice to see an OpenGL test case in automated
tests! I'm curious to understand more how it works:

- How does glslsandboxplayer knows that we want the frames to be
  generated as .ppm files?

- What role does the DRM vkms driver play in the story?

Thanks for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
