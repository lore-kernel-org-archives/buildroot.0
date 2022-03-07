Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE224170D;
	Mon,  7 Mar 2022 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRYLpSuCeXbq; Mon,  7 Mar 2022 21:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24682415F4;
	Mon,  7 Mar 2022 21:06:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 524C41BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403C14012E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZIC_RUbHJRV for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:06:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35B0E4016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:06:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 976F1200002;
 Mon,  7 Mar 2022 21:06:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKYy-001HRe-OV; Mon, 07 Mar 2022 22:06:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
 <11477_1644506971_62052F5B_11477_140_26_81fca21f2b24da16bb9e6d3af5add173f382f242.1644506959.git.yann.morin@orange.com>
Date: Mon, 07 Mar 2022 22:06:40 +0100
In-Reply-To: <11477_1644506971_62052F5B_11477_140_26_81fca21f2b24da16bb9e6d3af5add173f382f242.1644506959.git.yann.morin@orange.com>
 (yann morin's message of "Thu, 10 Feb 2022 16:29:25 +0100")
Message-ID: <87r17d4gm7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5 v3] package/pkg-cargo: allow building in
 a sub-directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Some packages have their rust sources as a sub-directory, rather
 > than at the root of the source tree.

 > Do like we do for autotools-package, and use the package's _SRCDIR
 > rather than the top-level directory $(@D).

 > Additionally, in such a situation, it is more than probable that
 > the Cargo.toml is also present in that sub-directory, so use that
 > when vendoring the package.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Changes v2 -> v3:
 >   - always consider Cargo.toml to be in _SUBDIR  (Thomas)
 >   - add _SUBDIR to the manual  (Thomas)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
