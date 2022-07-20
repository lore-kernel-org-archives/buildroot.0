Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85ABC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B73E60E36;
	Wed, 20 Jul 2022 21:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B73E60E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15ppqBKfp8_O; Wed, 20 Jul 2022 21:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D7260D52;
	Wed, 20 Jul 2022 21:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D7260D52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD1941BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8800F83F54
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8800F83F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-WqhXKk6A6e for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:01:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5605383F53
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5605383F53
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 21:01:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D98DD240004;
 Wed, 20 Jul 2022 21:01:44 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:01:44 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220720230144.4cb7f39a@windsurf>
In-Reply-To: <20220615161753.2580142-4-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
 <20220615161753.2580142-4-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658350905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0iQZl90Jrdbk/I3qgOvYrJpSegW6M9HEAMH0tnjCo4=;
 b=QF3pVaxX4Wk4uOPHqZtipRuqxq5vxUQ7mL0cGzp3DkvmDqi6P/8NEtQ9AkDOvetlo+l5/h
 a/IxpgR4K+2UkPI47yHAtJhC+BwZhkPD88IHb4Uhy51OhaxPtRTw31JPVs3TuOhhCwWXLo
 J+krh7ch8zqRZo4pdX50ODzfRCPCg+QEYmuhOllY14TvTNjcw6O5d1fOkmaNKnuSq7s25A
 Ep9296OefEdjOHDCypdDDmmT1ZioNKk3BtCMrSztHvEdpfnZ3kgtoj5W71gCxygkDjrY6+
 m2tnQMBp7x94O7z/yDnskn0UbhUnSiEcrqhQkvM3GvnYFXHutS4xXZqJytKE0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QF3pVaxX
Subject: Re: [Buildroot] [PATCH 4/5] package/open62541: add encryption
 support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Jun 2022 18:17:52 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> +config BR2_PACKAGE_OPEN62541_ENCRYPTION_MBEDTLS
> +	bool "mbedtls"
> +	select BR2_PACKAGE_MBEDTLS
> +
> +config BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL
> +	bool "openssl"
> +	select BR2_PACKAGE_LIBOPENSSL

This is not the correct way to force OpenSSL. Indeed you can't select
an option that is within a choice...endchoice. Instead, you need to:

        select BR2_PACKAGE_OPENSSL
        select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

> +ifeq ($(BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL),y)
> +OPEN62541_DEPENDENCIES += libopenssl

and:

OPEN62541_DEPENDENCIES += openssl

so, I fixed that up. I also explained in the commit log why we are
doing this: open62541 does not build with LibreSSL.

Applied to master with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
