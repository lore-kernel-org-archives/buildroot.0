Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54135C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238B4605E1;
	Mon,  3 Jun 2024 07:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lNivFf3uids; Mon,  3 Jun 2024 07:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 085D86085C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 085D86085C;
	Mon,  3 Jun 2024 07:41:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771901BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70E0840508
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ktw_zAYeBqUx for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.athaariq.my.id; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E517404C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E517404C6
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E517404C6
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:41:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.athaariq.my.id (Postfix) with ESMTPSA id 5800C483C5;
 Mon, 03 Jun 2024 07:41:11 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 14:40:44 +0700
Message-ID: <20240603074049.28426-2-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240603074049.28426-1-foss@athaariq.my.id>
References: <20240603074049.28426-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
Subject: [Buildroot] [PATCH 2/3] package/raspberrypi-usbboot: bump version
 to 20221215-105525
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

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 23 ++++++++++---------
 .../raspberrypi-usbboot.hash                  |  2 +-
 .../raspberrypi-usbboot.mk                    |  4 ++--
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index d482b0b9d4..4a0db4d5d4 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,30 +1,31 @@
-From 38b730c00f45abf324caf687b5b00662ff4252c2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 2 Dec 2016 23:09:44 +0100
+From 26048a4b79b97bfef72aa62c9e3aaf2fe88e58a3 Mon Sep 17 00:00:00 2001
+From: Athaariq Ardhiansyah <foss@athaariq.my.id>
+Date: Mon, 3 Jun 2024 12:58:28 +0700
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
+index dc78cfe..c9d4910 100755
 --- a/Makefile
 +++ b/Makefile
-@@ -1,5 +1,5 @@
+@@ -1,7 +1,7 @@
+ PKG_VER=$(shell grep rpiboot debian/changelog | head -n1 | sed 's/.*(\(.*\)).*/\1/g')
+ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
  rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
--	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0
-+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
+-	$(CC) -Wall -Wextra -g -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\""
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" $(LDFLAGS)
  
  %.h: %.bin ./bin2c
  	./bin2c $< $@
 -- 
-2.31.1
+2.45.2
 
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index cedc5fb7e1..830ead8243 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
+sha256  2f02dbe9a88e9dfad5f05e513e1f30afd47b1575820f7c3b09665dfefc45bbaa  raspberrypi-usbboot-20221215-105525.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 2e4194da0b..24a1f6d906 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
+RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
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
