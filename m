Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F3CC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADB682105;
	Sun,  7 May 2023 10:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADB682105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6h7dbW1Sj5b; Sun,  7 May 2023 10:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC5F820F1;
	Sun,  7 May 2023 10:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC5F820F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 717831BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A8B682105
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8B682105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rnt3ePkHf1Bk for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7132B82077
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7132B82077
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 536BD85EE7; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 11:22:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55ceaef8f65eeb0fd9ca7314b03668cf9dd325ca
X-Git-Newrev: 129c83bdd40376eecbcb45653a36d2ce6920892d
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.536BD85EE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: bump version to
 1.6.0-639-6-Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=129c83bdd40376eecbcb45653a36d2ce6920892d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to kodi fork, remove all kodi-related patches.

Needed by upcoming bump of kodi-inputstream-adaptive.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  16 -
 .../0001-Add-support-for-cmake-install.patch       | 130 -----
 ...ional-methods-funtions-and-passing-poolid.patch | 634 ---------------------
 .../0003-Backport-Smmothstream-changes.patch       |  99 ----
 package/bento4/0004-more-SPS-parameters.patch      | 219 -------
 .../0005-AVC-extract-VUI-values-from-SPS.patch     |  96 ----
 .../bento4/0006-Implement-SPS-Frame-parser.patch   |  67 ---
 .../0007-Fix-segfault-when-AP4_Sample-s-seek.patch |  25 -
 package/bento4/0008-Hack-HBO.patch                 | 214 -------
 package/bento4/0009-Android-32-ftello-fix.patch    |  31 -
 .../0010-Dazn-sample-duration-workaround.patch     |  30 -
 ...argument-to-reuse-single-sample-decrypter.patch | 179 ------
 .../0012-Static-ReadGolomb-SignedGolomb.patch      |  54 --
 package/bento4/0013-Add-GetChannels-method.patch   |  40 --
 ...-GetSampleIndexForTimeStamp-GetNearestSyn.patch |  59 --
 .../0015-Avoid-set-next-fragment-position.patch    |  43 --
 ...-segfault-in-AP4_LinearReader-ProcessMoof.patch |  27 -
 package/bento4/bento4.hash                         |   2 +-
 package/bento4/bento4.mk                           |   4 +-
 19 files changed, 3 insertions(+), 1966 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
