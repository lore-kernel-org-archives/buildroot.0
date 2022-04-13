Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95664C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C95C60FBC;
	Wed, 13 Apr 2022 08:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgP0JKfoOGXC; Wed, 13 Apr 2022 08:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F34D60BCD;
	Wed, 13 Apr 2022 08:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEED1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54A1981769
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugI3i02KfFk1 for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A25881753
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:03:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C8761BF205;
 Wed, 13 Apr 2022 08:03:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1neXyj-009al7-CI; Wed, 13 Apr 2022 10:03:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220412181607.1451580-1-fontaine.fabrice@gmail.com>
Date: Wed, 13 Apr 2022 10:03:53 +0200
In-Reply-To: <20220412181607.1451580-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 12 Apr 2022 20:16:07 +0200")
Message-ID: <87o815csuu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: security bump to version
 4.4.3
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Security vulnerabilies will be fixed by bumping internal bind from
 >   9.11.14 to 9.11.36
 > - Drop patch (already in version)
 > - This bump will also fix the following build failure on platforms
 >   without stdatomic lock free thanks to
 >   https://gitlab.isc.org/isc-projects/bind9/-/commit/261c84d91d1b4581df9f7f0ec031908299de7726

 >   stats.c: In function 'setcounter':
 >   stats.c:300:29: error: 'val' undeclared (first use in this function); did you mean 'value'?
 >     300 |  stats->counters[counter] = val;
 >         |                             ^~~
 >         |                             value
 > - Update hash of license file (ISC address updated and preamble removed:
 >   https://gitlab.isc.org/isc-projects/dhcp/-/commit/429a56d73c0f9f2edf400fd6313850a3ce4fd809
 >   https://gitlab.isc.org/isc-projects/dhcp/-/commit/ee868403d0df934442a438aa6b5832bacabb7b23)

 > https://gitlab.isc.org/isc-projects/dhcp/-/blob/v4_4_3/RELNOTES

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e4d027b5bcda852d0b5a54035de5ed37499a4ef0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
