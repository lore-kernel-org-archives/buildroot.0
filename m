Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E246C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 476E681E8E;
	Sat, 22 Jul 2023 21:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 476E681E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3JgXH1wiTDy; Sat, 22 Jul 2023 21:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB54832EA;
	Sat, 22 Jul 2023 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB54832EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5E521BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F8E9405F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F8E9405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sr3a7alFYKIj for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:23:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A3240500
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A3240500
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF8FAFF802;
 Sat, 22 Jul 2023 21:23:15 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:23:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722232314.683b6431@windsurf>
In-Reply-To: <20230722073533.3072853-1-bernd@kuhls.net>
References: <20230722073533.3072853-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MF1tbrEXlzhA4Nu0czCvG0tGIlWbxiRX5BLpxkj3s/8=;
 b=EHKEEW3IUjSSJAXR4aspHW/SELGk8S3EDxteh31BPgjBwvUzJSzCcmO93UKaIX/FB9GR/L
 Dr3XKolYL8bwn/VmOh7f8GenDdCfBGfMx9zIcZ2DlS045LsPCR2eVDTjVevO3965IpsbJr
 7v/vcpqBNIimAwYzy5cIzFGzQOCsV5BtbEFfFafJU9n8Ya7Dpqzg+wkhNIthRdzJYcn2zN
 NrkmcnAxt//mTJPc1UbO5EpBxxUJL2gmZRdOAyM7okN/MqXw/66s9AEYj82v6hdBCEZgXz
 Xdoz8Y9gT573sAA0KFiDmMGbaTk/kD0ROu6NOzIws4yKpeTnAIds6Rbc8AeFLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EHKEEW3I
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Jul 2023 09:35:33 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://mesonbuild.com/Release-notes-for-1-2-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
