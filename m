Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBB9C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CAD61105;
	Wed,  8 Feb 2023 15:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76CAD61105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3N2KgLRiDdAC; Wed,  8 Feb 2023 15:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4EC3610DA;
	Wed,  8 Feb 2023 15:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4EC3610DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454571BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C482610DA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C482610DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeyohiXadERh for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:04:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A4560FD3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A4560FD3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:04:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B38D524000B;
 Wed,  8 Feb 2023 15:04:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPlzb-00GGct-V4; Wed, 08 Feb 2023 16:04:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
References: <CA+h8R2q7bVZ7vFQGi_p54AcR4S9BPxxO7haRrdCi1BJRNXdhhA@mail.gmail.com>
Date: Wed, 08 Feb 2023 16:04:15 +0100
In-Reply-To: <CA+h8R2q7bVZ7vFQGi_p54AcR4S9BPxxO7haRrdCi1BJRNXdhhA@mail.gmail.com>
 (Christian Stewart via buildroot's message of "Mon, 30 Jan 2023
 15:19:29 -0800")
Message-ID: <87wn4s42s0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Multiple BR2_BACKUP_SITE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart via buildroot <buildroot@buildroot.org> writes:

 > Hi all,
 > Would it be possible to adjust Buildroot so that multiple
 > BR2_BACKUP_SITE can be specified in a list? This way there could be
 > multiple mirrors with some mirrors having some things that others do
 > not.

In concept that shouldn't be hard to do, E.G. basically stick a foreach
loop in the code that calculates DOWNLOAD_URIS in
package/pkg-download.mk.

Care to give that a try and send a patch?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
