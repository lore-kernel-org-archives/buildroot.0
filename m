Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6103C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FB34031F;
	Wed, 12 Jan 2022 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TuGWJR-YADZ; Wed, 12 Jan 2022 19:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A8834011D;
	Wed, 12 Jan 2022 19:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB5531BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8645415D0
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDFEeC7dkXMA for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B9F415CE
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 28BB482B45; Wed, 12 Jan 2022 19:39:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 20:42:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02d35007472675c147be79b4ca06959c83ae4128
X-Git-Newrev: 0d0f84d2004b04bc93d5ceb58c86640f190e5d78
X-Patchwork-Hint: ignore
Message-Id: <20220112193954.28BB482B45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: needs host-dtc
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d0f84d2004b04bc93d5ceb58c86640f190e5d78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

configure: error: device-tree-compiler not found

Fixes:
 - http://autobuild.buildroot.org/results/d35ff4a0ca0a8463121d717a9727e0d863ca83e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index e10dd4c662..59f70fc432 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -8,5 +8,6 @@ RISCV_ISA_SIM_VERSION = 1.1.0
 RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
+HOST_RISCV_ISA_SIM_DEPENDENCIES = host-dtc
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
