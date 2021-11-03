Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3C2C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:02:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8308161186
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8308161186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51EA240393;
	Wed,  3 Nov 2021 21:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slLOAnC73dn0; Wed,  3 Nov 2021 21:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C9140389;
	Wed,  3 Nov 2021 21:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F93C1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ADC760AD8
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-CCPPp2JaEv for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:01:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBD6460730
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:01:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2CDEC240005;
 Wed,  3 Nov 2021 21:01:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1miNON-0005Ns-Kx; Wed, 03 Nov 2021 22:01:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211031172615.AA4C4890C5@busybox.osuosl.org>
Date: Wed, 03 Nov 2021 22:01:55 +0100
In-Reply-To: <20211031172615.AA4C4890C5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 31 Oct 2021 18:29:45 +0100")
Message-ID: <871r3xlzr0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] configs/sheevaplug_defconfig: bump
 linux kernel to 4.14.253
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=297f2220a19e0ab75d7b8ce8e7b8eb4f91545a4d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730198

 > To correct a build breakage after the move to a gcc 10.x based host
 > compiler, as the updated kernel contains a fix for:

 > HOSTLD  scripts/dtc/dtc
 > /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple
 > definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first
 > defined here

 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
