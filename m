Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60974C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142B6417E8;
	Thu, 10 Aug 2023 20:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142B6417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHpPVBnJ0nAe; Thu, 10 Aug 2023 20:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7B7417D2;
	Thu, 10 Aug 2023 20:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7B7417D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EED9A1BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E94408D4
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9E94408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fayg3_SxMu0r for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:41:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C65F3417CD
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65F3417CD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F34460002;
 Thu, 10 Aug 2023 20:41:05 +0000 (UTC)
Date: Thu, 10 Aug 2023 22:41:04 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230810224104.654c469d@windsurf>
In-Reply-To: <20230808214153.1453666-1-f.fainelli@gmail.com>
References: <20230808214153.1453666-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691700065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hd/xqY0+0wwyQjRyXTdqrpSg64I4vUcY6XNk8jmCXhs=;
 b=dmgA3x5D3VGU3BYDUhhELfgJM/7WnhANOlrjco3ml9wzZVtjHhc/KOTe8Qd+9cjm/9u0PU
 UsyO9RhgrCAWrO86J7CBUasJG8LMnuN++QeoaYaYRWevPS8UKYJA3HBSBUh4isKtO9vy6J
 MA81oeAJEO/aTxzUjgmAbda+u/fm6HcILh6tEKaO4WHe38M60/ndeZE58pfoGcsJS8TfID
 ClzFNsPrZ3XPIHHKbYYGCl77+HNFKrx9PAQtTCUxUizm0RKUKC3V0yjatBI2/522FtnqFV
 2lvLMGQ934qDF1lgNWfWjSpSlh10BWSFl54KP6GJxHMSoJiyKCm/aaJhlh4xLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dmgA3x5D
Subject: Re: [Buildroot] [PATCH] arch/mips: Allow building for MIPS IV
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 14:41:53 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> MIPS IV is an older ISA than R1 but is still useful to support older
> MIPS-based systems (e.g.: Cobalt Qube).
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/Config.in.mips | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to next with a slightly tweaked commit log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
