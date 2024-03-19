Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DEEC54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 07:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15B7640286;
	Tue, 19 Mar 2024 07:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hAyURItZARx; Tue, 19 Mar 2024 07:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 102D44052E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 102D44052E;
	Tue, 19 Mar 2024 07:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257811BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11BBB4052E
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCN9RF8U4xRZ for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 07:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61B9140286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61B9140286
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61B9140286
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 07:06:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso11045975e9.2
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 00:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710831967; x=1711436767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1U0+nPDl9e0tzZST78xkZKox32kTcNUbEh2IOsrx2ZM=;
 b=n1Jae+Q8TA74xkANmiBzotUN5RzAWTO5q8mhdn43nNhVFlPy5BdaDEZDxc1X4IZXn1
 xQHc3c6cAqW5AHCap1nVti3+FH4hUIZc1vzDpVFO18sZ1+TO5fEumn0aZBBwi2Z0e5KJ
 oduLvlBy67+UK3Gibhv9gdnMojpIvhXDSIuI3TROglAXE0eG1AkRTij9oO/0eI86teDU
 cjbwPs4X7sY83SarUGxVp5xubcMp2iKQnd1ZBAFddaJSiO9vC40IQPpWnd0AfUg1TXiX
 APcw5o6CeuFCrM3Ztoo9ELaO7AkJbcc+rdmerCxYMs/n/ahCKL1F+aD8RNhmgjJkIBdQ
 h1gg==
X-Gm-Message-State: AOJu0Yw/IF0K3Uhip+DmyoOvOcXitXu+f59gAgWhiKItUjhsWOHHhfBm
 fEmOkScQQyWvjGyTTDOnRuZlLeNxtUr+ROeOy4VhjRroE+RKRFxo+k0ok2QFiip1dP1G8Qhgitv
 y9yk=
X-Google-Smtp-Source: AGHT+IHtJPNQg84AoZSAJrvhSBDhUvwxCbW3/162IOXnuxpTuQRODzcjUezfZPe/tTzWs2tPeq6wrw==
X-Received: by 2002:a5d:6183:0:b0:33e:cbf0:6dc1 with SMTP id
 j3-20020a5d6183000000b0033ecbf06dc1mr8673898wru.58.1710831967057; 
 Tue, 19 Mar 2024 00:06:07 -0700 (PDT)
Received: from localhost.localdomain (59.178-181-91.adsl-dyn.isp.belgacom.be.
 [91.181.178.59]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm11583865wrp.30.2024.03.19.00.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 00:06:06 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 08:05:52 +0100
Message-ID: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710831967; x=1711436767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1U0+nPDl9e0tzZST78xkZKox32kTcNUbEh2IOsrx2ZM=;
 b=VANFg6jTkEBbiSBX/07X2gTWMoLo1ELltuneWVkcY+TTfaAb0AgrxTK56MofwXZbA8
 xwbCthlqPk/oj0bWIFWbIcMzM4EmrVngEgS8GxTE2QIEhhzj0DU7q1yorfHbnmkFWoNH
 zuIV0+34xVeXbXnZPhWKj74bWpEtNVhaXs1Z1F/HhnxiW1AOzA+bx1axVixl9rwrLo89
 GiBw4xob3Ob+KyHPoS3VHVtkp7AowP5EjedFJFsRymt1EWhjg6xlLBWU1EAgHPaPvh4i
 OauLMSomR9ncJhVCuYnjRFVqE7CQq46MgF72Y8n3SpzO0Ioaf/hi6CCCN2mzQ6VWzkWU
 lbNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=VANFg6jT
Subject: [Buildroot] [PATCH v3 1/3] configs/avenger96: bump Uboot version to
 2024.01
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

This patch upgrades the Uboot version on the Avenger96 board.
Furthermore, as it was possible to manage build without upgrading
ATF, the ATF upgrade also moved to a separate commit.


Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

---
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
