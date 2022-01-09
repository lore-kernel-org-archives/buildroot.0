Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15712C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B144F40575;
	Sun,  9 Jan 2022 18:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpI1imayxWhr; Sun,  9 Jan 2022 18:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D7140495;
	Sun,  9 Jan 2022 18:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 030741BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D740181871
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRSGLKIP7hyo for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52A568186A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:18:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4F28F200002;
 Sun,  9 Jan 2022 18:18:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6cle-0003Oy-NH; Sun, 09 Jan 2022 19:18:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220109180657.2765079-1-fontaine.fabrice@gmail.com>
Date: Sun, 09 Jan 2022 19:18:10 +0100
In-Reply-To: <20220109180657.2765079-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 9 Jan 2022 19:06:57 +0100")
Message-ID: <87o84kai3h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: disable
 MBEDTLS_FATAL_WARNINGS
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

 > Disable MBEDTLS_FATAL_WARNINGS to avoid the following build failure
 > since bump to version 2.28.0 in commit
 > 0f8aab08e762742d753d5920718f31c629d0f8d7:

 > /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
 >   412 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
 >       |    ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/af017382bb5772de7383d71ed7b8af44717981f9

Committed, thanks.

The error message is a bit odd as we should be building with -Os. Do you
know what is going on?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
