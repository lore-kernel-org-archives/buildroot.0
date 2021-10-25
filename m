Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2786FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:48:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5140860EE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5140860EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD2B80DCF;
	Mon, 25 Oct 2021 08:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RU-eBpmWdQhq; Mon, 25 Oct 2021 08:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FAD80DCC;
	Mon, 25 Oct 2021 08:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48DDC1BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 388AC60729
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Lubxt_GtHn4 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:48:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEC126064C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:48:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 74DE91C001A;
 Mon, 25 Oct 2021 08:48:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mevex-0003qk-Lv; Mon, 25 Oct 2021 10:48:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20211017194926.C86A095DA6@busybox.osuosl.org>
Date: Mon, 25 Oct 2021 10:48:47 +0200
In-Reply-To: <20211017194926.C86A095DA6@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 17 Oct 2021 21:46:57 +0200")
Message-ID: <87mtmxxzf4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/testing: test_ubi: reduce the
 rootfs.ubi size to 64M to match the Qemu emulated flash device
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6f9e83f5f74da4c8f9a210fb586542eba08c4080
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The size of the cfi flash device emulated by Qemu is 64M not 128M [1].
 > Since Qemu >= 4.0, the size of the device must match the size of the block backend [2].

 > Fixes:

 >   qemu-system-arm: device requires 67108864 bytes, block backend provides 134217728 bytes

 > [1] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/arm/vexpress.c;h=58481c07629aedb09864dcc72757ff7947e733bb;hb=f9baca549e44791be0dd98de15add3d8452a8af0#l50
 > [2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=06f1521795207359a395996c253c306f4ab7586e

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
