Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD3CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 10:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6008381AF4;
	Tue, 30 Sep 2025 10:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdzLXmCAHRfZ; Tue, 30 Sep 2025 10:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684D181836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684D181836;
	Tue, 30 Sep 2025 10:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A60C2CF
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C96C40C94
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHTGqeWSFUbd for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 10:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.13;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 697DA40C7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697DA40C7D
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 697DA40C7D
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:04:06 +0000 (UTC)
Received: from evilbit ([88.171.60.104]) by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MI4gb-1v8C3A0vDj-00806f; Tue, 30
 Sep 2025 12:04:03 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 12:02:31 +0200
Message-ID: <20250930100250.31565-2-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930100250.31565-1-nicolas.cavallari@green-communications.fr>
References: <20250930100250.31565-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TaUhEuely8sSKr877ZzMeFlOcjD5+xmF6sW/6v1/ePp8Qb1GfGB
 SOkXAH6VCCdrWugAuyjkVy0d9+uBK0epqt5luNIvOYhZmyZER5tHKLzYmQ/vd6adKghMXcm
 4X7RHah65uX+On4XsegLqcFQ7ouxOPwp2kHphBy3UzQLjbESUhAmQv+RAyewAL0VgRYkWyG
 0fxWjnu4aHODfbI1mb4KQ==
UI-OutboundReport: notjunk:1;M01:P0:9TkKxjiQiSA=;RXpl3yzRSQhdqoDgRxM018LXQYI
 SjW8bFl491l+SXP4VHEtws1z0h1ga684pr8YJqWOvXlaZ/A6ZP0qGy87HSHACH7ZfJQvJvfNx
 EQVr83T6QpNv77974ulLJLhQdX3fo/soELB5J5YsanZ7bbPmGY4AoRr2CcyYykuusYFlfdsYG
 TiTzc4oh1H3DQbC+XxftHRMTAkaMyjBN19AXTP2msnHb5jDE5H7ZgkWPrh578xany6BeVKLEP
 X+xt5q1YQpI5c6YDS7UF3Vo5AS7yuHNosBy81eV6lUl2keX1n8SjgsYlc8KWy7bVt/8XusiR+
 jr4T2fJUxtVGefOJyJOIoWfx3GcXQw8sLRljOf4TTu/SuMHdrW8c5oDtP1V7xQ4gZ4pWB0iir
 kQNqo0FTNQnDwvHjwOMXn2uhd2cTcU5EHreJqYlIR3RlSKmez8NTiVwnc/njBBQ78vu5pkTe8
 SxyND3ngWUt2oSeprba1aJcAuxtXDNPB0VScLWqy/eRCkGQ1wzeRMhfmg+7mGFKAPMEogVmAy
 dD6o15asAxZXEuqRW9tUgDTrmMm38J3CmlmnuOBpSNCseYswo3CFJuGqNtUOwqJnQwLUzgMnU
 jGP9G3gxPUYZJijabLpDRCltmcxjiR7RD2zisCoYTpaWZEvoENVB/lxTAP3Ik2uQW8XzDqgc0
 bXnvQm2oGuRVoxIdZA9v7R/xs9ebm00eJxrOcm/zdVRoHPGiTuP/EAxZyY2tZM2u+Ck5B5fQ9
 q45BACo+ySJBU2V5KkIlNHqFGJ77Mp0YuvApjK2bR29NWiHWaqphkrKMd/da09SSG785usC5O
 RhhgVttHnhd60cl9FZqvmBTpksC/YtfNpt5CDyybK93kGD4jm/25fZsDOhs7GSAxThfHJar9W
 RXpyhCt+wqqJkQ+ZzxT03fCjwnL/CaaTTfgJdsQXyxsuLAZ7LGhYvtaZps0ouka8L1vBt1noi
 ra+l2EKtodMeVyRxj28GbHy791Mi5PSWN26xBPmOzN8atWqMqBzrJqz6LzusXhyTTUtcRA24m
 5oq/Pr4c3a6twY4Jg8gWzb+SVwWNCD8dGb/bRxQX7NBSoxzuZuN66ANhjUDOhZw8d4KUP0/Zf
 6H75FjF/fD/WRdnZ/ALWuvloz9cdGogi8JBeJn4ahtJp2noXgcYiQuhepp35EekgSmf+muHmV
 XcH0Bz0p+Q/HtSnYFHLLkuB/Gz0w6VINL9BTHKnhJdzRtFW149EiDrMYys9ST1u2bwSAh3VHC
 K8vZ1/0Vts3XKcIWYta8/j+xicT1iuWLpA5HKbaMs6MxIy3O105zzOxWfEEBU05KwpXMHV77G
 ukddq0QuZDzw7sNHA8lB3ax/6h+ddzhXVvtmuD8/nPzr5klzqJ0kMllYfHK8ydGsxh2zUrMw7
 Zn05pqkWM01F0jStlg/1oPkQlug4bxe30LMmfqk4lg3QkoDw8RX647MzjIqD8BFJ2twA91Skl
 k3Q7Xk2lZMunpvhhWmuTQ+ryJUt33/nLvCzv0sHjL3ykVKwp7iI3rAbrPBVz3OiU+RSmGsKZt
 BuTzQMvggPLvjIGZpEUxfNMxNLKlopM5FGa+qAtkdKIY4m0/bFJ9KMu95pfdt7kQ7zQSDTPTO
 LopgEnvnZGi9osX41bcF2rh3Z/BORbSUlQYUotQmAporOm28H4twhGeP6ZxKY+VIqNyH5d/SF
 +yWUGmMo6G03yXWd2quxysuC/wMaIH4ZlHZz1fHjdcjjv+Ey4GHMiIv1ffHxC9Od0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: add option for
 ath12k firmwares
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

Add options to install the WCN7850 or QCN9274 firmware.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/linux-firmware/Config.in           | 12 ++++++++++++
 package/linux-firmware/linux-firmware.hash |  2 ++
 package/linux-firmware/linux-firmware.mk   | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1f33fbc0bd..5d802cd12b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -490,6 +490,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	help
 	  Firmware files for the Qualcomm Atheros QCA6174 chip
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WCN7850
+	bool "Qualcomm WCN7850"
+	help
+	  Firmware files for the Qualcomm 802.11be WCN7850 chip
+	  supported by the ath12k kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_QCN9274
+	bool "Qualcomm QCN9274"
+	help
+	  Firmware files for the Qualcomm 802.11be QCN9274 chip
+	  supported by the ath12k kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index e980010cd8..90a3d3e042 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -40,6 +40,8 @@ sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENC
 sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENCE.xc5000c
 sha256  a064cbf83e10d72579d236a1e36032681adb8e442943ff75b57020a82992a5ed  LICENSE.QualcommAtheros_ar3k
 sha256  337a55102138d7baa143ee4a4c6c91693e0113fece35d380b2a12109e8c23b3f  LICENSE.QualcommAtheros_ath10k
+sha256  097ceeb6f03dad7e74a2de0f217b1dad149989e550681e8726908ef477c9d58f  ath12k/QCN9274/hw2.0/Notice.txt
+sha256  515bf4c9d620a87458e4447fe01a0e9bc384d1c3e0037cc4c3d2037b1ff25525  ath12k/WCN7850/hw2.0/Notice.txt
 sha256  8c4f2bd742da678336ca582ac46ee203d75d77ce928797caed032ee0e3a2c7dd  LICENSE.amlogic
 sha256  630fd46c95d3ac6544590c2265ba7348fbc930fb386261a1c04dcd9f403645b8  LICENSE.dib0700
 sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENSE.i915
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 723b525fed..90064ea11d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -459,6 +459,23 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += \
 	ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WCN7850),y)
+LINUX_FIRMWARE_FILES += ath12k/WCN7850/hw2.0/board-2.bin \
+			ath12k/WCN7850/hw2.0/amss.bin \
+			ath12k/WCN7850/hw2.0/m3.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENSE.QualcommAtheros_ath10k \
+	ath12k/WCN7850/hw2.0/Notice.txt
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_QCN9274),y)
+LINUX_FIRMWARE_FILES += ath12k/QCN9274/hw2.0/board-2.bin \
+			ath12k/QCN9274/hw2.0/firmware-2.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENSE.QualcommAtheros_ath10k \
+	ath12k/QCN9274/hw2.0/Notice.txt
+endif
+
 # CC2560(A)
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
