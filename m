Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557CBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0242561100;
	Sun, 29 May 2022 08:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGyQ6OL1hYgO; Sun, 29 May 2022 08:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301F460E3B;
	Sun, 29 May 2022 08:28:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 141421BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF5D4266B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykEEcvKWHWRL for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:28:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7EDA4266A
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:28:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 027B0E0002;
 Sun, 29 May 2022 08:28:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nvEI0-004zop-Od; Sun, 29 May 2022 10:28:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220515084949.395053-1-fontaine.fabrice@gmail.com>
Date: Sun, 29 May 2022 10:28:44 +0200
In-Reply-To: <20220515084949.395053-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 May 2022 10:49:49 +0200")
Message-ID: <87zgj068ub.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/duktape: can't be built with
 BR2_OPTIMIZE_FAST
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > duktape can't be used with BR2_OPTIMIZE_FAST resulting in the following
 > build failure in polkit:

 > In file included from /nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duktape.h:202,
 >                  from ../src/polkitbackend/polkitbackendduktapeauthority.c:28:
 > /nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duk_config.h:2893:2: error: #error __FAST_MATH__ defined, refusing to compile
 >  2893 | #error __FAST_MATH__ defined, refusing to compile
 >       |  ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/587485bcfd85dfd974608aa00b9bd0c42a3a61d8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
