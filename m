Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77463D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D1C40357;
	Mon, 11 Nov 2024 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpOq-1bMhKlq; Mon, 11 Nov 2024 21:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE5F40345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE5F40345;
	Mon, 11 Nov 2024 21:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6324AD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4476380AD5
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGM2FD_pVReg for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4034080AAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4034080AAB
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C68E86149; Mon, 11 Nov 2024 21:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 22:31:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36f1195493245c2299c436be5716cdee072ac8cf
X-Git-Newrev: 012bbb70c2a27847475618a132cfd578177da2cf
X-Patchwork-Hint: ignore
Message-Id: <20241111214448.2C68E86149@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/raspberrypi-usbboot: bump version
 to 20240926-102326
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=012bbb70c2a27847475618a132cfd578177da2cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds the -i flag to select the device to boot by serial
number [1], which is important when working with multiple RPi
devices. Otherwise mostly firmware updates, see [2] for all changes.

Also switch to the git download method for reproducible archives.

[1] https://github.com/raspberrypi/usbboot/commit/481c5e8a77d7bbf81060deb0f3efe463ec97243f
[2] https://github.com/raspberrypi/usbboot/compare/20221215-105525...20240926-102326

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 20 ++++++++++----------
 package/raspberrypi-usbboot/raspberrypi-usbboot.hash |  2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk   |  6 +++---
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index 29a9311651..fe2614d35e 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
@@ -1,4 +1,4 @@
-From acd175aa53af1f1b8422bf1f1fe57eafc710cdca Mon Sep 17 00:00:00 2001
+From d580bf031011d1e1e022ab1e1024f7cc5939f956 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 2 Dec 2016 23:09:44 +0100
 Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
@@ -10,22 +10,22 @@ Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Rebased on 9324fd7]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Rebased on 20221215-105525-0-g1afa26c5]
-Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
+[Rebased on 20240926-102326-0-g82d8755]
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index dc78cfe..c9d4910 100755
+index d2f7585..9812d6d 100755
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
+ rpiboot: main.c bootfiles.c decode_duid.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
+-	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c decode_duid.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c decode_duid.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
  
  %.h: %.bin ./bin2c
  	./bin2c $< $@
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 830ead8243..413fe88f03 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2f02dbe9a88e9dfad5f05e513e1f30afd47b1575820f7c3b09665dfefc45bbaa  raspberrypi-usbboot-20221215-105525.tar.gz
+sha256  2ce52a9f1de1aab39daa10fa487c55d20d34f679d11b1a1743d0ef81ffb3c726  raspberrypi-usbboot-20240926-102326-git4.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 24a1f6d906..3135741e9b 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 20221215-105525
-RASPBERRYPI_USBBOOT_SITE = \
-	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
+RASPBERRYPI_USBBOOT_VERSION = 20240926-102326
+RASPBERRYPI_USBBOOT_SITE = https://github.com/raspberrypi/usbboot.git
+RASPBERRYPI_USBBOOT_SITE_METHOD = git
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
 RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
