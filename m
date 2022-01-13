Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC30CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F12584CBC;
	Thu, 13 Jan 2022 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sw7yk1046mfL; Thu, 13 Jan 2022 19:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89EF7813FC;
	Thu, 13 Jan 2022 19:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7D41BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CC426FC57
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBZ0OPqfuQv3 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 669A660A9F
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 31D367FDB0; Thu, 13 Jan 2022 19:28:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f3a4a5d57bc5e020729de52169765acfb0bea18
X-Git-Newrev: a10835fac773e68eef18d48cb89d76f9f553c33a
X-Patchwork-Hint: ignore
Message-Id: <20220113192846.31D367FDB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: needs host-boost
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

commit: https://git.buildroot.net/buildroot/commit/?id=a10835fac773e68eef18d48cb89d76f9f553c33a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure: error: Could not link against boost_system !

Fixes:
 - http://autobuild.buildroot.org/results/d1ec407d3a9106be1271e4897d6f578d501439fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index 59f70fc432..ee9067d304 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -8,6 +8,6 @@ RISCV_ISA_SIM_VERSION = 1.1.0
 RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
-HOST_RISCV_ISA_SIM_DEPENDENCIES = host-dtc
+HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
