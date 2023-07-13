Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778FBC001DF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED46241760;
	Thu, 13 Jul 2023 20:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED46241760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOz3RASBLIWD; Thu, 13 Jul 2023 20:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 297A540575;
	Thu, 13 Jul 2023 20:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297A540575
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E10781BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C3C742151
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3C742151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrCqc6wwsd2S for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D3F42152
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2D3F42152
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:30:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FEE660004;
 Thu, 13 Jul 2023 20:30:33 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:30:32 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230713223032.5bb36539@windsurf>
In-Reply-To: <20230713201808.65932-1-ju.o@free.fr>
References: <20230713201808.65932-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689280234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NzkHZHYlvMFbwYPIjtQejOMy019fLdCRslJ5GTtsJE=;
 b=ObWe97lFUmdVv7ZhHCXBjdo6CLT8VdeIMK1Giu+LAC9o10yJ62sohoc53R2DsJ4CwNtk+Q
 i4aYDW2hCPn5MIhoXODQ1GQv035af0oXaY0K5BKWN+Q/Nj5+WOCcVbYLrzm6V7jpayTGmr
 3MGJ4MJrw2AHJIYyUGXGtKjyAGQN99iKjAMkJECmEWkWjZfP6qvHuhGWhYk4N1kS0Zx1jl
 Jbcsmd7TxVEMFvO5cicvHFm94vzk1v371zJRi5bU5ZECFb4zVUEW77+JQja366vcqtTfUQ
 JIs49aoXRBOLmeQSXMcSsORRcr05XBaIx9AG46iG3abvBOEcTEp3r0rTB77Fsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ObWe97lF
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_acpica.py: run runtime test
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

On Thu, 13 Jul 2023 22:18:08 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_acpica.py  | 91 +++++++++++++++++++
>  .../test_acpica/rootfs-overlay/root/dsdt.asl  |  9 ++
>  3 files changed, 102 insertions(+)
>  create mode 100644 support/testing/tests/package/test_acpica.py
>  create mode 100644 support/testing/tests/package/test_acpica/rootfs-overlay/root/dsdt.asl

Applied to master, thanks. Sadly, I only spotted the minor typo in the
commit title after pushing :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
