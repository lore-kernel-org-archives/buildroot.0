Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C035BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A57460B71;
	Sat, 22 Jan 2022 18:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbelWiEfPjeT; Sat, 22 Jan 2022 17:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0DE260AF0;
	Sat, 22 Jan 2022 17:59:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFC021BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBD66408A1
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqbSvKxcq8NP for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:59:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B68C840897
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:59:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 30AF6FF805;
 Sat, 22 Jan 2022 17:59:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBKg4-0003JH-F2; Sat, 22 Jan 2022 18:59:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20211217215308.46712811FB@busybox.osuosl.org>
Date: Sat, 22 Jan 2022 18:59:52 +0100
In-Reply-To: <20211217215308.46712811FB@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Fri, 17 Dec 2021 22:58:11 +0100")
Message-ID: <87lez7y7l3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] configs/stm32f469_xip_disco: fix
 kernel bootup
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=82c1a437929acaeeb7f0cc198d5e5fa4b7862d5b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The current configuration fails to boot on the stm32f469-disco board.
 > Make it bootable again by reverting the DRAM patches.

 > Also change the kernel load address from 0x8010000 to 0x800C000 to
 > allocate more space to the kernel, since 32kB for the device tree is
 > enough.

 > Also clean up the rootfs a bit with the common stm32-post-build.sh
 > script.

 > Signed-off-by: Dario Binacchi <dariobin@libero.it>
 > Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
