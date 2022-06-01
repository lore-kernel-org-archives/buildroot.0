Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E3FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F07261190;
	Wed,  1 Jun 2022 16:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVp4LujhX4Rb; Wed,  1 Jun 2022 16:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3AB6117F;
	Wed,  1 Jun 2022 16:04:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 995AA1BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8130B6117F
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ig1iFeWdWBq for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:04:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C49061174
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 16:04:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E147B100003;
 Wed,  1 Jun 2022 16:04:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwQpn-008szw-M2; Wed, 01 Jun 2022 18:04:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-2-bernd.kuhls@t-online.de>
Date: Wed, 01 Jun 2022 18:04:35 +0200
In-Reply-To: <20220514175612.2510884-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 14 May 2022 19:55:55 +0200")
Message-ID: <87zgiw2wvg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 02/19]
 package/x11r7/xdriver_xf86-video-amdgpu: fix glamor support
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Add configure options for glamor support following the logic of the
 > xserver_xorg-server package:
 > https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n141

 > Fixes:
 > http://autobuild.buildroot.net/results/e78/e786118db87f65bdcb913656a7b6d9b3187a212c/
 > http://autobuild.buildroot.net/results/a00/a0089ed3abdb0a3712524ae77fc613a4982054ed/
 > http://autobuild.buildroot.net/results/541/54193d198efe371bdb19ac4981d631ff1e279717/
 > http://autobuild.buildroot.net/results/298/298198c036931b10f7e1046176bd48310ae7455f/
 > http://autobuild.buildroot.net/results/4da/4da87d30e6f5a10aafae60abce1b89ed92204a4e/
 > http://autobuild.buildroot.net/results/74c/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
