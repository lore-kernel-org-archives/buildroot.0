Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D5BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 09:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E02BC8336D;
	Wed, 11 May 2022 09:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id np_w0nOFIpw0; Wed, 11 May 2022 09:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F9983365;
	Wed, 11 May 2022 09:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2F971BF5DA
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 09:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17F783365
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 09:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsuJ_OYMVZBO for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 09:11:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB52483342
 for <buildroot@buildroot.org>; Wed, 11 May 2022 09:11:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDD221C0014;
 Wed, 11 May 2022 09:10:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1noiMx-0063Ud-CK; Wed, 11 May 2022 11:10:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
Date: Wed, 11 May 2022 11:10:55 +0200
In-Reply-To: <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com> (Michal Simek's
 message of "Wed, 4 May 2022 09:11:23 +0200")
Message-ID: <87ilqccu3k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 buildroot@buildroot.org, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@xilinx.com> writes:

 > On 5/4/22 08:49, Peter Korsgaard wrote:
 >>>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:
 >> > This patch migrates configs/zynqmp_zcu106_defconfig to tarballs
 >> for TF-A, u-boot and Linux.
 >> > This patch has zero change in code running on the device.
 >> > The goal is to improve build speed and align with the zynq_xxx_defconfigs.
 >> > Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> Committed, thanks.
 >> Notice: I'm still seeing noisy warnings from the kernel during boot,
 >> did
 >> you hear back from Michal abot that?
 >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
 >> not present
 >> [    4.393156] ------------[ cut here ]------------
 >> [    4.397776] More than allowed devices are using the vpll_int, which is forbidden


 > This is caused by not proper psu_init which setup PLLs incorrectly.

I just noticed a different issue, reboots from Linux are not working, as
the PMU hangs with an exception accessing the TCM as the RPU is powered
down by default (ENABLE_UNUSED_RPU_PWR_DWN defaults to 1).

Resets from U-Boot works, but that is presumably because the RPU is
still running there.

Doing a build on the PMU firmware with the PM log level set to 4 I see
during Linux boot:

APU> InitFinalize
rpu0 active->forced off
ipi_rpu0 1->0
tcm0b 2->0
tcm0a 2->0
vcu 1->0
gpu 1->0
ipi_rpu1 1->0

And then when rebooting:

[   15.705425] reboot: Restarting system
APU> SystemShutdown(1, 2)
Err: #1 l2$ state#2
Error in change state for l2$
Err: #1 ocm0 state#2
Error in change state for ocm0
Err: #1 ocm1 state#2
Error in change state for ocm1
Err: #1 ocm2 state#2
Error in change state for ocm2
Err: #1 ocm3 state#2
Error in change state for ocm3
rpu 0->1
Received exception
MSR: 0x200, EAR: 0xFFE00000, EDR: 0x0, ESR: 0x4C4

This is not great :/ Are you seeing the same? On a custom board running
an old 2019.1 based PMU I don't see it, but after updating the PMU I do
since the exception was silently ignored before v2020.2:

https://github.com/Xilinx/embeddedsw/commit/b2bc5ed0e63ad1abbf2a3bc28dbf3c185b7092e4

Any ideas about how to fix this (besides using a custom pmufw with
ENABLE_UNUSED_RPU_PWR_DWN turned off)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
