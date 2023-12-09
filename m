Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C956BC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 15:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7402660ABD;
	Sat,  9 Dec 2023 15:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7402660ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nThfBMrFUOO4; Sat,  9 Dec 2023 15:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEDB60A81;
	Sat,  9 Dec 2023 15:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBEDB60A81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC2D1BF5A0
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2895981E61
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2895981E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHSqqsAaq3rs for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 15:10:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4362E81E5C
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 15:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4362E81E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 141E41C0002;
 Sat,  9 Dec 2023 15:10:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rByyk-000BQs-2i;
 Sat, 09 Dec 2023 16:10:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
 <87lea3pgo7.fsf@48ers.dk>
 <801a7ae9-e6cf-40bf-8250-6a9a36b1b67c@benettiengineering.com>
Date: Sat, 09 Dec 2023 16:10:54 +0100
In-Reply-To: <801a7ae9-e6cf-40bf-8250-6a9a36b1b67c@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 9 Dec 2023 16:06:44 +0100")
Message-ID: <878r63pg1t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/imx6ullevk_defconfig: bump Linux to
 6.6.4 and U-Boot to 2023.10
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Hi Peter,
 > On 09/12/23 15:57, Peter Korsgaard wrote:
 >>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
 >> > Let's also enable NXP firmware package to let latest SDMA
 >> firmware to be
 >> > loaded. To achieve this we also need to enable dynamic eudev to let it
 >> > to load the firmware.
 >> Why is that? I thought request_firmware() nowadays didn't need any
 >> help
 >> from user space to fetch files from /lib/firmware?
 >> Is it because this is requested very early before the rootfs is
 >> mounted?

 > Exactly, if the driver is built-in Linux it's too early to search rootfs
 > because it's not mounted.

 > Of course during drivers' probe()s and all kernel calls using dma will
 > use ROM SDMA Firmware until SDMA Firmware is loaded from rootfs so those
 > calls will have worse performances.
 > Of course NXP Firmware can't be embedded into Linux because it's
 > proprietary and license doesn't allow us to do that.

OK. Committed after extending the commit message to explain that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
