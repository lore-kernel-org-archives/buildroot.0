Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57CC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B438D60E2D;
	Tue, 13 Sep 2022 14:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B438D60E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTpPMVzNSHgy; Tue, 13 Sep 2022 14:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F0060B73;
	Tue, 13 Sep 2022 14:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F0060B73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5001BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7417C40866
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7417C40866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7k6UWbpHUBYW for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:19:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 533CC40650
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 533CC40650
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:19:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6A54FD367D
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:15:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19AB540007;
 Tue, 13 Sep 2022 14:15:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oY6h3-003OCH-4Q; Tue, 13 Sep 2022 16:15:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
 <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
Date: Tue, 13 Sep 2022 16:15:17 +0200
In-Reply-To: <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 29 Jul 2022 18:24:30 +0200")
Message-ID: <87v8prtl6y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug
 99410
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Gcc bug 99410 reappeared while building with gcc 11.x and while testing it
 > also shows up with gcc 12.x, so let's enable this bug for all gcc versions
 > except gcc 8.x.

 > Fixes:
 > autobuild.buildroot.net/results/64e/64e54ef5ba3a3dee391b788315615d57a1dd9fa2/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
