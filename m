Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C45C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD0841DE3;
	Sat, 17 Sep 2022 20:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BD0841DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOSi9hfnT7JQ; Sat, 17 Sep 2022 20:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B15D041DD9;
	Sat, 17 Sep 2022 20:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B15D041DD9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADF5E1BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7803C41DD1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7803C41DD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z430_J4Dqr9t for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:21:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE60341DD9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE60341DD9
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:21:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E06BE0004;
 Sat, 17 Sep 2022 20:21:05 +0000 (UTC)
Date: Sat, 17 Sep 2022 22:21:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220917222104.4a615677@windsurf>
In-Reply-To: <20220824192604.2549356-13-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-13-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663446067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtKGFamUNxFhtY9QFAXEDk1pAucTzxG3rfOFWso5rzg=;
 b=hb/wdK1aJY3d0pq4S+fHd0b3ia3o28nRQZkyuWhHo16ElaaIhj4RGzjFcdKNd/XVFKVcBQ
 x9TPXm1uzXQGka5IE3xvLoCbo1hOIS1sbJ5y5MViAbyn+pOAk3342XynEARV7VdxjVrzng
 wwVqCa10t3nPEFHV/VO6doqH94VtLoKDHosF5dm1k9MJxMZ0wRX0FXYcNhFHEg5nfxt5/h
 +WzPLSQgmux2eGHo+aJgw0al5DGHDuzPAyVivHOhxzp6xdc2zbsPAi+KEDNsHzX8M46J3A
 SB6ZN/jFKxao8ezTuSWgqj/sUen8XiH+y5YJpeuEan1GPCbHL/LpBh3olRbqfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hb/wdK1a
Subject: Re: [Buildroot] [PATCH 6/7]
 package/freescale-imx/imx-vpu-hantro-vc: bump version to 1.7.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Wed, 24 Aug 2022 12:26:03 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> -To match NXP 5.15.32-2.0.0 release.
> -EULA/COPYING: update to LA_OPT_NXP_Software_License v35.
> -Add an INSTALL_STAGING_CMDS define as libraries needed by imx-vpu-hantro-daemon.

Please split the version bump from the installation to staging into
separate patches. These are unrelated things, so they belong into
separate commits.

> -sha256  d5efae484c4271c098286d007590d6bf40c272d4f35702ff65625f2362715ab3  imx-vpu-hantro-vc-1.4.0.bin
> -sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> -sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> +sha256  8af665f8e06e0e467f563e372f43583d94128f0d37f75321965bc26bd4404b2b  imx-vpu-hantro-vc-1.7.0.bin
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA

Here as well, the EULA hash is wrong:

>>> imx-vpu-hantro-vc 1.7.0 Collecting legal info
ERROR: EULA has wrong sha256 hash:
ERROR: expected: 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31
ERROR: got     : 30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Please make sure that "make legal-info" works in a configuration where
you have this package enabled.

> +define IMX_VPU_HANTRO_VC_INSTALL_STAGING_CMDS
> +	cp -r $(@D)/usr/include/hantro_VC8000E_enc $(STAGING_DIR)/usr/include/
> +	cp $(@D)/usr/lib/libhantro_vc8000e.so $(STAGING_DIR)/usr/lib/
> +	cp $(@D)/usr/lib/libhantro_vc8000e.so.1 $(STAGING_DIR)/usr/lib/

Please use the same commands as the target installation. The
INSTALL_TARGET_CMDS are using $(INSTALL) -D -m 0755, so you should do
the same here.

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
