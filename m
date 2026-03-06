Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3697DFCC048
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 17:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E291283BED;
	Fri,  6 Mar 2026 17:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9HM0vTa1j5v; Fri,  6 Mar 2026 17:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C1783C45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772819566;
	bh=tV6qzv0FeCOMoOiMt5/rUXcdL8KVO7WRG3l1/ke+dJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nyggVZk1IbFOYXLknDKL0DXZ3sIloHWfH+Q6Wla24gimXXpI+zASnUc0soAOGDmIi
	 FkE1+be/7qcmYyhy0H4auqavtvtOh0f3mVnDE/S8aQYyUyg9Pu9VTnfo3VTnOgavbv
	 /6mBGi7+pymnj+a8m8NnZ7G2W5RWCsKBa3EFSBMRXvKcJPO0v4pLPax2j3HilqaR0N
	 rmjN6oBv5JeC2JlISzraofGaraH+LV6VUAzqqvQuIZC7XX3eaBxvSX2IIqs1QpD/NH
	 6VqDWO3OpDZUS+3DZX9sJgaLMob+Dq1Pt5lmTGcRd8V6SPzWhCdFdAUnU0oFXMDXrS
	 eiiiiALutY/Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C1783C45;
	Fri,  6 Mar 2026 17:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49506223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46DD683C45
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4oZIslb-_mM for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 17:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6867883BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6867883BED
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:52:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C40A84048; Fri,  6 Mar 2026 17:52:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 18:51:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f489b40190e47ad13f2d7566abefffee8214cea0
X-Git-Newrev: 5a0f3c66c95508bd17916fa4ccf5595cd3166e2e
X-Patchwork-Hint: ignore
Message-Id: <20260306175243.7C40A84048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20260221
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a0f3c66c95508bd17916fa4ccf5595cd3166e2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Updated hash of LICENSE.amd-ucode due to copyright year bump:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENSE.amd-ucode?h=20260221&id=e399bb332bdaaeacb27923e8a0a68b0d6f303d49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 6 +++---
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index bbd8d3295a..7b4d1d224c 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,10 +1,10 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3  linux-firmware-20251011.tar.xz
+sha256  bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94  linux-firmware-20260221.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  ad548ca0ffb91ec655de0f28e13089ef1cd4e0deabb2f15a9289194990e62252  LICENSE.airoha
-sha256  27907ae1d74b94fd6f1159971158ed3199e472f129ea1ff748ea13aded2a59d5  LICENSE.amd-ucode
+sha256  2103bd999f77522c5ab5fd35df0579ed00e2a6b885f6f8ebd444e97ffa482991  LICENSE.amd-ucode
 sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  fc3825c3807cf5028aa9c60a4f5936a8265e3e00fcbc85b5c016bdfc136e045f  WHENCE
+sha256  f347586920c214293245169711f81ef837d9c37410a04bddb44a583e2883c2f9  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0a35d72bc4..c58d3e4b56 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20251011
+LINUX_FIRMWARE_VERSION = 20260221
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
