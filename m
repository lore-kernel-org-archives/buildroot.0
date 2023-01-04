Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD11BC53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 21:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7AC60D80;
	Wed,  4 Jan 2023 21:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7AC60D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzCiunHuZOcP; Wed,  4 Jan 2023 21:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CC960AF2;
	Wed,  4 Jan 2023 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CC960AF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A10681BF279
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C57980DCC
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C57980DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etGGrNSP5Fid for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 21:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DFE280D51
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DFE280D51
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 21:28:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6996360003;
 Wed,  4 Jan 2023 21:28:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pDBJS-0059M2-Hk; Wed, 04 Jan 2023 22:28:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230102154550.78227-1-romain.naour@gmail.com>
Date: Wed, 04 Jan 2023 22:28:42 +0100
In-Reply-To: <20230102154550.78227-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 2 Jan 2023 16:45:49 +0100")
Message-ID: <87bknevvjp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/minetest{-game}: bump to version
 5.6.1
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

 > Release announcement:
 > 5.6.0: https://forum.minetest.net/viewtopic.php?f=18&t=28511
 > 5.6.1: https://forum.minetest.net/viewtopic.php?f=18&t=28703

 > minetest:
 > - Update license file hash due to new image file in the project sources.
 > - IrrlichtMt 1.9.0mt8 is required to build Minetest >= 5.6.1.
 > - Add xlib_libXi dependecy for xinput2 support enabled by default for Linux.
 > - Remove xlib_libXxf86vm dependency previously used by gamma ramp code [1].

 > [1] https://github.com/minetest/irrlicht/commit/538c9e5cde425ecee1e802fd53344111683b60be

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
