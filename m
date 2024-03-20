Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F34C54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 22:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6336840130;
	Wed, 20 Mar 2024 22:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZlvokqZ7FwS; Wed, 20 Mar 2024 22:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4736E416AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4736E416AE;
	Wed, 20 Mar 2024 22:14:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2491BF575
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 22:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 744178131E
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 22:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16DNOfeVhpLw for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 22:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C3C4812FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3C4812FE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C3C4812FE
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 22:13:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso8597365e9.0
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 15:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710972835; x=1711577635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGGtnjc5MtCPSK2zdcqbN24J3b4KS5gQc4w2MFGFzgs=;
 b=rdYB3pJhKCJWZSDHYOfP5Ff5y1Qr2AmEDMwO5PLTIoyk5CfLgqtCoMRVFp0mWmg/En
 DoGhvfjsYL++5fmkykbeXTD7gEiq2tjYdl9V09Jl9nPt/4yL+jDMrRecCet4sRdE8xeB
 IMm0AnQ8tPc1/WVBMKDWeh0IGa94ookJKBftqSM/Pd6m+AS9XuTTqVLDuK5gLtvkNXCo
 V78Cn3Q2QlZL146T/a2rxjYUb3uhiKM57W5P0sfsfu8pdW9c91mxywUG9LyDzDaTojCF
 q5/esFoPGycC2OHBgV+MgJ9t1t+wZFtN1ZxmuoMCg4ysMEXXEXzongeWysNJwtk+/hmd
 rcyQ==
X-Gm-Message-State: AOJu0Yxlb3IHA2unx30ogo218t7uKIee2C+fVh9XPhVaj39M8xEzMtXt
 gshjCK4t6lwiqAkTsZSdEO1QVyR55hLSZPDbkeQHhmU4gMsSEdgpJhSIEEeK
X-Google-Smtp-Source: AGHT+IGg24bYCXQBoFoOAg4aB/j1bK9da29U8LeEoeDWVmlXglBIWg+b8rGVpukNwLjIAHqnKnoTpw==
X-Received: by 2002:a05:600c:1d96:b0:414:37f:18dc with SMTP id
 p22-20020a05600c1d9600b00414037f18dcmr810655wms.1.1710972835199; 
 Wed, 20 Mar 2024 15:13:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b004146dd6bfe2sm2770020wmo.47.2024.03.20.15.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 15:13:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 23:13:52 +0100
Message-ID: <20240320221352.13766-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710972835; x=1711577635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uGGtnjc5MtCPSK2zdcqbN24J3b4KS5gQc4w2MFGFzgs=;
 b=mCjGoA3gcWxdwHmYSxW8KC55xnnMw5QfVnRgBRMGVBEIiOi/oi7kzfDu5Vh2rfQg+F
 YF9VyiJXyS8nK2+xVdIHlSaUShVR8TPo4OINpGPVVuiicnYaRlDXhD7Obg4nCw/6krH6
 sqtkHgRnZi7f+SsAYXEc1DnF1m7skWpCzp5nOGMBTiuqOWGnI7kUsD4Mqbf2sKKOTSPY
 Y5jP1pQndKlY7CYiglB5n1iCSQPk70DpcjkOgeHZsGSK6JgwpglioDZn6Etocc4dlOyG
 aaXM2v6/TFcNsOdkN7C7x7XrCJkTork0PvgFErHO6ngCdPtrKCpRUrmvf7kM+GGh83Xi
 t2Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mCjGoA3g
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: disable riscv with uclibc
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

Disable riscv with uclibc to avoid the following build failure with
uclibc-ng < 1.0.43 raised since bump to version 2.1.6 in commit
47b6737e841baf8b666ea9f37edc5f169652e88d and
https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:

/home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
    4 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Indeed, upstream is reluctant to avoid calling getauxval if is not
available: https://github.com/zlib-ng/zlib-ng/pull/1700

Fixes: 47b6737e841baf8b666ea9f37edc5f169652e88d
 - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 3a486376ac..346202c8bf 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_riscv
+	default y if BR2_riscv && !BR2_TOOLCHAIN_USES_UCLIBC
 	default y if BR2_s390x
 	default y if BR2_x86_64
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
