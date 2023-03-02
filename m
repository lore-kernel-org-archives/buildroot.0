Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D234AC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 22:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46A2D40359;
	Thu,  2 Mar 2023 22:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46A2D40359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xegDFD-KB_pl; Thu,  2 Mar 2023 22:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F98E4016C;
	Thu,  2 Mar 2023 22:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F98E4016C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEE791BF48D
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B884016C
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B884016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuwzWWwrHxlU for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 22:18:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF50400B9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BF50400B9
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 22:18:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88510FF805;
 Thu,  2 Mar 2023 22:18:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pXrG6-00CnHN-ED; Thu, 02 Mar 2023 23:18:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20230301005456.250709-1-christian@paral.in>
Date: Thu, 02 Mar 2023 23:18:42 +0100
In-Reply-To: <20230301005456.250709-1-christian@paral.in> (Christian Stewart's
 message of "Tue, 28 Feb 2023 16:54:56 -0800")
Message-ID: <875ybig5kt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/qemu: check if qemu-system
 is enabled when creating symlink
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Commit c6b9cd9a11fe7fec6bfec2ddbd42c2851dba0011 added a symlink to qemu-system
 > as a post install hook. However, it does not check if qemu-system is actually
 > enabled with BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE.

 > Add the check to make sure we only create the symlink if that is enabled.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
