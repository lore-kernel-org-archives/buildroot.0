Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E43F531CA
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF6B605DC;
	Mon, 13 Apr 2026 19:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DPC5hE_dg7b; Mon, 13 Apr 2026 19:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D30C60EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776110283;
	bh=zfyJxi5y0HDmoOuiea9yqXsqWjd8UfObeahkIF1mbts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iZy574Xreivi73V7ZrRcy/VUqWl12YhUQAmmLhEg5NKfhJw4ylVY4v5kE+qMx2Tq8
	 HenpiDro4/5njmxhYMC69SZag8Fxihu+aXolf+h0QkzYFSGYZhXFlx1tzLIpZNqnhL
	 JQBMQzNyWwgtZrkTd+p1cf8Pjw2jgY9oI/20mVEI7LQYKMsgd97svOxfyG2E+EizpH
	 UbbKnWD6bO15zr8nfL0v1e4qGJMXljIdzyWld+L7/9M9vReaLQXh0g1MWy8Mn/M8mA
	 3so2aZYL3LVppk/EbFe3qWyiypDiaX6frb+bYUrV3fIZjJxRV/lvaOrko5/ygww9To
	 cNSxKScxPTMCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D30C60EA1;
	Mon, 13 Apr 2026 19:58:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2807A196
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19FE840365
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB9iIJyRA8X8 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558E940130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558E940130
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39F1813DD; Mon, 13 Apr 2026 19:58:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 21:50:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66124c73b1b0f694ae04a8e4d90b9cf290f16874
X-Git-Newrev: e2ace8475f0f142c1898d295751fb8a037ffd0b9
X-Patchwork-Hint: ignore
Message-Id: <20260413195800.D39F1813DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20260410
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2ace8475f0f142c1898d295751fb8a037ffd0b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c891c1a868..ede4d7fa67 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c  linux-firmware-20260309.tar.xz
+sha256  b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178  linux-firmware-20260410.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  b763b1df1341d86664e8e881f5214333d5f904c31e8cc58bb5302774f0369630  WHENCE
+sha256  c282239a5a2d849677e9304e6f361e475e1b6e71e7c771c03f8986f71b309527  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4fe1c4d5fc..6561e1cd1b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260309
+LINUX_FIRMWARE_VERSION = 20260410
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
