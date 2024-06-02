Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFCCC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC608812A5;
	Sun,  2 Jun 2024 14:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92hJJkPL3S1o; Sun,  2 Jun 2024 14:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FFF8124F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FFF8124F;
	Sun,  2 Jun 2024 14:43:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B61A1BF82C
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655CE4004A
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 14:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qizEnYQRaCxz for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 14:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 434774000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434774000B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 434774000B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 14:43:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8E971B005A3;
 Sun,  2 Jun 2024 16:43:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 16:43:43 +0200
Message-ID: <20240602144343.1272944-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717339428;
 bh=1Y9rQp2+9d57klVwE1lQbfap8oRB0OQ00eoDXYp528M=;
 h=From:To:Cc:Subject:Date:From;
 b=U+zYioE8GhrCmuSF+FLT9IkzsRcNIQcj92qxoSpEgdUrWN1ZTqYILVGEU094ArVev
 fJMTi4yegkNotpiSKwxDMQgG5gVL0E5dtSvZu7K06x8XuXuu2OVXub31FYiNs3wZT2
 TNw0iQUimeuNco4WBqnAuaG2TyhWTI75GdAZ6iCYfAzDefiYqA9WnQw2YFh+xpqI/Z
 jT7PoQqlY/VURKVGpQ8YeAhKQheflrBzhTQ0iuTmOSiSBEetJFgepRLTq73SX/oye7
 vycuhcY+ScYA/VmQqyXOpPDfF8YsQJ/oCG4hMYGYNLM6n/msDSrqDJ+R9WPa8cV0GC
 fQExKHhe0kfgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=U+zYioE8
Subject: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: bump to git version
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/riscv-isa-sim/riscv-isa-sim.hash | 2 +-
 package/riscv-isa-sim/riscv-isa-sim.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.hash b/package/riscv-isa-sim/riscv-isa-sim.hash
index d787a03e4c4..a935cdcf80d 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.hash
+++ b/package/riscv-isa-sim/riscv-isa-sim.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b29c220fed1e867e3bea4b5c565f2629237d525a4d9fe1668699c4406003a1f  riscv-isa-sim-1.1.0.tar.gz
+sha256  fb4420fbc8fe88799e5cd3195920afab99a18bc919e6c675a5e55c7c90079cb4  riscv-isa-sim-00dfa28cd71326a9b553052bf0160cb76f0e7e07.tar.gz
 sha256  c65e436d18972c9c4bd192494fe4870bd2e158179474975b80a3559f27631632  LICENSE
diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index 90eed93c36d..a31192da0a8 100644
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
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
