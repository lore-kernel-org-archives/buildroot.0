Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D4C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 07:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1904984448;
	Sun, 18 Sep 2022 07:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1904984448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRxIPW1CwqiB; Sun, 18 Sep 2022 07:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F83784441;
	Sun, 18 Sep 2022 07:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F83784441
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D384B1BF484
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACBFF42418
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 07:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACBFF42418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkXsK3rLQlVQ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 07:02:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CD64240B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65CD64240B
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:02:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A68C9E0002;
 Sun, 18 Sep 2022 07:02:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZoKF-00BMXP-Ug; Sun, 18 Sep 2022 09:02:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220827161431.333659-1-romain.naour@gmail.com>
Date: Sun, 18 Sep 2022 09:02:47 +0200
In-Reply-To: <20220827161431.333659-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 27 Aug 2022 18:14:30 +0200")
Message-ID: <871qs9xizs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [for-master 1/2] package/glibc: glibc on or1k needs
 a toolchain w/ headers >= 5.4
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

 > Commit [1] enabled glibc on or1k since it's now supported but it
 > requires a toolchain with linux-headers >= 5.4.

 > From [2]:
 > "Here we define the minumum linux kernel version at 5.4.0, as that is the
 > long term support version where 32-bit architectures start to support
 > 64-bit time API's.  The OpenRISC kernel had some bugs up until version 5.8
 > which caused issues with glibc fork/clone, they have been backported to
 > 5.4 but not previous versions."

 > Fixes:

 >   checking installed Linux kernel header files... 3.2.0 or later
 >   checking for kernel header at least 5.4.0... too old!
 >   configure: error: *** The available kernel headers are older than the requested

 > https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/2875256686

 > [1] 68d0aede597d32816c5b2ff32de0ce33cc14eb93
 > [2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0c3c62ca7d9ff3bdacdd13e636bc858101e3e288

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
