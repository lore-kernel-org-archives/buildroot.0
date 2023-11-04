Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B08C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C07B400BD;
	Sat,  4 Nov 2023 17:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C07B400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kr4Z-S0d133t; Sat,  4 Nov 2023 17:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C5D140193;
	Sat,  4 Nov 2023 17:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C5D140193
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C98991BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D38040193
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D38040193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12MqkhvwnAnU for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:44:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 055C640359
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055C640359
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BFF840002;
 Sat,  4 Nov 2023 17:44:13 +0000 (UTC)
Date: Sat, 4 Nov 2023 18:44:12 +0100
To: <yann.morin@orange.com>
Message-ID: <20231104184412.44dc321a@windsurf>
In-Reply-To: <cover.1698747732.git.yann.morin@orange.com>
References: <cover.1698747732.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699119854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=305IhuYfbjH+XtWGxG5PWMzU7SRCX+u4JVmRAfGtzg4=;
 b=gHnWOz0EMKBzhtbC5Ma94oOWZCVzCQp7TZ3/J09yUGWuq8QFaH1QcU9hyDIED43bo/NEi2
 fO5bt+dobzhtOzuRZCnGVsmGVm7Jlf5CtmM7TfP1vb2yyOU+oX0APdrw9IodDS8nKhwYRT
 NuB6WxGFI6qQfxk7sEdbMSkVdspUChHEff+0x30AAz8YmitZmJ4JOayV3f47wDHI/9vpjr
 OiH+57MP5MDjnuWJoPn+0OvEY6VzBAL7bm3Y/Of08LbXnKm46nNzzsK/gH0MZ2lBIVrgzN
 hnf8kXyIFhM+suducPhgHDdS6IXBvNr1uX1uIYGhGWGS3itUgQHuBPDPpKJy0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gHnWOz0E
Subject: Re: [Buildroot] [PATCH 0/2] utils/docker-run network improvements
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 Oct 2023 11:22:14 +0100
<yann.morin@orange.com> wrote:

> Yann E. MORIN (2):
>       utils/docker: use host's network setup
>       utils/docker-run: propagate user's proxy settings

Both applied with minor tweaks to the commit logs. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
