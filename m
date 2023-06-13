Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB23EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A4B4015B;
	Tue, 13 Jun 2023 21:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A4B4015B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfMYeagzMbcP; Tue, 13 Jun 2023 21:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02590401FA;
	Tue, 13 Jun 2023 21:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02590401FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72FCC1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 578F060F71
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578F060F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-o4QxIBpFhF for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:33:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DE76061B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7DE76061B
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:33:10 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25901C0002;
 Tue, 13 Jun 2023 21:33:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9BdU-004sMq-CV; Tue, 13 Jun 2023 23:33:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230515073503.3567935-1-dalang@gmx.at>
Date: Tue, 13 Jun 2023 23:33:08 +0200
In-Reply-To: <20230515073503.3567935-1-dalang@gmx.at> (Daniel Lang's message
 of "Mon, 15 May 2023 09:35:02 +0200")
Message-ID: <87r0qfujxn.fsf@48ers.dk>
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

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
