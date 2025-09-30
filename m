Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87334CCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 10:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D7F81992;
	Tue, 30 Sep 2025 10:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV4cgLpe_dJ3; Tue, 30 Sep 2025 10:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD84816E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD84816E2;
	Tue, 30 Sep 2025 10:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A5ACF
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8854C816E2
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VM94BMYJIPFK for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 10:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.24;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09B15816DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B15816DD
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09B15816DD
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:02 +0000 (UTC)
Received: from evilbit ([88.171.60.104]) by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MxVfj-1u5nqr44ev-0155Nb; Tue, 30
 Sep 2025 12:04:01 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 12:02:30 +0200
Message-ID: <20250930100250.31565-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cvllrNcAIGrLZKKA0mYcA5d4Jdy8+HZCCu+Tf++C3W8JX2wIf8C
 Upy4vEpzEq9BTctxLldf6AHtvA+J4Ic5CXpvbRS7TOScM3juU7tks9896b4MkJauESgrUkj
 4Xw9ADcKV+AHm1F4yT1wBVRjt5trcTlmAbt1dtbw94nxj0RpXh9MwbPxKHiDz1RzH1y0B4X
 fRQo2fD9FWcuJm0vu0LSQ==
UI-OutboundReport: notjunk:1;M01:P0:17Eot0+jMv4=;+Gi3xxipeEz7wxDyQ5zOHnnF7Eo
 49IW3z57E8AeOJZ4lbP4aLKtXysWmPx/tBgtjvOxQcPRd/7EYayo2GWh+KXZbNVn6CoRUwAZq
 LuZqXg1p+dawMOILm5zXKy/b6Z4YNfeVd/Hnn2u0dZZXmlMiLnIHWn/IzPhoI29vuJs8K3/Ti
 DN4ZpO5FfcviUATxB4xh1FlBs1oB4NHcDigKD3dcqE2LeHE4zE8xXyp2KF1XzR64YWgBUTaJi
 TR1QRUjfDQYBIBgwuWjqdydF0dLupGj/CNoPcRjAvVANUEf8B9T0yirMReH6np1jzN4ReLU9K
 FtyUTPeS8PGOOnnaiihH0WZBC5MYqqUNwETKVhFZmU0AEV5hPNnceWQOADvMjsZiiI9AJ+qF8
 fvFrfhL0X2DmT2SYhHtt18S6w8vxIZ/DJr5/u/cFZyUJZ6V8pqINVdeVWbRgIDPS673WWJ6ry
 ANqsfrnLOkplpYCKLKvheJSFZYNOgH5gyupFCH0aZB/4WFVEt7EqvV7Ve82FusJ2GBCMJL1D5
 KCN41THj70Eqyu9T360bNxnjL2lQ0mWcf5MLfWjduIzWnKuuZCSH8jHrGwArPOX4fYkqdzQKq
 7oatgu5ObhfhaCzbxpTWal2l0aG7gG3GnWcYpXYyftzwrF0LkUTp6BUs9SmoJJUqPE4U2BeJp
 rOkt4AK3ohtNp2kUqZLNmWWvL7ABFK+Z9AU7aOdsX1r+nj0zPFLZuBxgXiCybO9wZfrmBKXsl
 CXMsyGLm7PDsyWRSeMaHGsUcDVrJvA32m9zfXGz+rA+JdBrbsD8M/0U7+P79SICY0I08Vp8Ny
 9Yy80R72HwQAST/UG4wVQ/DWtB1biYcWL5rJkicCjAGSteFLRRpoyFqOckLBC2u/RwEpbkcHS
 5IGbdwB8K2Yhd8+Cm6+bp/BWgebZsGDAJ63IET1KtxXoyfnWNl+q7pIIFDeMDekTBDwqUt5Sx
 Lj/fW7IDe+VCemeOgcLvrBB+oO7pcrMfKJL/93ObQxaS0gMrb9g8kSPy3BS7upnNDe9+H19W5
 lRuilMSxICOcs8PWy8kv/Zm/jBHcc0r4n2w+20bTA/dCEV2tUq8VzXK//T/+2QWg1P5SGqFDJ
 jbiIa+sk4cJB3wEtkxziqaD4zZ0JQcsrb41XOVWJTpdSXt1gXRYZutCT05dunraJ3gXERaU1k
 AF2Thb6r5zPAG639akYLIZKaniDdhALDD2nlbLZ6H7jfTcZC6jGd80+ETecoLXfA5WwpPRivg
 fpXZi4zMtFYbDq9y1p6PlDYb5Xov/ULVJVcX3oDwxGdcMWqjfA4lbyXVsg8tkARcLIzMZywV4
 uIZR0C4u4CmpK3bV536cr6BhleXLOWSXBT8fWwmdlKzrH+99S7L9yWMkR/AqE4Jkf8AgRBsga
 90GRuZyWkkWEgqZQstblCT1pflIy/7JitkcGWs5Du9x4y4UZd0GA3GVFPieTgIjCU7x24Oebu
 rBxf8fsH+Bz/wRNpJKbVpMYQ+ZQRM/WC9nfAv/opwRjqo/getBIjtsn0tyMh6U62gTRguKbkB
 +IXvcYBo4vPu4fzsPgrIbYcx/PiXTxGEae6BC3CMclQo6fuE/d7fbhlJPmLJGVQoUA0IVcY/Q
 KC8OnEDIWTQIiyYzbmlZTWR63kFv+uZMeLCWGMIOGJcItoFm9mm2d4ytvvqrK7/3MQStQRCSt
 YUXqq9tMrBoqcYWsj48cJ+wwcnOq6SmqgMyj+rmRcb4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: fix license file
 for ath10k firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The WHENCE file indicates ath10k's license file is
LICENSE.QualcommAtheros_ath10k license and not LICENCE.atheros_firmware.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 21d29fa945..723b525fed 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -262,14 +262,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
 			ath10k/QCA9377/hw1.0/firmware-5.bin \
 			ath10k/QCA9377/hw1.0/firmware-6.bin \
 			ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 			ath10k/QCA988X/hw2.0/firmware-4.bin \
 			ath10k/QCA988X/hw2.0/firmware-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 # sd8686 v8
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
