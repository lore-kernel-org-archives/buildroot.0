Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0698EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 05:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6900D60E44;
	Thu, 29 Jun 2023 05:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6900D60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngLs3SGzrVhf; Thu, 29 Jun 2023 05:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31CD60E3F;
	Thu, 29 Jun 2023 05:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31CD60E3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A487F1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7094A60E3F
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7094A60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGTi5-XeYRxE for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 05:41:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9783760E30
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9783760E30
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 05:41:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 364DAC03A3
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 05:31:39 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95B731C0004;
 Thu, 29 Jun 2023 05:31:32 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 07:31:27 +0200
Message-Id: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688016693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zXJU4d4KPDk7q/sdjM+al7e3QEF2VqI8orryKjBRqb4=;
 b=WTWMTJyFDh2F+aSseB4WpDUmM4sNN8aZOGxgvaTVvUPkXOYrmlad+FDQmEQmYWHZ24uz/C
 xAoQ+Z6x9qUHng93rqSAl4Ttw8UqQxDVZgSNQUyUq9/hSj/U5BzZm2ytqX3K+/GgsaOmoW
 UGpzZuLheLw85mQJWR1Mhg3QYElPAg9l53KxrtPYOE8xGmV/eytIWq9upaI3BLCj7I75RP
 rcyJexKoPTisRYqbX2Kr7DMae2iwj6QAn6BWULw9q4kle8oJt/iq/F87MwdPDxApgn4l+L
 4vDUfOjJurOX+6hXgc00valPfbloaQblcvzWuuiOK4ictMvS22mRArYrpNABlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=WTWMTJyF
Subject: [Buildroot] [PATCH 0/3] Add support for the MCF54418 Coldfire
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi !

I have a custom board which uses a MCF54418 and I want it to use an
upstream buildroot (for all the good reasons ;-)).
From what I can tell the only Coldfire processor currently supported is
the MCF5208 which does not have a MMU.

While trying to add the processor support, I faced an issue during the
host-gcc build when the MMU configuration is selected, because it makes
it compile the multilib part.

Sadly, a commit [1] removed the GCC ARCH configuration which was used to
determine if the architecture is "m68k" or "cf". I have re-introduced
this configuration here, only for the MCF54418 case for now as I am not
sure if it is my real issue or not. What I can tell is that when I have
the BR2_USE_MMU selected, the host-gcc fails and it passes when I add
the proper architecture.

[1]: eda11417be m68k: remove BR2_GCC_TARGET_ARCH

Jean-Michel Hautbois (3):
  arch: add support for mcf54418 Colfdire
  board: add the qemu board support for mcf54418
  configs: add support for the 54418 qemu defconfig

 arch/Config.in.m68k                   |  9 +++++++++
 board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++
 configs/qemu_m68k_mcf54418_defconfig  | 19 +++++++++++++++++++
 toolchain/Config.in                   |  1 +
 4 files changed, 52 insertions(+)
 create mode 100644 board/qemu/m68k-mcf54418/linux.config
 create mode 100644 configs/qemu_m68k_mcf54418_defconfig

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
