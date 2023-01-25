Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F56DC54E94
	for <buildroot@archiver.kernel.org>; Wed, 25 Jan 2023 08:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED53B61122;
	Wed, 25 Jan 2023 08:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED53B61122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WP6i5vQbehtA; Wed, 25 Jan 2023 08:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2346111F;
	Wed, 25 Jan 2023 08:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2346111F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E69CD1BF3A1
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 08:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD844183B
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 08:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD844183B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeQ-7ZPSRZVQ for <buildroot@lists.busybox.net>;
 Wed, 25 Jan 2023 08:37:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92F941838
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92F941838
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 08:37:28 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B08D15C2784;
 Wed, 25 Jan 2023 09:37:26 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 25 Jan 2023 09:37:24 +0100
Message-Id: <cc6ec5647287b0814750a7561f656efa684c354e.1674635820.git.stefan@agner.ch>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1674635846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=gKTaiUBLhV6ltzs0eFDR+7229jcgGWe9TQHgcdQGTF0=;
 b=jezb/Sh2Q1iFCzMlDSoqoXgJR2xjaJSafLlXzmq+D8XKBQL8Ik4GxYjC5Falx6TcVlZVBo
 s2vkgU+THEL+7fGJU1SCBBc+xxehhv8JWUkAqPXKueA5Zrdv+kSspX1lvhEKTaFWsY9qe4
 HJL5hGkgzuGqUgHRBIdVNLYlKdwyE8Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=jezb/Sh2
Subject: [Buildroot] [PATCH] package/linux-firmware: add rtl8761b/rtl8761bu
 firmware
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Deploy rtl8761b/rtl8761bu firmwares as well.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/linux-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6990ef38ad..9d9d12bd5f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -71,7 +71,9 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723a_fw.bin rtl_bt/rtl8723b_fw.bin \
 	rtl_bt/rtl8723bs_config-OBDA8723.bin \
 	rtl_bt/rtl8723bs_fw.bin rtl_bt/rtl8723d_config.bin \
-	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin
+	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
+	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
+	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
