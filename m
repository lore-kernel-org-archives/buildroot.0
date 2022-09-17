Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425A3C6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 06:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D559A610F0;
	Sat, 17 Sep 2022 06:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D559A610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3EXAUybaNJC; Sat, 17 Sep 2022 06:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E751261040;
	Sat, 17 Sep 2022 06:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E751261040
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 882D81BF846
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7079183FEE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7079183FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwMN3dKBJIPE for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 06:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6068E819F5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6068E819F5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 06:47:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5BD9120003;
 Sat, 17 Sep 2022 06:47:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZRcB-0096TL-Ib; Sat, 17 Sep 2022 08:47:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220822142353.9958F87AA7@busybox.osuosl.org>
Date: Sat, 17 Sep 2022 08:47:47 +0200
In-Reply-To: <20220822142353.9958F87AA7@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 22 Aug 2022 16:13:44 +0200")
Message-ID: <87sfkq4hv0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit branch/next] package/sdl2: be explicit
 about OpenGL ES options
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

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=d6df46fb145c4211b0750b0362b6e3ca832e8231
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > In addition to --enable-video-opengles, SDL2 configure script also
 > looks at --enable-video-opengles1 and --enable-video-opengles2. Since
 > all OpenGL ES providers in Buildroot provide at least up to OpenGL ES
 > 2, enable both options when BR2_PACKAGE_SDL2_OPENGLES=y.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998@free.fr: split long lines]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
