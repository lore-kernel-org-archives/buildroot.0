Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294BDC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B466183F57;
	Thu,  8 Jun 2023 19:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B466183F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vabsjxlYHgs3; Thu,  8 Jun 2023 19:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F024183D0F;
	Thu,  8 Jun 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F024183D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBD11BF397
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0706183F4B
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0706183F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0tPpXcGxXoy for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 19:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF1A83CDE
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFF1A83CDE
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 19:13:05 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout06.t-online.de (Postfix) with SMTP id C707315AB2;
 Thu,  8 Jun 2023 21:13:02 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7L49-1KqOXZ0; Thu, 8 Jun 2023 21:13:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57974)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7L49-00067C-12;
 Thu, 08 Jun 2023 21:13:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 21:13:01 +0200
Message-Id: <20230608191301.3527479-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686251581-41FF5266-9B24CE9D/0/0 CLEAN NORMAL
X-TOI-MSGID: 625a98d2-3236-4da7-97ee-75ee49d1d1b7
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20230515
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

Updated license hashes due to upstream commits:

- copyright year bumps
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENSE.amdgpu?id=d0598c3b82f24f3ed811f5505f4090924c4da626
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENCE.qat_firmware?id=24c9df9b942518717dd53966712df69ac35c8b90

- other changes
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENCE.qat_firmware?id=588dd07134daf4b0f6f74698f24eeb74ebe90012
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-firmware/linux-firmware.hash | 8 ++++----
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 6bbc2f9c77..55178ba8f8 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,9 +1,9 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331  linux-firmware-20221214.tar.xz
+sha256  8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951  linux-firmware-20230515.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
-sha256  a6c0ec4338bc89480da52812bea7f9e4b52bc7118e3e352141f99d779c397c53  LICENSE.amdgpu
+sha256  33c0ba2ed43918f2602cfb7274757ff62a6c743082aeeec78ad636ff74200faf  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
@@ -19,7 +19,7 @@ sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENC
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
-sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  LICENCE.qat_firmware
+sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
 sha256  8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508  LICENCE.ralink_a_mediatek_company_firmware
@@ -35,6 +35,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  744babd4eae138ccfb5bd343b1589912b9839274f8a794af0b6c9b451df73579  WHENCE
+sha256  d41a4f4e4230e27d9dfd83b49d2ec839792d80cc559b0bb2b1112adbb0916e6b  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9d9d12bd5f..393f82774d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20221214
+LINUX_FIRMWARE_VERSION = 20230515
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
