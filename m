Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E86AC4829C
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A614096D;
	Tue,  6 Feb 2024 10:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A614096D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYGMQ5pPWHH4; Tue,  6 Feb 2024 10:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4696140967;
	Tue,  6 Feb 2024 10:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4696140967
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0F31BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DF5A60BD7
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF5A60BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffBK0-lKNNfp for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:15:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0336F60BB1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0336F60BB1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42CE8E000C;
 Tue,  6 Feb 2024 10:15:44 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:15:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206111543.3d636875@windsurf>
In-Reply-To: <20240107210645.3318474-1-james.hilliard1@gmail.com>
References: <20240107210645.3318474-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707214544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYlwHaqLe9uvlGfBfkQP5KuXUuyaHS3S7we8S4pgtEA=;
 b=j5gMYV/pfjjDycZi3iqWG8+mtAgOuX14zLL6huv8CKmcGFXgKf+XvkOPb45Y8WRstKERgn
 NTqb6DDtjz4GZC2rLKpe5Yx8T2Udbe/uh/l517BT5AtEznsKF0W7ARNOZt6ryH0+Vj59Ng
 A6cEHMeTyJregR04rhKP+X1DTA/oJ//4sP0Ip5VKSU4bqr8mC2svPxndaHSW0wUzpHuTxI
 H1kfgKfLg+ut7+pI59vkIrLsVNH3I0CTmlrFw6F/oHT/5EEth+AVO7Tzc3EvyAXO8SvJC6
 im4PnadGzEFlpCxphp1SmDBj3Oui8aAE0/SbSl6yTyckhz9iqW+lIu0A3B5LUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j5gMYV/p
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-debugtoolbar:
 bump to version 0.6.1
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

On Sun,  7 Jan 2024 14:06:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to new line removal:
> https://github.com/aio-libs/aiohttp-debugtoolbar/commit/449550e9c70f17be7b679b90cc3dda2cc90c61e1
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-aiohttp-debugtoolbar.hash                        | 6 +++---
>  .../python-aiohttp-debugtoolbar.mk                          | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
