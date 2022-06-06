Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97BC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67926832EA;
	Mon,  6 Jun 2022 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLnrW0T7-AhV; Mon,  6 Jun 2022 10:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A20E5831F2;
	Mon,  6 Jun 2022 10:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E74B1BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D0841747
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KGjIRNw-IgW for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:30:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B306441803
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:30:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4FECC0002;
 Mon,  6 Jun 2022 10:30:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ny9zl-00Clzf-SH; Mon, 06 Jun 2022 12:30:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220528202627.2082719-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 12:30:01 +0200
In-Reply-To: <20220528202627.2082719-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 May 2022 22:26:27 +0200")
Message-ID: <87leuaxexi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/dhcp: fix build without atomic
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without atomic raised since commit
 > fde21979427ffeb4fe9c0068310be195f2dec5ec:

 > /nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Move BR2_TOOLCHAIN_HAS_LIBATOMIC block inside 
 >    BR2_TOOLCHAIN_HAS_ATOMIC block

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
