Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08596C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7AAA41AA9;
	Thu, 26 Oct 2023 16:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7AAA41AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txQErM16ojkL; Thu, 26 Oct 2023 16:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 936DB41CC7;
	Thu, 26 Oct 2023 16:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936DB41CC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA561BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185C583E91
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185C583E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5a10CTf3HIW for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:08:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0D3281499
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D3281499
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ADBA240008;
 Thu, 26 Oct 2023 16:08:20 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:08:19 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180819.38c4ac7f@booty>
In-Reply-To: <20231020114236.4129636-10-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-10-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j/PblkPewA2VEfR5bMZ4LGrg+5wsPP7UEwckWj878w=;
 b=CLWj90lc/x6aTc5VDSMUYKTWvdUyThzMcyW9UrI8KufEZZjAU9qFf4MS1mH7OFI9KFsA9/
 1tPe7GKXG85kUl4MMlruYE9I1WD5DNIKQMMovKmZPEi5oFCXzWn5B3PwJZhh9gGi6718sn
 ssoz9hyfZVBC+F4FITeoPA6P2kFEiifx9+/lGaHt81DP3xeC5e8Uan0fDDYZ3iCfIPX3K4
 CgtIFLDIdUKksd1PWfW2ardl7L8TQ+QNKl/sgD4u3ob510ft1iX9OQjn9zmY5/hjkRj3Aa
 AMu8+CtmL17Iqr2rW/wxTdiHhVk6OrcyXGiUf56g7eUK4BRZD40UW90ABB8g9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CLWj90lc
Subject: Re: [Buildroot] [PATCH v6 10/10] package/versal-firmware: remove
 package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Oct 2023 12:42:36 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch removes the package/versal-firmware as this package is replaced
> by the boot/versal-firmware target boot firmware package for versal.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
