Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28219C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7C8C421E3;
	Sun, 18 Sep 2022 09:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7C8C421E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05IJUI0qqCN5; Sun, 18 Sep 2022 09:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2058B41E57;
	Sun, 18 Sep 2022 09:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2058B41E57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2ABA1BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE956FB0C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE956FB0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzkGK9RgZbnr for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:35:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A464B60E2E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A464B60E2E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:35:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0701D20003;
 Sun, 18 Sep 2022 09:35:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZqhh-00BVck-2j; Sun, 18 Sep 2022 11:35:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220908094448.AD3A982AA2@busybox.osuosl.org>
Date: Sun, 18 Sep 2022 11:35:09 +0200
In-Reply-To: <20220908094448.AD3A982AA2@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 8 Sep 2022 11:44:22 +0200")
Message-ID: <87czbthvoy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] arch/xtensa: custom configuration
 requires an overlay
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4cbf7336914f25478aea943456ba7dc3c892c21a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Using a custom Xtensa configuration requires an overlay that provides
 > that configuration; not providing an overlay is like using the default
 > configuration, BR2_xtensa_fsf, so there would be no point in that case
 > in requesting a custom configuraiton.

 > Make providing an overlay mandatory for custom configurations.

 > Fixes:
 >     http://autobuild.buildroot.org/results/f0b/f0ba47d2534aeb3cc2921124aa639ae3aa072b9b

 >     xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=include/xtensa-config.h;hb=2ee5e4300186a92ad73f1a1a64cb918dc76c8d67#l28

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Max Filippov <jcmvbkbc@gmail.com>
 > [yann.morin.1998@free.fr:
 >   - always require an overlay for custom configurations, not just for
 >     little endian ones
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
