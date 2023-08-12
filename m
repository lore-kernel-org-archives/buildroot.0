Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A81CC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167B841529;
	Sat, 12 Aug 2023 20:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167B841529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbHLccHEVbNT; Sat, 12 Aug 2023 20:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118E54154A;
	Sat, 12 Aug 2023 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118E54154A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 728501BF578
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BCBF60DDF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BCBF60DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVYaVRIiRr_D for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F79260608
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F79260608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BFE485B02; Sat, 12 Aug 2023 20:55:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 22:53:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a713568321c1802eba641c6373c0ad79d39c5d0
X-Git-Newrev: 530e6e97b106bb1f14333388f760992cf44bedaa
X-Patchwork-Hint: ignore
Message-Id: <20230812205512.6BFE485B02@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external/toolchain-external-bootlin: update to 2023.08
 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=530e6e97b106bb1f14333388f760992cf44bedaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A new version of Bootlin toolchains, 2023.08, has been recently
released. Besides the usual updates of GCC, binutils, GDB, kernel
headers, and C libraries, support for AArch64 BE with musl has been
enabled, which explains why there are two new toolchains and two new
test cases.

All test cases where successfully tested:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/957304450/builds

Note that the sparcv8 uClibc toolchains are considered obsolete. They
are still available, but at some point we'll have to drop them from the
choice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/toolchain/test_external_bootlin.py       |   28 +
 .../toolchain-external-bootlin/Config.in.options   | 1261 ++++++++++----------
 .../toolchain-external-bootlin.hash                |  824 ++++++-------
 .../toolchain-external-bootlin.mk                  |  422 +++----
 4 files changed, 1314 insertions(+), 1221 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
