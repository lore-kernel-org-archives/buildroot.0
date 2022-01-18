Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB21EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F18E60B23;
	Wed, 19 Jan 2022 20:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6F6lHVLI2EKh; Wed, 19 Jan 2022 20:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695AD60AE7;
	Wed, 19 Jan 2022 20:23:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEC41BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF4681751
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPE760tchyzM for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:23:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E1EE8174F
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:23:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 83CAB8351F; Wed, 19 Jan 2022 20:16:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 18:27:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9096036f00c5a0f37e3b3916417f0d0b166b73e8
X-Git-Newrev: 8ae840ba193a90f4cb950526646b831294477454
X-Patchwork-Hint: ignore
Message-Id: <20220119201624.83CAB8351F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: set --with-boost
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ae840ba193a90f4cb950526646b831294477454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set --with-boost to avoid the following build failure when a non working
boost version is installed on host. This failure is raised since the
addition of the package in commit
ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure:5559: error: Could not find a version of the Boost::Asio library!

Fixes:
 - http://autobuild.buildroot.org/results/855b66b86d979cc922b947da932b0e2388481263

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index ee9067d304..90eed93c36 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -9,5 +9,6 @@ RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
 HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
+HOST_RISCV_ISA_SIM_CONF_OPTS = --with-boost=$(HOST_DIR)
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
