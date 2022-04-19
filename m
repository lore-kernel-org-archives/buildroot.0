Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90232C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC57415BD;
	Tue, 19 Apr 2022 19:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ye8Cuirp0YMt; Tue, 19 Apr 2022 19:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8A4E41592;
	Tue, 19 Apr 2022 19:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 516D31BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E51141592
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u53eI3GuHDjy for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:00:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1475341588
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:00:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w4so23681519wrg.12
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K/d0u4uCwExQ3NUCzzTDhWDzU9HbYqCEvcPDr8XZGE=;
 b=NytFWkFko7mizCQmvOTT4r3ag20ADO80j5xgyr2Xoennkc84tJQCpmF3dLN6UVuRIh
 lUO+x6FO6+e9w4dBMWJ6w5/kuKvCF2b5VhTXrwczTGD6AgWPv7dBes90lJyT11Rmv/9m
 wccjNeOnRz+t3OydYKJWGIkskKAY+GOgk+pKMLhcPuJI3y8lfr1sr4gO0vG5mr04ZthC
 PmqSDBTbrmBkWUSq9ilgVn0LY30+/xgm60/AkfjYD0cH5klSk7LELD1KhU54rsE2LdWk
 N1BfhzwHvVi1bAKNT6b/ZIX34kcgZSinmAHJb6i9s0CJkby0te7EsdKpeInzgus+eC7t
 kOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K/d0u4uCwExQ3NUCzzTDhWDzU9HbYqCEvcPDr8XZGE=;
 b=qeva/zRr/e1h4FpbRewZhs2IOT1BII3igAosRtWhS/icGFJEHGOHSegPkSfldxMAUC
 ciZWJF86CT1cUz9jGDdBPSg37YBv+FAj0raZjw7nehyypxVyarezw3AuwRhibpH+u4Nr
 j6x7NfMaZRbrY1B66NpEqDCo4hhMOjOllGySRkCXYcjBGCIQnbzOalWa9p/Pqi5xCqKY
 ullOLbfE14iSJl95NtXdkzAIrOSAdJxokpkGm6TphWJT3uIvp3aU4uSkZEU8qVPSmFT6
 xl1X8+eZk2dW6YBCOGxmqUxxaSuEyUTwwp1z2S+xq410yJA+PChGa27gPooSAQAr5NQ+
 86hg==
X-Gm-Message-State: AOAM532/3xIb0/ZI/QxO6xjz54lqUzJbuHrV/3Wc+rwKMJNvbmIJi1PO
 cQ9Z050h7oObO4zENKWykZHtmTReGGc=
X-Google-Smtp-Source: ABdhPJyAiXV8S1/O6uOdn1PPuj5Fy8Ke5F8JUodiq/xp4um9fYgZf54SIbUAX1KtEZooR0Jb6+p8wA==
X-Received: by 2002:adf:e9d1:0:b0:207:b80e:dc22 with SMTP id
 l17-20020adfe9d1000000b00207b80edc22mr13095634wrn.405.1650394827942; 
 Tue, 19 Apr 2022 12:00:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b002060e7bbe49sm15657630wri.45.2022.04.19.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 12:00:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 20:58:21 +0200
Message-Id: <20220419185821.4087483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/batman-adv: needs CONFIG_CRC16
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONFIG_CRC16 is needed to avoid the following build failure:

ERROR: modpost: "crc16" [/nvmedata/autobuild/instance-6/output-1/build/batman-adv-2021.4/net/batman-adv/batman-adv.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/64bf0f89ef444dda4d1277c0e46d189ad2515713

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/batman-adv/batman-adv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 838f9b1851..6a1aaa699c 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -35,6 +35,7 @@ define BATMAN_ADV_CONFIGURE_CMDS
 endef
 
 define BATMAN_ADV_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC16)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LIBCRC32C)
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
