Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F1BC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D6F781DF8;
	Sat, 30 Mar 2024 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2Xt-m-NADFv; Sat, 30 Mar 2024 21:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990FE81DFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990FE81DFB;
	Sat, 30 Mar 2024 21:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9821BF4E6
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 283EB60616
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mptoS0KHwhHD for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 21:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C30E60613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C30E60613
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C30E60613
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 21:22:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so32864551fa.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 14:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711833734; x=1712438534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDwtxc4CfCQROUtX9+b/ZEchrgSuA9ysH5ojJRF8Zpw=;
 b=vV0X1JHNne0q5/JiZvmGmS21fymvaq+Dm1VsKE7dB66VZjeSKyiOp5UfSnLfWdcv5b
 UQtqb1Xdjg9hcUH/R477pv57cL2f/y7/zK00FaFSxcjN4A1rkNgs7j4gHR+7VKrf0rqn
 WZrofXynUau6WPlLRCinrwBiZMfrwhLYVl7JdwURhPl7asdia8aBToHUleHEAnmgxtWK
 NIVXsMtnY8Go0kEs++WkmSqYxqZIDrdmjdxgCW9MSFWrUYF/NV2j2PkH6vtiz6ys/Px9
 mCfVgP25eRTHnQCh0dVzIbxdVn5WX57/8/aAz1U/4Uz4ZTkPXgsWQcsAOjcn/YU+wulN
 VYUg==
X-Gm-Message-State: AOJu0YwthM3ViLt2opXh+aGqYHVpxSV1e5YYt+/QuPM1Gt9tXpvUHz8B
 YyMmFnQKWYYGt0a4HVxC/Im2v8YW5YFzKaWF+F1ENYXzVL18Jz9S9U2aWWh9
X-Google-Smtp-Source: AGHT+IFg38oayNwAZ1eaR25vyADiWSB7TUWC6xsWR97CWe54h8oIEcXOdPwe60GYY8c/3gkJPwDeQw==
X-Received: by 2002:ac2:4da1:0:b0:515:d1c8:e486 with SMTP id
 h1-20020ac24da1000000b00515d1c8e486mr2936138lfe.35.1711833733440; 
 Sat, 30 Mar 2024 14:22:13 -0700 (PDT)
Received: from localhost.localdomain (broadband-46-242-12-48.ip.moscow.rt.ru.
 [46.242.12.48]) by smtp.googlemail.com with ESMTPSA id
 y22-20020a0565123f1600b00515cf8e12b3sm666529lfa.91.2024.03.30.14.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 14:22:13 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 00:22:00 +0300
Message-Id: <20240330212200.794927-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711833733; x=1712438533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDwtxc4CfCQROUtX9+b/ZEchrgSuA9ysH5ojJRF8Zpw=;
 b=REDcdE9Drw0edO0ZmVWEXuXI7Q2Vn4zLIKFKak5GhQwImq+AwkLCCwOP8m2d0pkYj9
 Hxr6taN8M/XyWZ1TdlFy1iNN7QBSzAknLstUN9yIAvceNYtGDeoArgcrf/6+8cLAIYHo
 VUwM5TbreYbPSQA71MjEF/pplLfA83cFa1gRveX15x7axBaSt1OYekxnjfrRoN0hTwhN
 /WroCxlXrXClDSkK+uE5J9NkFx2iz0yk/rTKNHR9n/Z5o/f1adPStZcIeL8ssBe4XYIa
 6KL2Dwthul02JLBndwtHeE7cZ/dbtxIDdFndNCt8q4nGSXgk02otijOE17k86HBfWW12
 RLKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=REDcdE9D
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add wireless regdb
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wireless regulatory database lists the allowed radio frequencies for
each local jurisdiction. Since linux-4.15 the kernel supports loading
the files regulatory.db/regulatory.db.p7s directly from the
/lib/firmware directory. Currently this package is not enabled and
kernel complains with the following message on every boot:
"""
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
cfg80211: failed to load regulatory.db
"""
Add wireless regulatory database package to fix the issue.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 6032544d2d..cba92ad93d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -62,3 +62,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index afb652f3fc..fe6686b4a2 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -63,3 +63,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
