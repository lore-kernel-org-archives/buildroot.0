Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A801C05021
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313A5813D2;
	Wed, 20 Sep 2023 20:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313A5813D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6WmGl83Lv7P; Wed, 20 Sep 2023 20:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1B781393;
	Wed, 20 Sep 2023 20:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A1B781393
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30EC51BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16F1761363
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F1761363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwaS9dr03YVN for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:34:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19F2D60B83
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F2D60B83
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B617240009;
 Wed, 20 Sep 2023 20:34:38 +0000 (UTC)
Date: Wed, 20 Sep 2023 22:34:38 +0200
To: Roberto Medina <robertoxmed@gmail.com>
Message-ID: <20230920223438.3a9472cb@windsurf>
In-Reply-To: <20230919194834.626884-1-robertoxmed@gmail.com>
References: <20230919194834.626884-1-robertoxmed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695242079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2vcGEowIg0KJk34Q+Rl2QBSUiQ3qWgaieF2UEkE5RE=;
 b=NGJQ/WKPKt6RZnXM9WFPHQS6ALxdKjq40qoZKGMN4VIq64MliJ9c2hOgV1w8H48j9d2GD3
 OaqFxeexVbMdRmm4i5c3rGha7ZXhxKuBdKeyiRNnMlBjhiAfMGczBy3DAM44EU37KgUT3q
 mJZzpa6MHlkZkhOIFWFUwfCOxmBOk+KJBGWMNtQ9MdAkicBtsQM1D/L0T6ztzsgoEeFYnf
 yK6FwWM9EnfafzrNzoTusPAluP7k/RTLAz8mWDEGgbFYlD6yNFuoLgxmVcQ+HWTXP6EEYJ
 rVB2iTTZXZNOQa6InDqH9iz+1/HzQ77FdUaXSV4UE5YLBGwyfbuH41tGVOoqMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NGJQ/WKP
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Enable OpenSSL
 for U-boot
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

On Tue, 19 Sep 2023 20:48:34 +0100
Roberto Medina <robertoxmed@gmail.com> wrote:

> Enable OpenSSL to build U-boot. Reported by the daily autobuild.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367140
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> ---
>  configs/roc_pc_rk3399_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
