Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A1C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CB4840CA6;
	Mon, 10 Mar 2025 20:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxYiFOM5djw3; Mon, 10 Mar 2025 20:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F9840C9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F9840C9E;
	Mon, 10 Mar 2025 20:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8176E1C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A5D681EE2
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uosOh2EaSA5V for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 20:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38C5481EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C5481EF8
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 20:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15ABC87DDA; Mon, 10 Mar 2025 20:26:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Mar 2025 21:21:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99a73492f855c05ad563825d1204d6c41b9f28be
X-Git-Newrev: bc933199e0a850afe54ae5372d68aa9b76137822
X-Patchwork-Hint: ignore
Message-Id: <20250310202633.15ABC87DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/raspberrypi-usbboot:
 bump version to 20250227-132106
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc933199e0a850afe54ae5372d68aa9b76137822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

32-bit mass-storage-gadget has been replaced with
mass-storage-gadget64. Drop patch included upstream.

Upstream diff:
https://github.com/raspberrypi/usbboot/compare/20240926-102326...20250227-132106

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 34 ----------------------
 .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |  2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk |  2 +-
 4 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 08285eadcc..e38d576a20 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1048,7 +1048,6 @@ package/qt5/qt5webkit/0006-Warnings-due-to-AppSinkCallbacks-struct-growth-https.
 package/qt5cinex/0001-Fix-execution-problem-with-Qt5.3.patch lib_patch.Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
-package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
 package/read-edid/0001-Fix-install-file-list.patch lib_patch.Upstream
 package/read-edid/0002-Fix-compiler-check.patch lib_patch.Upstream
 package/read-edid/0003-fix-build-with-gcc-10.patch lib_patch.Upstream
diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
deleted file mode 100644
index fe2614d35e..0000000000
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d580bf031011d1e1e022ab1e1024f7cc5939f956 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 2 Dec 2016 23:09:44 +0100
-Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
-
-This might be needed to pass some custom CFLAGS/LDFLAGS when building
-rpiboot.
-
-Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebased on 9324fd7]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Rebased on 20240926-102326-0-g82d8755]
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d2f7585..9812d6d 100755
---- a/Makefile
-+++ b/Makefile
-@@ -3,7 +3,7 @@ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
- INSTALL_PREFIX?=/usr
- 
- rpiboot: main.c bootfiles.c decode_duid.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
--	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c decode_duid.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
-+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c decode_duid.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
- 
- %.h: %.bin ./bin2c
- 	./bin2c $< $@
--- 
-2.45.2
-
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 413fe88f03..e17be5f411 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2ce52a9f1de1aab39daa10fa487c55d20d34f679d11b1a1743d0ef81ffb3c726  raspberrypi-usbboot-20240926-102326-git4.tar.gz
+sha256  339b1e2a0853ad700339206a2424c3fc9559518bc37ebfaac76b0484cf6f5bdb  raspberrypi-usbboot-20250227-132106-git4.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 3135741e9b..dd7a2a1b24 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 20240926-102326
+RASPBERRYPI_USBBOOT_VERSION = 20250227-132106
 RASPBERRYPI_USBBOOT_SITE = https://github.com/raspberrypi/usbboot.git
 RASPBERRYPI_USBBOOT_SITE_METHOD = git
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
