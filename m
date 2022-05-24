Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEC2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E1083F06;
	Tue, 24 May 2022 08:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2I9CCnBbrAad; Tue, 24 May 2022 08:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A992D83EE3;
	Tue, 24 May 2022 08:21:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C05D81BF28D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE26660DB2
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB7UHOiS4U7d for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B2F560D64
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44308C0006;
 Tue, 24 May 2022 08:21:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntPml-00EhHh-3y; Tue, 24 May 2022 10:20:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 10:20:59 +0200
In-Reply-To: <20220419161130.3431492-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Apr 2022 18:11:30 +0200")
Message-ID: <87y1yruys4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
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

 > Untar internal bind so libtool patches will be applied on bind's
 > libtool. This will fix:
 >  - installation of some libraries such as libisccfg. Indeed, if libtool
 >    is not patched those libraries will be "relinked" and so not
 >    installed.
 >  - build failures with riscv and or1k:

 >   Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized

 >   Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buildroot' not recognized

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8966cb1bc2
 >  - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202fb161c40e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
