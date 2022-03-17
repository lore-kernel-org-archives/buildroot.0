Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB49C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 19:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C45981420;
	Thu, 17 Mar 2022 19:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hu45sQj8EQgl; Thu, 17 Mar 2022 19:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C7C813DB;
	Thu, 17 Mar 2022 19:28:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCD61BF343
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D32E40448
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWAqGBaJmaAi for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 19:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9DCC40194
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 19:28:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F040F60005;
 Thu, 17 Mar 2022 19:28:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUvnc-00DMPt-RW; Thu, 17 Mar 2022 20:28:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220315205405.9291-1-ps.report@gmx.net>
 <20220316213626.GZ283544@scaer> <87cziltvrq.fsf@dell.be.48ers.dk>
 <20220317191510.1b3b85d5@gmx.net>
Date: Thu, 17 Mar 2022 20:28:40 +0100
In-Reply-To: <20220317191510.1b3b85d5@gmx.net> (Peter Seiderer's message of
 "Thu, 17 Mar 2022 19:15:10 +0100")
Message-ID: <87a6dos7iv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: bump version to
 1.1.1n
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

>> Indeed. Why it is not marked as such ("security bump to version
 >> 1.1.1n")?
 >> 

 > Sorry, missed it ;-), did only look at the last version bump ([1]):

 > 	package/libopenssl: bump version to 1.1.1m

 > not marked as security bump, but according to [2] is one fixing
 > CVE-2021-4160...

Yes, but that was not known when 1.1.1m was released, E.G. the release
is from December (and so is the bump in Buildroot) but the advisory was
only made on January 28th:

https://www.openssl.org/news/secadv/20220128.txt

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
