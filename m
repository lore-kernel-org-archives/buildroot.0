Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 06:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0207A40946;
	Wed, 12 Jan 2022 06:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iR9asBS_BDAY; Wed, 12 Jan 2022 06:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C37A4054B;
	Wed, 12 Jan 2022 06:43:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5AAA1BF8A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 06:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CDFE415D3
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 06:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Le7JHvkFD1e for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 06:43:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD32341550
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 06:43:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1B60C82E00; Wed, 12 Jan 2022 06:37:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 07:43:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af5b1ec68bf0af0af61de6b58e3c64d632a9a1e6
X-Git-Newrev: 280ad2e3d3b85bca5a45e8ff365445fe3f111d4d
X-Patchwork-Hint: ignore
Message-Id: <20220112063713.1B60C82E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: fix typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=280ad2e3d3b85bca5a45e8ff365445fe3f111d4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in comment added by commit
ea033cecf990ed3f86619647523a9ad2ccb09adb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/riscv-isa-sim/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index 35e404caf0..4ccf6e9546 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++1
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
