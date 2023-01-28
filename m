Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98457C636CC
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D34B40498;
	Sat, 28 Jan 2023 22:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D34B40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bc0Zsg7hvaQZ; Sat, 28 Jan 2023 22:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63AA640146;
	Sat, 28 Jan 2023 22:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63AA640146
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5B21BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 220A960E35
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220A960E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eG1lJa_O8Lmj for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:23:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA4560BF4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DA4560BF4
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:23:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 46B67E0002;
 Sat, 28 Jan 2023 22:23:40 +0000 (UTC)
Date: Sat, 28 Jan 2023 23:23:39 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230128232339.156536e9@windsurf>
In-Reply-To: <20230116215516.264468-2-dario.binacchi@amarulasolutions.com>
References: <20230116215516.264468-1-dario.binacchi@amarulasolutions.com>
 <20230116215516.264468-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674944621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kadG5j/4x+s+MA6v1KYfJiJ3C/XrGCptMpHt6CCYliE=;
 b=XtCEZ5i9ITBoqDRbpBMbk6KxYVYOh5WGNv2Dwq+7CEjmeRWnNtYFdZmQBZ9fCFcmDAlHLu
 xEWp5jltUl1254Be5aIUL/IeZqhB8K44WPHR95guKnQvOIYCgbOegXALPGScNYRXThMgwr
 zyQRZGKgyExJ6AZ4vUl/RqFoBjI6ZSI5Syk2y56GmThuitooSOmLwD64oTi9HV8ERs2YHv
 IQbgFbKtzfVNUZOtfMOw16WRPRc5m+3d4+zP1JUCBGIHqsXz8dy94a7QKBwIbOUpw+bQVL
 yrQGfonoT3wPOa3SirAR5yaV0qj431UzRcj4lEbWcp67IJ3wOccu/gOGWaerJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XtCEZ5i9
Subject: Re: [Buildroot] [PATCH v9 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
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
Cc: buildroot@buildroot.org, Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Mon, 16 Jan 2023 22:55:15 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
> input and output interfaces to a dedicated carrier board. It is designed
> mainly to provide graphical/video and connectivity interfaces to the
> appliance.
> 
> Board support package includes the following components:
> - mainline Linux kernel 6.1.6
> - mainline U-Boot 2022-07
> - default packages from buildroot
> 
> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> The smm s2 board is basically the same as the pro except it boots from
> NAND instead of eMMC.
> 
> Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Changes in v9:
> - Bump Linux kernel to version 6.1.6.
> - Remove the Linux kernel patches because they have been merged into
>   the used version.

Thanks, I've applied both patches. One interesting point to note is
about the kernel configuration. Your Buildroot defconfig says to use
the default ARM64 kernel configuration + apply a pretty huge fragment
to disable lots of things:

 board/bsh/imx8mn-bsh-smm-s2/linux.fragment    | 895 ++++++++++++++++++

So you have a 895 lines fragment to disable lots of stuff. I was
curious to see if this fragment was not *larger* than the actual
resulting kernel configuration, as a defconfig, and indeed it is:

$ wc -l output/build/linux-6.1.6/defconfig 
816 output/build/linux-6.1.6/defconfig

And still reading this defconfig, it is pretty clear that lots of
options that are enabled are not relevant to your system, and could be
disabled, making the defconfig even smaller.

So overall, it looks like having a complete defconfig of your kernel
configuration would be smaller than a fragment that disables zillions
of things.

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
