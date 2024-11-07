Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACB0D43369
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9285E80C84;
	Thu,  7 Nov 2024 14:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCl99mGBcCxC; Thu,  7 Nov 2024 14:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F8480C33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F8480C33;
	Thu,  7 Nov 2024 14:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867B7C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 14:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 749E580C17
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 14:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTltAF9-9oLn for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 14:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B602480BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B602480BFC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B602480BFC
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 14:45:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.49]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1tEoUo0nF7-00VDQ8; Thu, 07
 Nov 2024 15:45:07 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Thu,  7 Nov 2024 15:44:53 +0100
Message-ID: <20241107144453.4093935-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:3MaC7BUlLpCXr9pVUpbu+7du9IHgVWyIFL4R5QuRuKjfU3l13N+
 W6bO/PNkjK0HPXZ2GcrPbIISGnVt45TtZNSa1yxkiWZ5a/boLoiuOtYtYUMk93A0BPDLHu/
 SssaUf73diDaZ2mMdiHyL7R9zC0H/vDDOkvtfeg2TFLfx0r1iz2ax+ouCHJdyY9Ddt+S1SB
 zxfKUYORsXYoAgfYlb3oA==
UI-OutboundReport: notjunk:1;M01:P0:WVhCYnO9GaI=;mKF5z+dgyyWLSYaZDYvfqbUnnRZ
 rvr3Fa8kqWaxnRaDrhBtVQv+ij6tDh8DaWTdXxlCtE24MOQoIMN5IJwZoS61DZbYykyHSh1g7
 mqYvb+GYQD6s5hlLb68Ur38lQZfs0Ikh2eVD+prs/ZIgGTFREkdHvZJpWtvwThU/1PLNf0nRz
 lgeifE4C9tRmKVQ2zck43jt9yHTmmeTp3kr95rmQtaZMHkNEvEOX0N5kIMAKhix+jQmJS9Bbb
 1QSI9bp+3dfywEUr/SCgAf2TSwixm4h3e3ySXzfD6OGrWMA0eExR4g0EJWJdhETELt8CmpIEu
 PEylGuudjO3HzUOlV/+ajJH1I+qhMXJOJf8E2fotcuHHjh0yNUOcZRYjuhSXouvlsae1EGYdT
 +qK44phzAwEaMrL3VzzLR463KKKi/+a/+HlrhfSe3nFEeOYmXpYPnHdB/7tdKBP/dgx8TYlqv
 BxDV0HF6eN1XPJ+Sfr+3MiuYIRo9JnOLZUWqxmkqWwlTJwIOt6rwj3I8rCPoIz+GWv4P4a9Vk
 xzGtRt8HPM1kMkZ1XeQckXIZs8FSJhhKANRkxpKgys/WRVT6qg5dmEQtY49xOIeT/MlgDkplE
 tGdcjsqHJU31xBpAHBCUcTNDIbqrqaRUuER3t/oGMvIGNF5s+ztgYo9qM5xfathGehbelx7o/
 Nv49lBu3TuU9eagYzL/5jS3g9BfTPhjEBZS2Nj0/GgQaU8Sd2UpSmhsghsxkO++eiXM4VvtXv
 sCS23qh/4h3aAFSm7lAWhfTjNIaClOJ/jmiuZLbLErX2Kipxell6rQNHMw3ToNmMQwhOMR5wr
 iLIvYERbiPmLk0CDSnxgR54w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730990707; x=1731595507; i=fiona.klute@gmx.de;
 bh=l7absCZuLS6wWWpEHp360CrRYZTV9iCmdHj/NI/ifEI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j0zNkixx84igP2qtGbzf7WNijgRswr4fSGrTz0q1WCMYd3RnRnyWsBhrZAA/p7w0
 YQs0gCGBWF7GCgLTA8aWEMCuozOuVhqVYjcrbqbGlnjq1cjIOSglWLMEwtMksHWfe
 BTkiztRYZIkk04TvOKbe/vzoksAGDL7h3bpJ5wOsE1bagFOIvN8xe1FCbcVGR7fL+
 8DTNxFIqiT1WfhUTBWbv8QVvm3JVDAIXuN8tGeemaAuRnTiCn0H3mNRWWf5HnuXZZ
 /3nPjFp2PXvc/CSwFS2KxHOmVCJ/c8MooGy3gxZdR9AmY8uG+UdKF9cJ7nNe2ip1S
 phi1mSu0FhITjiPb/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=j0zNkixx
Subject: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump version
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This version adds the -i flag to select the device to boot by serial
number [1], which is important when working with multiple RPi
devices. Otherwise mostly firmware updates, see [2] for all changes.

Also switch to the git download method for reproducible archives.

[1] https://github.com/raspberrypi/usbboot/commit/481c5e8a77d7bbf81060deb0f3efe463ec97243f
[2] https://github.com/raspberrypi/usbboot/compare/20221215-105525...20240926-102326

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 20 +++++++++----------
 .../raspberrypi-usbboot.hash                  |  2 +-
 .../raspberrypi-usbboot.mk                    |  6 +++---
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
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
