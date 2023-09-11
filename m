Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D060EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1B4402AE;
	Mon, 11 Sep 2023 07:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1B4402AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQ81W-cTzsgk; Mon, 11 Sep 2023 07:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E066402A0;
	Mon, 11 Sep 2023 07:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E066402A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3196E1BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C957240609
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C957240609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbH3ozZRGdgc for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:13:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE47340119
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE47340119
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFDF0C0007;
 Mon, 11 Sep 2023 07:13:26 +0000 (UTC)
Date: Mon, 11 Sep 2023 09:13:25 +0200
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230911091325.02fab21c@windsurf>
In-Reply-To: <20230904033632.817444-1-alistair.francis@wdc.com>
References: <20230904033632.817444-1-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694416407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5sbkruxCWta3MJFttNRUAovIdTVUoBSx5vBjwKaA0k=;
 b=gWKciV8JRcTc2qBgwPWDphVpTGAiHPwxaZozdhXDpSWpvMv2PfOcRUmZ8SbCHeKOfsq6Bd
 x2MHRYqpRuZ9PlJ6YPuUJbuEZjJ4xyLEoOMuZZwoU61g/pEYMDBlPWWQkmu31dmqVdwaXl
 jrxBtegT8+5rwHbNxW5qJvhdjIgws0t6QEhuFkDn4wuvXCHpM0/s1l9piUXbjpzm8gCcEB
 84emIH3tQfbZE5/bszB3xtJgnXozTwjLAtkFomy9xZ+vr+w8vU9qJA75eJ3OC+8PpT55Ud
 ikJl9ewzuaExhDjJ09LjlJElCJhIrO6KXbz68L+RObCU9MqtUzVLUrnomu3gTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gWKciV8J
Subject: Re: [Buildroot] [PATCH v4] package/libspdm: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon,  4 Sep 2023 13:36:32 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks, I have applied, with one change.

> +LIBSPDM_VERSION = 3.0.0
> +LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
> +LIBSPDM_LICENSE = BSD-3-Clause
> +LIBSPDM_LICENSE_FILES = LICENSE.md
> +
> +LIBSPDM_INSTALL_STAGING = YES

I've added:

LIBSPDM_INSTALL_TARGET = NO

here, as this package only installs header files + static libraries, so
nothing goes into $(TARGET_DIR).

> +define LIBSPDM_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(@D)/lib/* $(TARGET_DIR)/usr/lib/
> +endef

And I dropped this as a consequence.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
