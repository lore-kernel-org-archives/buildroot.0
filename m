Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E4ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666AE402DC;
	Sun, 30 Oct 2022 20:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666AE402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5szfKnT4HZeh; Sun, 30 Oct 2022 20:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B79D402C5;
	Sun, 30 Oct 2022 20:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B79D402C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C14701BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C721400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C721400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVLHqdRCl_K7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:43:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87DF9400DC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87DF9400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:43:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C20C91BF203;
 Sun, 30 Oct 2022 20:43:01 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:43:00 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221030214300.629c8f7b@windsurf>
In-Reply-To: <20221014065900.3311604-2-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-2-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667162582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbVkKsvMn2ekyX1BLXofAoBHxFvuSa1/xxAIzdjJgZk=;
 b=GaXvGRmludVtyCKMbLeOJj9vnSQ69MGUxETPqOl2ftEDEr1Wj3YgxI+kP/CkqJLh1lqkuH
 AYjsBwh0vBd+0ubD/fVWtU8ab51IZDgZnLLJKJeSYgIoe8wpKaAy7S93JWS0sfxAE7JYbP
 5SKyw8I/3Yw/r+grsxec4KeSRN3yvDesr9jXQfTGwm/X31IRhcx+uq79O8dSzRdG6ls9Lo
 3gMIp07pVdovthJ26HY3fMdn9LNL2B5n2qyOQq/l90BoWHaPT8Q8DtpakJ0LSTNL22NPnV
 xaSLhHggc7jfSy9m0z7V2GLc8Ku75ihnAKAIZxLqPPaJlZQt3YZSTjkjYFXSYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GaXvGRml
Subject: Re: [Buildroot] [PATCH v2 1/5] linux: enable
 CONFIG_EXTRA_FIRMWARE_DIR
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Oct 2022 08:58:56 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +	# The kernel CONFIG_EXTRA_FIRMWARE feature requires to have the firmware full
> +	# path for locating firmware file.
> +	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(STAGING_DIR)/lib/firmware")

Unfortunately, this is really not a good idea, especially if it is
meant to be used with your rtl8723ds-bt package. Indeed, the
rtl8723ds-bt firmware is according to your package under a PROPRIETARY
license, so not compatible with the GPL.

Except that CONFIG_EXTRA_FIRMWARE_DIR can only be used for firmware
that is GPL-compatible, as they get linked into the kernel image. What
you're proposing to do makes it illegal to distribute the resulting
kernel image. You can do it on your machine, but you're not allowed to
distribute this kernel image, which for something like Buildroot is a
bit of a problem, as you can imagine.

See
https://elixir.bootlin.com/linux/latest/source/Documentation/driver-api/firmware/built-in-fw.rst#L21

The only options for such firmware is:

 (1) In the root filesystem, which means the driver needs to be a
     module... but that's anyway OK as it's going to be the case as it's an
     out of tree kernel driver, and therefore always compiled as a
     module.

 (2) In an initramfs loaded separately from the kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
