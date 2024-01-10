Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B851C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B036A43677;
	Wed, 10 Jan 2024 19:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B036A43677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNUJldTM9mWl; Wed, 10 Jan 2024 19:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB94643731;
	Wed, 10 Jan 2024 19:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB94643731
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78AFB1BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5236683684
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5236683684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPpcb-863tcB for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:39:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 442748301D
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442748301D
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0967C0004;
 Wed, 10 Jan 2024 19:39:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNeQN-008kPF-0M;
 Wed, 10 Jan 2024 20:39:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230902133347.3261113-1-thomas.petazzoni@bootlin.com>
 <ZY3eC5BDc92fXTsj@landeda>
Date: Wed, 10 Jan 2024 20:39:39 +0100
In-Reply-To: <ZY3eC5BDc92fXTsj@landeda> (Yann E. MORIN's message of "Thu, 28
 Dec 2023 21:43:55 +0100")
Message-ID: <87a5pdasg4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/pkg-qmake.mk: drop host-perl
 dependency
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2023-09-02 15:33 +0200, Thomas Petazzoni via buildroot spake thusly:
 >> Since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e ("package/qt5:
 >> bump packages to latest kde submodule versions"), the
 >> QT_HEADERS_SYNC_HOOK hook no longer calls the syncqt.pl script, so
 >> host-perl is no longer needed as a dependency of running this
 >> hook (and as a dependency of building Qt).
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
