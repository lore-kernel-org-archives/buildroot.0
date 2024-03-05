Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22C1C5478C
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 07:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9E4B41561;
	Tue,  5 Mar 2024 07:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOFYuo0KGY-m; Tue,  5 Mar 2024 07:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C973A4155E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C973A4155E;
	Tue,  5 Mar 2024 07:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 423BE1BF287
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 07:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F8534155E
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 07:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIXV-jvG3Cic for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 07:12:43 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Mar 2024 07:12:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92E0E40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E0E40137
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=35.89.44.33;
 helo=omta34.uswest2.a.cloudfilter.net; envelope-from=karthikeyan@linumiz.com;
 receiver=<UNKNOWN> 
Received: from omta34.uswest2.a.cloudfilter.net
 (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92E0E40137
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 07:12:42 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
 by cmsmtp with ESMTPS
 id hO4srdRCHHXmAhOrmrByeX; Tue, 05 Mar 2024 07:05:34 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id hOrhrvHWJOQFPhOrkrM4Jc; Tue, 05 Mar 2024 07:05:32 +0000
X-Authority-Analysis: v=2.4 cv=CPwsXwrD c=1 sm=1 tr=0 ts=65e6c43c
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=K6JAEmCyrfEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=4N7HVCEezjgQvitgCjMA:9
 a=rsP06fVo5MYu2ilr0aT5:22
Received: from [122.165.245.213] (port=41896 helo=localhost.localdomain)
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <karthikeyan@linumiz.com>) id 1rhOrg-003V7W-0u;
 Tue, 05 Mar 2024 12:35:28 +0530
From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 12:34:52 +0530
Message-Id: <20240305070452.183573-1-karthikeyan@linumiz.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1rhOrg-003V7W-0u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [122.165.245.213]:41896
X-Source-Auth: karthikeyan@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFm5VQ6tAqN3Hoxpzv6JbAotpY1bT3Vn8DqQ39DuvpyOVOQMWVWFI10YzlIJIed16VppPXnIv/6VnD6j4L8Dfjk4aHJ80gXeSIqzrYUwbKm1xoLGiBrM
 O5VH8EbeBMOMHepupW33Yrnl8FQussS0yI75DaD0ICU8hG3SWKmlKP3bv67wv6AI7WqSDkaPIlTB71sdlv8Tlt/VRxzxi9eTdUM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dVuIWhMhyeiGewfMI/PS+W/RdOQsBEqvpKXFlGT/rZg=; b=EYumOBEt2CHOYR4JoyoUQDl1vD
 wK9Ua0aGLdaKErFr/RceZybbUh5h5TupTaXG2NJdqzfeZkUcIWvJk3zkLyA79E9Iw3k6JLQP9HEod
 bxY275nVyV+YAqRSIFEvW13paN45Y/kL/Kp/0uki+3eZMtkritghBdljGF3RSsSrJNSsSgIVS9fg6
 +WlkPOvSWRq1BHYa1F5aHAHMlYH+jxUWVqv+42LMtEWNCCQkEEXG6Eu4rH+1uocMm71aflBefYujl
 cdzw94BJuY225jBqC4eIwojy2JDu+J+1tddT41uLNhhQzSZ8JxtlafEf45OJYMp8d5PMsGdGuX1Nh
 EYYAB7iA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linumiz.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linumiz.com header.i=@linumiz.com header.a=rsa-sha256
 header.s=default header.b=EYumOBEt
Subject: [Buildroot] [PATCH] package: linux-firmware: update linux fw
 bluetooth package for rtl88xx
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
Cc: parthiban@linumiz.com, Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
 bernd@kuhls.net, saravanan@linumiz.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add realtek 8821cs bluetooth firmware in linux firmware package,
BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT config for realtek 88xx family,
not device specific config to enable, add fw's in realtek 88xx family
in build instead of adding them separately.

Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
---
 package/linux-firmware/linux-firmware.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60e8861abe..7e1e5cf6f2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -90,16 +90,7 @@ endif
 # Realtek 88xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
 LINUX_FIRMWARE_FILES += \
-	rtl_bt/rtl8812ae_fw.bin rtl_bt/rtl8821a_fw.bin \
-	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
-	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
-	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
-	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin \
-	rtl_bt/rtl8851bu_fw.bin rtl_bt/rtl8851bu_config.bin \
-	rtl_bt/rtl8852au_fw.bin rtl_bt/rtl8852au_config.bin \
-	rtl_bt/rtl8852bu_fw.bin rtl_bt/rtl8852bu_config.bin \
-	rtl_bt/rtl8852cu_fw.bin rtl_bt/rtl8852cu_config.bin \
-	rtl_bt/rtl8852cu_fw_v2.bin
+	rtl_bt/rtl88*_fw.bin rtl_bt/rtl88*_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
