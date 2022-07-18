Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5731EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 12:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D636E40B16;
	Mon, 18 Jul 2022 12:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D636E40B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exnC_R2awBdI; Mon, 18 Jul 2022 12:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0A9140B0F;
	Mon, 18 Jul 2022 12:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0A9140B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16D8C1BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60A461008
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60A461008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cofxw82SjqAK for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 12:58:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1066460590
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1066460590
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 12:58:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CEE2100013;
 Mon, 18 Jul 2022 12:58:04 +0000 (UTC)
Date: Mon, 18 Jul 2022 14:58:04 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220718145804.722b2224@windsurf>
In-Reply-To: <20220708150031.1189738-1-bernd.kuhls@t-online.de>
References: <20220708150031.1189738-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658149086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwcZv5kSe5G3RwmFnaWItR5GvPhZfCRCpFisWfxGZmM=;
 b=gm+63HJegxgwMmahWrxQa3e2bSjqab/8uSYZsMpzArNjFJUaDzvaqLLRHPVpH51i3bm5ME
 uBV9CIMWyU2TfnC1jrg/0cTQUnCMuI2CxBFRWoghxPcYXbYRjo1+bJiH34UDreOR+siyj+
 9+BtWfBWocK2aCq9sVc8j8f9mjDUuLkHaaFmeWOtIOOHbLkmye13NmQbZwOFK8wN8ViThJ
 gS+R6EPGtWocNorfoJxybcnzwyeeuUshYtdXvWkiTL6skAbQb7EaltToUp4MS/rgEWvMWr
 XbQYCXciufC/qiVonqn5Y0b85sK8Fu9aVjXjrT6UrHMziYagj0DDkyiLqc2j6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gm+63HJe
Subject: Re: [Buildroot] [PATCH 1/2] package/stellarium: fix sha256 hash
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

On Fri,  8 Jul 2022 17:00:30 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://git.busybox.net/buildroot/commit/package/stellarium?id=5de73f0b685d7c2d096e3d28a50f2e89ed68c52c
> forgot to change the filename to be checked with the sha256 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/stellarium/stellarium.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
