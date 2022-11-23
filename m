Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BF3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B086102F;
	Wed, 23 Nov 2022 21:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B086102F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52dtDvL4zj_t; Wed, 23 Nov 2022 21:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2C460BC2;
	Wed, 23 Nov 2022 21:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2C460BC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1492E1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F11516068F
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11516068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjdyn-QJmhcJ for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:58:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA1E6068D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCA1E6068D
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:58:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F25F240004;
 Wed, 23 Nov 2022 21:58:26 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:58:25 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123225825.496f4f8f@windsurf>
In-Reply-To: <20221123225803.3e5c20c0@windsurf>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-2-chris.dimich@boundarydevices.com>
 <20221123225803.3e5c20c0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3sPZQSQKAw1xH5tkL5v3RXYzA5vMgc8dBAFbs/BOGM=;
 b=ViODvkRFTVXhP2+5XeWte7SV7vns7KV7wZCFXZpiCW2sYsfVtcAGt9GP1nsZpTjJpc0W6S
 1BfGcXikfVzp1xf0+e28eyCMlgcae6wnk695/oxTPTsHZ+nQay+o5dzDS76K6nGWWHTtjw
 GZT3wcs01GXrcUIfJAztXgVIpiH/arXdNKIOIyRVNSTAp+yQqkG2dwTJ78AWcq6QfX4B2p
 LDFvzJeAHovQzmGXvKPv6RoOnHurLSq1Fhf7BXMJJxaRsrQCtOzFOELuidU0+Wdh+leH23
 SKxmlpU+QS/eLqHy2zlkRSszzepcNJgApF5nddr6p49mU4khkT1qTM/Z7GUxsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ViODvkRF
Subject: Re: [Buildroot] [PATCH 2/7]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 22:58:03 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Applied to master, thanks.

Sorry: applied to next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
