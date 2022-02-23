Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC36C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E24D40603;
	Wed, 23 Feb 2022 11:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYfQ9PeQCwGt; Wed, 23 Feb 2022 11:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C7CB4014B;
	Wed, 23 Feb 2022 11:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F981BF868
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D8A60B52
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbMHlCNxUw49 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:18:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9521160B34
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:18:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C2F7100004;
 Wed, 23 Feb 2022 11:18:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMpez-009aNx-HJ; Wed, 23 Feb 2022 12:18:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <87pmnsnquv.fsf@dell.be.48ers.dk> <87sfs96gqj.fsf@dell.be.48ers.dk>
 <PH0PR02MB775035975B305CECD5D842F3D73C9@PH0PR02MB7750.namprd02.prod.outlook.com>
Date: Wed, 23 Feb 2022 12:18:17 +0100
In-Reply-To: <PH0PR02MB775035975B305CECD5D842F3D73C9@PH0PR02MB7750.namprd02.prod.outlook.com>
 (Neal Frager's message of "Wed, 23 Feb 2022 11:02:24 +0000")
Message-ID: <87fso96dc6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

Hi,

 > The reason why this was working for me is because I had the DEVICE_TREE environment variable set when building.

 > make distclean
 > make xilinx_zynqmp_virt_defconfig
 > export DEVICE_TREE="zynqmp-zcu106-revA"

I wasn't aware that U-Boot uses the value of this environment variable
over what is speficied in the configuration file. I think we should
clear this environment variable in Buildroot similar to how we do for
E.G. CROSS_COMPILE in the top level Makefile. I'll send a patch for
that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
