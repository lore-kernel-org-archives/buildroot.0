Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C24C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24CD41C63;
	Thu, 27 Jan 2022 07:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KtkKbVBtGfw; Thu, 27 Jan 2022 07:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBA541C50;
	Thu, 27 Jan 2022 07:54:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC021BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 679B681471
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYNC_P1XZLp7 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:54:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C03184D82
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:54:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94AA42000A;
 Thu, 27 Jan 2022 07:54:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCzbT-00079G-SR; Thu, 27 Jan 2022 08:53:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220108164622.A463581DFE@busybox.osuosl.org>
Date: Thu, 27 Jan 2022 08:53:59 +0100
In-Reply-To: <20220108164622.A463581DFE@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 8 Jan 2022 17:51:24 +0100")
Message-ID: <87mtjhd36w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/rustc: fix the riscv64gc
 architecture handling
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=79c5639597e961a36ee10e55b0479e642013448f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > riscv64gc was made available for BR2_riscv, but RISC-V can be 32-bit
 > or 64-bit, so we need to restrict it to BR2_RISCV_64. There's no need
 > to keep the BR2_riscv dependency, as BR2_RISCV_64 can only be true
 > when BR2_riscv is true.

 > Also, BR2_PACKAGE_HOST_RUSTC_ARCH needs to be set to riscv64gc to
 > allow rust-bin to download its pre-compiled standard library
 > correctly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
