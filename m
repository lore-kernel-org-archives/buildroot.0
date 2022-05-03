Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0C5C433FE
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 333D640AF0;
	Tue,  3 May 2022 14:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRYslB6_hZLd; Tue,  3 May 2022 14:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 418B840ADE;
	Tue,  3 May 2022 14:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2091BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1AB40ADE
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1b6_xM7aC14l for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:44:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FAC640189
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:44:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6B291BF208;
 Tue,  3 May 2022 14:44:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nltlW-00BsLd-To; Tue, 03 May 2022 16:44:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220502074907.3941472-1-neal.frager@amd.com>
 <87a6by4s5g.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758E081BE889432D144B4B6D7C09@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Tue, 03 May 2022 16:44:38 +0200
In-Reply-To: <SJ0PR02MB7758E081BE889432D144B4B6D7C09@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Tue, 3 May 2022 14:38:11 +0000")
Message-ID: <871qxa4qw9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig:
 bump to Xilinx 2022.1
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
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

 > Hi Peter,
 >> Committed, thanks.

 > Thank you!

 >> Out of interest, why is there two tags (based on 5.15 and 5.15.19)?
 >> Is the plan to rebase the _LTS_ one on future stable releases?

 >> git tag | grep 'xlnx.*5.15'
 >> xlnx_rebase_v5.15_2022.1
 >> xlnx_rebase_v5.15_LTS_2022.1

 > The xlnx_rebase_v5.15_2022.1 tag is continuing our older release strategy of staying with a 5.15.0 kernel for the entire year.
 > Developers would then be fully responsible for rebasing the kernel.org security patches.

 > The xlnx_rebase_v5.15_LTS_2022.1 is our new release strategy and the one I am promoting for everyone to use.
 > This tag is using Linux kernel 5.15.19 for 2022.1 and will update to 5.15.x for 2022.2.
 > Essentially, developers get two updates of security patches per year by using these tags.
 > Petalinux and Yocto are also using the xlnx_rebase_v5.15_LTS_2022.1 release tag.

Ok, nice - Definately a step in the right direction!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
