Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A45C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8600481FF0;
	Tue, 22 Nov 2022 20:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8600481FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdbsMCZwCITH; Tue, 22 Nov 2022 20:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC5981EF1;
	Tue, 22 Nov 2022 20:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC5981EF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34DEE1BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB9241903
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB9241903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDo4SI38LnCK for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:47:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683AD41902
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 683AD41902
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:47:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77D7F1BF205;
 Tue, 22 Nov 2022 20:47:14 +0000 (UTC)
Date: Tue, 22 Nov 2022 21:47:13 +0100
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20221122214713.1359fcac@windsurf>
In-Reply-To: <20221122190743.2610e8e9@booty>
References: <20221122053611.44757-1-neal.frager@amd.com>
 <20221122100124.3a441eb7@booty>
 <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221122171315.7a749d61@windsurf> <20221122190743.2610e8e9@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669150034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snL6reUDKUGH2/TcJ1ySRu4FtQMJBKZQKf0J7/sA6vc=;
 b=gocWGxTemHWw4VFZavzZqP9fUZyWwQoNzvsv2D5Oye7pl8LyQlq7weBvr8oMOLtrjprkiN
 90ZB/XeCP+5pDV3OrKeQo7BbiumDKCHMZ+JcHY7XUO2toZzygfLjNt2aHWy0eEPJFTirpo
 13BOO6pWguCIdm2YUEekLl3SihRvOGZQQ2icSAaMgmaVlZwcgUviw8GPst32sdmhKNyf5Q
 WQR6FAJ9z0IPbwAbKjzSU2J7oXbq+xX2KxYcev7QstSOEuYEZNto/gADmcWinrLPOwTFUn
 yfaFEryGDzImZJmDtcQjqA5GdJCuNfzDHgtskXH9S1V+8yqLz/XTeZ/fT5B1kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gocWGxTe
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
Cc: "Frager, Neal" <neal.frager@amd.com>, "Frager,
 Neal via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Nov 2022 19:07:43 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> I agree with the principle you are proposing.
> 
> However, according to the U-Boot source code, u-boot.elf appears as
> u-boot.bin repackaged into an ELF file. Is "stripped" a correct word
> for this?

I used "stripped" because that's how Neal described this file.

Based on what you say, perhaps a better option name is:

BR2_TARGET_UBOOT_FORMAT_BIN_ELF
	bool "u-boot.elf"

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
