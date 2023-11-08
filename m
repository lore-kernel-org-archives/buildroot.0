Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B51C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2068960AAF;
	Wed,  8 Nov 2023 22:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2068960AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_b1HrxavT6Z; Wed,  8 Nov 2023 22:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7480460BE6;
	Wed,  8 Nov 2023 22:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7480460BE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1496F1BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC86481DEC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC86481DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgLjt6BXPYr7 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:27:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A034181B53
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A034181B53
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6329FF803;
 Wed,  8 Nov 2023 22:27:15 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:27:14 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20231108232714.7bd58371@windsurf>
In-Reply-To: <20231107135917.1008132-1-fido_max@inbox.ru>
References: <20231107135917.1008132-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699482435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+AZ08ldsPoFB6ooSiJ8Ok3mczsZSutYRMY7frn4Nso=;
 b=ojXG/XyJsHrPiLeSCdhETX1y7SXt/uQYdBUduOuZvAFvoyOR3lNB0UJA83SLDJzaDOjQRw
 OEQ2Y+scGbeubjoSFrfWgpTZENcrtAm3BGPsh7djx1eqWV1n8dDHZ7asJ6VAfE+GCv1c+D
 a4BoHOoZk/SC/VOQC++wbAlYstuAk3GeVmDiZ8NIY6WCB1DUS8Sm+RUx2CqgJQ+2nfE7dm
 1nY5HEulB+x8wZgI0K219CcL6cBrDxZsLbFLoF16KhoQh/3vKyot74oWhKv0dqycOhsGQ9
 yrZiH2XSNURdY4bSpgFCdzQjw3McjXn1J5BO020WE8ekquwvn3z/Ea6BWk1Dbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ojXG/XyJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libosmium: add optional GDAL
 dependency
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Nov 2023 16:59:17 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/libosmium/libosmium.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
