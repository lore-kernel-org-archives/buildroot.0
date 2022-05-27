Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C24C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1FEA42971;
	Fri, 27 May 2022 19:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clQrxHrMndeV; Fri, 27 May 2022 19:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA85A4281F;
	Fri, 27 May 2022 19:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D16D1BF255
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C9BE844D8
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCueJgytCZSi for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B8FD844D4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:02:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7A4CE0009;
 Fri, 27 May 2022 19:02:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nufEC-002FzB-1O; Fri, 27 May 2022 21:02:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220428215252.3084384736@busybox.osuosl.org>
Date: Fri, 27 May 2022 21:02:28 +0200
In-Reply-To: <20220428215252.3084384736@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 29 Apr 2022 00:03:01 +0200")
Message-ID: <8735guiyt7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] Revert "toolchain/toolchain-external:
 error if BR2_TOOLCHAIN_EXTERNAL_PATH is not set"
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=77fc4580254997c1f9f83efabd061e81de0b022e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This reverts commit 8e91385a2cb81c5f8114354f4494230e2aebb93a.

 > This commit is incorrect, as it is perfectly valid for
 > BR2_TOOLCHAIN_EXTERNAL_PATH to be empty. The help text of
 > BR2_TOOLCHAIN_EXTERNAL_PATH even documents it as a supported case:

 >           If empty, the compiler will be searched in $PATH.

 > Commit 392b0a26f5fd8d3aedce7e0c15f9762a79312f01 ("toolchain-external:
 > default BR2_TOOLCHAIN_EXTERNAL_PATH to empty") even made that the
 > default saying "In addition, it in fact works correctly when it is
 > empty. In that case, the toolchain will be searched in PATH."

 > A user has reported that commit
 > 8945ba49480a7885d104445ca855ef7681a374ff (the backport of 8e91385a2c to
 > the 2022.02.x LTS branch) breaks his use-case:

 >   https://lore.kernel.org/buildroot/CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com/

 > Reported-by: Kristof Havasi <havasiefr@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998@free.fr: reference 8e91385a2c on master]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
