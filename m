Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 07:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6E7410CB;
	Wed,  4 May 2022 07:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4KrFEJH6bGu; Wed,  4 May 2022 07:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A373440A06;
	Wed,  4 May 2022 07:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0604F1BF42D
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 07:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D554098A
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 07:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58D8KXySvGpx for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 07:18:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A418D40987
 for <buildroot@buildroot.org>; Wed,  4 May 2022 07:18:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14C96FF80D;
 Wed,  4 May 2022 07:18:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nm9HH-00DJIQ-0h; Wed, 04 May 2022 09:18:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
Date: Wed, 04 May 2022 09:18:26 +0200
In-Reply-To: <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com> (Michal Simek's
 message of "Wed, 4 May 2022 09:11:23 +0200")
Message-ID: <878rrh3gvx.fsf@dell.be.48ers.dk>
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

This is using the psu_init_gpl.c in U-Boot:

https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2022.01_2022.1/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c

And the pmu configuration object from Neal:

https://git.buildroot.net/buildroot/tree/board/zynqmp/zcu106/pm_cfg_obj.c

So what exactly needs to change?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
