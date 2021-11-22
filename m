Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39701C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0B780DA3;
	Mon,  6 Dec 2021 18:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78v6fD0hy0nI; Mon,  6 Dec 2021 18:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483F880E54;
	Mon,  6 Dec 2021 18:38:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9BA1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E4D41C78
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bz61gRpjhXww for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB33441C3C
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F02581468; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 18:42:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a9b860bed9bff7146b1889db046789b2f517f2
X-Git-Newrev: 386cf00e6f32f3dd6d13ee38577d959dc4addc6f
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.4F02581468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: move to
 u-boot 2021.04 / mainline linux 5.10.79
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

commit: https://git.buildroot.net/buildroot/commit/?id=386cf00e6f32f3dd6d13ee38577d959dc4addc6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This board is now supported by mainline u-boot and Linux.  For U-Boot we
unfortunately still need a patch as the available (<rev A2) boards do not
have an identification eeprom, causing boot failures.

Use the workaround patch by Robert Nelson also used by the official bb.org
builds.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/uboot/0001-BeagleBone-AI-support.patch | 1783 --------------------
 .../patches/uboot/0001-am57xx_evm-fixes.patch      |  839 +++++++++
 configs/beagleboneai_defconfig                     |   11 +-
 3 files changed, 845 insertions(+), 1788 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
