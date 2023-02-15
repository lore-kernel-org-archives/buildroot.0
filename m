Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295D5C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE30F40209;
	Wed, 15 Feb 2023 21:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE30F40209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iioK2Xxt0pUs; Wed, 15 Feb 2023 21:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA8C4179C;
	Wed, 15 Feb 2023 21:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EA8C4179C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBFD1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26BB881FD2
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26BB881FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TePh1Zjgoowo for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:39:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A4C81FCB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05A4C81FCB
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:39:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1802240004;
 Wed, 15 Feb 2023 21:39:34 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:39:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230215223934.141b34c3@windsurf>
In-Reply-To: <20230213181754.913323-1-fontaine.fabrice@gmail.com>
References: <20230213181754.913323-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676497175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XAhMdTkHI3VTSqS0/D7QOTBlPvksArY/qIMaojAHDA=;
 b=deNHvsCUmiAy6YlzUwRM+9PNEM8eLkux5XwOm7aqewX4Xd06zX1lH0lRJ6yBTR/UJJGt/l
 tgCQeq3s2CdehqDM98fB/DYtbskQjkOgRXrMxS9Lz1DcFdvJm+xdMXcFHM9o3ThYDgwBM7
 R4QBY5jsUSCmkOBeD1JEyrf+VS9mb3P0mieUlAyM2ZoxeAYboLWKRqxnhJmEOw8eJ1kHit
 U2430TNwZ+exvclWwldMO+FNeop4gO5w7LRue2pEzNVCIKwnIAETNUvd8CIaz37Txuz47O
 EqsFYjt9aJ7J8fV8ih7ik7NBKyMZYOb257ke9QyP4J1LKVe389mjI0pUa1MlNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=deNHvsCU
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: fix libressl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Feb 2023 19:17:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libressl build failure raised since the addition of
> the package in commit 2a571acddd0badaf9636649d98fd095757878348:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
> auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-SHA3-is-not-supported-by-libressl.patch | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch

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
