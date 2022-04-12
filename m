Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF87C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793DF610C2;
	Tue, 12 Apr 2022 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4eW5QO0BjWi; Tue, 12 Apr 2022 18:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A93610C8;
	Tue, 12 Apr 2022 18:02:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B73111BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6E2C83F54
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CSDJEdcDXNp for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D719683F35
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:02:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e21so12373979wrc.8
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cwTAv0FW/4DU+Z6KRVP9ei+jsm0MIqwQrMv9uNmjRj0=;
 b=o0RK0SnHO0TSGu9VVaMhFNx/L8H+yp4IeAiXUMTx7mmtI1K4fHLfyA7+r9a3seraPi
 ex78yzpSilux/XJwQnRdc4WEn0gH3/WR8L0z/h6HPaircNcnNvmq8kZhTPCmjSfxF1J8
 d4Co8o6rh6Hp1n9rZ4wX01Bvl4m3FJdIAJBrO66/DJFvXt+lWM+meXRQ8w2NVyx1gDla
 NPU7srlz8LKCqeYXoIMzntAC58oK9IepOeRDODWPoF6UCJIESaDZ9gKNf0rdU0RNMkW5
 Mh7r5DZnPaSUXocTzkFfv35hf420A/g0MzcocPBJY616ghBp17GgTTLDoRHAZhJdIIXF
 PCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cwTAv0FW/4DU+Z6KRVP9ei+jsm0MIqwQrMv9uNmjRj0=;
 b=kxHwruLWDdN41bs7Dl+xn8PunDhO1AjoIZNrdcVnuyzoV8K3gCMKYOrLvbxkQgnl6g
 SJbwcGLEzYXvc0vw1ZIGPlGH+5YcRBjmDydlM5F+jVdNL5A2UkmtrDedrRce7ULtzw5u
 cgGUzbe6jpaIGuj6UfSQVm+t9KVgbl/YYTWeAYyRC8miREXtErJmf+4pQCiBRipbp2S1
 bGUfWdpCJIE1nzR2g+y5+e3H75jFLZ5JGVM4ysI3NOTzScG773zqgaM2VdtgD/mi0xHk
 dTVrPl33GzRRN0zLKSnU22UvApELn/4eDYWMDeJ8B1+CMRJB9Q03g0sTmPLmrRANFzRq
 Ogvw==
X-Gm-Message-State: AOAM531VhNvn1MrgpmDCCpLWDDMHNUWWvYIgoWPy+byhcp1Tj4uW7jGO
 jISX54J5BwJQ7oCrr/cdtvEdW+xwUek=
X-Google-Smtp-Source: ABdhPJxovy/9fWySVcDfmcSzOZSwt74yLmDtMYNIx/c2hbNpLS1CIh5kssa5puA7OhaLmGqoGhRNCg==
X-Received: by 2002:a5d:64e3:0:b0:204:1a79:f1b9 with SMTP id
 g3-20020a5d64e3000000b002041a79f1b9mr29229921wri.330.1649786545888; 
 Tue, 12 Apr 2022 11:02:25 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm153057wmq.36.2022.04.12.11.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:02:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:02:13 +0200
Message-Id: <20220412180213.2709733-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 6400f64b9..b0381474f 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.27.sha256
-sha256  31be59225ffa9920816e9a8b3be0ab225a16d19e4faf46890f25bdffa02a4ff4  mc-4.8.27.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.28.sha256
+sha256  e994d9be9a7172e9ac4a4ad62107921f6aa312e668b056dfe5b8bcebbaf53803  mc-4.8.28.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 678d687bc..ac12c2173 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.27
+MC_VERSION = 4.8.28
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
