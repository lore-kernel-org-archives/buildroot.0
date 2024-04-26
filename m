Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE2DC4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7040B81302;
	Fri, 26 Apr 2024 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8rHf3pkcQih; Fri, 26 Apr 2024 21:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552378130C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552378130C;
	Fri, 26 Apr 2024 21:41:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B76A31BF344
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 21:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD4768130C
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um6gmlPqTpoJ for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 21:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D207581302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D207581302
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D207581302
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 21:41:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.221]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1sNjFB38JA-00kyP6; Fri, 26
 Apr 2024 23:36:05 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 23:35:51 +0200
Message-ID: <20240426213551.1106068-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:aFAFTfOhGgLUtuMM4ZgeV665eNkieOOp9TojhsGmlNJ2uYLGlen
 Yeq9FvNSz0ESSOl4/0fzOLmQrpJPFQXqDNhgsHDPFZwsOuw7EDBrCi4G8Dvd9ndZBik1E7A
 fBxFjLXvpmVf7a7pgcPhxJ9URU8MUUxCNHaYUYXQR6xX3dQ/wPQfonZwZ1gGbl4NbQUL2tr
 XEGSPfVRC6Kx5yUwHH98w==
UI-OutboundReport: notjunk:1;M01:P0:M2CCrSPURzg=;fxnPzkUEcBRqLr+ZhgKOZHig+/w
 LXet8sQFaDRxw5C+ShpHLprjKMAQWwO+a5ITyevrKfNhbL9N776M9b26B0qr0oKdURoUsy4GJ
 DUglhJVVYVGXMt2N7CdKAT3jd23uVSrFUr9bd2nIOl5gNFhUuQLLYxgukdkH4ER/gbN3CG0Qf
 39tNbK65H4vMaVy5eJhp+8RFDIIFwVSAvGb/9HwHAE3FbZXklKR5od3l50I42gaY3ttcad05X
 x13DQYANK07b92/hxsrXoZ+yfhwSdqIVt6/gmfuKZuWu4S1dcU9L0grY/miZIsROpheOiyLf2
 thC/ia7esZB7ZWtmyIwX2h3cn+jlnh8+lo46w8Rb2zqpqHa8DkfHLpVV56JkMNUlQXup/Xlu+
 nN+z+qXB21q/dAk8blQ4KIfwdTEb4z9PZhOV7XohF9AIW25vOl9Gs9iSKgr3uMvcEfCtYTVvD
 Gnieb7xR54MLdnZo0rKENlXomb41n1aDwEeRoZ5s72Zu+YOys7jYRbe2zr/BIyOkCN7ZaJYK+
 Bs/tIzAMKkG1JYj0jYhgjDdy+Ir3l8bugpZQtu/xbHT1WItq9W+1qPvmbFKU1eHvv0BBWbl3u
 gkiZfOqpCd69QiX0Wved5rXR5dlXodEImWeFGs8xW29oYsdl2xe+kzS530xVWdfAMlg/+3lM/
 C8nLJjOlRxvlXn61tojmuYY4sZMDWcb8GamPs3R4y97rcldRY9t0Cy/F5IW3BX9sAhm7Cqp4s
 t9cDvIs1gmhibc6FfnKZQqWS1+AlY2OOSlOqt5ZOJr38thZNYHSQeZFrUtVMwjHJcoNXzEW2T
 mpEHyAkbIcMZf2RLlcuD5LZl8/lBgQUA79HOIjhQeHPYI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1714167670; x=1714772470; i=fiona.klute@gmx.de;
 bh=KRUkd5TLgtXytPgVM7JFk8htRczSt91xlgIvhWeV5k8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:Reply-To:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NfFC1lGh18SJlWjVN4A7DJBQ8jtSaFlk0mE9XX4V8YbiKIUfc8pIaYXgedpsFLkK
 8rTpetCLkigDhZPsO+PpgYZRM104YAvF7byjcoeS1bWnf9ZdKt/gio6KuqezzvLxp
 7f/thOdrDNaAAYhrAUcazu1b2fAQsHN0UcGPfRYH/g8b+HdTAG+QdjmC/N7mdZNoy
 tRQ0ZMO9fuaakk8mYXwME44n8nKA9T4urwAknfAa/GiEmHJWymga1YGjmOz5YZlIC
 BPiCIkd1gVye47KhF5exyFLWS0kVeZUPLN32dIj5seCvmqijMIAZFGfwEYbUKd7RG
 4bTk9J6dKqoP8cqkEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NfFC1lGh
Subject: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump version
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: fiona.klute@gmx.de
Cc: Fiona Klute <fiona.klute+wiwa@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fiona Klute <fiona.klute+wiwa@gmx.de>

The "msd" (mass storage device) firmware files in 2021.07.01 don't
work with some newer CM4 based devices, the one I had issues with is a
RevPi Connect 4. Updating fixes the issue. Mass storage device mode is
required to flash the eMMC of CM4 devices.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 14 +++++++++-----
 .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |  2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk |  4 ++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
index d482b0b9d4..776f6d3476 100644
--- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
+++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
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
+index dc78cfe..5ada5be 100755
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
++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< `pkg-config --cflags --libs libusb-1.0`  -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" $(LDFLAGS)

  %.h: %.bin ./bin2c
  	./bin2c $< $@
 --
-2.31.1
+2.43.0

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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
