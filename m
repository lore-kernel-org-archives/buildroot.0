Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83E460BDA;
	Sun,  6 Feb 2022 11:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBUSHDxrkfaR; Sun,  6 Feb 2022 11:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2825060B48;
	Sun,  6 Feb 2022 11:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 463B41BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DCB0401A2
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_ik9jVgPYti for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:26:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BD9400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:26:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GfgVnJtALX0z7GfgWnKnej; Sun, 06 Feb 2022 12:26:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644146785; bh=CXuM3CHrXEA39PWtyIVELfmoPzVkTZD4sJi508SfxJg=;
 h=From:To:Subject:Date:MIME-Version;
 b=bpV/6CJCdOzFYoKsHyGqEhdrRAHeBG65gEeo2enynXNXPEHPOy71dEzITbsmH45p1
 obhwep4opOTNOIIr0R3pUKTA3ilGGb+KYkvkUJ01nJlJw/6y9pQ9Lpxa5Bu5rL5/+S
 HMZ5rhYv5V1EiBEmW6CZVrvfoPKW7iqj9aj0ZC9AUXHZkQzm31Ulo91RGYYpF1zD/y
 V2UjDN4rPYdA0BAmZRXv4CVhWWZ5pAmPe1To013Okn8BOGFTpbhCxXF4AafiF5O8ZJ
 lz+ARLELQ8IKrlmU59tO23ZflnehbGj1tsJR/yqFpdcMvF4mBt6F18SRRRgfJgbdho
 zFg0V1VrOl9Vw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 12:26:20 +0100
Message-Id: <20220206112620.1637342-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFA4PqEXtmBBmHwg0D7fa6Asl/Hl69HVe9j90JC6UPGCmmGmbHb1QWPVdbBiF0HjkBCh5UmROG7nOONJ30H5qDbgHWlrkKJ7l36vasTgrphPVYpWXDRN
 FI6AhfzYSfuB9sBp9Wn3FTu+BNKmEffMJCIv26wHeZ/NyK/schHrN0kTpQN3a8yOqcN7tcuFxuLBGNj5/+2CAFmjokixY94GvEr/AIgxT3+V7MXYukIIdoa6
 DpKzSW5sJSdFo+ZbzJIFkZmQ7e/aKjt0VxLqregc33fmB01Ogu3E7Hvjp8ES0XsK5Nop5K9vbxJqeT8kt/61zozsnz8DnjtET0tB8p3qFfgx372/UP5bn72m
 UGbeAnhja21C4F8Fx+IfGj/8/87vzM9NJz4hJmDwKMp+cUb7M5Q=
Subject: [Buildroot] [PATCH v3 2/2]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035821100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add host openssl linux
V2->V3:
* set custom linux version as suggested by Thomas
---
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 3253bce401..c11ea2f518 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -8,9 +9,12 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.21"
 BR2_LINUX_KERNEL_DEFCONFIG="sama7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_TOOLS_IIO=y
 BR2_PACKAGE_BZIP2=y
 BR2_PACKAGE_XZ=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
