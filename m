Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8797E75438
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 09:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EBE0414E4;
	Tue,  3 Oct 2023 09:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EBE0414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fx3shFy8B5aE; Tue,  3 Oct 2023 09:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373894098B;
	Tue,  3 Oct 2023 09:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373894098B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0DEC1BF376
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97EC4098B
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97EC4098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKJ_p8nmUSQp for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 09:15:22 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F69F4096B
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F69F4096B
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0F28A4C1040;
 Tue,  3 Oct 2023 11:15:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44220)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qnbUt-0008Bo-0S;
 Tue, 03 Oct 2023 11:15:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 11:15:19 +0200
Message-Id: <20231003091519.4709-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696324519;
 bh=10ZoAn53PYN9aO8ZpQA76Vj7+S5fWIfq4+cDbeCIouM=;
 h=From:To:Cc:Subject:Date:From;
 b=sZh8Vh1fjA+RGO91jo2ysw9FegCvsHDjTIoWDHP5qvIGRZgOYkKLBnNyMhzV6mW6Y
 fhbInsmzhw+sNtBIdKZHaqP2iRqEp6jztHQm5URvIYWkYfOvMqhEG+gSJcaPdIIc8h
 McpVKWtfMBo9Fsy5nyXrMyl5JXxMelBRszJLt5q+NBzbED4d/HMzpqCkuQoO/NC+dR
 lU8c/XNPUgZuqifZ2WfmBOoJ2ZeRa5w1kVaa5V4xfs3qjwUHCerrC23zFKO4r2oeYS
 IlpqOndlXqScXAqPfF+qYMJQoe5MrepGRrWyYs9WQYjCdChxjlZLfbtCZrKHbW2SK8
 AAB7elCeXMWxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sZh8Vh1f
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware: bump version to
 20230919
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to various commits:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed unrelated parts (Baruch)

 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 31bbfddfaa..d33215ecd1 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688  linux-firmware-20230804.tar.xz
+sha256  97fada0d02bdafc4e017a4dcc456e7fa48bc8daf2ddf75161f39a92e38f084ad  linux-firmware-20230919.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -36,6 +36,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  0f87f8f67de39828d8e59c69369f850e0a80de638795e22ddfdd1f7f31cdf889  WHENCE
+sha256  960bbc08cdd5f505b05645947360461aa5a62fe56c97f5ffbae064ca33a922ec  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0cd1f30c16..6f15ff7400 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20230804
+LINUX_FIRMWARE_VERSION = 20230919
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
