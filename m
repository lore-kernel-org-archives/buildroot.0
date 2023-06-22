Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF33EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C35841F8A;
	Thu, 22 Jun 2023 16:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C35841F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qouUPftHSUPa; Thu, 22 Jun 2023 16:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4309541F73;
	Thu, 22 Jun 2023 16:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4309541F73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCD91BF484
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036A1405F9
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036A1405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6i8ETJCnPz5 for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:49:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E9E2401C2
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E9E2401C2
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:49:59 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b5e4178817so190088a34.0
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 09:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687452598; x=1690044598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NiLp7ZJ+36jJr+nPAXU5O5UyYcxlH1a3eNA0lL8TN7U=;
 b=azaIL+/JLt3ehnDid2i7T3lKqRfAuRjofQtnGAzq3MVpmvpbqTVqgJzbNuCmsfsSev
 SFVRED7mUutJTdiSGS8mOD6vvWv7vT3YcDQ7iAvMJ1dfab5bYlxSpjt0HMt1Z6sY8sLG
 QWSiOGbfSQn12lYmyvvqiufuCkBZc2TH0Nr8h9NxaJY3o8bmtoSnGHxCC36llLP3MuAE
 bwQT/n9YrVO/cxdQsljE5Pz9Hrxt0X7sAeIWc+UacJoXmk3jaAPtSpcnXV6Pu3PF4Tb6
 jYde1cYOXrs/36c/YXQC38IJy5i+JDE0uAI9+VwE7kCbD74v7IXQC5vKifn/mveMBD16
 FAXQ==
X-Gm-Message-State: AC+VfDyS/2rjuMA8Z9Ep1KB1WvCTOVo8nSlevbgYiDlRgAxE2BIjtZ/4
 PcHsHmMmu11y1f6JbahxelerYFwks3JLng==
X-Google-Smtp-Source: ACHHUZ779mmYbjImFFqm53X7pXihXqBi+LEq8Dl4ON5PpQug9BQRfU0wUSRcgB62WgCOUKnn5iaBKQ==
X-Received: by 2002:a9d:5387:0:b0:6b4:57ad:3d19 with SMTP id
 w7-20020a9d5387000000b006b457ad3d19mr13506348otg.2.1687452597692; 
 Thu, 22 Jun 2023 09:49:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e70b:1e40:f2b3:8a14])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a9d6a83000000b006ab241d8c42sm2983877otq.17.2023.06.22.09.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:49:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 13:49:51 -0300
Message-Id: <20230622164951.1213353-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687452598; x=1690044598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NiLp7ZJ+36jJr+nPAXU5O5UyYcxlH1a3eNA0lL8TN7U=;
 b=r0h9+V3Xb1kDgRzAHka/qbnzpVbmDPEN3wbsCVzQQsB7VumGrMVknY0z9K7c/xzrW+
 RQxuHl4V7Y2iQeMnX3Niu4W/zEFgkh/eTOLQ524KQfj010u2RwimBCvonMq9HRQVvejU
 qvaNXUOtjEsoLGoOWkKTO6XoexV10dtX9v5w9vZpy5w/sPIYXWVWfl4+xHwvlwCNPqWa
 V4VLlVGLohCAZHbIjGYFmxOiwkmzdpjSdK3/SYFKEElQNB3wTlUhiocnenB+okGq46qx
 oj+Rfq7mxAOPsf0u2uPryghHmNYaf6dfLvQLssmLdzbQMcGENK2PoIkOsPf17FnN9HfQ
 JJWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=r0h9+V3X
Subject: [Buildroot] [PATCH] configs/mx53loco: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>, Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select  BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build error:

include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory

Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 212a032d84aa..d03c7d0916e8 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
