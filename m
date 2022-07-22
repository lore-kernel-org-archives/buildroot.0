Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91537C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D1A84813;
	Fri, 22 Jul 2022 07:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D1A84813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLUBwCTI39RV; Fri, 22 Jul 2022 07:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3608C847C9;
	Fri, 22 Jul 2022 07:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3608C847C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 535021BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D64D847C1
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D64D847C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAKrHAmEiAFN for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF0AD8418D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0AD8418D
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:55:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE44324000F;
 Fri, 22 Jul 2022 07:55:04 +0000 (UTC)
Date: Fri, 22 Jul 2022 09:55:03 +0200
To: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Message-ID: <20220722095503.27868873@windsurf>
In-Reply-To: <91ff193c-5e66-b80c-538c-7ebcddd9bd87@ti.com>
References: <20220721203307.30488-1-x-shi@ti.com>
 <91ff193c-5e66-b80c-538c-7ebcddd9bd87@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658476506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kFDCOLFcs4k1qLwxXkAfKd3pefJFEKBQnoqNspDUrQ=;
 b=BSc1NRmVMXQRG6nbrllYaUIawaYOSicHAOjcPFD1Z/76P7fUnG8drzW6omyoFaPW/BJXL0
 BL/+R2IhcUkwdqa3MVEK3mVE7Kd8s0OFcNmMTjYQqU8jLwcEsr6W5Z0dRwPFpbZFZGMr09
 u5nqXkEnmJ9j71iXgejPgR7KOceQMkLM5u5K6g7xYAfNtG4NFr4dLvv9dzXit0jWVmID8c
 Mu/px/WqDUVPGQjhnaPEDhnn+qcFF+bgbbT7B/RSlyCUzLIg+fm1KcWW688VT0xpL4GBs4
 cVFf3osk82dmRmZ0KXz4NIRWWQf90i6x5QY/4uYKEKvCoj7qrw6S6rrM0RYoWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BSc1NRmV
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add target
 board options
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
Cc: Alden Benedick Agcon <alden@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Sergey Ostrovsky <sergeyo@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 21 Jul 2022 15:38:56 -0500
Xuanhao Shi via buildroot <buildroot@buildroot.org> wrote:

> Some platforms such as TI's k3 outputs a TARGET_BOARD directory
> in their ATF build output paths after PLATFORM.
> $(@D)/build/<PLATFORM>/ does not contain the debug or release
> directories for these platforms.
> They are under $(@D)/build/<PLATFORM>/<TARGET_BOARD>/
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>

Thanks for your patch. Could you resend it with "git send-email"?
Indeed, your e-mail client has mangled the patch, so it cannot be
applied.

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
