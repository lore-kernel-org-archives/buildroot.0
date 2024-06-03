Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D551C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18F04091E;
	Mon,  3 Jun 2024 15:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23a7rrlX4yD8; Mon,  3 Jun 2024 15:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2F14095C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E2F14095C;
	Mon,  3 Jun 2024 15:57:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527221BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4BE60A52
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WLGt_TwiMPa for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2A560A5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E2A560A5B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28B757F8BE; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:53:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bf952b0cb7d10361389984027019161d46da105f
X-Git-Newrev: 5751191f2d4521125560c0022b385929a867c3fe
X-Patchwork-Hint: ignore
Message-Id: <20240603155720.28B757F8BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bpftool: enable
 on riscv
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

commit: https://git.buildroot.net/buildroot/commit/?id=5751191f2d4521125560c0022b385929a867c3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

bpftool supports RISC-V, including rv64 and rv32, so let's enable the
bpftool package on RISC-V.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a91a245ec04e992c7ac6709c701380fdf5e3655e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index ef3a7a8a45..55fd09ef3d 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_s390x
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
