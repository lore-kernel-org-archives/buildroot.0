Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F56C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB59B6001B;
	Sat,  3 Aug 2024 21:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLIsPC9y05GL; Sat,  3 Aug 2024 21:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C638960590
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C638960590;
	Sat,  3 Aug 2024 21:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB5401BF2EB
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A535240182
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTioWkjS6kSF for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB7AB400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7AB400DD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB7AB400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:59:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA2FF20002;
 Sat,  3 Aug 2024 21:59:44 +0000 (UTC)
Date: Sat, 3 Aug 2024 23:59:43 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240803235943.226e6d14@windsurf>
In-Reply-To: <20240722-tfa-src-update-v1-1-e68bba62f146@ti.com>
References: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
 <20240722-tfa-src-update-v1-1-e68bba62f146@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722722386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jQf1eve7nujOplfWK7rpj+6qhiITXPNyYtIS1NcYDA=;
 b=XjMbwkIACEND9+VAkihxGmpJFcsCAYWYlrHL+f9nR9gr52F/BteT6HSKBfFwlhIPMVJDr3
 ic/FgLdQXnqQsJJ+EoAQQ4gEgWmOBM8AItGBm3WJlTcrstIzkcp2yB+6f+gscUswecKlG/
 Dv1EqrDV3SqYpomXbbDfn8V8u/SvtR3v1ISnTrkwpzjYVG1p/oKnA83gTe4E7p3cFKiDJR
 /8zQ2WQEkLqAm3e2qzuKg2b/5iD4imdhhRYmjhFRdih8Y1uuJYl+Ffjf0zZWWQU3ppi6XQ
 2yVdLYvzJvA1ZPWveohfW9JEqK9p3eVkvmLD0g3cHGXD9VlZiEND0WSXhmSFLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XjMbwkIA
Subject: Re: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: update
 source to the new mirror
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>, Bryan Brattlof <bb@ti.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryan,

On Mon, 22 Jul 2024 14:17:37 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Tags are no longer being pused to the old ARM-softwre
> mirror. Let's move to the new mirror at TrustedFirmware-A which
> continues to publish newer tags
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
>  board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
>  .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
>  .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 2 +-
>  12 files changed, 13 insertions(+), 13 deletions(-)

I have applied locally, but not yet pushed. My concern is that it's
really annoying that it breaks hashes for all previous versions of
TF-A. This means that all people having existing defconfigs (not the
one in Buildroot) that use
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE will see their
build fail now. And even for those using the defconfigs in Buildroot,
they will see a hash mismatch message and a redownload.

But I don't really see any other way around that. The issue is
basically that we are not fetching real tarballs, but auto-generated
ones, which are different when fetched from one repo or another.

Should we instead switch to fetching via Git all the time? Should we
switch to using the official Git repo, instead of a Github mirror?

As you can see, I am not 100% sure about this change, even though we
obviously need to change something to be able to use the newer versions
of TF-A...

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
