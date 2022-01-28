Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BE5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0795641D71;
	Fri, 28 Jan 2022 21:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqGIHgV3IrEb; Fri, 28 Jan 2022 21:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66EEA41D56;
	Fri, 28 Jan 2022 21:21:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EDF41BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D2F161189
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxg5_njyeRal for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:21:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D6B610C5
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:21:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E5FCA200006;
 Fri, 28 Jan 2022 21:21:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDYgE-0005k6-8V; Fri, 28 Jan 2022 22:21:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220126202236.1399934-1-yann.morin.1998@free.fr>
Date: Fri, 28 Jan 2022 22:21:14 +0100
In-Reply-To: <20220126202236.1399934-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 26 Jan 2022 21:22:36 +0100")
Message-ID: <87wnij36b9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/polkit: bump to fix CVE-2021-4034
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We are currently using the fork by Adam, with support for duktape as a
 > JS engine. But upstream has finally merged that just a day ago. Woohoo!

 > Between the fork we were using and upstream, there are very little
 > changes, mostly centered around:
 >   - translations
 >   - buildsystem
 >   - duktape
 >   - CVE-2021-4034

 > So, we just switch to using the HEAD of the repo: it has not much more
 > than the two important changes: duktape and the CVE fix.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Marek Belisko <marek.belisko@open-nandra.com>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
