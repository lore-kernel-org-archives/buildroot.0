Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A9C2BA1A
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC3C41438;
	Tue, 18 Jun 2024 19:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRZQHj4feSMx; Tue, 18 Jun 2024 19:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4EF94141F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4EF94141F;
	Tue, 18 Jun 2024 19:40:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 375A41BF295
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2154F404F5
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAfiVg5CHewE for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 19:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADEB6410C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEB6410C8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADEB6410C8
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 19:40:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1siXNh0P5Z-00pW6I; Tue, 18
 Jun 2024 21:40:12 +0200
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 21:40:00 +0200
Message-ID: <20240618194001.1907396-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618194001.1907396-1-fiona.klute@gmx.de>
References: <20240618194001.1907396-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:K/97nqEJSPSLQJ9shCzT6VGDMXxdb1zDgtQKqoEPnFdHUa90Yda
 SgFCyp5ucsVhFelcSLGS+PUu+JLB/rrxqAaH7+iAKMXk0NTR7wW5QwGo9Zw8QVjRn7QWqdD
 Kn2BTYbML2BCbLQr8OyQonL0HM/hm9ZaQehjCWiWrjoI87aUrZE7g36Iflp7SP3VSLPgWrh
 YurzLp51Dpa7pLtvSijKg==
UI-OutboundReport: notjunk:1;M01:P0:r1r7rCQhQuM=;JiGWp+wB0vO9o6RCiyBcVbBA/5C
 PBvPaN80TEy/TJn1fHvDrkjlsMsk8cWN1BtcbKpngIR77EHp9JRNT7UwxcLIEIacQrcOqNnyL
 7qrpHF4mW4ePsU6NqqX9RtScipXG+9XJCfpMwfNIJxwd/ahscgcGnO1UmLbZde1JxTb78cP9J
 V3IBC4Z/Pkk3k1UVWHjeJgP4x7Bh9bDjZ36Gw/HhKV8HyK1ZiTtvWstsdeKwuTPJyt76dqtAD
 MtbRwG4szNF/yal0iIOe7KtgBxm0LMBx11e5vUOTsupXO9FoEFmIBZVEoxMIHgPQlZRMgpW+L
 cjVXrwHLzjvOyZZDP9WDgMvWlojBEoI3tVWwfq6b9YlK4bI9dLffrC0JIjxFZ3xsdh5gJ8dkO
 efZrZO0mGgDc+ZUMAxXBCOPn6MhTkLWMfFzCch/3RvxiBP3raPU23SB6XU+MV5swPIvRXOJv9
 PgSQpaStb9YZcZPYQ0gZs4GvRnKrejTvzGEajiApfTk4FzhqTHBWm5Y8PrPIUmSPC3yAukUKX
 oDVeTA3c9b4gZmLtX+KbBJdq42zbgZlcjeOdaG+ldvurDSZRaOdQqdGSb8ay76LwrswOVwSRZ
 VLnZ4xCMwXny/fBDRTGUG8M70qrP8Fy3HqOEpbrxWP88Iq7GE2sZRWfFErDwLZeg81xMir+9E
 STFu6imn38MxMJD4Cigd5ehm8p84AxfexlHjrEb9yh+vKXtQQChAOM7WlK8LiyP67RjMiw35S
 J43sFGxM1VyQE/iRr6VdPHVUHYDjYuQex0Mk06QVNn94sroXF0C49hJyGAnqe87yB0kIaBqha
 m3pYlpCcWyqJWJGqEELBiKtGHzn0+xW02fTN1VmvhGc3w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718739612; x=1719344412; i=fiona.klute@gmx.de;
 bh=a7r2M+sn+H3RHx7gqL8lMNa03Ttkd6W5zt1pkYIoMDU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oQZr+AjbMauRBFDA5hnYk5NchJuKTOpgqXmyOwGqB4u4K5AGy/mjf+SRG2S4XRSb
 I4X/WiidZe9p7edaQhklnWE6HSw9bydNcQE3FSr21rpaK8Vf6qRpNU4tNe6T0j1At
 klh2dWuRoTsqGZSQzv9wuB0rrYntEcpF8ay1Fyrz5gUAADiNGr7SU0cNOsLYaYkjS
 GVZGX9QINFCZe+yXF1eFLCF3dxh/7mD7ehlUHPBW9Q6VgoeAuivwXdRaJ1XAcMnx9
 TpBIGf77pk4mKSjFhs9WbJ1hlvbY9FbI4NxPw453pWYS4X9uqqbEZ4paM4w9I7U/u
 oEyN+9tEdtC5mykeOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=oQZr+Ajb
Subject: [Buildroot] [PATCH 1/2] board/raspberrypi: Support boot.scr for
 U-Boot
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
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If using U-Boot as "kernel" for the raspberrypi bootloader, include
boot.scr in the boot partition if it exists.

To use this, use BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE to set a config
file that uses U-Boot, and enable building a boot script in the U-Boot
host tool settings.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 board/raspberrypi/post-image.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9b9eac972b..e4611d05dd 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -19,6 +19,12 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	KERNEL=$(sed -n 's/^kernel=//p' "${BINARIES_DIR}/rpi-firmware/config.txt")
 	FILES+=( "${KERNEL}" )

+	# If config.txt calls for running U-Boot, include the boot
+	# script if any.
+	if [ "${KERNEL}" = "u-boot.bin" ] && [ -e "${BINARIES_DIR}/boot.scr" ]; then
+		FILES+=( "boot.scr" )
+	fi
+
 	BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
 	sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${BOARD_DIR}/genimage.cfg.in" \
 		> "${GENIMAGE_CFG}"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
