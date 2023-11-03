Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E1CC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99E2B403E9;
	Fri,  3 Nov 2023 20:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E2B403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msYZ056qm1Rk; Fri,  3 Nov 2023 20:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CBA40441;
	Fri,  3 Nov 2023 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CBA40441
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14F6E1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E09F440441
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09F440441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMuysp1J3oLN for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:11:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCB8403E9
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCB8403E9
Received: from fli4l.lan.fli4l (p54a1b8f0.dip0.t-ipconnect.de [84.161.184.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72F24A4C05AD;
 Fri,  3 Nov 2023 21:11:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53036)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qz0Vv-0007V6-0e;
 Fri, 03 Nov 2023 21:11:31 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 21:11:31 +0100
Message-Id: <20231103201131.80826-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699042291;
 bh=iELg3Flz5n0Mmhr7Q+0UqJ+rVeBL80va9sOEGhPYbhw=;
 h=From:To:Cc:Subject:Date:From;
 b=IzfuSq2O4GWjOAt9xJ6CzYQ703cUaus46tqQcntAg0t/dH6wJxY/nZePFbxtiMJ8H
 epr6UvUuR7849nxEf9/nbQ6En7gYqhreamY88DORphoZx0p0QX99w9LhGvCzP4F2hX
 nUbPgTbfT8KRu42Qvw0R3Qi9SSpDBOObbILdkSvq93c/FH9jCAigE6sm3gkgosiUGh
 ExAHufXN4Tz4Tlx7uZ6aVm51mNG7S542+SRkUA6nk6ANf3V3nKb9vlNikn4jsjYBP7
 IUDNWLsr1/BXx7CWixKVzC0/dc2SyD1pubs9yNUkKIRMAuFNpwckHTpelnnxE+sMz0
 2C81My8rAUbsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IzfuSq2O
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231030
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
index 31bbfddfaa..6722aa14c6 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688  linux-firmware-20230804.tar.xz
+sha256  c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7  linux-firmware-20231030.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -36,6 +36,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  0f87f8f67de39828d8e59c69369f850e0a80de638795e22ddfdd1f7f31cdf889  WHENCE
+sha256  697134859b663bc110d57275a7a7862bba21c4425266aac8c62bee18202aac20  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0cd1f30c16..c2cf0fec19 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20230804
+LINUX_FIRMWARE_VERSION = 20231030
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
