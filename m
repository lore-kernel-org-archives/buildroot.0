Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A07C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B8980EEC;
	Fri, 21 Jun 2024 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZTodTKt4kbh; Fri, 21 Jun 2024 21:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1655780F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1655780F0B;
	Fri, 21 Jun 2024 21:34:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E83121BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D66D6607AD
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wK8SDN4dNad for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF9E4607A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF9E4607A5
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:34:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 890228260C; Fri, 21 Jun 2024 21:34:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:26:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6701a91e69a1dd1d5afdf627565936cf7df5cf70
X-Git-Newrev: 853b7661bf5ddca5d4b81964ef1a19a133beac85
X-Patchwork-Hint: ignore
Message-Id: <20240621213444.890228260C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv-isa-sim: bump to git version
 00dfa28cd7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=853b7661bf5ddca5d4b81964ef1a19a133beac85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv-isa-sim (Spike) has not received any tag or release in the past
years. As of the time of this commit, the latest release is still
v1.1.0 (2021-12-17), see [1].

This commit bumps to the latest commit 00dfa28cd7. For the commit log,
see [2]. This bump includes many RISC-V spec and extension updates.

Also, when host gcc >= 13, riscv-isa-sim compilation fails with
output:

    In file included from ./fesvr/syscall.h:6,
                     from ./fesvr/syscall.cc:3:
    ./fesvr/device.h:15:30: error: 'uint64_t' was not declared in this scope
       15 |   typedef std::function<void(uint64_t)> callback_t;
          |                              ^~~~~~~~

This bump includes commits for fix those issues. For example, see [3].

Fixes: [4] and few others.

[1] https://github.com/riscv-software-src/riscv-isa-sim/releases/tag/v1.1.0
[2] https://github.com/riscv-software-src/riscv-isa-sim/commits/00dfa28cd71326a9b553052bf0160cb76f0e7e07
[3] https://github.com/riscv-software-src/riscv-isa-sim/commit/0a7bb5403d0290cea8b2356179d92e4c61ffd51d
[4] http://autobuild.buildroot.org/results/c30/c300f1c84033aec1d265b682e4c1da5362d25f8b/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/riscv-isa-sim/riscv-isa-sim.hash | 2 +-
 package/riscv-isa-sim/riscv-isa-sim.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.hash b/package/riscv-isa-sim/riscv-isa-sim.hash
index d787a03e4c..a935cdcf80 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.hash
+++ b/package/riscv-isa-sim/riscv-isa-sim.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b29c220fed1e867e3bea4b5c565f2629237d525a4d9fe1668699c4406003a1f  riscv-isa-sim-1.1.0.tar.gz
+sha256  fb4420fbc8fe88799e5cd3195920afab99a18bc919e6c675a5e55c7c90079cb4  riscv-isa-sim-00dfa28cd71326a9b553052bf0160cb76f0e7e07.tar.gz
 sha256  c65e436d18972c9c4bd192494fe4870bd2e158179474975b80a3559f27631632  LICENSE
diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index 90eed93c36..a31192da0a 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RISCV_ISA_SIM_VERSION = 1.1.0
-RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
+RISCV_ISA_SIM_VERSION = 00dfa28cd71326a9b553052bf0160cb76f0e7e07
+RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,$(RISCV_ISA_SIM_VERSION))
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
 HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
