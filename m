Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E5AC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ADAA60FB0;
	Sun, 12 Mar 2023 08:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ADAA60FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDYW5pp9-tdx; Sun, 12 Mar 2023 08:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF37360F99;
	Sun, 12 Mar 2023 08:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF37360F99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E92A01BF3E9
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 08:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D76819B4
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 08:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D76819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_y63JN_WIEA for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 08:55:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D72281934
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D72281934
 for <buildroot@busybox.net>; Sun, 12 Mar 2023 08:55:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39FDEE0003;
 Sun, 12 Mar 2023 08:55:04 +0000 (UTC)
Date: Sun, 12 Mar 2023 09:55:03 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230312095503.267aa7c8@windsurf>
In-Reply-To: <20230308085047.126406-1-francois.perrad@gadz.org>
References: <20230308085047.126406-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678611304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeLhxZEvTWlqYzvcQT4D4D4rqlF7B6eq6Ztb0tOIWn0=;
 b=StMDoTyKne9ae0m3cMu3Quqqy7cTLulXaPTTzkBPlGWtSTu1U6HkgaXV2FpSYdaXwhrNGs
 s8rWEcLVazSvAaYJUVEXdW8gpf32bbi5J8BSeXWjdIip8Tqf2DlS4T0yM8WthklNxRdrzf
 Y6pjRCbQlesDowOrya1g+RdINmGzpIrqp/jaws7hE1wBvTVrLovQPU5fMY32c8U0SCnECK
 PRuB/uEeaHRMlPrk64LBAQE/Zzk5Cmhkhf5eI1AT/nNapehQDreh20+nFmLnp+2kC/1SyR
 dRe0b0T+rjHtaHfDyGQmOaKwlbO4vLztdrDBUdiWH4PWezUVnNl9pjGVGuVrCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=StMDoTyK
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.2.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Mar 2023 09:50:47 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/htop/htop.hash | 4 ++--
>  package/htop/htop.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
