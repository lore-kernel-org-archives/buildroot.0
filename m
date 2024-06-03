Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E79C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 23:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF41402B2;
	Mon,  3 Jun 2024 23:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3fnn_wlxjLk; Mon,  3 Jun 2024 23:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D1C404DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D1C404DB;
	Mon,  3 Jun 2024 23:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 428F41BF352
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 23:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C555403C4
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 23:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A28Kf5ylGNVN for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 23:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5563A40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5563A40010
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5563A40010
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 23:10:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id A97D4344F4;
 Mon, 03 Jun 2024 23:10:19 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Tue,  4 Jun 2024 06:09:34 +0700
Message-ID: <20240603230940.51746-1-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version to
 v1.20240529
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Martin Bark <martin@barkynet.com>, Fiona Klute <fiona.klute@gmx.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest RPi firmware already provided support for Raspberry Pi 5.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing description due to terminal issue
---
 package/rpi-firmware/Config.in         | 5 +++++
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a9aeaed745..e4de5ddaa3 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -63,6 +63,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
 	help
 	  The debug set of files for versions 4.
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5
+	bool "rpi 5"
+	help
+	  The default set of files for versions 5.
+
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Path to a file stored as boot/config.txt"
 	help
diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 33e05a2f4a..57afe3a1e5 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
+sha256  a116479e4e8e3bae354860d00321e5df5010cdbe10a3db9e59c81858a0aec84d  rpi-firmware-3590de0c181d433af368a95f15bc480bdaff8b47.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 11177aee02..5eef3974d3 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
+RPI_FIRMWARE_VERSION = 3590de0c181d433af368a95f15bc480bdaff8b47
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
