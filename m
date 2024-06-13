Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC7C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 13:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F6206100E;
	Thu, 13 Jun 2024 13:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdG5Cacrutid; Thu, 13 Jun 2024 13:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7773E61013
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7773E61013;
	Thu, 13 Jun 2024 13:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E69121BF34C
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 13:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D10F684298
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 13:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56DiS2IFuVCd for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 13:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 195D780E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195D780E6D
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 195D780E6D
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 13:45:00 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7eb6b1045f7so37879439f.3
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 06:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718286300; x=1718891100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2SH7uJgGFnl20alLDbTx/6HA6zK/g7NXxDe5tib6PE=;
 b=b5zz25H+IDqX8W7ijp8tDuzkfq+43w9Llr/4KoIhvSP43s0cZ7bx2sVQ5bv8T2sIsc
 lcQ4hjmih74KOaKh/sr7R9SMoCcQjEzXak9xNCBqPYruDgjhgp1DKLM0bPMuw5RgbwOk
 Ch9Ezyy79wv2Ed7LQW+IaZLpRB+gsGSz0aBGbJA/eH7Leu5FVjAWeOzThZHhYKAyd2OS
 QoJJVKSQQaweXteqwi11xnkB4R5Z3d+qxy8E+w8YxrXVPcIDw3H6hQz7qIN8M4OQ5mDM
 x/JvFhmNxLUq93TykSXa0UjGxGH9BinzoHUXh63krE5m2aQs174u9j4T3oYuzTexRsRK
 GghQ==
X-Gm-Message-State: AOJu0Yya7tQExRNse70sgGJDwFe57vEecyeKs0aA90rZo0KlcP4u9KdP
 tFH/bojHPCDpSI5v9P078tB+H6aw/E3LoyIJdpMbxuJ/GwZLsEyx5XVxdg==
X-Google-Smtp-Source: AGHT+IEi2VmDYo8qn/Rmnx1gqG6QfBEec5FuMbLIrRF8CfyMsWTlyoEoswrXZrmAhvoKw6ykXfyo0Q==
X-Received: by 2002:a05:6602:3fc4:b0:7eb:861e:8bd7 with SMTP id
 ca18e2360f4ac-7ebcd0c6716mr565313539f.2.1718286299768; 
 Thu, 13 Jun 2024 06:44:59 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b956a409b7sm353661173.154.2024.06.13.06.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 06:44:59 -0700 (PDT)
From: lancethepants <lancethepants@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 07:44:51 -0600
Message-Id: <20240613134451.3523957-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718286300; x=1718891100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h2SH7uJgGFnl20alLDbTx/6HA6zK/g7NXxDe5tib6PE=;
 b=GOYBenENoZJNZg3TKRWGPRzbDE6PMWin3Z/NiDrMr6x1LPpehQoeRkmu2GlEfkiLB6
 wHvmruWxjgQieRY0GqA6IwSQc+WFOSQb1fyh/DM+EyMkRu9RnSaiuAJUTqnOcmpy51Ox
 /yptnLQGafZDo7y7q5S4maeqWEyYJCTrBKBcGgiVdBMaMPQPjdSV62Sdzuo900IC88y3
 Xau0zftVKAn8M0pcL9Us3fB+WS33sHmv04i9n79DW5lnXBZDOgsowrlK8fLJqV+/DVEf
 7HTSuR5n+MiabQthYNq4QIRSNUx9pXVo7farMieWXGLwWFC5HFdsc9QwjKv1h2xdCcfJ
 PuYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GOYBenEN
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add additional
 firmware fo Intel iwlwifi 9xxx
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
Cc: Bernd Kuhls <bernd@kuhls.net>, lancethepants <lancethepants@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Intel Wireless-AC 9560 looks for iwlwifi-so-a0-jf-b0-*.ucode.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8dcd57fb7c..13dbc6d98c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -583,6 +583,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
 LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
+LINUX_FIRMWARE_FILES += iwlwifi-so-a0-jf-b0*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
