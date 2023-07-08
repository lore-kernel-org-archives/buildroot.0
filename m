Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B60EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 17:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E8481E8B;
	Sat,  8 Jul 2023 17:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E8481E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqW3VWT8LoHx; Sat,  8 Jul 2023 17:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC9481E85;
	Sat,  8 Jul 2023 17:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC9481E85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD5351BF2A9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 17:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6B3041781
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 17:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B3041781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aHaWMQqhlj4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 17:31:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 462AF416A5
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 462AF416A5
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 17:31:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e35791a83so2889962a12.2
 for <buildroot@buildroot.org>; Sat, 08 Jul 2023 10:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688837472; x=1691429472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t4UfrPCMLNxQuW44I04XFsHiWCCV3pLYW8iLeHWwvU8=;
 b=Sf+3jHeQ+l6bTryvkOZdP0A1GelCkqaI3SGCtfbHO2xxXLyHaMbQJT3WZtJkSZAENR
 MPv8uyavjRoJrqn3X9dZKqJMYEidDNHyBJTJE5+t2pzRsH1JkWvmJmU0273UeRba8XxY
 Gc7kKaAjIbbgCbeqcJvctBAb8QtqckTHN55scnQQRUTXqUoY4VM7PIW2Y3HvMd0zPLOh
 hfTHIryhBt2tCpsygLmtnPmoGx24kn7Efz0emFYhQdjdf0So0BHe1SA+kJUg6UESG+4E
 YlG7YCrV42TfdjAANW+wG4a/IZ5sbry7NiJxhyRc22J4PxqaMWzKOmN8GTHvbJre/jIc
 Dm+g==
X-Gm-Message-State: ABy/qLZg5QWDN6elzdih8x1RN2/t+Ejik1KGMzSi/oJCfL+KyiyiXc77
 G4jtBbWN+K/1/Go6ARe7AnguyunT2nHnJYebv731Dg==
X-Google-Smtp-Source: APBJJlGHnff6JSdkIdWAXtjztJKjSLNNgZ+iB6MPkphYEdjm6IAnHHTWOWq7EX+ur6sHmXPMPRZb3g==
X-Received: by 2002:a17:907:c004:b0:988:f1ec:7400 with SMTP id
 ss4-20020a170907c00400b00988f1ec7400mr6224287ejc.36.1688837471882; 
 Sat, 08 Jul 2023 10:31:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.steri.wh.com
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a17090690d600b00988b86d6c7csm3731621ejw.132.2023.07.08.10.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 10:31:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 19:31:04 +0200
Message-Id: <20230708173104.686175-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688837472; x=1691429472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t4UfrPCMLNxQuW44I04XFsHiWCCV3pLYW8iLeHWwvU8=;
 b=oHujKZ1BKHP5KPRSKDFJY7vuSSnN8TmHeM673sEy5vjcYMgUGtkBSIDZwt1QzMwjoY
 KMeODmjTW/XTcShErCXFKPvNM93KDBUJcALYRptMVB9lYm+vobkEOK66wim2kPOxv740
 FURQwuAdnxwWhRN5XfGPmbMqXmjMn2MTplaXQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oHujKZ1B
Subject: [Buildroot] [PATCH v2 1/1]
 configs/imx8mn_bsh_smm_s2[_pro]_defconfig: explicitly set binutils version
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit fb50eab8a5e6b ("package/binutils: switch to 2.39.x as the
default version") raised the error reported by Gitlab CI.

I tried to bump arm-trusted-firmware to the version that fixes the issue
against binutils version 2.39, but the subsequent board update was
unsuccessful. Therefore, for now, it is better not to change the version of
binutils to ensure the proper compilation of the image.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996179
https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996181

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- add `Fixes' tag and change a little bit the commit description

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/imx8mn_bsh_smm_s2_defconfig     | 1 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 8b2b74395efc..55d05393e184 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index e9ff244a3555..b3767b332e84 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
