Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2655C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629B660B6E;
	Thu, 28 Apr 2022 21:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjdKQkwh8Oyj; Thu, 28 Apr 2022 21:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B5360AE6;
	Thu, 28 Apr 2022 21:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32EAB1C115D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E5C84051A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGIa5gShs5n7 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61D5140004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:47:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3C12084719; Thu, 28 Apr 2022 21:36:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:45:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44b9361a2ee0741e1307831e3a66c7a03cafec17
X-Git-Newrev: 6030cea9e99d93b361e9ee42ce57859792d575cb
X-Patchwork-Hint: ignore
Message-Id: <20220428213639.3C12084719@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: drop version 2.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=6030cea9e99d93b361e9ee42ce57859792d575cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that recent versions of binutils work with FLAT binaries, we can
drop the old 2.32 version, which was kept only to keep support FLAT
binaries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |   6 +
 package/binutils/2.32/0001-sh-conf.patch           |  48 --
 .../2.32/0002-poison-system-directories.patch      | 306 -------------
 ...fix-shrink_dynamic_reloc_sections-for-exp.patch |  41 --
 ...terals-const16-for-xtensa-loop-relaxation.patch | 294 ------------
 ...as-put-.literal_position-at-section-start.patch |  96 ----
 ...correct-value-in-PLT-GOT-entries-causing-.patch |  46 --
 .../2.32/0007-bfd-xtensa-fix-PR-ld-25630.patch     |  37 --
 .../2.32/0008-xtensa-fix-PR-ld-25861.patch         | 432 ------------------
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128 ------
 ...sue-with-plt-link-failure-for-local-calls.patch |  59 ---
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 -----------
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 ---
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 ---------------------
 ...lf32-or1k-fix-building-with-gcc-version-5.patch |  50 ---
 ...-relative-relocation-against-dynamic-on-P.patch |  59 ---
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch |  75 ----
 package/binutils/Config.in.host                    |   5 -
 package/binutils/binutils.hash                     |   1 -
 19 files changed, 6 insertions(+), 2494 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
