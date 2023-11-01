Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69886C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2AA2431DD;
	Wed,  1 Nov 2023 17:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2AA2431DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzwTg1usRRC7; Wed,  1 Nov 2023 17:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F009431D2;
	Wed,  1 Nov 2023 17:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F009431D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 286571BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088B249DFC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 088B249DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzNZIOb4Z419 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:01:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1397A4ED5E
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1397A4ED5E
Received: by mail.gandi.net (Postfix) with ESMTPSA id D13EF60005;
 Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:01:49 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231101180149.746f0ac7@windsurf>
In-Reply-To: <20231023182610.1400528-1-giulio.benetti@benettiengineering.com>
References: <20231023182610.1400528-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698858110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+wJ0cXtMLSVIK7OEbv/2dDKxQPp+LmwDZolbfYBwwI=;
 b=bH8ikp7iy8tmgR4ZshAawCfVwxPeUglmNtyGRj7d50UCku/5jAX2cljvwyxurG4Bb2u119
 DJf+/yRcu3+472q6jVG5ePzbHZFOtLAksPnBFvebL+R1by9YxfkjDIRag8BdTuhfUFBbz8
 oTVu3uGq8YZruulP6QTv+3O+RGQRjderWfSTHp4I8U7dnomO1vM5Q3huEsbNxYiFEFwwa2
 SURaTCiqpF1VA198l4JHlvdrhbiPhrX6k1J11hvjL2VzE+t8UZ/hP4VSWSg3/auUYIxSiu
 7Nt/p2/ajMLjQjnpRxVxygHCol3z5MBUQWali/qjuUXX8a9jTEwqGipc9mdSxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bH8ikp7i
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump version to
 0.19.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 23 Oct 2023 20:26:10 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/python-uvloop/python-uvloop.hash | 4 ++--
>  package/python-uvloop/python-uvloop.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
