Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96776C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 16:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 387F0404B0;
	Sat, 15 Jul 2023 16:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 387F0404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnBi9Q3uEUV0; Sat, 15 Jul 2023 16:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 812ED400E5;
	Sat, 15 Jul 2023 16:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812ED400E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C16811BF2F0
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 16:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D0F4091B
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 16:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D0F4091B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lWQ8K54ypJp for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 16:24:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EABE40911
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EABE40911
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 16:24:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B287C1BF204;
 Sat, 15 Jul 2023 16:24:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKi3u-008Zx4-Ko; Sat, 15 Jul 2023 18:24:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
Date: Sat, 15 Jul 2023 18:24:02 +0200
In-Reply-To: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 (Adam Duskett's message of "Fri, 14 Jul 2023 20:02:23 -0700")
Message-ID: <877cr1f8il.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Hello! I have a task to port Flutter to Buildroot and to make the packages
 > suitable for the master branch.

[snip lots of details]

Gaah, sounds like a big mess :/ Oh well, I guess that is life. Good luck
with it ;)

I take it that you have already looked at
https://github.com/sony/flutter-embedded-linux and the meta-flutter
layer? From a quick look it seems to largely do the same (but skip the
reproducible tarball).

I take it that you have already played around with Flutter? How useful
(features, but also size and build time) is it in the context of
Buildroot?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
