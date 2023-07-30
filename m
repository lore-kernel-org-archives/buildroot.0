Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C81AC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D526461030;
	Sun, 30 Jul 2023 21:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D526461030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Go4yPJtvn6If; Sun, 30 Jul 2023 21:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245FF60804;
	Sun, 30 Jul 2023 21:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245FF60804
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D71601BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B083781416
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B083781416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeUShulQ1PW1 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:34:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C58D781414
 for <buildroot@busybox.net>; Sun, 30 Jul 2023 21:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C58D781414
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1C0120003;
 Sun, 30 Jul 2023 21:34:21 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:34:20 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230730233420.4cec6520@windsurf>
In-Reply-To: <20230521085345.25691-1-guillaume.bressaix@gmail.com>
References: <20230521085345.25691-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6e9GJ/jyiYzwcuacaE17r/QNjhfgr6ewpegGrsuHUU=;
 b=NLCyDPHFotpd8/+Oew5jDSLNsOti6m5pgS7xbG/rVzKVHxbv7r2l661sWSS9BEm/V0gSsT
 0NFrrcFrcyvuse/17/SwZv9JeyUwOCQm37ZavLWXcx1GvW1Cs/lPipT4bCuM47Pdv9kSB8
 zOIdzAjF1kHVdIzBbA4fY/Q/pnFm6hzuJKBTo7/n4zDq5okb30MicnX0fvsuaZZaq3YVpt
 7vn98a4wNcc8VXCIe8oBi+v5RuSSKjArAyzmzhSzJW8O2OJXr/Zp6Kw8ZOAs1tm2MpsVWV
 Hp6jBhKkdXS2n5FhHmNDKzCe4JewsFmgo2GyFlHHq/LteuETff9uVu/2ZgfbLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NLCyDPHF
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump to version
 1.5.0
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

On Sun, 21 May 2023 10:53:45 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/liquid-dsp/liquid-dsp.hash | 2 +-
>  package/liquid-dsp/liquid-dsp.mk   | 2 +-
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
