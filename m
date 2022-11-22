Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD3C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E922740B9C;
	Tue, 22 Nov 2022 22:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E922740B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxxm8imd16aB; Tue, 22 Nov 2022 22:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3366B40A01;
	Tue, 22 Nov 2022 22:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3366B40A01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D77A1BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A17D41901
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A17D41901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZY_34tPWMd1Z for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:30:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E405418C5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E405418C5
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:30:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4C04FF806;
 Tue, 22 Nov 2022 22:30:14 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:30:14 +0100
To: Tim Gover <tim.gover@raspberrypi.com>
Message-ID: <20221122233014.5b274d03@windsurf>
In-Reply-To: <20221101093007.28341-1-tim.gover@raspberrypi.com>
References: <20221101093007.28341-1-tim.gover@raspberrypi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnoPs6t1lfAiItg31HQIMfOzlt2/HowJuukxqmdKKCQ=;
 b=NpMKAdCof/Qgw1Hp3pqpftgXYfSSZ80mULzMqk2uIoW/c9o8ommELry7l5Hdhwg7wafPXF
 m3rsoClgOvoCtsfjpp3FkzM8qc5yc9iWXYMTClzhAFpnVfcBIbEOazuo95x4+DZhCybUiz
 4Nd65BcEeyXYkAjfSsXxgxjQCW5ZK2s1Q57RAZGDahzBIf3NZFp+vBCn7bNtoi+JC/F10m
 NvxB7pcgkZEnUq0x1AG2Xg29+FgdumyI+nao9MX+XHGcLPc4ODjmxlXoTB1tNCVuESkhQV
 OQMkiTfIp7JHZLJ3UcY3sdVj4i6hQupbashXYJU0T6QiJdfWKcqjEhtTJwD93w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NpMKAdCo
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 09:30:07 +0000
Tim Gover <tim.gover@raspberrypi.com> wrote:

> Enable aarch64 support for rpi-userland to provide
> vcmailbox and vcgencmd in 64bit builds. The are useful
> for programming OTP and system debug.
> 
> The ARM64=ON parameter restricts the make targets
> to only include those supported on 64-bit i.e. it
> excludes the legacy Broadcom EGL drivers.
> 
> Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> ---
>  package/rpi-userland/Config.in       | 14 +++++++-------
>  package/rpi-userland/rpi-userland.mk |  6 ++++++
>  2 files changed, 13 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
