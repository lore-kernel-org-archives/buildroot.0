Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58272C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F4A821F6;
	Mon,  5 Jun 2023 20:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02F4A821F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9MWC9fUg2P3; Mon,  5 Jun 2023 20:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E5D6821B7;
	Mon,  5 Jun 2023 20:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5D6821B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 778621BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E23660FE6
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E23660FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5Mj8oNZ5SU1 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:12:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D1660F83
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1D1660F83
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:12:15 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E66E31BF205;
 Mon,  5 Jun 2023 20:12:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6GYl-00DohP-VK; Mon, 05 Jun 2023 22:12:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230502211158.2832484-1-romain.naour@gmail.com>
Date: Mon, 05 Jun 2023 22:12:11 +0200
In-Reply-To: <20230502211158.2832484-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 2 May 2023 23:11:58 +0200")
Message-ID: <87ilc16544.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gdb: disable gdb for or1k builds
 with musl libc
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The or1k musl port is incomplete, elf_gregset_t definition is missing
 > (user.h is empty) [1]. It fail to build gdbserver and the full gdb.

 > [1] https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3

 > Fixes:
 > https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276569

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Stafford Horne <shorne@gmail.com>
 > ---
 > host-gdb build fine but it's useless without a gdbserver on the target.
 > Keep it enabled for now to avoid dependency handling for or1k with musl...

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
