Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23808C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52A782EE1;
	Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBAlRPV7C205; Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21BA0827F3;
	Wed, 26 Jan 2022 14:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBFA1BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0E840994
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ww_9M8FEaV2v for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:40:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B426D40604
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:40:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69549C0014;
 Wed, 26 Jan 2022 14:40:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCjTB-00062D-Ad; Wed, 26 Jan 2022 15:40:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
Date: Wed, 26 Jan 2022 15:40:21 +0100
In-Reply-To: <20211231100725.3662078-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 31 Dec 2021 11:07:25 +0100")
Message-ID: <87r18uh86i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 14.18.2
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure raised since bump of
 > python3 to version 3.10.1 in commit
 > 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

 > Please use python3.9 or python3.8 or python3.7 or python3.6 or python3.5 or python2.7.
 > 	/usr/bin/python3.7 ./configure
 > 	/usr/bin/python3.5 ./configure
 > 	/home/peko/autobuild/instance-1/output-1/host/bin/python2.7 ./configure
 > Node.js configure: Found Python 3.10.1...

 > https://github.com/nodejs/node/releases/tag/v14.18.2

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9e2ebb9c3681ec0485eaa042fa838c8ee62f649b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
