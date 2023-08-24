Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C09EC27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3E541D85;
	Thu, 24 Aug 2023 21:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3E541D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cy9xtRCl1o78; Thu, 24 Aug 2023 21:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEC141D98;
	Thu, 24 Aug 2023 21:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEC141D98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 258BD1BF98E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B7B41D8C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B7B41D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8UdJMaOVUE1 for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:18:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D3FC405A2
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3FC405A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0ACAC0002;
 Thu, 24 Aug 2023 21:18:24 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:18:23 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230824231823.62063121@windsurf>
In-Reply-To: <20230809171501.1329182-2-zgyarmati@zgyarmati.de>
References: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
 <20230809171501.1329182-2-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692911905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfz69MwCzJLZNRAZ8eMDAJCylp+kSa0Ta8+UtK/R4PI=;
 b=KvZGaxhuj8K5JnAf3GnbA7A0kr7A5rvATQ04NcyxNzgw4md8TQH9jPOfjHNWCmLSBTrcw4
 IKHRyipFjUBmm4WDFAbsOp+9AUs6iwfJFApKm45K7dDmJBI2jdUiv1hTkvcpr1wykLAeCE
 aaIE1VbkBHz9VIcxxEVd7kjNP/sEp3gxUMzDxfUT2W1AwBCYWAw6RhnW5drtv5HkiggjRU
 odcpk+oTMXbhjaeXmhVhmYeDSglQEIk3ZaF8y+oI3hFu9REoh0hBFxfQRF6BQzPMw2KOig
 ZomUrCByI5kO85MshgtM/72edM7aDVblKpYxGFC6E34si4SHrCc5nUd68Iubdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KvZGaxhu
Subject: Re: [Buildroot] [PATCH v1 1/2] package/qt6/qt6core5compat: add new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Aug 2023 19:15:00 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6core5compat/Config.in          | 12 ++++++
>  .../qt6/qt6core5compat/qt6core5compat.hash    | 10 +++++
>  package/qt6/qt6core5compat/qt6core5compat.mk  | 39 +++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 package/qt6/qt6core5compat/Config.in
>  create mode 100644 package/qt6/qt6core5compat/qt6core5compat.hash
>  create mode 100644 package/qt6/qt6core5compat/qt6core5compat.mk

Applied to next after minor changes:

- Change commit title to "package/qt6/qt6core5compat: new package"

- Add an entry in the DEVELOPERS file

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
