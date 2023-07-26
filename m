Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1675CC001B0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 16:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F88441915;
	Wed, 26 Jul 2023 16:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F88441915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1B9ZATkG1Du; Wed, 26 Jul 2023 16:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69CB341B75;
	Wed, 26 Jul 2023 16:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69CB341B75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDD91BF2B1
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 16:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C2D83942
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 16:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C2D83942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHZaOYola8Ns for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 16:47:22 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A9858392C
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 16:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A9858392C
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FED2A4C036A;
 Wed, 26 Jul 2023 18:47:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60368)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOhfU-0003bJ-08;
 Wed, 26 Jul 2023 18:47:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 18:47:20 +0200
Message-Id: <20230726164720.485456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690390040;
 bh=UFcdYJAO0LwfDHOjzbLB0SPyGFHgEcRf+rD/LvC7IoU=;
 h=From:To:Cc:Subject:Date:From;
 b=k4osNZVZcaBMm6viz2yaiTJznVjPd4Ixk6+JPj8C+zlpyXQikb+LHMg7G8sV1ZAzY
 7EaBj2ZZjvHQXBrDG367+mdfacwrGm+yJuoXKpkCNqlzwd26nnAcrZLjbS0x6YnKOf
 GszJdne3NkonsrB+fvT22mCOdO2J49SBoYF7nIlmJXap5w6YMtQUKxbO6OtfbwCJXv
 5MXWm9yzfHlDu1w1H3ZYtyk4wx/79sAEtIgra3E+x56mEWL+EaiiSTo6k/A0wmOaeV
 X+NiVGppZ0FYPN11edNGMmGrk3zS5JKJMKEEeMU8P3FaT95tNNGH1jbC3VJC6PcpK4
 nXdqUe7uMcQkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=k4osNZVZ
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20230625
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
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 55178ba8f8..25b6d018a1 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951  linux-firmware-20230515.tar.xz
+sha256  87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d  linux-firmware-20230625.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -35,6 +35,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  d41a4f4e4230e27d9dfd83b49d2ec839792d80cc559b0bb2b1112adbb0916e6b  WHENCE
+sha256  cb91afd4cf763c316d3cb6acc20a63a58d3c7e7b3ff03f254285a4414aeb76f9  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 068de3859e..01718fa1e0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20230515
+LINUX_FIRMWARE_VERSION = 20230625
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
