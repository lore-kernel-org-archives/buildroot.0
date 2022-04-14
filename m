Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA4BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09CC8409F8;
	Thu, 14 Apr 2022 19:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvETY2E4Wl7w; Thu, 14 Apr 2022 19:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2350B40286;
	Thu, 14 Apr 2022 19:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F421BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC2BE40286
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuHsjUD9Ww7v for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2CD440142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:40:05 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d15so5494924pll.10
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrvV7PRg/d2XtzD/MzkkJB0Neu78MMY38WgN9DQ1hYs=;
 b=UupmRnxYvsx0qCO7XPJY/xWodhyWZLbzdb+U/ATw3KD5+5BSwBDnraxQRN3BxYtqlU
 oa4ZOxZabaCDtPMRU2nGiI8S/LrSfTpL+xJYTmbxDNHUZZrOx9+2ipXL80XlBAm2S4uu
 DPoxqetqooNsaPH6ZG/3V4fXGY/zl3cB1k3I9keUiGp7V7IZki5rxAWbL+YRWAWh0Ejd
 kwAWc+lXLc/enspd+XHpYxgjFD/paLseLt2vnQRPDVtUe99rUXE35Y7VuBkLLiOnkJWl
 4XUTYG4WMBEBpyJw4aMBULbhxMUDbuiKKHvJ3Tgqt8ONAm/9kUzTetT9DZ+68LZx/STz
 +lqw==
X-Gm-Message-State: AOAM533vIB/i5cvLQkLay3E/nxJcqM1c2/iMpM8tQA7aVdkuYz8YLri7
 gGF1ic0FaEZY+oipvpcuPcWqrQCvGnQZHA==
X-Google-Smtp-Source: ABdhPJyggjeQ/8zSAg3azIeZB/pmfIGPPZ/H6q5wzdvdMYLw2hOcAgqxlgtl0inDkADgsbPT5kwlqQ==
X-Received: by 2002:a17:902:b495:b0:158:8318:4cf9 with SMTP id
 y21-20020a170902b49500b0015883184cf9mr15923396plr.33.1649965205010; 
 Thu, 14 Apr 2022 12:40:05 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 w60-20020a17090a6bc200b001cbc1a6963asm2710312pjj.29.2022.04.14.12.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 12:40:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 12:39:42 -0700
Message-Id: <20220414193942.422360-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: add support for riscv arch
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the supported "riscv64" GOARCH.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/Config.in.host | 2 +-
 package/go/go.mk          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index e82ab6e81a..8be86103ea 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el || BR2_s390x
+		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
diff --git a/package/go/go.mk b/package/go/go.mk
index 3df16c9a68..ba0da74b86 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -63,6 +63,8 @@ else ifeq ($(BR2_mips64),y)
 GO_GOARCH = mips64
 else ifeq ($(BR2_mips64el),y)
 GO_GOARCH = mips64le
+else ifeq ($(BR2_riscv),y)
+GO_GOARCH = riscv64
 else ifeq ($(BR2_s390x),y)
 GO_GOARCH = s390x
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
