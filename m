Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28166C433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:30:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553BF60F70
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 553BF60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F6560777;
	Sun, 31 Oct 2021 17:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLJTl4IZPB44; Sun, 31 Oct 2021 17:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF056067D;
	Sun, 31 Oct 2021 17:30:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A171BF969
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E6D40210
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxPdICAGa1uN for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:29:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F006140190
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9FFC6890C3; Sun, 31 Oct 2021 17:26:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 18:29:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f5655e791586b2dfb0c211a1a7dd0c6c9d6a403
X-Git-Newrev: 3eb7c4d3c4b5adfa8b84cd83fa9868a3e30c785d
X-Patchwork-Hint: ignore
Message-Id: <20211031172615.9FFC6890C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/openblocks_a6_defconfig: bump
 linux kernel to 4.14.253
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eb7c4d3c4b5adfa8b84cd83fa9868a3e30c785d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3

To correct a build breakage after the move to a gcc 10.x based host
compiler, as the updated kernel contains a fix for:

HOSTLD  scripts/dtc/dtc
/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/openblocks_a6_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index c805ae9c61..2238c0940c 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.253"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
