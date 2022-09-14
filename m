Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782A6ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 19:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B44360DF0;
	Wed, 14 Sep 2022 19:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B44360DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OrRxzFESQko; Wed, 14 Sep 2022 19:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446F560BA1;
	Wed, 14 Sep 2022 19:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446F560BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 805051BF33C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C4CC60BA1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4CC60BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYx8jttG8XtO for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 19:03:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0D9607FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA0D9607FE
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 19:03:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDCAF1C0004;
 Wed, 14 Sep 2022 19:03:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYXfN-004DNE-NB; Wed, 14 Sep 2022 21:03:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <31813_1659684220_62ECC57C_31813_212_5_89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
Date: Wed, 14 Sep 2022 21:03:21 +0200
In-Reply-To: <31813_1659684220_62ECC57C_31813_212_5_89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 5 Aug 2022 09:23:36 +0200")
Message-ID: <8735ctrd6u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/lshw: allso uses hwdata' PNP IDs
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Commit 29bccabdebff (lshw: use data files provided by hwdata) removed
 > the hardware info DBs installed by lshw, in favour of those provided by
 > hwdata, as the former are way out-dated while the latter are more
 > up-to-date.

 > However, it forgot to also select the PNP ID database, to replace the
 > one lshw would install.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
