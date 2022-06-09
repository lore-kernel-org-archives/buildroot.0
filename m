Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5AAC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597A541011;
	Thu,  9 Jun 2022 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xz6cCMSabpe; Thu,  9 Jun 2022 20:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA2E40C44;
	Thu,  9 Jun 2022 20:46:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A28251BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F40B60672
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXo8N-FMw_2o for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A82E36060A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D45F1E0008;
 Thu,  9 Jun 2022 20:44:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzP1K-002N40-29; Thu, 09 Jun 2022 22:44:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220606130446.3F10486D90@busybox.osuosl.org>
Date: Thu, 09 Jun 2022 22:44:46 +0200
In-Reply-To: <20220606130446.3F10486D90@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 6 Jun 2022 15:15:00 +0200")
Message-ID: <87fskdzhvl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] arch/Config.in.powerpc: disable some
 variants on ppc64le
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=c0b02883148025ea3e62535f237b246818155a99
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Following commit
 > e59b3acc3603e55fbaec25406258ec9ca9623564 ("toolchain/glibc: Restrict
 > ppc64le support to power8"), when selecting ppc64le as the
 > architecture, it is possible to end up with a selection for which no C
 > library is provided.

 > Indeed:

 >  - glibc only supports Power8
 >  - uclibc has no support for ppc64le at all
 >  - musl only supports ppc64le processors that have Altivec support

 > Therefore, this commit adds "depends on !BR2_powerpc64le" to those
 > PowerPC architecture variants for which no C library support exists.

 > Fixes:

 >   http://autobuild.buildroot.net/results/3f6fb1c2d5648e78f7856bdea3171b5a89dfa2f9/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
