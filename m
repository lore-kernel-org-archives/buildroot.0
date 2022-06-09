Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8C7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DE861136;
	Thu,  9 Jun 2022 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8YfEQ2VB7bX; Thu,  9 Jun 2022 20:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9949860FD5;
	Thu,  9 Jun 2022 20:31:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48F311BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 463B98425F
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_HljiT1lXYe for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:31:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 289CC84253
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:31:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8F5C1C0008;
 Thu,  9 Jun 2022 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jh0fb9Od0Ytf98iRxxZuSm1oD+HKBH7uQH5MzVu4W+c=;
 b=UF8fI2zNjpHOVPJgkmnJfxQxvt3Qzf7u9XQe5Tsd1tU2vDjU6PD0wL6+5ASmuGns13mmLo
 yOmxLmm1jLSifQbljL2gbLLr9+2LyECPi6IxT8QOqch8ferV07d4SoFPzyRa8AOTxqvys7
 xzANuyUmA+pYo/xgwM+eBO9ws7UY9pKJAucKzMw0tKg1DL9lV6p7xXO3ejcPU3KMu/Tfpr
 DF5a4sgKbN8k4GQPlLeY7+bhyrJk4ycJDInodbz4/ONzyf27AIqiyJ5036lz8y8Ccjv0FD
 CsRey0z046fa8KiGh+aMW4MxRJBkll8NhAfQMjHlZ7JOYhhZVwW8bYd7b/ymSQ==
Date: Thu, 9 Jun 2022 22:31:46 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220609223146.6c6185e4@windsurf>
In-Reply-To: <20220608094803.3403930-1-thomas.petazzoni@bootlin.com>
References: <20220608094803.3403930-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] arch/Config.in: armeb no-MMU is not
 supported
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Jun 2022 11:48:02 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> elf2flt does not support ARM big-endian, so supporting Cortex M3/M4/M7
> with armeb is not possibly.
> 
> Therefore this commit makes:
> 
>  - MMU mandatory on armeb
>  - Prevents from seeing Cortex M3/M4/M7 on armeb
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9bca0cbfb6a66c455e74ad194526bca942665978/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in     | 2 +-
>  arch/Config.in.arm | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)

I have mistakenly pushed my own patch, sorry about this. Hopefully
people are OK with this, if not I can revert. Let me know.

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
