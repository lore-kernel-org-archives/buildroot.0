Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C95DC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F9C4057B;
	Sun, 10 Sep 2023 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F9C4057B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwDbNZWhxlse; Sun, 10 Sep 2023 21:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313F3404FE;
	Sun, 10 Sep 2023 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313F3404FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD111BF836
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52DEC60B89
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DEC60B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwDteoYqkKsX for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:30:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E624560B50
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E624560B50
Received: by mail.gandi.net (Postfix) with ESMTPSA id 757AB1BF203;
 Sun, 10 Sep 2023 21:30:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfS0G-00CtQt-J1; Sun, 10 Sep 2023 23:30:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230804183321.1766262-1-bernd@kuhls.net>
 <20230804183321.1766262-3-bernd@kuhls.net>
Date: Sun, 10 Sep 2023 23:30:00 +0200
In-Reply-To: <20230804183321.1766262-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 4 Aug 2023 20:33:21 +0200")
Message-ID: <871qf5g1if.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3] package/stellarium: disable ShowMySky
 atmosphere model
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
 > stellarium which included these commits
 > https://github.com/Stellarium/stellarium/commit/b3f02beaec2a285251db1e1707abe2e423803834
 > https://github.com/Stellarium/stellarium/commit/5d5edd0e5f5630872628a1525685b77854b6e4b4

 > It downloads external packages during the build:

 > $ find output/build/stellarium-23.2/ -iname *.tar.*
 > output/build/stellarium-23.2/_deps/eigen3-subbuild/eigen3-populate-prefix/src/eigen-3.4.0.tar.bz2
 > output/build/stellarium-23.2/_deps/showmysky-qt5-subbuild/showmysky-qt5-populate-prefix/src/v0.3.1.tar.gz

 > which breaks offline builds.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
