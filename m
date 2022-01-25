Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C353C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AA41415A6;
	Tue, 25 Jan 2022 18:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQfoPNBOClFU; Tue, 25 Jan 2022 18:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A21415A8;
	Tue, 25 Jan 2022 18:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 806B71BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F88A60AB5
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqJHgSiXVplh for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:06:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 236D560DFA
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:06:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72C47C0003;
 Tue, 25 Jan 2022 18:06:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCQDP-0007z1-G0; Tue, 25 Jan 2022 19:06:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211227215833.1136054-1-thomas.petazzoni@bootlin.com>
 <20211228204448.GB3390456@scaer>
Date: Tue, 25 Jan 2022 19:06:47 +0100
In-Reply-To: <20211228204448.GB3390456@scaer> (Yann E. MORIN's message of
 "Tue, 28 Dec 2021 21:44:48 +0100")
Message-ID: <87a6fjlmfc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcc/Config.in.host: fix
 BR2_GCC_VERSION_ARC select of BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2021-12-27 22:58 +0100, Thomas Petazzoni spake thusly:
 >> When the gcc arc version was bumped to a version using gcc
 >> 10.x (arc-2020.09-release) in commit
 >> 0791abfba0227803b19895ea22326f4e17ac93dc, the select of
 >> BR2_GCC_VERSION_ARC on the appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
 >> was not updated. This commit fixes this issue.

 > I've slightly rephrased the commit log to also add a reference to
 > 0b4c7ba01cfe (toolchain: update option descriptions for ARC tools
 > arc-2020.09-release) which also missed updating the select.

 > Nice catch, applied to master, thanks.

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
