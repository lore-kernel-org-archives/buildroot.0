Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78337C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BFFA81934;
	Thu, 29 Dec 2022 09:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFFA81934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBiX4xMtWjMa; Thu, 29 Dec 2022 09:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51776818AC;
	Thu, 29 Dec 2022 09:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51776818AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 541A81BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22398818A1
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22398818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRsY_uZjJ0Jh for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:36:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F818176A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15F818176A
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:36:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F4E3240009;
 Thu, 29 Dec 2022 09:36:51 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:36:50 +0100
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20221229103650.208974fd@windsurf>
In-Reply-To: <20221213221210.29366-1-lancethepants@gmail.com>
References: <20221213221210.29366-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4W3PupFYmce5f4dOknmIVEWIuqkOfuAWsv1wtKEx15c=;
 b=GXHCFICfjKHCFmE7MfvmJBeUf5Evd2PySZx5cMdMxUfsSKvTVRGwRUowMo1+19JIQ8WKZD
 Wsl9STv+io8p6u4SoINnlGkc2pWrbxk21vuUL27bxwzaIoII6tUD9GvIpVDXXaYzF5f9uC
 xl3dMrqsPNIFHG4jW7Nj3VmVELyMPhvQhIktmv1xMj3vXqeWKZMpEa2k78kkC0FVrZwQWv
 MYoxuBx7dnVdBAzAJRbuaCX2hg7QZSo4UIcqBGbYhlzXzeKt1C5zkESAsq7Xc1V+q4mLRG
 wTY7jN0+xCK3iTvNVPcNAUKzxM83/AkgVVL85CseqhWMpyphGta0SL9HWRHh+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GXHCFICf
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: include firmware
 for the Realtek RTL8125b variant.
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Lance,

On Tue, 13 Dec 2022 15:12:10 -0700
Lance Fredrickson <lancethepants@gmail.com> wrote:

> Newer hardware revisions require different firmwares so include those as well.
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 2 ++
>  1 file changed, 2 insertions(+)

Sorry about this, I'm only seeing your patch now, and in the mean time,
I've applied an identical patch from Bernd:

  https://gitlab.com/buildroot.org/buildroot/-/commit/909e10a422df33cd67e6f0fc6ad628ee2c1fb933

Sorry about that. Next time, I'll try to be more careful, and take the
first submission that was made, chronologically speaking.

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
