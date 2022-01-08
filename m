Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B2E60B0A;
	Sat,  8 Jan 2022 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBidxpMqNek6; Sat,  8 Jan 2022 09:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82B4860A9F;
	Sat,  8 Jan 2022 09:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9512A1BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 830408144B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOc_7HZ_vN0d for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:59:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A53128141F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:59:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8717EC0006;
 Sat,  8 Jan 2022 09:59:41 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n68Vg-0005oP-VF; Sat, 08 Jan 2022 10:59:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20220107214600.54727-1-romain.naour@smile.fr>
Date: Sat, 08 Jan 2022 10:59:40 +0100
In-Reply-To: <20220107214600.54727-1-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 7 Jan 2022 22:46:00 +0100")
Message-ID: <87czl2im43.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to version 250.1
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Remove upstream patch
 > Fixes a build issue with toolchains using kernel headers < 5.6,
 > when the openat2(2) syscall is not available [2].

 > Add a new patch to fix homework-mount with linux-headers < 5.2.

 > [1] https://github.com/systemd/systemd-stable/commit/cd88d010e862d26ce816eb3bd6735a80999ac41e
 > [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fddb5d430ad9fa91b49b1d34d0202ffe2fa0e179

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Norbert Lange <nolange79@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
