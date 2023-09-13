Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE8AEE0208
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 18:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85D081831;
	Wed, 13 Sep 2023 18:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85D081831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMic-UyO3zdB; Wed, 13 Sep 2023 18:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FEB881E3D;
	Wed, 13 Sep 2023 18:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FEB881E3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4698C1BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 18:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20285404B5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 18:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20285404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GX832NPYlsPc for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 18:55:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7775401DD
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 18:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7775401DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54244FF802;
 Wed, 13 Sep 2023 18:55:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgV1e-0063PO-76; Wed, 13 Sep 2023 20:55:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230826165628.31792-1-romain.naour@gmail.com>
Date: Wed, 13 Sep 2023 20:55:46 +0200
In-Reply-To: <20230826165628.31792-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 26 Aug 2023 18:56:27 +0200")
Message-ID: <87msxp298t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx6qsabresd_defconfig:
 fix defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > While switching ATF to github, the BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > symbol was not removed. Since then this defconfig fail to build
 > in gitlab-ci due to invalid defconfig check.

 >   WARN: defconfig ./configs/freescale_imx6qsabresd_defconfig can't be used:
 >         Missing: BR2_TARGET_UBOOT_CUSTOM_GIT=y

 > [1] dd42b159a5f752921ee602530d289c810ad7ee51

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > This defconfig will fail anyway due to too old ATF package (pre V2.9 version)
 > and binutils 2.39+. But it should be backported up to 2023.02.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
