Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED5CA101F
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 03:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547CB6F82B;
	Mon, 15 Sep 2025 03:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2Z08U5yjRTx; Mon, 15 Sep 2025 03:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BBE26F827
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBE26F827;
	Mon, 15 Sep 2025 03:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA6012D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 03:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100F740052
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 03:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_s-iSCkxp5b for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 03:41:54 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Sep 2025 03:41:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7E7E40056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E7E40056
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.208.4.196;
 helo=mout.perfora.net; envelope-from=alex@alexmclain.com; receiver=<UNKNOWN> 
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7E7E40056
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 03:41:53 +0000 (UTC)
Received: from localhost.localdomain ([50.47.161.26]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MSthj-1unvnK07gT-00Ij8Q; 
 Mon, 15 Sep 2025 05:36:43 +0200
From: Alex McLain <alex@alexmclain.com>
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 20:36:31 -0700
Message-Id: <20250915033631.2230670-1-alex@alexmclain.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:nXXFvFVFwNCl+jbEATK3pDVpiaG18uEDjw/HsqhngmTQ4L3evJo
 rIc7XYDUxxCxXhco01+6w2NoGa9LGCv6ev/hEAKUTw4RsKvm2gDkLd4sT/byTQkKr1wnitO
 iXgzwzGBchlk5hkk9m0hfi2GjQZbJ7n9JWCnDHs1fZIo9F9PBn6uXXeggiFZPQmtZPrZG95
 54KFItbKD3cGWAGTB7cRw==
UI-OutboundReport: notjunk:1;M01:P0:+kjZqIKYJVE=;mdJaM3Gm07vGcjAcvlxQelx8TfI
 KlHJbQwPLFE7uzvTXGAm+COZ61qwUITVTqyxm9QR8+kv/QD+RsGpagjUmeF4sCWgEadBlWaCL
 pW+lcCugv5pw+o/HAuSUpmIPLjGuYd4Wv7dcEh55Det5Mmd8bi5bQQsSIbgbm1x5Mpg2FO1If
 wO/tSs3pCXQ+Rmbt053UyjuPT5np//lqR1SDjXS2z3nX/4Uc1ugvv4ztuou/yRE3/sIlEPwQQ
 QhzjG8WwHMTcZhVkHoiN9jK4Sg+h0mhBFAQzdb1eyGCr28tBlB/GQzMIpqygm2fEuaJqKIdkf
 n0lD9fo469V7687u4U37Q7Y6nrjXi0fAaypbfRpDalQbiD7mjNY7sdG59MVbd6+olZATT3MZM
 6iOubWsdn5VYgtjFtJOANREwld17+QM0DSLh7n8c8sIiTBV2dsquRa4wwGFt4UBC8utOqbltf
 YBZbb/aHOwtQUnBf/3kcLskC7Ox6n5mR1COI3fmrjUchSyc2kNQDQ9lldPinDtqwQ01U+yFi7
 BhHdn63DmXjHvgqfc7HdxBrUXWiQ2YTr8vSKxnAA7G5jKxp0Jj+b33v04PLLPAjPmHm5sFtvS
 M1zx9hfb9yL4Pw01FIrb1bQdzo/rxrxaMNksjeXOP67p7RZiFtu8dff2NPRsjyvX/QTUsIp17
 AmTZEXfTOOd2rHvrukuUj+gfe9NuCAuRd+bybXCNw7R6EhTZYOMknxEZHzfIQUrD2OPS552pv
 +DEaLkFh3Eyl7HyljZ5WpCnxYcxGvA3EnqGNOm58GhZkn+tMofwYJrTA/mUMxcQQfsJNJkReU
 6Cw1BEJ2S7ov37Lb1eVP/xAmYUjgXWYcjKW0YdL8PtFzEt4e98rrTLPHBZgvnozi21Vh0ur0K
 ACcxh7XZuiMvRh1zRKGqXEUE1wpPTOskI5bEZObNbRLv1cTTWrsGchywYWhUL7o1l9gbsMio/
 Val22AqGkV3unvlPrwLLJzVDog6M5n5PZQ2VIZbYJSAiSLU8X5XPmXL/KgEC+ue+YzMc3oaua
 3dPPikcKuvGZoSaGfK02jRinnZeV5Ix09G5kolGiFPn+VphVe3ebTRBHtBbWfDzKUeRPyhWif
 0ou4ff0r/oqaiwtqvMAQNAzS4vWXnJ02Q9RvwfLAKWizNlONK1IbHU76HyRXUn4ZFBN3D0ff/
 SqLIrmKyK9sVdcO1K1u9Ap8kuzF4rl757cbbHMdMxOCpunmvewpaD3bTUksatK7TCfFA0WxKa
 1WTstNQ4FOok7jaSndAcjkLpKH+uVkvAla2SU1TxIVvq3JVUHuoiljy76qwWM3tl/LlEnJq/E
 S2CszuIOdazB2Lg8l2a7JetNnUcTDrzX4gcJ+qyFYJ2VzYNa/1qve4gCruaymXfDIPYQN6nro
 sFLKVwKKhTVQIQz6PSzHPMt5P0+n1NBWiLEi376KksSzfa3P5bz6G0lo7sBm9Hb/LPbXjGH0M
 BBkkcwLUVidFHZGKzgEOupXsN7MfVUNFJ+zFsLbRmbEIejk+7IcP5ze0ttv7VP1D7v4yyMu49
 hYib4XCMCBYmEFgdWDYbJp8pi35rERKJ/F4R/wI6a8/TpTYPStugQhfZutasWQylNvielYZkh
 +v5gZK8DpLeL/m7WPjRkfbVIAdslWm4fs1y7Ijx9ud8UlZ7r3UGC7+6RGRiOHr2gzQkC8o4uj
 G4HoVNGy9vaqBoyWnaMlXwzGVWP+PZq91j7tkvqj9PjMYtDlDUZdfWEUmxg/TqMkA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=alexmclain.com
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add support for
 Intel 6E Ty architecture
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Alex McLain <alex@alexmclain.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alex McLain <alex@alexmclain.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 7f1a789057..21d29fa945 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -642,7 +642,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
-LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
