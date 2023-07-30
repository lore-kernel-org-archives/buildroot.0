Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D74EC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1764060AFE;
	Sun, 30 Jul 2023 10:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1764060AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGWDNTdQRFaK; Sun, 30 Jul 2023 10:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0AA60ACA;
	Sun, 30 Jul 2023 10:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0AA60ACA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25B991BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F378B81E16
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F378B81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xr4TQA-2dLcg for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:27:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E864181E0F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E864181E0F
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3C4F20004;
 Sun, 30 Jul 2023 10:27:14 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:27:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730122713.4826c3ea@windsurf>
In-Reply-To: <20230708200447.3919009-3-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690712840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlPLQGFkJCy1bLHkTbM6BodEhxVCkpEghuIM3D1CW6U=;
 b=Tnp5JJGT1Lefgn18BLbUq9M775tWsNqtBYzITPa1qioOj6FJUWyAX38ZLAS2gf1qitdPDi
 aewo+4dfAWFK5PmchI/VHlE0rWbFZl185GInop02XIPvQDL7ssTYB2tFR8doc5Bp47UWyy
 H/dpNZNXH7ZNUFj057Yj58+nZHjiEGdp+Gvpcke75YZ6HeA0+sgmR3oFjoT7zpwaWfnlVG
 xKPXTtk8nt7QsAVcH+HhaZrIEwnhtytlhIR3MqOqMBYCHVZskD7zekdYxm5orJLjCV/p7o
 kTedav7nbvK4dx58E2uTEwIzCLd4FfBI8iJ7KlLHEEDotxqeLNuvZn4t+gcIFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tnp5JJGT
Subject: Re: [Buildroot] [PATCH 3/7] package/gd: add optional support for
 libheif
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:43 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/gd/gd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
