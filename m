Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5307340C76;
	Wed, 30 Mar 2022 07:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bK_fCZTIthHE; Wed, 30 Mar 2022 07:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6483B40B3E;
	Wed, 30 Mar 2022 07:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 073991BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDC5D41A54
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wELDQndVl9cp for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:12:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25EC341BA5
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:12:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47AE220007;
 Wed, 30 Mar 2022 07:12:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZSVI-00GSAI-Vc; Wed, 30 Mar 2022 09:12:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20220317163823.2913753-1-foss+buildroot@0leil.net>
 <20220317163823.2913753-2-foss+buildroot@0leil.net>
Date: Wed, 30 Mar 2022 09:12:28 +0200
In-Reply-To: <20220317163823.2913753-2-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Thu, 17 Mar 2022 17:38:22 +0100")
Message-ID: <87ilrv9an7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/qt5/qt5base: remove leftover
 patch
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > CVE-2021-38593 fixes originally missed a usecase that was covered by the
 > to-be-removed patch. However, this patch was incorrect and added some
 > issues on its own, which was then fixed by now-removed
 > 0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch.

 > Unfortunately for us, the to-be-removed patch (fixed by
 > 0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch) can actually
 > be applied (with fuzz; by `patch` only) on top of the now-removed patch.
 > When the move to KDE Qt fork was made, some patches were removed as they
 > were already part of the new git fork. However, the to-be-removed patch
 > was not. This means the
 > 0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch was actually
 > undone when Buildroot patched qt5base.

 > Let's remove this patch to fix this oversight.

 > As a reference:
 > e7ea2ed27c Improve fix for avoiding huge number of tiny dashes
 > fixed by
 > 65b3aa6a1c Refix for avoiding huge number of tiny dashes
 > in the git repo.

 > Fixes: 5770a645a3a49 "package/qt5: bump packages to latest kde submodule versions"
 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
