Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C5C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 08:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E2E4062D;
	Mon,  3 Jun 2024 08:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQF8pkOLPfIo; Mon,  3 Jun 2024 08:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AE354068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE354068F;
	Mon,  3 Jun 2024 08:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A34251BF2EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 08:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5886065F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 08:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6FAGzBvNhOZ for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 08:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86C6A605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86C6A605E9
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86C6A605E9
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 08:47:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id 1AC1748DA8;
 Mon, 03 Jun 2024 08:47:09 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 15:46:13 +0700
Message-ID: <20240603084617.38508-2-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240603084617.38508-1-foss@athaariq.my.id>
References: <20240603074049.28426-1-foss@athaariq.my.id>
 <20240603084617.38508-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH v2 2/3] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest raspberrypi-usbboot package has Raspberry Pi 5 support.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing description due to terminal issue
  - Use the latest commit instead of the latest tag
---
 ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 25 ++++++++++---------
 .../raspberrypi-usbboot.hash                  |  2 +-
 .../raspberrypi-usbboot.mk                    |  4 +--
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index d482b0b9d4..ea53f8360a 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,30 +1,31 @@
-From 38b730c00f45abf324caf687b5b00662ff4252c2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 2 Dec 2016 23:09:44 +0100
+From e09c92d68efa4efbd48a3366f9053a4f8c275091 Mon Sep 17 00:00:00 2001
+From: Athaariq Ardhiansyah <foss@athaariq.my.id>
+Date: Mon, 3 Jun 2024 15:35:49 +0700
 Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
 
-This might be needed to pass some custom CFLAGS/LDFLAGS when building
-rpiboot.
+This might be needed to pass some custom CFLAGS/LDFLAGS when building rpiboot.
 
 Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebased on 9324fd7]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 822e714..875e717 100755
+index 4479b1b..076ae43 100755
 --- a/Makefile
 +++ b/Makefile
-@@ -1,5 +1,5 @@
- rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
--	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0
-+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
+@@ -3,7 +3,7 @@ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
+ INSTALL_PREFIX?=/usr
+ 
+ rpiboot: main.c bootfiles.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
+-	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
  
  %.h: %.bin ./bin2c
  	./bin2c $< $@
 -- 
-2.31.1
+2.45.2
 
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index cedc5fb7e1..1a183bf47f 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
+sha256  2182a6bf5ca9cd54ee3bca2d7667758ceac685fa78a3a6ae663762bde03e781a  raspberrypi-usbboot-4a3d31171769f87d919340778e5aaeaba01e10b5.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 2e4194da0b..7eef7df600 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
+RASPBERRYPI_USBBOOT_VERSION = 4a3d31171769f87d919340778e5aaeaba01e10b5
 RASPBERRYPI_USBBOOT_SITE = \
-	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
+	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
 RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
