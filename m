Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0DAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 07:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9050681E97;
	Thu,  3 Nov 2022 07:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9050681E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E0R9rY_tBPI; Thu,  3 Nov 2022 07:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09C881E8F;
	Thu,  3 Nov 2022 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C09C881E8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDE371BF3F3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 07:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991096080A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 07:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991096080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ps18PFdyNW2w for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 07:46:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3593B607F1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3593B607F1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 07:46:24 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF8CDC0008;
 Thu,  3 Nov 2022 07:46:21 +0000 (UTC)
Date: Thu, 3 Nov 2022 08:46:20 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221103084620.60165a0a@booty>
In-Reply-To: <20221024142216.31273-1-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667461582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEOR/Kkghtte4BGD/21ptCfb5rLVW2sgu5whgJVNGBw=;
 b=gSgyCAJ4JVMa7YdLsEqsDLMQYy+FNEcQ6rkAcanGUFIvoHADCZGfESHlK7QSQ+4kEAvLFs
 gkB7++dMSVZsHqrDvG7pjaxwfPwwwV1WGm3tZmzAoBasRNwRXouH9UP9TkcLChgaHL3x0T
 f36oC1pjPYlD4pyjx+E4Ljzag7bEt+jqq5uZyT42bjMRmbSW03VsBCM7ipw8E8cnVgpsyX
 pRtXmg8/k0nkHv3i94nZbpNC1iRn3iMi+kEAsd5B+XCvz7lw+ZGotWEGJ948MTTgtCm5YE
 O3+7CybHksbPi0EFTBeG4sJfy/IP2ZAo3H5Zg9upHJ9Gc4mHhVOXVtkw8z4hdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gSgyCAJ4
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: terry.oneal@amd.com, kris.chaplin@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 24 Oct 2022 08:22:14 -0600
Neal Frager <neal.frager@amd.com> wrote:
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# versal-firmware
> +#
> +################################################################################
> +
> +VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
> +VERSAL_FIRMWARE_LICENSE_FILES = LICENSE

The LICENSE file appears like a "Xilinx-Binary-Only or
GPL-2.0-or-later": https://github.com/nealfrager/buildroot-firmware/blob/main/LICENSE

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
