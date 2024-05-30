Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D86C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 19:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F6F405F8;
	Thu, 30 May 2024 19:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U66Axiv8w7XS; Thu, 30 May 2024 19:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D97240A39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D97240A39;
	Thu, 30 May 2024 19:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23FE11BF479
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A07F40A39
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUDs1f45d-eS for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 19:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BD12405F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD12405F8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BD12405F8
 for <buildroot@buildroot.org>; Thu, 30 May 2024 19:13:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2807A20005;
 Thu, 30 May 2024 19:13:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sClD2-00CCMg-15;
 Thu, 30 May 2024 21:13:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240529213751.3919280-1-dario.binacchi@amarulasolutions.com>
Date: Thu, 30 May 2024 21:13:08 +0200
In-Reply-To: <20240529213751.3919280-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 29 May 2024 23:37:51 +0200")
Message-ID: <87a5k7qfjv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/at91sam9x5ek*_defconfig: add
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

 > Furthermore, the use of the directory board/atmel/at91sam9x5ek/patches
 > for all 4 at91sam9x5ek*_defconfig configurations automatically fixes the
 > Linux compilation failure for the at91sam9x5ek_defconfig,
 > at91sam9x5ek_mmc_defconfig, and at91sam9x5ek_mmc_dev_defconfig
 > configurations as well.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 > Changes v1 -> v2:
 > - Put the patches under board/atmel/at91sam9x5ek/patches and use them
 >   for all 4 configurations (i. e. at91sam9x5ek_defconfig,
 >   at91sam9x5ek_dev_defconfig, at91sam9x5ek_mmc_defconfig and
 >   at91sam9x5ek_mmc_dev_defconfig).

 > +++ b/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash
 > @@ -0,0 +1,2 @@
 > +# Locally computed
 > +sha256  cc72d6a36ebf5f0970e18788b1e1dc9b76ba9237ec6745c6f16f1b2e1d8fb3a0  uboot-linux4sam_6.1-git4.tar.gz

Hmm, did you do anything special here? This is the hash I get if I use
tar 1.34, but NOT if I use the correct version, 1.35.

Fixed by running ./utils/add-custom-hashes and applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
