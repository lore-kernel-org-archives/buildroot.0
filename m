Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E35C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E5C60612;
	Sat, 23 Mar 2024 20:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yr9ddFB_V_-Y; Sat, 23 Mar 2024 20:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E36E6063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E36E6063C;
	Sat, 23 Mar 2024 20:25:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27EC31BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148CB6063C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TC9x7fSYAcyr for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 102FC60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102FC60612
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 102FC60612
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:25:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D0561C0005;
 Sat, 23 Mar 2024 20:25:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro7vT-000L1A-2P;
 Sat, 23 Mar 2024 21:25:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-3-tekieli.lukasz@gmail.com>
Date: Sat, 23 Mar 2024 21:25:11 +0100
In-Reply-To: <20240208211517.9234-3-tekieli.lukasz@gmail.com> (Lukasz
 Tekieli's message of "Thu, 8 Feb 2024 22:15:17 +0100")
Message-ID: <874jcwitlk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lukasz" == Lukasz Tekieli <tekieli.lukasz@gmail.com> writes:

 > Enables U-Boot and required OpenSBI builds for the VisionFive2. Changes
 > the sdcard.img to use GPT and adds the SPL and U-Boot to partitons
 > specified in U-Boot's documentation for the board.

Hmm, so to use that we need to change the boot mode to SD, otherwise the
SBI/U-Boot in the SPI flash will still be used - So we should add a note
about that.

I gave it a quick try here and it does boot, but USB is broken in U-Boot
and Linux, is that a known issue?

[    8.728592] xhci_hcd 0000:01:00.0: Error while assigning device slot ID
[    8.735301] xhci_hcd 0000:01:00.0: Max number of devices this xHCI host supports is 32.
[    8.743495] usb usb2-port2: couldn't allocate usb_device
[    8.748984] xhci_hcd 0000:01:00.0: Error while assigning device slot ID
[    8.755660] xhci_hcd 0000:01:00.0: Max number of devices this xHCI host supports is 32.
[    8.763686] usb usb1-port1: couldn't allocate usb_device

 > U-Boot config uses BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME with value
 > "u-boot.itb". Using BR2_TARGET_UBOOT_FORMAT_ITB fails, because the
 > build does not support u-boot.itb make target.

Hmm, odd.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
