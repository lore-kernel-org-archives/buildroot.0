Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1873C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8ED441DA6;
	Mon,  6 Nov 2023 21:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ED441DA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIhoxzto6aR3; Mon,  6 Nov 2023 21:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D676441EF1;
	Mon,  6 Nov 2023 21:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D676441EF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7EB81BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAF6415C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAF6415C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yv1rQslw_VLR for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:27:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E52C0415BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52C0415BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 234651C0007;
 Mon,  6 Nov 2023 21:27:09 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:27:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106222708.609c08b2@windsurf>
In-Reply-To: <20231105095731.2951000-1-james.hilliard1@gmail.com>
References: <20231105095731.2951000-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuJqPot534cmWupxhGhYzMvo1F4dyA6YSkwU1j6oIBQ=;
 b=GLvnnwRAqm8dtwoN28AbqWacDgVdaTZ74dIkeSU3PR7u+bc8ONoTWHQAqFf79AeWbISMg9
 kBMbQ2IxginLj7TEdjsJkK55OzjO24N/zJW2v6WCYmWWST4DyYW6jRg3TFH+FlzeLWzwtn
 DEyu5oi+6nu3+HA58fb2oZIteoG4+Wkay+baXIHUZXaYD2NpQHfoiU1iyEfkMHsAhRpL+g
 CL1Xqig6ouGWdfS5nxWgJevm8hzb/vHQGoDsYPtOfIAFJqU8EEJN0k/w2oFyzstcgOx5Ua
 1oXNWffpN0oIWQY2zMCy4pG0XVThrj5PvtQx19xhWT473XxgMTzFCDjILkI4HA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GLvnnwRA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 68.2.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 02:57:31 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Refresh add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-add-executable.patch                 | 27 ++++++++++---------
>  .../python-setuptools/python-setuptools.hash  |  4 +--
>  .../python-setuptools/python-setuptools.mk    |  4 +--
>  3 files changed, 18 insertions(+), 17 deletions(-)

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
