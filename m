Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581CC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7C5606EB;
	Sun, 14 Jul 2024 16:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfGO0mjIxQyV; Sun, 14 Jul 2024 16:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612A860644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612A860644;
	Sun, 14 Jul 2024 16:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F183C1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB03403A0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciP_WwRkv-22 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DF454039B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF454039B
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DF454039B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 5C066510DB;
 Sun, 14 Jul 2024 23:05:19 +0700 (WIB)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 204922501C;
 Sun, 14 Jul 2024 23:05:19 +0700 (WIB)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 23:04:53 +0700
Message-ID: <20240714160457.39434-2-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714160457.39434-1-foss@athaariq.my.id>
References: <20240714160457.39434-1-foss@athaariq.my.id>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received; s=dkim20240121; t=1720973119; x=1722182720; bh=zT4dHz
 I/ojdDHZdLSrF79Zaeb3dj+E1PkA1VIjr9jN8=; b=YLjI/VO9533R5ROiY9KOrk
 bIGkSqd70ySc1oZWJDRaLvEcFfdXoRamx7reYwtxEPTqnIuxVKij9F6dOSfTISce
 eDaygUdZlSVvjYgpCWmRRN9MeTNT6kMFAqw4nNvd9nFgubyN7q1h9OkH3CfkVloz
 uGAZoKkVO6Z9XcELzJkifGeta9CxI2hbKBx8HixPzorgeQLm42H2g0Q5AoJ6Hf0c
 7LIiI1K3ZYVea8Rln6DVL8dwdDCpkFKFbZOaOaElVWKwDQPP2phzZ9+3HQRvn6QX
 tMFFG+MLW9gNDcjAiTmEAWP+zEzWUuAfI6CryXCzDYyuMDU03JqLVlM8OiAQydOw
 ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=YLjI/VO9
X-Mailman-Original-Authentication-Results: mail.selirafood.com (amavisd-new); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=athaariq.my.id
Subject: [Buildroot] [PATCH v4 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest raspberrypi-usbboot package has Raspberry Pi 5 support. It is
considerably matured at commit 4a3d31171769f87d919340778e5aaeaba01e10b5.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing description due to terminal issue
  - Use the latest commit instead of the latest tag

Changes v2 -> v3:
  - Update the commit title
  - Add more explanation on commit description

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 27 +++++++++----------
 .../raspberrypi-usbboot.hash                  |  2 +-
 .../raspberrypi-usbboot.mk                    |  2 +-
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index 29a9311651..ea53f8360a 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,31 +1,28 @@
-From acd175aa53af1f1b8422bf1f1fe57eafc710cdca Mon Sep 17 00:00:00 2001
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
-[Rebased on 20221215-105525-0-g1afa26c5]
-Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
+Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index dc78cfe..c9d4910 100755
+index 4479b1b..076ae43 100755
 --- a/Makefile
 +++ b/Makefile
-@@ -1,7 +1,7 @@
- PKG_VER=$(shell grep rpiboot debian/changelog | head -n1 | sed 's/.*(\(.*\)).*/\1/g')
- GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
- rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
--	$(CC) -Wall -Wextra -g -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\""
-+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" $(LDFLAGS)
+@@ -3,7 +3,7 @@ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
+ INSTALL_PREFIX?=/usr
+ 
+ rpiboot: main.c bootfiles.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
+-	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
  
  %.h: %.bin ./bin2c
  	./bin2c $< $@
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 830ead8243..1a183bf47f 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2f02dbe9a88e9dfad5f05e513e1f30afd47b1575820f7c3b09665dfefc45bbaa  raspberrypi-usbboot-20221215-105525.tar.gz
+sha256  2182a6bf5ca9cd54ee3bca2d7667758ceac685fa78a3a6ae663762bde03e781a  raspberrypi-usbboot-4a3d31171769f87d919340778e5aaeaba01e10b5.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 24a1f6d906..7eef7df600 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
+RASPBERRYPI_USBBOOT_VERSION = 4a3d31171769f87d919340778e5aaeaba01e10b5
 RASPBERRYPI_USBBOOT_SITE = \
 	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
