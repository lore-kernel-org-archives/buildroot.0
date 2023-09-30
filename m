Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FAE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F0CD832B0;
	Sat, 30 Sep 2023 12:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0CD832B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfaj8v3PuJxd; Sat, 30 Sep 2023 12:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADC383C62;
	Sat, 30 Sep 2023 12:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADC383C62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2681BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C3260DF0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C3260DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnBFAfwkppEp for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:38:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B777660D90
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B777660D90
Received: by mail.gandi.net (Postfix) with ESMTPSA id 800CC20002;
 Sat, 30 Sep 2023 12:38:00 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:37:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230930143759.6f6019c1@windsurf>
In-Reply-To: <20230626181531.2312002-1-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696077482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y382X5iZRxEX6dGcFXbEI2Y2nUREIcxaEdXWUDD5HV0=;
 b=UaUYSe61wqZKHwy5svzdZYr+1mRNDZ6Y9lX593owOjfp8UiepqeGFQnpayt5kAXtt+P5ef
 +idFiBhtXrlXHbDM6jMEpBtKJnNDyuhfcBLNYCbOSxkFFGJMWU4Dy0plQk3ZlBsnX1Px7R
 Hm5zTXTkJtwmB2fpT305XQUKcd0B8LCHbIsRiomA0wXTHG0npdALMfew4ztpq5+q+wsYdF
 hB6ccA/uu2g+ATYxUxEGTlcrZPcK+lCO11nnxDPFVAgz8sYhm+Y8BTTe7w1uHJvQTS0f+Z
 ZM8S44zymAd4vY3QQu3n7wLVkTKoL3QrOZ5RDNSCToj8fRFXLd5RKNjuPsJTiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UaUYSe61
Subject: Re: [Buildroot] [PATCH 1/5] package/python-numpy: bump to version
 1.25.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Jun 2023 12:15:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate to meson package infrastructure.
> 
> License has changed due to date update:
> https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-numpy/python-numpy.hash |  6 ++---
>  package/python-numpy/python-numpy.mk   | 31 ++++++++++++--------------
>  2 files changed, 17 insertions(+), 20 deletions(-)

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
