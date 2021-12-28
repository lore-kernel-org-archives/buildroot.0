Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214E2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 15:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CA7401C4;
	Tue, 28 Dec 2021 15:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElSVtiyRUHh0; Tue, 28 Dec 2021 15:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365F840305;
	Tue, 28 Dec 2021 15:49:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD5CA1BF2BD
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D93401B7
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6-_uIjIaXk4 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 15:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81EDD401B3
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 15:49:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AA86CFF80C;
 Tue, 28 Dec 2021 15:49:17 +0000 (UTC)
Date: Tue, 28 Dec 2021 16:49:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228164916.2beec0d6@windsurf>
In-Reply-To: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Dec 2021 16:33:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mbedtls 3.x is incompatible with mbedtls 2.x:
> https://github.com/ARMmbed/mbedtls/blob/development/docs/3.0-migration-guide.md
> 
> mbedtls3 was created from mbedtls package with the following changes:
>  - license file is now LICENSE
>  - zlib compression is not available anymore
>  - config.h renamed to mbedtls_config.h
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

An important (and unfortunate point) is that apparently mbedtls3 cannot
be installed side-by-side with mbedtls. At least that's what your
"depends on !BR2_PACKAGE_MBEDTLS" seems to hint.

This is a major annoyance, and I'm not sure how Linux distributions
will handle this migration if they cannot have mbedtls 2.x and mbedtls
3.x installed side by side.

Have you talked with mbedtls upstream about this? It seems really odd
that they didn't plan this possibility.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
