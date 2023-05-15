Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D76C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 15:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65CDC41D9D;
	Mon, 15 May 2023 15:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65CDC41D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PI2_EzliGT9; Mon, 15 May 2023 15:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D58741DA2;
	Mon, 15 May 2023 15:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D58741DA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1DD61BF573
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9312615D9
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9312615D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAp6YY_odGPY for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 15:51:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30627615D7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30627615D7
 for <buildroot@buildroot.org>; Mon, 15 May 2023 15:51:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 05E82C0003;
 Mon, 15 May 2023 15:51:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pyaUK-000G2G-82; Mon, 15 May 2023 17:51:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230515073503.3567935-1-dalang@gmx.at>
Date: Mon, 15 May 2023 17:51:52 +0200
In-Reply-To: <20230515073503.3567935-1-dalang@gmx.at> (Daniel Lang's message
 of "Mon, 15 May 2023 09:35:02 +0200")
Message-ID: <877ct91tk7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sdl2_mixer: fix license hash
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

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > b1b8d5b ("package/sdl2_mixer: bump version to 2.6.3") forgot to update
 > the hash of the license file.
 > In 2021 the file was renamed from COPYING.txt to LICENSE.txt in two
 > commits ([0] and [1]). The copyright year was subsequently updated for
 > 2022 [2] and 2023 [3].
 > License is still Zlib - no changes there.

 > [0]: https://github.com/libsdl-org/SDL_mixer/commit/0f84f242643a913ba81bd6c260c39064c432afd3
 > [1]: https://github.com/libsdl-org/SDL_mixer/commit/371bf1575913828c46212e9220d4a4685ed66bb5
 > [2]: https://github.com/libsdl-org/SDL_mixer/commit/3f5a0502e0394aa967179d53e180f31cf038e032
 > [3]: https://github.com/libsdl-org/SDL_mixer/commit/6fdd4d469b4065ddfb701530d2ea602efaa772b2

 > Fixes:
 >  - http://autobuild.buildroot.net/results/302cbd0adc2c6190d8923b9449e26a3c519d2326

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
