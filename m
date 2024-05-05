Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0933C25B10
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E6B3400A6;
	Sun,  5 May 2024 13:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Rzazt8ITJ2P; Sun,  5 May 2024 13:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87560400D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87560400D0;
	Sun,  5 May 2024 13:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18F441BF31E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04E748218A
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suYtBMXT-Hop for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02D7182188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D7182188
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02D7182188
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:40:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1BE5FF806;
 Sun,  5 May 2024 13:40:00 +0000 (UTC)
Date: Sun, 5 May 2024 15:39:59 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240505153959.14f8ef6b@windsurf>
In-Reply-To: <20240412211222.26585-1-brandon.maier@collins.com>
References: <20240412211222.26585-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714916401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDS2zpTDhWjzmDyqRMUBBabn8MHmWNAszWJd3H4k6YM=;
 b=eHI99uD3FpXJxREfd+XDqM8FoXfCKur05AbftQIB6WQ7IwGlIP1MnEoIQifJTx8lyuAdt7
 xa0RCukdUA73Nn+c+EDKBwd6ojWzXTxH+jJ5TFAM1Jixt/qZSdnPT2hge4P9XNPuL1ogw/
 I+jTCraNMr4f6lDu5AsYyN+TW2dxoadh3xa38FurJ0mbigr62QkFg+QMYbZ3VqOxu/5lPy
 M/ZvgA3BszwNi13jyKxOAAqrTulr8Ftvsn36norX5hfOwnmj93hEMZc4B7hPlZ+To1/cUe
 9KtpLbPIeSD39XP4LH7g8BvBbbsv2ovxZXCL0fyY8OQWPHGjCOefLwOu9N2TEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eHI99uD3
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: enable
 verbose output
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 21:12:22 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)

I am confused as to why this patch is needed: for both Linux and
U-Boot, we don't need to do anything special, just doing "make V=1" at
the top-level, the V=1 gets passed down to Linux/U-Boot, and they
exhibit a verbose build. However, that doesn't work with
arm-trusted-firmware indeed, so I have applied your patch which makes
the build verbose also for arm-trusted-firmware. Still a bit unclear as
to why it doesn't work "by default".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
