Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F05C433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 08:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF81F4020B;
	Sun,  8 May 2022 08:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJ8YmcTRbWG4; Sun,  8 May 2022 08:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF3440123;
	Sun,  8 May 2022 08:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D946C1BF2CA
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD74F40123
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 08:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9ldLCY2hpIc for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 08:24:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2F740003
 for <buildroot@buildroot.org>; Sun,  8 May 2022 08:24:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9463320008;
 Sun,  8 May 2022 08:24:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nncDM-000vy1-Eu; Sun, 08 May 2022 10:24:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220507231046.3590-1-f.fainelli@gmail.com>
Date: Sun, 08 May 2022 10:24:28 +0200
In-Reply-To: <20220507231046.3590-1-f.fainelli@gmail.com> (Florian Fainelli's
 message of "Sat, 7 May 2022 16:10:46 -0700")
Message-ID: <878rrczb2b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Added missing dependency
 on threads
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
Cc: mmayer@broadcom.com, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > cpulimit requires a toolchain supporting threads, see the following
 > build failure reports:

 > http://autobuild.buildroot.net/results/55e1af96f01a0786b4a95665736453db72be9c13
 > http://autobuild.buildroot.net/results/2e50face429553a6431ba5e8cda9527e5c876699

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Fixes: 9e8e80d1e335 ("package: Add cpulimit")
 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
