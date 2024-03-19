Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DBC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9450F406E8;
	Tue, 19 Mar 2024 12:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-XG7PJ2RnAf; Tue, 19 Mar 2024 12:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C4F406EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C4F406EA;
	Tue, 19 Mar 2024 12:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 492671BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3614980E46
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00MtnpDZ-gtD for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DD9081091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD9081091
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DD9081091
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:23:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d687da75c4so4722761fa.0
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 05:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710851035; x=1711455835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LjhbtftUiQ5bADno7Y2P3Jah1gLXtAI0CI0Wzd9XM2U=;
 b=AapkzTTKsnl0ovb2b+uUKvxYZPO02AdKt/qoe6fPOecfWxaQd4BEVd+wu1OAoILPpW
 RxBnz/gA72qIGdIAc0mAFLVI1di0CoDomG5/s42P+nKAZ9N3BVNb/RR9ZFCGcnim4Xnt
 35W5/xG2aEWXJzM9OckOyEJVokdVC99ufQ44C0Pap7IZdsHftRN5OnnLQUA0Hd5pOf9C
 mDXKEO00kdDBy8uscDpgG+N7iKTNerGv68k3B3/euH88Yl350uX/fXEM7G5DUs378LK2
 omHdg/4QVEdfc3/n/S17bYFxF43uB1cVI+3TcOIc7SuOQW16agbNYagmeml/fdqMb1CF
 HT+Q==
X-Gm-Message-State: AOJu0YznyYNXS7w+Cm8lchekexBVn3bNyhNhzXJBG6AYMQdMyg8+mDia
 582rPI4nQKTvLSiE1/08crrs5xQVVe0nNMuSyMswGjAVN5jOc4fSjEUxFT0Qm1sRWzla2iavfDC
 VriQ=
X-Google-Smtp-Source: AGHT+IGcHKVHdbO/l0pmcWDjJxQBYsrlGPNxGDDNO+GDJHCFjB83dS/OI9r+WbT7gG1tg3bnKWNHfQ==
X-Received: by 2002:a2e:9396:0:b0:2d4:2640:2eaa with SMTP id
 g22-20020a2e9396000000b002d426402eaamr9127045ljh.49.1710851034883; 
 Tue, 19 Mar 2024 05:23:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8b20:c100:2e31:96e9:7843:4bd2])
 by smtp.gmail.com with ESMTPSA id
 cs4-20020a0564020c4400b00568a1ce4562sm5551524edb.25.2024.03.19.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 05:23:54 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:23:42 +0100
Message-ID: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710851035; x=1711455835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LjhbtftUiQ5bADno7Y2P3Jah1gLXtAI0CI0Wzd9XM2U=;
 b=AnWqM5INCxwWO37zNFdMkcTUTJaJiZV9X83yRICTceLR8Wz2xZ6vknloLr1Ceq9cC6
 krbtre3blCh7hfxG8EtVCuDbu4j2X+0uVZYD3YDQ2eMRbqMudgQcCGzm9//1aOEgiJNo
 3tFjT0evs9ILHLefs5rf/p0Hjpi8cvuDN0LOHqpGBbxed4sjuYTT50PjxxhxR6z2XBVr
 7GV4VAnZo5MeGgt+yF1Ws5noeMzhb5WgdCYGKIrGVolXOeIUYl4gpSJwLwpXxN5XOkn0
 4pY3eC0QO+hPfOqZ3fu5BaNfXj6lm2ZXzQlmRti4m6KBqmyx/15oSIFo4QZpHfMN2iwI
 hoXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=AnWqM5IN
Subject: [Buildroot] [PATCH v4 1/3] configs/avenger96_defconfig: bump U-Boot
 version to 2024.01
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
Changes v3 -> v4:
  - Improve commit message
  - Modify commit title
Changes v2 -> v3:
  - ATF upgrade moved to another commit (suggested by Peter)

Changes v1 -> v2:
  - Uboot version fixed to 2024.01
  - Unnecessary variable removed from ATF additional build args

---
 configs/avenger96_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 536899583c..82702bcfc7 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -41,7 +41,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
