Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2873C001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA97814AB;
	Mon,  3 Jul 2023 19:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA97814AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBjJswGM5S3A; Mon,  3 Jul 2023 19:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63448145E;
	Mon,  3 Jul 2023 19:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63448145E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 045F81BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCDB6408C3
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDB6408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCEJm5p3f7-z for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:44:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4BA408BC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4BA408BC
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:44:45 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C03E01BF204;
 Mon,  3 Jul 2023 19:44:42 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:44:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703214441.31bc1281@windsurf>
In-Reply-To: <20230702180449.527486-1-bernd@kuhls.net>
References: <20230702180449.527486-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688413483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQk6PEO2w95Tvu8ZAhD/N17xygbbmZLGFiE+IpJgAQ0=;
 b=A3s0Q3XCZbtQTFU6dl3WGqkoE7lSwGxqYgjQKSd0TKWfqcaacSPT5PCy7pxM0ow5HKn2aW
 S5gsbZ2PT9CoWhG5k4ItGgX9/A/fl7TzChEdMXG3NqM2oZmGMsRgs5ALF43b+0nGMtseku
 yxCdNJwvSnT4LH5XS201yLAC007ThqbDndxqR9h4mN24vq7jrYDc1pByAxGCbG1SiaCOpH
 j+W6BOhhFRoGgHYV9fPLOYkNsC7MBwe8NbR9x2EQUGBB9UC/bHXBjYZU30vZr5GLv3jRBo
 cb46N1XoYHFMLzejocaex0vX9SRQqG+WdwyEbATMLyjt3vASiVPP21n6FKLKXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A3s0Q3XC
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{gettext-gnu,
 libtextstyle}: bump to version 0.22
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun,  2 Jul 2023 20:04:49 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00009.html
> https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
> 
> Removed patch 0001, the patched file is not present in this release.
> Removed patch 0002 which was applied upstream.
> 
> Added comments about other files to be updated during version bumps.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: updated gnutext-tiny as well, added comments for future updates

Thanks for working on this. Unfortunately, this patch doesn't work for
me. First, the update of libtextstyle.hash is missing. As it's trivial,
I fixed it locally (but also updated all comments in gettext-gnu,
gettext-tiny and libtextstyle, both in .mk and .hash file to remind to
update the 2 others). But after fixing that the build fails later in
host-gettext-gnu:

In file included from ../../gettext-runtime/intl/localealias.c:61:
../../gettext-runtime/intl/gettextP.h:71:11: fatal error: libgnuintl.h: No such file or directory
   71 | # include "libgnuintl.h"
      |           ^~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [Makefile:4690: ../../gettext-runtime/intl/msginit-localealias.o] Error 1
make[4]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-gettext-gnu-0.22/gettext-tools/src'
make[3]: *** [Makefile:4036: all] Error 2
make[3]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-gettext-gnu-0.22/gettext-tools/src'
make[2]: *** [Makefile:3434: all-recursive] Error 1
make[2]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-gettext-gnu-0.22/gettext-tools'
make[1]: *** [Makefile:3302: all] Error 2
make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-gettext-gnu-0.22/gettext-tools'
make: *** [package/pkg-generic.mk:293: /home/thomas/projets/buildroot/output/build/host-gettext-gnu-0.22/.stamp_built] Error 2

My defconfig is:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_SYSTEM_ENABLE_NLS=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBFUSE=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look at this?

It would be really awesome to have some test cases in support/testing/
to test the gettext support. Because it's quite tricky to test/remember
the different combinations. Sometimes gettext-tiny is used (!NLS),
sometimes gettext-gnu (NLS). Sometimes only the host variant is used,
sometimes the target variant is needed (to provide libintl). Having a
few test cases each testing one of these situations would be really
awesome. This way we could merge gettext updates with more confidence.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
