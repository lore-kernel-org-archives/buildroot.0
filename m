Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32207C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 12:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FFA6088C;
	Mon, 10 Mar 2025 12:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWhwU97wjkXU; Mon, 10 Mar 2025 12:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72B460869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72B460869;
	Mon, 10 Mar 2025 12:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08FBB1C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 12:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E031B40C71
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 12:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GAlp9woo3yL for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 12:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B3594095E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3594095E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B3594095E
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 12:08:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1torqk1Eio-00DwRw; Mon, 10
 Mar 2025 13:08:48 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 10 Mar 2025 13:08:31 +0100
Message-ID: <20250310120831.4017937-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ljO0s4QoQxaUwbiyspkTG76/YO254coKgnAXxyDbdHlnReUA9F9
 Y6r7uzPeJkvaP0Yjsq/jYqCbDw7daRW0zpfiFYcx+rVdR7ZVp/+KV3idOBwFyeG5KhWgBpa
 3VBe6gYLxpDXJyrXl2NjU+ITjgOqIhSO6OGtI9ypUXFD/PpKdvxbTGvT1FEYCYEu3yVntlL
 dxt1FQnyAVzSKWMSe1q/g==
UI-OutboundReport: notjunk:1;M01:P0:cGtU+C/vRH8=;Y/zffhk8ViAaaamO9FmPwFvSNQE
 aokHQjfLRRybiYS1ZI4UVE9Uc2f/vbHPHOtQsSS/zOYrXOZ+nbJ9w8LrtAdKkbch8zVBnlyoP
 doA/yNwo/mVSVuEpepe/LIwMAD5TPfjSbJMoenKUelTLNdJgpHh16cJpZb8mEIJAkqBLaxazh
 1NCMiq2qj8EsZ90cGdB80/BeXbFDlaiflbeOTyANdTwXqj0WnzDaNK3HjIzpMm6QJ719pSCd3
 WVL6lfj+etrkz1xLRinJXckscus7pnpSRPBwb6u2iFtRIyskDNtlMGlHk3qYDjBjZGnX3tkdG
 UM1rlXDdwBnxtKLGrBzCNCM9qjf7JNVkAPohfjr6XmI7nboYGXzyPZQRPd/NCM4HDOCEsitdx
 zeC82ExTGzwA9/V95OJvN8HdT3/oCxRxrDonNPhgN6Az/a8AWpg7Dk9a/CvxKgCj0G5PV8JI5
 mukWj972IsuWCIL4Fz0KQ+Xq0Zn8cawASY8T63xzu0ckM1JsINfOckLMlE4YW0GP0C1NQho+n
 ZicJOMbef1PiCmr8zSoypatkqMbv1Jw3CLv240ct9kdoaJDkB/7fLbwJZUhmUwGiO81a2npFl
 ++vpiR0+piNUgdzWf+7sfznosbxj8bwhJ1uL5OBgaWWaLYlRgyQwcmXfbtYLyifr/+85DTEFW
 N8yYf2p7RMoIEPAUGtO/rkkaefiFrNs8AQ21nRWiWE9twq1nZiQryexku3+m/PdiyRdGKg9dC
 Rtp0nHalmEO4tQaU3NDeLgCP/FKl8rYsYL1FM9wkdOoaH6MBgaksnVg22T+GlNcYyoUWCoOFB
 FL+rTJsRcqrZkx58vm1KVto1B45Pawtzg386Gkz8IkANcjcDiVKhcuR3AHYJkddO78Xslv0/e
 jB8ScyRusPyUuLq5q9pMuFvAk0F/+k1KkHLo5uPdmHRDOgtqjT+Ng8DJDD5VgaQsiGb/69AhY
 zQKjlbn7ApgR0S2mWmoNVOU5GjPqh75FQu+nP/yB5t2rg+gVjUwx1ADyl5cnyCVHOZGPckVY1
 WtxFeMT0G8v6Q5IhyDbm+NBigpZR53Uk3U5hXc9FLgeI4RypYwZjl6NS7JR79H07WwZWPqcaq
 DbSArPXE+gwPomC3aI2U8B/2w9atjAh+Vg0fbKWE2mXlsu5+5dnVQr9W/Bc8QtX+zqWqJafOF
 LMdvarzzae5xK7ZtgToIPSk79/biLB/6gJSFYSJ0vS7oaVKFNU/M7JGXOG87FvH+pmAitQGjY
 D4wmbSP9o0lkdOGgoQeGPE4GtFxc7q2Ai93bjTuf0z15hz24mV0nICiinQ1lDiUu3/mG8OUmz
 63JM0XDYX6Bbz6MJaQplBqBZ6vi2h/AOKKshXZrOB9gi5IJ+da+RygL+CWFnlwSXnPQAFvNig
 w2LeE2R2yXIyYjJYxzyZ4pfffkKpOvN1bX6HOa5l9/jnIgEbgg2QBllKOyEI/VcdOa/mswBh1
 czVn0QqNFqg7MzcR/manm4N7l/AHX+TR5P5jKt3PRnv6lSzkg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741608528; x=1742213328; i=fiona.klute@gmx.de;
 bh=pXUus0U9AtpLJlJXMgjPw8TCxwnQWNQUHg58M//EZKI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EaW59zhdLStfM8CP8pvHc/fkNETbw2TWmpwGIqtgS0ngvPZghM42+NFtbyjnqmVJ
 zwyNcIcYHePWwABHiXyJVXSaBB7AcrjDGhCmm1WQQdMm7E2a9iIJZ6N7JvNwrpLKw
 ZC8zgniW44F2rWqDXzJt/SjYB7IS6s58klK8lds5qazVZkvGl6QsHZ29aw0tNyiWt
 YmxZ+yhqyCa4uicDpfu7+T5oWqFhkMqeKXyHSdioqV64q9LYLbTJ3fpIXPjY94S3a
 u/xsS5UnrhXndaFM0rbsOYfV74JwTcL1AEK8wemqnpzHU99p7ZJ4xIMUjSMWUxOfx
 XZfdFD6LPT5lWii2uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=EaW59zhd
Subject: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump version
 to 20250227-132106
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

32-bit mass-storage-gadget has been replaced with
mass-storage-gadget64. Drop patch included upstream.

Upstream diff:
https://github.com/raspberrypi/usbboot/compare/20240926-102326...20250227-132106

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore                           |  1 -
 ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 34 -------------------
 .../raspberrypi-usbboot.hash                  |  2 +-
 .../raspberrypi-usbboot.mk                    |  2 +-
 4 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch

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
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
