Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ECC433FE
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 10:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6D47610B9;
	Wed, 11 May 2022 10:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2G1fn-6BCZQc; Wed, 11 May 2022 10:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A28610BD;
	Wed, 11 May 2022 10:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB581BF5B3
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7044023C
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 10:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRQJz6pVya0T for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 10:08:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C31240227
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:08:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 499791C000E;
 Wed, 11 May 2022 10:08:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nojGc-006CYi-A4; Wed, 11 May 2022 12:08:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <08d36a3f-8c9b-173d-f965-fa2aef9a8c77@xilinx.com>
Date: Wed, 11 May 2022 12:08:26 +0200
In-Reply-To: <08d36a3f-8c9b-173d-f965-fa2aef9a8c77@xilinx.com> (Michal Simek's
 message of "Wed, 11 May 2022 11:59:45 +0200")
Message-ID: <87a6bocrfp.fsf@dell.be.48ers.dk>
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

Hi,

 >> This is not great :/ Are you seeing the same? On a custom board
 >> running
 >> an old 2019.1 based PMU I don't see it, but after updating the PMU I do
 >> since the exception was silently ignored before v2020.2:
 >> https://github.com/Xilinx/embeddedsw/commit/b2bc5ed0e63ad1abbf2a3bc28dbf3c185b7092e4
 >> Any ideas about how to fix this (besides using a custom pmufw with
 >> ENABLE_UNUSED_RPU_PWR_DWN turned off)?

 > I am not pmufw owner. Have never had a time to dig into internals and
 > maybe I even don't want to see it.

Heh, having looked I know the feeling. Do you know you I need to reach
out to instead?

Is reboot from Linux working for you?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
