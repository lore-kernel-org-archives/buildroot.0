Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E6C60DCB;
	Sat, 11 Dec 2021 23:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Az8_kACh5xvx; Sat, 11 Dec 2021 23:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EC1360DCA;
	Sat, 11 Dec 2021 23:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9DA21BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B25C360BFE
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2U70UgSI3aN for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:07:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EE6560A98
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:07:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 01E68FF809;
 Sat, 11 Dec 2021 23:07:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwBSY-0007Wh-D2; Sun, 12 Dec 2021 00:07:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211201221114.1371808-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Dec 2021 00:07:18 +0100
In-Reply-To: <20211201221114.1371808-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 Dec 2021 23:11:14 +0100")
Message-ID: <87h7be2121.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: fix build failure
 with -latomic
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

 > Fix the following build failure raised since bump to version 3.4.10 in
 > commit 0ce776942d34d5d3bea6c11913cac38ea3e52f8b:

 > /usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.0.0
 > collect2: error: ld returned 1 exit status
 > make[3]: *** [run/lemon] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/02ea7d76a683b039fb37e005578644108bd1e3b7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
