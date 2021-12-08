Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F5EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACB783F57;
	Wed,  8 Dec 2021 08:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12O7kjUC74-8; Wed,  8 Dec 2021 08:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F335780EF5;
	Wed,  8 Dec 2021 08:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0AFB1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A070341CB2
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCJmAyOcI0QQ for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:45:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7504841CB0
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:45:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 99C0560012;
 Wed,  8 Dec 2021 08:45:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1musa5-0006O9-Mj; Wed, 08 Dec 2021 09:45:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
References: <20211118093813.474-1-luca@lucaceresoli.net>
Date: Wed, 08 Dec 2021 09:45:41 +0100
In-Reply-To: <20211118093813.474-1-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Thu, 18 Nov 2021 10:38:13 +0100")
Message-ID: <87k0gf5vt6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_zcu106_defconfig: fix
 arm-trusted-firmware build failure
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

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > This defconfig uses arm-trusted-firmware version 1.5 which fails since
 > commit eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f ("package/gcc: switch to
 > gcc 10.x as the default").

 > Backport a patch from v2.2 to fix the build.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296
 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
