Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78088E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D33D60AB9;
	Sun, 22 Dec 2024 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgpJ_nwkP5BA; Sun, 22 Dec 2024 15:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC776087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC776087B;
	Sun, 22 Dec 2024 15:18:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1601BD8
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E92AE40606
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHoqJBcvcSDf for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 15:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 658F3405F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658F3405F7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 658F3405F7
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 15:18:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 010D120003;
 Sun, 22 Dec 2024 15:18:21 +0000 (UTC)
Date: Sun, 22 Dec 2024 16:18:20 +0100
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, =?UTF-8?B?TWlxdcOo?=
 =?UTF-8?B?bA==?= Raynal <miquel.raynal@bootlin.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241222161820.7c8b1081@windsurf>
In-Reply-To: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
References: <20241221-fix_mpv-v1-1-d7ba39606571@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734880702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw1OBZrkS0VlpfucTlmNf+9SD2cJ1BmN8+sxZs7pMs8=;
 b=Whd3q1KEbovCiGTPUlyOFnBNmPXdwSy1+OK4TEBfd2CwFQ3VQbMSzzs5M6nVvsJXJjLEMg
 66OwhbL3YkefB0RqSAv4U21kMcDhdh178L6vG/pERGOEDnLOMv72NDMz5qdEa1oqM9HKZb
 EIWBTTmlvNDpt6u+inzhA13OpcCSZA/0WfKLWkd5pBC5/e2j/BakRMcDo300iTvv9dd0hY
 EFvd8dqqM4Pi8cYUtip5nCXjnEkf5VhzDZ0PnaSjW/X62O4DpfyoO8Ha2EQOahEynJA5l8
 CzOFmYDQoxv1/yHbmWwEHfdSTieeNbE0DMNWv3RtN9MpScjUjbFINIv6q7FsiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Whd3q1KE
Subject: Re: [Buildroot] [PATCH] package/mpv: use meson instead of waf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sat, 21 Dec 2024 18:19:21 +0100
Thomas Bonnefille via buildroot <buildroot@buildroot.org> wrote:

> Waf has been entirely removed from mpv since commit f2cce5f [1] in favor
> of meson.
> 
> This commit is a rework of mpv makefile to use meson.
> 
> Note that the meson package compilation itself supports the
> static/dynamic compilation setting.
> 
> Fixes:
>     https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77/
> 
> [1]: https://github.com/mpv-player/mpv/commit/f2cce5f38f4031bf1a4b4919ec90e4e8f8c66a77
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thanks for the fix. However, do you have an analysis of what the
problem is, and since when it started occurring?

Indeed, we want to know if we want to backport the fix to our stable
2024.02.x branch or not. Also, your fix is far from being "minimal":
such a conversion from waf-package to meson-package can potentially
introduce other regressions.

What was the issue with the waf build system?

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
