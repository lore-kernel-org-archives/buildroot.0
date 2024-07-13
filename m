Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD3C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C0B440385;
	Sat, 13 Jul 2024 11:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTItBZ6KTpcJ; Sat, 13 Jul 2024 11:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11E640463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F11E640463;
	Sat, 13 Jul 2024 11:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 978E31BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8431A605E3
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEHuK_QGrAhq for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D9D3605D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D9D3605D2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ADF48516B; Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 12:59:24 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9cddd68f8e667a4ab28f18ceb2eaa9e69c2fdef8
X-Git-Newrev: 2e34d5638de988816c037ff09ce88c986a871331
X-Patchwork-Hint: ignore
Message-Id: <20240713113033.2ADF48516B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/raspberrypi-usbboot: bump version to 20221215-105525
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e34d5638de988816c037ff09ce88c986a871331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The "msd" (mass storage device) firmware files in 2021.07.01 don't
work with some newer CM4 based devices, the one I had issues with is a
RevPi Connect 4. Updating fixes the issue. Mass storage device mode is
required to flash the eMMC of CM4 devices.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbd9a3f3114ef52d6ff9a14ec2648926909fd46e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch     | 16 ++++++++++------
 package/raspberrypi-usbboot/raspberrypi-usbboot.hash     |  2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk       |  4 ++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index d482b0b9d4..29a9311651 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 38b730c00f45abf324caf687b5b00662ff4252c2 Mon Sep 17 00:00:00 2001
+From acd175aa53af1f1b8422bf1f1fe57eafc710cdca Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 2 Dec 2016 23:09:44 +0100
 Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
@@ -10,21 +10,25 @@ Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Rebased on 9324fd7]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on 20221215-105525-0-g1afa26c5]
+Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
