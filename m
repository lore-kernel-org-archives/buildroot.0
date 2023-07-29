Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65798C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134DD415C8;
	Sat, 29 Jul 2023 21:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134DD415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZfKRiEgvpgS; Sat, 29 Jul 2023 21:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1069441559;
	Sat, 29 Jul 2023 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1069441559
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECAD1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3814C60F58
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3814C60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgJM1QIbcGV0 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:35:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB35760D72
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB35760D72
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A6741BF204;
 Sat, 29 Jul 2023 21:35:03 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:35:02 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230729233502.5a5948cf@windsurf>
In-Reply-To: <20230607171834.595904-1-bernd.kuhls@t-online.de>
References: <20230607171834.595904-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690666504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/ThLXK+jo4TCYElnPAhKEeV/SaFQRzpW4vX37LuGZY=;
 b=idBmtXQyTIly2klk0h+r76SME51/l0Q/xFhF1rUTJ7ASyfaV0ypzmcvKs/QciujT+sN+QE
 TYauYnYPzCHya17si9Dilnkvex2P7vpc39TBNVj0rscqn9DbbRgMQcO8xJGaZLDEmlb7V4
 t4/HwU7KfYNyZ64g4oe7FKuFSoSFthJVeET1q5JUmh22M8KH2Dbj9O6J0VwqYNVcBgL0fg
 g+nImc8NKc9K+PSupBve3VGGk80iRZLi3gy5Pyuko5Jbx5gBCNT+quop52BS8tpE6UMo7Q
 0DCBIq2YMeM69rFbgpn8ip8xuhEJzwCczBW236uE8Uf0wVaw8AfcKZ+xteNjKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=idBmtXQy
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libdeflate: bump version
 to 1.18
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Jun 2023 19:18:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches included in upstream release.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-target-when-required-due-to-gcc-bug.patch | 90 -------------------
>  ...or-due-to-PMULL-enabled-without-NEON.patch | 35 --------
>  package/libdeflate/libdeflate.hash            |  2 +-
>  package/libdeflate/libdeflate.mk              |  2 +-
>  4 files changed, 2 insertions(+), 127 deletions(-)
>  delete mode 100644 package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch
>  delete mode 100644 package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch

You had forgotten to update .checkpackageignore after the removal of
the two patches that did not have an upstream tag, so I did that when
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
