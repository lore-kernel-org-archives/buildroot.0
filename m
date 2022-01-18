Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F642C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D49460D94;
	Tue, 18 Jan 2022 10:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBxRdwWwFaa3; Tue, 18 Jan 2022 10:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BED460D8E;
	Tue, 18 Jan 2022 10:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8151BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C7C081A5C
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITlS28sMt1Pf for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 976DA81323
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2fna8XG; Tue, 18 Jan 2022 11:48:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502930; bh=2LtbKq6a5I9g4nI9y4H/vnQWDco/7cuvWbkiEYYjA9M=;
 h=From:To:Subject:Date:MIME-Version;
 b=LteR1hMjucXbOj513q26F0RMgIjp9pQj+L150DtLHTt1UnVuLIFwBVDd/FpkzIxlp
 81nXq2oWiYc8lpaQfJo+US6Ew/Jo05PQHSEtlwKTd4C3fCwELOvG9zNOn+fuUZPEpY
 dD0o0xP39H6XWPsr2lQB2WC2oEudAroGCwlEGtks0aBwJeRc85YmwAoKm4y90sC7AX
 CizTEHdcgTCj9qEoUexjaCmE/hLT6oLioLBsx+8CdrDDuI/GIDYFiQM9TMleCwxYwn
 0GA1NWmxXouZtELBw3SBdWRGNXXEnGgM1LEhgLDfGR3EN1/Mp0eHfeev0QM6AK1+2p
 sm3PSX1OCkaog==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:35 +0100
Message-Id: <20220118104338.2081259-26-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPc6pYBQeeh/qY6SNjo6tUWpl+9xYIDyOFbzz5Xgks0vG/W5ZhKcULhacdNwdPi49KlLRPK2SfKTabioHAOcBaWnIczOqM5QeTemJKNPr43JuytVNjcZ
 p+wgQ5fnc+phGi7ZuLStctWU9jQLNNATJEK7QKjVYV6tXVTHraJ2asuht2xtWpWr1pfzcMy97ggcYgNPeEaJtqGJ5WuQ7n6fh9GKwY1wtGf3NeTY2gn9KQm4
 Oly1PrxmsJfkeZP92MSVrxf2Q2gYrnWrYQ280kTRwkM4zeTgm2KrT/Sz9AkdC9k0StczcMjZgFDaU7s/YM+I/1z8yo1pScGksuI2S4TySl/Fwr2IeL/FZBnh
 riWF4rRw4rkqPubUELLBmPH7YI2dOFbyzdub6SbA5FWr7vxzwpIuZIAbcvJY2twJfBsl8slL4HRVZhq8ew4j58F6fTXr/9BvVMLtohni6yGtIeoF1jefBIPk
 443C+pDfs/rbVCsKaKLGyCm/oFt8PPw4Phs267fTzibehmYPD5a3/gsb+auv13QXzyDK7/TdR+pGH75pqRUkE1oAzgK6NN0mwRK7WNRx11azXXF3deJ+VMq5
 xqjhb/RA7Dwd19SVcHCf+i7YpPLaF6/hcYHT+tXQlR00uZtPISq6E1LaJSwFuJBaQdTR7XL+XAF2MgelzGSjTiHQIpbGGQxbxTcKEOPpvdBYskn/rp/9Hz3h
 FUkXMmvbVZNkTRufqaMwqRYYCe9h7akNPYdHou/C94hgL//ncKNaxal1GtGSlkhtrV+SE1CHOHf6XW/gmliODtqd3ExUAzotpF77rpdFu630aSed4ZmbZxDC
 gdM92kjlkFRPHt5ofXZAj+bpdMQG4enZDHv+FeloWzR0ElTTBiIe70e0w+SyMA==
Subject: [Buildroot] [PATCH 25/28] configs/orangepi_zero_defconfig: enable
 NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has Allwinner H2+(compatible with H3) that is a cortex-A7 and
supports NEON/VFPV4 FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_zero_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 1c107b10e6..a0af809e92 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
