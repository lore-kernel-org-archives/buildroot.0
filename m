Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0933EC001DB
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2C6E4052A;
	Sat, 12 Aug 2023 19:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C6E4052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oECgBYwo79jp; Sat, 12 Aug 2023 19:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6EFB4051D;
	Sat, 12 Aug 2023 19:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6EFB4051D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A94BB1BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD194150E
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD194150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y07JJEZwcH_7 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:56:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EFB64150C
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFB64150C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17ADE40003;
 Sat, 12 Aug 2023 19:55:59 +0000 (UTC)
Date: Sat, 12 Aug 2023 21:55:59 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230812215559.65936b40@windsurf>
In-Reply-To: <20230812175348.1449808-1-zgyarmati@zgyarmati.de>
References: <20230812175348.1449808-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691870160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wxr2sEbgaF5sXpg/fjHkdlJWR6IxjLiycfcW+qXRKcw=;
 b=K2nj3gEeIkih1b/7+wY06mZ648SiKgA681EcCDoUCv0faAUL6i/qETPufhGX5zSuUivHpH
 yoSS+cIef4hEcTe9Es5y1Ch0g8w+6EfmtV1D+NOZWLKMjyWJuWI61DmicOIbv73vEqG+iD
 npd0lwoi9DeFq6telCamTghoTUQN/0tf8oCEQVCLlpdg7d+q+gUA8gEupzlVAd5vLzywFY
 TtTvRRlK26SA+jA6l7J/WlXEiJR1sh/x2filcwblXspnhXhATPLSxS1z34Ea78sYF3rbyn
 Z05VFbb5tmwAE2IksYJtrF9xVgHYVD681JslM/ugSupM+z317YFU7jYk9FD6cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K2nj3gEe
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to 0.1.8
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

On Sat, 12 Aug 2023 19:53:48 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Removing upstreamed patch and force autoreconf

Thanks for your patch. However, why is the force autoreconf needed? We
need to have a comment above this line in the .mk file that explains
why.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
