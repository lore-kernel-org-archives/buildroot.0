Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765A9EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 09:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0645E4036A;
	Tue, 11 Jul 2023 09:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0645E4036A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-DkyqbjwunK; Tue, 11 Jul 2023 09:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4314A40204;
	Tue, 11 Jul 2023 09:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4314A40204
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F36D1BF28B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A2E81F1E
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A2E81F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtqJt0rRdJpm for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 09:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C9F81F1D
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71C9F81F1D
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 09:45:39 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-635e3ceb152so27764546d6.2
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 02:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689068738; x=1691660738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VKcoaYl8PbR0yz7A+yAFV60ymy8Ka8dk81A1MW2TA8=;
 b=JYeVP3mtfYinQr+JkqH5aSWua5qr64s4tPnhlr00x6GRKvrxg9fwYMoCyZujhmVjeM
 HhwftAc3Hc5hi1QD27V8dD4+NSTLwIVa6Ml5K9ol2PxbF7jyoniaX9eONPnmlFp75/p1
 6s8WS99HTzp/AscyEXPg81IpfvRArJEClybghexqZxzZBdFZ/3H01KJXhFOXZZxIm7hS
 nhfXohsMkxw+UUIwgg44dgK2MW/N77Nxh0ZpwLSLDu1wINIQO/rKE0TicLTXXtZQBEOS
 XR6VWhLGF7L89dWdtrpWRXdc5lYXE+bqXdaAEYYOWKbRifi33rIz320+efu7OG9QKYhq
 bl7A==
X-Gm-Message-State: ABy/qLYvxDUUJaj2bFkgXBXhvTS0YNnD5SdEX2t/g9Dw2yz6TZLbGVYq
 fS6qhW9uNO54er4WaW53Lo4rx78yjKipOA==
X-Google-Smtp-Source: APBJJlHnlC8OnEsCBA/1v7DLMddq73fBHfwap9aoEVN5l4ftdplXEua+6Ikk0DeHiBND66gaJ5svLg==
X-Received: by 2002:a0c:dc8b:0:b0:635:e696:b33b with SMTP id
 n11-20020a0cdc8b000000b00635e696b33bmr11865442qvk.32.1689068734958; 
 Tue, 11 Jul 2023 02:45:34 -0700 (PDT)
Received: from xeon4.informatik.uni-stuttgart.de
 (cmlf1.informatik.uni-stuttgart.de. [129.69.218.20])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a0c9d48000000b006362c5760f8sm853069qvf.139.2023.07.11.02.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:45:34 -0700 (PDT)
From: Lothar Felten <lothar.felten@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 11:45:23 +0200
Message-Id: <20230711094523.2482710-1-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689068738; x=1691660738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/VKcoaYl8PbR0yz7A+yAFV60ymy8Ka8dk81A1MW2TA8=;
 b=ZyDCeQYaNsV6EuR1gzskug74csYJSrzUL+Z5bWusb10Efu2OLLXTZOTlFURXiG/Odu
 laLQ/cAqTjht89yoT6U9cu/y1QY+ueHYx/j77XNhblAOzr+1LOpMV1jksTNyhts7uN13
 TY476Et5IBqbhej9HxDRL5N3hrwkedrYNSzt7Vh5igdTXFJFt60JdeTrMo5rxmSexm6n
 Tbwf/A75jIPkiWK96jpvzmeXEy+SjZWmtv0+uuzVc4hT0OdP1Xkyf9mvw3TQPUItFeuv
 OozF+klCSRANDhmGtxkdiKLixPx/uQZWxt2lBXj/RTCuNtWlbBI04kW1ISLcMr7dUq+h
 pEFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZyDCeQYa
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: uboot needs OpenSSL
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Regression builds failed to build uboot due to missing OpenSSL
  library.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 3e7ad8d402..7e006e7a85 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -37,6 +37,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
