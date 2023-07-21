Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD619C001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E5840482;
	Fri, 21 Jul 2023 21:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E5840482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6imKud5lQPHz; Fri, 21 Jul 2023 21:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04A040949;
	Fri, 21 Jul 2023 21:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A04A040949
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19F6D1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E770380B5C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E770380B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lChfp8NEJTcX for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFB8B80C2F
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB8B80C2F
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9920CC736B
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:19:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6FDDFF805;
 Fri, 21 Jul 2023 21:19:21 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:19:20 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230721231920.4e0c3fff@windsurf>
In-Reply-To: <20230721184752.819052-1-francois.perrad@gadz.org>
References: <20230721184752.819052-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689974362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYRC0zZBJoB4d5+Ozbow5DvyWAUW3Cvgq2zqW2EJup8=;
 b=Ei6DIE4s0PYr1vgHrjcgPUlIZQMDbq77T6ehy2HubQ2nAf9f4B2Hzh/akgaMNu3si61Kd3
 EitGXLyc/i1kdv4KJBWp8AmVakbAVOCv1qrQkjtptb7cQLliMb7Z86cR6flifWBIe72vbZ
 O3xzPCDMrsADnLUD4pTWkpTlJyOx0kO7vAu4h4NjEXiG/gbOskrKo4rLC+EJn17aM8z1Ih
 aK9lAvW6vSzFCDKYc6K26OTBB3PocoVnDVlpghqbNkOlV8hmaku4kH7XBSl1OkMUTBu/Vb
 8oEI4vn4jTt/p9ygSYNlq2TfetcvoYOLjeCEetFpQBS2Cd+ZkdsvQzk/E1SNAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ei6DIE4s
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
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

On Fri, 21 Jul 2023 20:47:52 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.hash | 2 +-
>  package/luajit/luajit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
