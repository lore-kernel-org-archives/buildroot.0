Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C629DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 07:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78ECF842E0;
	Tue, 22 Mar 2022 07:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WR0DXmTrI67w; Tue, 22 Mar 2022 07:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5DA842D8;
	Tue, 22 Mar 2022 07:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 022791BF314
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D46D541638
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y81Ny-k9UyQ8 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 07:54:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7156C41625
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 07:54:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4762660009;
 Tue, 22 Mar 2022 07:54:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWZLN-008ehc-7o; Tue, 22 Mar 2022 08:54:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220320151649.767880-1-thomas.petazzoni@bootlin.com>
Date: Tue, 22 Mar 2022 08:54:17 +0100
In-Reply-To: <20220320151649.767880-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 20 Mar 2022 16:16:49
 +0100")
Message-ID: <874k3qh17a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2021.02.x] DEVELOPERS: drop libqrtr-glib
 from Yegor Yefremov
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Commit 73ce754531b5e45bd42b56c58718fbacc754406f in master added  the
 > libqrtr-glib package to Yegor Yefremov.

 > This commit was backported as fad154253deb5b5399ea52a19ed6608dcd00ee4d
 > in the LTS 2021.02.x branch, but this branch does not have the
 > libqrtr-glib package, as it was added after 2021.02.

 > Due to this, the DEVELOPERS file is bogus in 2021.02.x, which causes
 > the following warning when running pkg-stats:

 > WARNING: 'package/libqrtr-glib/' doesn't match any file

 > This commit fixes this by dropping the bogus line from the DEVELOPERS
 > file.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ups, committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
