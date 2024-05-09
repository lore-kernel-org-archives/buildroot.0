Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606DFC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C40C41E57;
	Thu,  9 May 2024 16:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UALchj4saovr; Thu,  9 May 2024 16:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4608405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4608405B0;
	Thu,  9 May 2024 16:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 461E51BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E20583ECB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxN6xJAIDLSR for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D1383E68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D1383E68
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65F6286CD0; Thu,  9 May 2024 16:42:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e6e58e342d440a4d6aa6c25b5caf9061c352b79
X-Git-Newrev: a91a245ec04e992c7ac6709c701380fdf5e3655e
X-Patchwork-Hint: ignore
Message-Id: <20240509164200.65F6286CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: enable on riscv
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

commit: https://git.buildroot.net/buildroot/commit/?id=a91a245ec04e992c7ac6709c701380fdf5e3655e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bpftool supports RISC-V, including rv64 and rv32, so let's enable the
bpftool package on RISC-V.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
