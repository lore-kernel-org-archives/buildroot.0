Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADF8EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 17:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD15141880;
	Fri, 14 Jul 2023 17:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD15141880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD72hc-Fccg7; Fri, 14 Jul 2023 17:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F8BE4176C;
	Fri, 14 Jul 2023 17:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8BE4176C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E96A1BF83C
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBAD084292
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 17:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBAD084292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDbgUH9Sz8qS for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 17:56:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77EEE84290
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77EEE84290
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 17:56:23 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 3957BA2E29;
 Fri, 14 Jul 2023 19:56:21 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 1C05980219;
 Fri, 14 Jul 2023 19:56:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 99B3010013A;
 Fri, 14 Jul 2023 19:56:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 19:56:19 +0200
Message-ID: <2157461.Mh6RI2rZIc@kilian-aisec>
In-Reply-To: <20230628095825.905451-1-ludwig.kormann@ict42.de>
References: <20230628095825.905451-1-ludwig.kormann@ict42.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2044
X-purgate-ID: 154282::1689357380-3EFFB7B6-076D6F0D/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689357381;
 bh=4toQhEj0eqVhE9SRdgLFwdzmcCP1A/fdrn+NiVHLybM=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=0a7PwekzsRup+qiK9IpyyL5iXcC90toUY9M1G2JZUmJW4Tzy2lJkED+UNQ4nS6ms5
 GUFYo8addeInhj4fCF2PV+PIU3I9z5+3FoTXxsf/hKjlmUYPdi/ygwCRaZAc6SHBU2
 RSWTWXcsbxle4KWvvt3dGn8REs6lLIJZ6jCzjY+p1i6WNx0Axi1YfmwRrzllwye6lV
 bOYbBsid3PhXM4e2iRba9RjKtQ+LleDLCTbolTTybO3rUc4dcQCnTCCRHwKmCWRzcu
 3Jc+2sHBjrHBoN8YADPmre1hDye5lVArWG0UCmNQTlooFHOqgmX0XNj98gFLetUAYw
 vyCl3hUloY4EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=0a7Pwekz
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/icnova-a20-adb4006: new
 defconfig
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Ludwig Kormann <ludwig.kormann@ict42.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ludwig, all,

> +++ b/board/in-circuit/icnova-a20-adb4006/post-image.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

This seems to basically only invoke genimage, to create the image as defined in 
your genimage.cfg. There seems to be a script in buildroot, which does exactly 
this. See here: https://gitlab.com/buildroot.org/buildroot/-/blob/master/
support/scripts/genimage.sh
I recently came across this, when I looked at patches for the imxrt1050-evk 
and the Firefly roc_rk3399_pc, see here:

https://patchwork.ozlabs.org/project/buildroot/patch/20230102181603.3337480-1-Mr.Bossman075@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20230710212151.574040-2-robertoxmed@gmail.com/

They seem to use the support/scripts/genimage.sh in their defconfigs with a 
parameter, e.g.:

BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"

I myself have not done this, but you could maybe do something like this in the 
sun7i-a20-icnova-a20-adb4006_uboot_defconfig: 

BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/in-circuit/icnova-a20-adb4006/
genimage.cfg"

If this works, you could have one script less, i.e., remove the post-image.sh?

(I also do the same in my proposed Radxa Rock 5B patches and think about using 
the support genimage.sh script as well, but there it is a little bit trickier  
...)

Otherwise, to me your board support already looks very well. However, I am not 
a buildroot expert, so I can't really tell ;)

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
