Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB5CC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45A882333;
	Sat, 27 Jan 2024 18:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45A882333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-uZEkT-IMsB; Sat, 27 Jan 2024 18:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CAB8822B8;
	Sat, 27 Jan 2024 18:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAB8822B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B370E1BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC4982272
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC4982272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwm9_vFyEZnf for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:39:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1F5382266
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F5382266
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAD77A4C1068;
 Sat, 27 Jan 2024 19:39:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50444)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rTnaI-000000007x7-2hkq;
 Sat, 27 Jan 2024 19:39:18 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:39:18 +0100
Message-Id: <20240127183918.22769-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706380758;
 bh=P09WmvoTfPVLxOSk81oHT6dbWSmafUCFoB/19WeLMUk=;
 h=From:To:Cc:Subject:Date:From;
 b=mZXztu+DLmDuJD+Y/u4k+1AYo9KGXI9si/rBGDGbScgYIwDBejKid3xy8F4Jj1zPP
 cgEE6T/arRRW5x21qDj2dB6WqPJR0Q2iD2KN/0kVotewAqJI9pIcMm7wLWv3EESfG+
 dkjKaoersxRlwK4BZwpuMxJZFA9cA6dxltiKbTIgOE+Ff0lZLjsDWWO57ev8k29TEh
 Rm8FxqZgist4vELts2baUHvBQowhaIKgvNDz2mdyTJxb9ZG0llflHTVk9z5FhnTxAj
 PN/3H0B8ZEug7BohrNDyJojKhjHQ4Px8HGPaBM07j9lDU2eOOgsAQh4oCMzuG5eYeY
 unwEJ5i8xfBsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=mZXztu+D
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20240115
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

Updated WHENCE hash due to various new entries for new blobs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 339fad0d4b..5a19292a74 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb  linux-firmware-20231211.tar.xz
+sha256  ab7caff09bbb9e68e2b8a7c3e86d32b65f6444caa4ef8b0aabca9503da2c678d  linux-firmware-20240115.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -38,6 +38,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  dd63e67d3d9e51f84fed9a3efa7a465310b5b5058969eb7295a58339227aee14  WHENCE
+sha256  92d477fe15d81875bc5bcc4c54df7e95b65f42e4c44d64d840f39cd0aa153d6f  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ee51ecc930..58fbaab1d7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20231211
+LINUX_FIRMWARE_VERSION = 20240115
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
