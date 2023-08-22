Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69007EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D50F611E5;
	Tue, 22 Aug 2023 18:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D50F611E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OG9NJVEvkpvm; Tue, 22 Aug 2023 18:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77CC8611D1;
	Tue, 22 Aug 2023 18:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77CC8611D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C145B1BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A4BE81D16
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A4BE81D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnlHIB1k6ynC for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:26:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A03481C81
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A03481C81
Received: by mail.gandi.net (Postfix) with ESMTPSA id 570CB1C0004;
 Tue, 22 Aug 2023 18:26:51 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:26:50 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230822202650.0275e6e7@windsurf>
In-Reply-To: <20230814142106.141500-1-dario.binacchi@amarulasolutions.com>
References: <20230814142106.141500-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692728811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A8L0rKQitE67PJ0xcJQR0p1Y+KYG1pqvcVXnS8CpkA=;
 b=MyI0eWl1CPW2ceHjPqVhrzfohTMGskNN4Jn/QnEw+M85mmcm/9sCT3DRMmTz6G9mAGUufL
 hXjEkTusIpRdOZk/0ZwDzPh06Ixc2XrOsH9TcKb3fH/7t+unsCn9qh1Gy2KDcjTSl23xIx
 4ut92xjK9VaDp/mEP4PhGFm7jLnBA7TAHDsC+yIR+KVYsuzppP8wYi6o1g0RrE3wdh3pr2
 zKwd9G2AgTrutQSxHMX2z9ClmmmXVa7T5Ib+QsYvC+EfYcz1JEk/SFaKm3Du8dCcvPQNjy
 2P2J+cZVXtOGTH9JT7dcdtdUDonhq0Pz022/tQz5dU7AUyESP5jKmIanxTnSRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MyI0eWl1
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.125
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Aug 2023 16:21:06 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.125
> 
> The changes to README.md are not related to license modifications.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 4 ++--
>  package/uuu/uuu.mk   | 2 +-
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
