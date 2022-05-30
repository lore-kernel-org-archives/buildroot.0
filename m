Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EB3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4D724197B;
	Mon, 30 May 2022 19:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqcdPqvnPm_r; Mon, 30 May 2022 19:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5B141710;
	Mon, 30 May 2022 19:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF6DF1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE2540936
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOJ5cdmS3Eml for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:44:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D71840239
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:44:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDF0F240003;
 Mon, 30 May 2022 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653939897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifAb6UbbEx4agDDpRnhPvEhmGI3tdYVyN1cThxQrphg=;
 b=Ned8yKwzjxUgmJxRLp3+T1Hh/TF1VjhZZqibUPn2SW7U0YXS/zp9vaA1dkLtHe1ay+HEps
 vfR5N9IMD4Si+Q2ja/DdTiQ4Z9WJqCEaAyF5izKjJjCvVIzGmawnzRbTr9yEAIkbzwPZXo
 2ER223Ij44tJQc334T0orBdLtLO3uiWaL/yBquNN6lg6FE2/g5ruipBP2Py95tECWCqvMv
 6ICfNQbHdwjMyk+oCPcytaUoE8+e6W7opHl/1uYd8+YxYgY4oiDT1FKMVqYh667AXYGcaD
 Eg5HCnpy+jSegRwO8TpXHe2IXwzslrPavDEZjhGNGPAWGvoUMSwOewLiY00UpA==
Date: Mon, 30 May 2022 21:44:55 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220530214455.7001115d@windsurf>
In-Reply-To: <20220521123838.2881-5-heiko.thiery@gmail.com>
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
 <20220521123838.2881-5-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] boot/uboot: bump to 2022.04
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
Cc: Matt Weber <matthew.weber@collins.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 21 May 2022 14:38:44 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Since U-Boot 2022.04 a host dependency to gnutls is required.

Are you sure this is an unconditional dependency?

When I read tools/Makefile, I see:

HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule

so it's only configurations with CONFIG_TOOLS_MKEFICAPSULE=y that need
host-gnutls.

So unless I'm missing something, the host-gnutls dependency should not
be made a new mandatory dependency, and instead a "U-Boot needs
host-gnutls" option should be added, like
BR2_TARGET_UBOOT_NEEDS_OPENSSL.

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
