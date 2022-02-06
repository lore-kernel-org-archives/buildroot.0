Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D8CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF35813B1;
	Sun,  6 Feb 2022 14:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTtbz4FLL98w; Sun,  6 Feb 2022 14:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0598138E;
	Sun,  6 Feb 2022 14:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBB51BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E3A40201
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URKOYkTqh2-e for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:15:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3EE6400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:15:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5FE45200004;
 Sun,  6 Feb 2022 14:15:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGiJt-0000TH-H6; Sun, 06 Feb 2022 15:15:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
References: <20220206092357.19286-1-thomas.devoogdt@gmail.com>
Date: Sun, 06 Feb 2022 15:15:13 +0100
In-Reply-To: <20220206092357.19286-1-thomas.devoogdt@gmail.com> (Thomas
 Devoogdt's message of "Sun, 6 Feb 2022 10:23:57 +0100")
Message-ID: <87pmo0w07i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: fix build with
 libglib2 >= 2.69
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas.devoogdt@gmail.com> writes:

 > Fix the following build failure raised since bump of libglib2 to version
 > 2.70 in commit 079923d:

 > profiles/battery/battery.c:162:2: warning: 'g_memdup' is deprecated (declared at /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/glib/gstrfuncs.h:257): Use 'g_memdup2' instead [-Wdeprecated-declarations]
 > batt-> initial_value = g_memdup(value, length);

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6b8/6b8870d12e0804d6154230a7322c49416c1dc0e2/build-end.log

 > Sources:
 >  - https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=710220f861b100856711a0a4d4a852874228a57a
 >  - https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f09e69ecb077082301dafb745856e1f3731aaa7
 >  - https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=cfab569484b18407fc117bb96634525cc76ea1f5

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > ---
 > [update] removed patch numbers & remve change to 0001-tools-mesh-cfgtest-include-limits.h

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
