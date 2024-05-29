Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E98C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 06:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 607E260704;
	Wed, 29 May 2024 06:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efAUyFTjthgi; Wed, 29 May 2024 06:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C4E60707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72C4E60707;
	Wed, 29 May 2024 06:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF561D2E0B
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28E7E40150
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vECjVIrPQGp3 for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 06:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06E4040139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E4040139
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06E4040139
 for <buildroot@buildroot.org>; Wed, 29 May 2024 06:43:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D10484000A;
 Wed, 29 May 2024 06:43:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sCD1z-009exF-0Y;
 Wed, 29 May 2024 08:43:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240527160343.2662538-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 29 May 2024 08:43:27 +0200
In-Reply-To: <20240527160343.2662538-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Mon, 27 May 2024 18:03:43 +0200")
Message-ID: <87le3trucw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/at91sam9x5ek_dev_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
 > defconfig from .checkpackageignore.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 >  .checkpackageignore                                             | 1 -
 >  .../at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash | 2 ++
 >  .../at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash   | 1 +
 >  board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash           | 2 ++
 >  board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash           | 2 ++
 >  configs/at91sam9x5ek_dev_defconfig                              | 1 +
 >  6 files changed, 8 insertions(+), 1 deletion(-)
 >  create mode 100644 board/atmel/at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash
 >  create mode 120000 board/atmel/at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash
 >  create mode 100644 board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash
 >  create mode 100644 board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash

We have 4 at91sam9x5ek defconfigs all using the same
at91bootstrap/Linux/U-Boot, so it IMHO would make more sense to put the
patches under board/atmel/at91sam9x5ek/patches and use them from all 4
defconfigs.

Care to send an update doing that? Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
