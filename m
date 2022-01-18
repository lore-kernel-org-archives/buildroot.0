Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9E0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF2460E57;
	Tue, 18 Jan 2022 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-0E11fiikIF; Tue, 18 Jan 2022 21:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F77160E53;
	Tue, 18 Jan 2022 21:15:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDBA1BF33E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA8D414C1
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-tYS_3GSBKL for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12587414C4
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642540477;
 bh=KNdQ9mB0aEyQFpWHxMy/FNBSocre5vX8jJaZPYZbMyc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=X4z/49EqWyNkLkX3sZ3CDo+zPMLK7n8k4seYlzaAJFSypi0+YFWpQdxyevOcyWwTt
 9X18abfSiOp6z/RKIjr4y2Ls40YvNrekpV1ycyWxn1WVeiv1h3IUHWfCJ5NFZMBjRW
 61L4xiBocoAcB1V0PVHN/jlclwAiq5sboNV4YtqY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N33Il-1mBJlQ1kgH-013OzU; Tue, 18 Jan 2022 22:14:37 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 22:14:33 +0100
Message-Id: <20220118211434.9854-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:O3z/9uVPqU143a2WMJjiKO0Ady2ajcZtVp+NCrQCxUWR0/xU8NZ
 fBhrFzZ0bbCrKdWhibNMhby5sw5z7pZO8EH0IddVkbktSVJYNZNcDQlLnmo3xWLerujtVfj
 /kQDwV3f0zpKXZa3YHz8RoqSnaIkyzI/35l7jXWm6i/1IU8ZjyZQ4MXno03uYl3f5/e+Mu0
 54rtcDjdJ4WAVh70s40mA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wLzsMrnq2Ik=:hKerwkgLCcJHUUkXcr3HB7
 14qV3I33xdsxzgHvMA0pWTvcnn3laLKdZQfwZGFypSK1GBjb6DjmXeLpEdTP2YPYqxgIkneoG
 N+PMezYxnE8PVWKIBt5AvIhOR27fs+4stnou99ujUvhL1QCu4DmiDL3qq90sa+G/C3reyO4Tk
 S4Jab4kOYMVNSbQ92kMTscKG30yiur1j35K1d7s2TE+YIfG6pF03llE/Puqe1sxkPEVrSgNnR
 wU95w+LBL9b0iL5rAf5X22Mc4NA4Hyp3BFheOycahf8fkzH2+ZyufvXclgvX6AbjICfKnGvcF
 FoKlByram+EO/SyJl4ECTtiMVS3NQfFZXPAe56z/fGJmUvh1yYEhz0C+zBwr8qxE391/xT8nU
 ej8+s/dmo2KSrLAT66sgoBUlQ5Uw85AtDPGuk3vnlVSQu5G+XzyWuNwZiu3X0oL5vNGchzYik
 5BfqDwn7Spg7ihf1Lx3MQq5eTcL/vSXuKAjbRV+PeSRE1E67kRfxzRSlrlX3wHL8fpSfucx8Z
 XsRSOqrpJzhiJRbW5vOazYumfpXt6SNmzJeY2Ape3tRG5ur86C9UGQZbxVCPn5cx2W+tfLTIu
 FZYdIB+lshQ3EFAyBCK0BBPEviZHJXHVlIbC0ZmxL5KuSXB8TuA073PCMC+yA8u77+hm7RZUp
 9os3uEXMT1JwZ8MJfkilfb4hoHPJ9J4NVibCViW5HHTOkVEFwlItd0kdmBj+t8gjxRTUdrBdL
 FgIdNy+RlPKJcKLFdVJ6/mZxUB7PMQPGKvka6o8cnQ9FKWu4pbB2kf6ANGl+VQMN0FpqNx41J
 OsQDqL/WD8Nc7muovqPVPKbrHkX7vRVmZP2qS8aaxjc2oTjPEdjEe+p1Te15acwpkEhrsuXmN
 rQVfpVV4gbE5rREiIjA4R+XwTa8moV9EbOuwR3IR/6VNoR3jVbHKDqlOCpDTCNROcf+mk+FLm
 HxF6aw4iFqWIAoYnR3KK1hkoVxONQDDNQvAIaJLCBWiEoXU2yXygY2rlN6VnaQqalsTNCO+Qc
 dDN8hcNHFq6oe5fZIqiG780XMJQIYPjinZxTVNenDMcQqJq6NzF6aCMvqZO45qDWGNp1SboyT
 GXxVw7njvL8qCY=
Subject: [Buildroot] [PATCH v1 5/6] package/rpi-wifi-firmware bump version
 to ea9963f
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add cypress files

- update links

Chanelog (since 3888ba2):

  - Sync with RPi-Distro repo
    Switch to "bullseye" branch which moved several firmware files to
    the cypress dir.
    Add 43438 firmware 7.45.98.118 + external clm_blob
    Add 43455 firmware 7.45.241 and clm_blob

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash |  2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 09cd197dd8..7ff47b8cfe 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-wifi-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
+sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  rpi-wifi-firmware-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index a467f2c7b4..b54cd359a4 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
+RPI_WIFI_FIRMWARE_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
@@ -12,9 +12,17 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
+	ln -sf ../cypress/cyfmac43430-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
+	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
+	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
+	ln -sf ../cypress/cyfmac43455-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin
+	ln -sf ../cypress/cyfmac43455-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
 	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
 	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
+	$(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
 endef
 
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
