Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD4CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138E441B58;
	Tue, 24 May 2022 15:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-7EN_pB0XxO; Tue, 24 May 2022 15:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB39041B57;
	Tue, 24 May 2022 15:04:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF311BF395
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49BC041B57
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwSibqOtprvU for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:04:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC3C940045
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:04:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AEE320009;
 Tue, 24 May 2022 15:04:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntW57-00F6XZ-Kb; Tue, 24 May 2022 17:04:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220419090055.2029170-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 17:04:21 +0200
In-Reply-To: <20220419090055.2029170-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Apr 2022 11:00:55 +0200")
Message-ID: <87fskzt1je.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/trinity: fix musl build
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

 > Fix the following build failure on musl:
 > In file included from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/asm/ioctl.h:12,
 >                  from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/linux/ioctl.h:5,
 >                  from /nvmedata/autobuild/instance-17/output-1/host/powerpc64-buildroot-linux-musl/sysroot/usr/include/linux/fs.h:14,
 >                  from ioctls/vfs.c:3:
 > ioctls/vfs.c:109:35: error: 'loff_t' undeclared here (not in a function); did you mean 'off_t'?
 >   109 |  { .name = "FIOQSIZE", .request = FIOQSIZE, },
 >       |                                   ^~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b7f46072751a8d70fa02f1c625c5279f70bec853

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
