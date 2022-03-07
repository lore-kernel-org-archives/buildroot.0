Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3952C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5BF41706;
	Mon,  7 Mar 2022 21:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2S223aG4C0YF; Mon,  7 Mar 2022 21:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCC741635;
	Mon,  7 Mar 2022 21:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1DC1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381064016A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1FydkbqHeP8 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29FE54012E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:07:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB28060006;
 Mon,  7 Mar 2022 21:07:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKZv-001HUU-Kd; Mon, 07 Mar 2022 22:07:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
 <1449_1644506975_62052F5F_1449_399_1_68889e1f1d960c99ade7457d58a115bf955a7b64.1644506959.git.yann.morin@orange.com>
Date: Mon, 07 Mar 2022 22:07:39 +0100
In-Reply-To: <1449_1644506975_62052F5F_1449_399_1_68889e1f1d960c99ade7457d58a115bf955a7b64.1644506959.git.yann.morin@orange.com>
 (yann morin's message of "Thu, 10 Feb 2022 16:29:27 +0100")
Message-ID: <87ilsp4gkk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5 v3] package/pkg-golang: allow packages
 to define download environment
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Currently, the golang infrastructure forcibly sets the package _DL_ENV
 > variable, instead of appending to it, which prevents packages from
 > providing their own download environment variables.

 > We fix that by using an append-assignment.

 > Note: when introduced, that variable was explicitly not documented, and
 > is supposed to only be used by packages infrastructures. However, that
 > variable exists, and it can be (ab)used by br2-external packages (most
 > probably to ill effects, but heh!). We anyway leave it undocumented,
 > like _ROOTFS_PRE_CMD_HOOKS.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Christian Stewart <christian@paral.in>
 > Cc: Anisse Astier <anisse@astier.eu>
 > Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
