Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD79C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50858137C;
	Mon,  6 Feb 2023 21:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D50858137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEwLa2oDZwVX; Mon,  6 Feb 2023 21:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E10581371;
	Mon,  6 Feb 2023 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E10581371
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4011BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47B5160C0E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B5160C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0ukCC4yY2ly for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:26:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3BA60C11
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3BA60C11
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B32483D19; Mon,  6 Feb 2023 21:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:26:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 394afb3c3b97ec4db28b19c27539c4d653f22e5b
X-Git-Newrev: 452365a385ef35e808eb2eb669d1e3227c7399dd
X-Patchwork-Hint: ignore
Message-Id: <20230206212649.6B32483D19@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: update to 2022.08
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=452365a385ef35e808eb2eb669d1e3227c7399dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit is the result of running
support/scripts/gen-bootlin-toolchains now that 2022.08 toolchains
have been made available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py       |  163 +++
 .../toolchain-external-bootlin/Config.in.options   | 1098 +++++++++++++-------
 .../toolchain-external-bootlin.hash                |  798 +++++++-------
 .../toolchain-external-bootlin.mk                  |  454 ++++----
 4 files changed, 1547 insertions(+), 966 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
