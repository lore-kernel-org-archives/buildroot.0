Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B3FFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97F18408BC;
	Mon, 31 Oct 2022 12:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F18408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8a4J-wWRw9MX; Mon, 31 Oct 2022 12:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF4C9408EB;
	Mon, 31 Oct 2022 12:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF4C9408EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CCEB1BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCAAB60B20
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCAAB60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l70pzMzvtvej for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:19:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC489605AB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC489605AB
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:19:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8F78240003;
 Mon, 31 Oct 2022 12:19:05 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:19:04 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20221031131904.329c060d@windsurf>
In-Reply-To: <20220916210059.2395129-1-geomatsi@gmail.com>
References: <20220916210059.2395129-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667218746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvUuiJeW49WK9Z2k5rt8y8kb9+R5sMlfETrSBK+J4wE=;
 b=nHB900Dvs9x2BthCgN66YqmtpsHLAMfEiRlQG6bjK1zurPWlf61kToZphtuur64xNUe74/
 kfFmWK13hnp6jXTKiyD67oePBd8JWlSvy9+ci8SLOUPKp0TukMMBfFrBg9BUl4DgV8wXIo
 QJVvRUJ1TotYdSe8pixi2dJer6eE2pklL6k0v0w5sopbhHXNvYA8SXl35YuvHoYjkuxLpI
 J9y95go/vEtpqYXqjCi1C1KDmr0Tl4oFRDVhmx+PUB2VMdrG3abnQr6FI/RC7hpx7jvVGM
 4OS1Gr1C2fZ7VLbBfIFCLl/kKaK32BxYswrVAKl2omO3HwcMK9DQxZsBLQ566w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nHB900Dv
Subject: Re: [Buildroot] [PATCH v2 0/2] hostapd/wpa_s: fix static build
 issue with zlib-ng
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Sat, 17 Sep 2022 00:00:57 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> This patch series applies appropriate hostapd upstream fix that renames
> 'crc32' function to a less generic name, see:
> http://w1.fi/cgit/hostap/commit/?id=0c7b3814ca6070a8e930dea09fde08b4058a4ca6

Thanks for pushing it upstream! This link should have been added in
each patch, so that we know their upstream status.

I fixed that up and applied both patches. Once again, many thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
