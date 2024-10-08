Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE4ECEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B47B6063A;
	Tue,  8 Oct 2024 20:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtfjSR5ljsqy; Tue,  8 Oct 2024 20:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B09460658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B09460658;
	Tue,  8 Oct 2024 20:44:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1ED81BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0B14401FE
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJOMLD9E_sFO for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5FEA401D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FEA401D4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FEA401D4
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:44:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so62256835e9.3
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420293; x=1729025093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rafb1NsY2B+S++Wl+zaVYilPKWwn7swRi/kgszOf16M=;
 b=B+eOlZOgA7SOM3nmvRD2HgEg2EFAIL/MY1bLsHLQz4eBfj0F9HUjmHN5XRHq+LP0fc
 6XhlFjHNYGmnsEf97kzVmQdMDpYEN7l3Twq+cYbwQaNazfuODNl2xmFbei2+bDiO/K0d
 bQB38sizN/zgpgWHZkcnjBBw+nC7VZVROlz6WNJxJf/CsGTLMVTMF0NXYD+u3D2Gzql0
 nEoX37q0ujI8Z6EyywkgyNOXzTbpth7BxdgYH/bCYQOxEQDr938SOhBjwFGlnlC94ALc
 kRei9zIdhT0teI49IVE8r5+by//U86AK7rMLfUdQOdnmsjLF1jtct5YtXESWWVnuuX3n
 gEWA==
X-Gm-Message-State: AOJu0YwdSD1NEmvKtmLyEBUgrEpHNninmlSYByok5JdzGhvcTMDWSqCa
 ELLX+98BTtP6OCFG/b3NKny/k+09wZ1LiafsF6N3EW0uHD4nGg1pcJPinUTXcIPSwA4lwVgu70z
 hw8w=
X-Google-Smtp-Source: AGHT+IGbKEPeDGmp0jl28vOmJ+EOTOlhl0Smwi2qonldzJG4gND5x2AmGobYfPpp79Twm1CTS3F17w==
X-Received: by 2002:a05:600c:4fc6:b0:42c:b52b:4335 with SMTP id
 5b1f17b1804b1-430ccf28421mr139745e9.10.1728420293458; 
 Tue, 08 Oct 2024 13:44:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430d6fab661sm31795e9.47.2024.10.08.13.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:44:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:44:50 +0200
Message-ID: <20241008204450.3838045-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728420293; x=1729025093;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rafb1NsY2B+S++Wl+zaVYilPKWwn7swRi/kgszOf16M=;
 b=C7IubP38bO8zZIc0gdvOHOi72V/cpKrlnHXC+8gBZV5KA4VNx5JilmBdV7zeqLehAy
 FbPf+dyKQ73TilAPRHW70ttbtDw3uBhXNqk68kwxnBe88tBi0dX3HZO0Jj76j8MbZhPo
 VutFbamk7dDBT9Unss3efjnZ9C/jUz1QWEibE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=C7IubP38
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.112
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.1.112. The size of xipImage
has increased by only 54 bytes (1669958 bytes compared to 1669904 in
version 6.1.98).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 88e1ba4660dc..fc2057c3f249 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  97cdc9127c7700556ea0891267a0c24cf372f4b81636fb8203a914f3a69f3406  linux-6.1.98.tar.xz
+sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 41970d469d90..33f725e18530 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.98"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
