Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363F3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2462841A5;
	Tue,  7 Jun 2022 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1rYylKDzvu4; Tue,  7 Jun 2022 20:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BDD8418F;
	Tue,  7 Jun 2022 20:59:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F56A1BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E16640332
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0buW81anvpV for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1CB040017
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:59:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D1E2B40002;
 Tue,  7 Jun 2022 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654635572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yRnZ7gD9IxB57gG2tACLYU6+yHrXLiH7o5md1LOXdx8=;
 b=iXeU0l6hi/yUxeYSLKbgRoJUbBuSogZ4tdQ+lrNljhFoUvsEx3KsIuc84CCQaJArnZeVSM
 /gN0UvyKYJpV9QKcVYApwLSqeAdlnH+VFfpWIOLSJuD8iXp9BgA8vB6U3QKqQK0SxSZvrq
 WtOjaniVCQQYDDAghUw0OfI+Ts4fCGwVbV6kuhlhXKkw7yM8mi3S3wYC2fnyiLzPFFjUOa
 uFR3Kz+jmWtxrFTM97VzK2AkLhTJCjhj6wChkTqyHtlAwew8cBWXV9eDPhxLSEzFiAWj87
 wt4haLZClCU2noQMHvci1k4FuCUyI8HgIzzHun9bo/bfIhf/j6DaBzwOZb57aQ==
To: Buildroot List <buildroot@buildroot.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>
Date: Tue,  7 Jun 2022 22:59:17 +0200
Message-Id: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Remove NDS32 architecture
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The upstream Linux kernel community has removed the NDS32 architecture
support in commit
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aec499c75cf8e0b599be4d559e6922b613085f8f.

There has been very little to no activity in Buildroot around this CPU
architecture recently, so let's drop the support for this CPU
architecture.

Thomas

Thomas Petazzoni (3):
  configs/andes_ae300: remove defconfig
  toolchain/toolchain-external/toolchain-external-andes-nds32: remove
    package
  Remove support for the NDS32 architecture

 Config.in.legacy                              | 10 ++++
 DEVELOPERS                                    |  3 --
 arch/Config.in                                | 12 -----
 arch/Config.in.nds32                          | 17 ------
 board/andes/ae300/ae300.fragment              |  1 -
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 ----------
 ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
 board/andes/ae300/readme.txt                  | 49 -----------------
 configs/andes_ae300_defconfig                 | 10 ----
 docs/manual/known-issues.txt                  |  2 +-
 package/dhcpcd/Config.in                      |  1 -
 package/gdb/Config.in                         |  1 -
 package/gdb/Config.in.host                    |  1 -
 package/libbsd/Config.in                      |  1 -
 package/postgresql/postgresql.mk              |  2 +-
 package/strace/Config.in                      |  2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk      |  2 +-
 .../autobuild/andes-nds32.config              |  3 --
 .../autobuild/toolchain-configs.csv           |  1 -
 toolchain/toolchain-external/Config.in        |  6 ---
 .../toolchain-external-andes-nds32/Config.in  | 15 ------
 .../Config.in.options                         |  9 ----
 .../toolchain-external-andes-nds32.hash       |  2 -
 .../toolchain-external-andes-nds32.mk         | 10 ----
 utils/genrandconfig                           |  3 --
 25 files changed, 14 insertions(+), 229 deletions(-)
 delete mode 100644 arch/Config.in.nds32
 delete mode 100644 board/andes/ae300/ae300.fragment
 delete mode 100644 board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 delete mode 100644 board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
 delete mode 100644 board/andes/ae300/readme.txt
 delete mode 100644 configs/andes_ae300_defconfig
 delete mode 100644 support/config-fragments/autobuild/andes-nds32.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk

-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
