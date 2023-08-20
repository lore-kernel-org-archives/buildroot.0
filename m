Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C235EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01ED40952;
	Sun, 20 Aug 2023 21:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01ED40952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9bWam5_FXgC; Sun, 20 Aug 2023 21:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED80240959;
	Sun, 20 Aug 2023 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED80240959
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F83D1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466FC4032C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466FC4032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Hejc0OuV7w4 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:30:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 888CE40136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888CE40136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 758DD85EAC; Sun, 20 Aug 2023 21:30:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:27:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a5d90a5951623ca0821b51c97dcc6bda8c4c26c
X-Git-Newrev: 0293d131c9c56af24d4f58dfddcd2d8c971f5841
X-Patchwork-Hint: ignore
Message-Id: <20230820213018.758DD85EAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/radxa/rock5b: fix kernel patch
 location
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0293d131c9c56af24d4f58dfddcd2d8c971f5841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2a5d90a59516 (configs/rock5b: Add patches to fix gcc12 warnings)
introduced the kernel patches in an incorrect directory.

Fix that by moving them in the proper location.

Reported-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch       | 0
 .../0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch b/board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
similarity index 100%
rename from board/radxa/rock5b/patches/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
rename to board/radxa/rock5b/patches/linux/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
diff --git a/board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch b/board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
similarity index 100%
rename from board/radxa/rock5b/patches/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
rename to board/radxa/rock5b/patches/linux/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
