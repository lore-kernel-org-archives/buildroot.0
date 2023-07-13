Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D69DC0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26379417EE;
	Thu, 13 Jul 2023 20:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26379417EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZnBD_2VRVNV; Thu, 13 Jul 2023 20:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57425417C7;
	Thu, 13 Jul 2023 20:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57425417C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3731BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005D942152
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005D942152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkVlldHYgQV3 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AEA42151
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2AEA42151
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:31:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA29A1C0003;
 Thu, 13 Jul 2023 20:31:33 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:31:32 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230713223132.0202ca4e@windsurf>
In-Reply-To: <20230608190234.3523884-1-bernd.kuhls@t-online.de>
References: <20230608190234.3523884-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689280294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkSmpFzfKYddyURE+8ttCoJUS8lscJVmoXXOcN4AS+s=;
 b=MMzeE8XfScb95K/YfxSAHdtGYBKyGsoXbULwImAvxt4GGJgfMQdkDcUbHShLZqtXgf1ncv
 XAlIlvDtQ3uFH4rvPY2UZIse4q+GSciuG5ipiLCQhVM3E2jrzc+7Rp3+NrdXiA5c3NqCKE
 R6BRN7YZNm0AetOlxAruP8jDII4YCRn5XXcCKLvxugbV1BVZ2zVfxc6b/xJo2nldq0YDMa
 8Ej+vwy2NtkZf21ADk7Dzsl8Sf0vpHBOWMpqDEEijU4sytlzEGOle2Bmg2V0jwbMKy0tlW
 7iAT97ZiwpgMbAynARsOlVPOFHiH1tAJv3mbcKASR+qvzpa5sSIzt05cjnK4Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MMzeE8Xf
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: bump to version
 1.0.13
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
Cc: Mikhail Boiko <mikhailboiko85@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Jun 2023 21:02:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://github.com/fribidi/fribidi/releases/tag/v1.0.13
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libfribidi/libfribidi.hash | 2 +-
>  package/libfribidi/libfribidi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
