Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5E3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0AB4089F;
	Thu, 30 Dec 2021 17:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0m7HTc55Flm; Thu, 30 Dec 2021 17:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC8A40977;
	Thu, 30 Dec 2021 17:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 416DD1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3010F60B8A
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqNJ-9NoB20R for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B51C607C0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:51:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4226882B97; Thu, 30 Dec 2021 17:45:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:43:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbfcb19c556d618fd024458cda28fb1d3096f199
X-Git-Newrev: b3c66481e1f1503fcbf193d0c780271e880ad500
X-Patchwork-Hint: ignore
Message-Id: <20211230174512.4226882B97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: re-generate Bootlin toolchain
 descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3c66481e1f1503fcbf193d0c780271e880ad500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the releases of 2021.11 Bootlin toolchains, this commit
represents the result of re-running the gen-bootlin-toolchains script.

The only part that isn't auto-generated are the contents of
Config.in.legacy, which account for the replacement of the RISC-V LP64
toolchain by RISC-V LP64D toolchains.

The complete set of runtime test cases was verified on Gitlab CI:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/437767674

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  14 +
 .../tests/toolchain/test_external_bootlin.py       |  80 +-
 .../toolchain-external-bootlin/Config.in.options   | 856 +++++++++++----------
 .../toolchain-external-bootlin.hash                | 684 ++++++++--------
 .../toolchain-external-bootlin.mk                  | 374 ++++-----
 5 files changed, 1084 insertions(+), 924 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
