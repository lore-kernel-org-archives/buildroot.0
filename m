Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04232C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F10D4086A;
	Wed, 13 Apr 2022 07:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MwReJFC7_pv; Wed, 13 Apr 2022 07:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D31405AE;
	Wed, 13 Apr 2022 07:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2041BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C84260BDA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kM4-ZFuYRWFG for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:50:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45D3F60B9B
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:50:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9526A200013;
 Wed, 13 Apr 2022 07:50:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1neXm4-009ZVt-P4; Wed, 13 Apr 2022 09:50:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
References: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Date: Wed, 13 Apr 2022 09:50:48 +0200
In-Reply-To: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 (Tim Hammer's message of "Wed, 6 Apr 2022 14:52:25 +0000")
Message-ID: <878rs9e813.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: build internal bind tool
 gen for host (not target)
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Tim" == Tim Hammer <Tim.Hammer@orolia.com> writes:

 > Building gen tool of the internal (bundled) bind needs to be for host, not target
 > Switch to use internal build in commit 0c8dd6ebd656e06cf99a63eb93343715f4853503
 > overlooked this.

 > Building dns library in /home/autobuild/autobuild/instance-13/output-1/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns
 > /bin/sh: line 1: ./gen: cannot execute binary file: Exec format error

 > Fixes:
 >  - http://autobuild.buildroot.org/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7/

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
