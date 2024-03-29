Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10406C6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A526062F;
	Fri, 29 Mar 2024 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY-vqTJwkQBt; Fri, 29 Mar 2024 18:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663C460654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663C460654;
	Fri, 29 Mar 2024 18:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2DD1BF3ED
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 18:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E7382670
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 18:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRD_ITRz1Pwd for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 18:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16F71823F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F71823F6
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16F71823F6
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 18:52:56 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6e6d063e88bso1440365a34.3
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 11:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711738375; x=1712343175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xnwFa4t7YwBBdqQlUEynyiSUSnNxlSJJDQDqo6gjxd8=;
 b=pj4zlwgCoDMuooGueL1vUcLjyKJJb6ciz9NLUYI3C1ssBuH9vG6i/gTmBfXQatavBm
 HRyLPn1YvNnhY5blLFhNloaJLUZpUuXT+kCEEXiTHLQaG28MI6BpxQgN8R2NkdYAGWir
 MlVOTDpkfZVIzRe6bpdlxN4nQbSgNZPctuUooLjvfIR7M7xx4Y6mWRzFSe+DSLvVLgRE
 FFNGT9H4IvaoGW2Io1yd9+bu28bw2NiKF/r6L3M9bkLEvtaib+yfgQWgT1Wvg/v8YEDo
 gOA6vU3eYaPp0vDh/Qr/lV3fJwR2pnYMOCn9IrfyFX5Bn+Lf/AUfu8hDDECew0Jh0Xw3
 Z6/Q==
X-Gm-Message-State: AOJu0YymZGbLIuV1xfZ+bG7JpWfvaYy1KL389DsXG87HAPkLpI8BJxDa
 1MoWxJ5lQQlpNFcSj7f4Sh6lRZEPDlfor6oWbRCIwAx+hep4Zx3k4gEO4anMH8MxQOdWCOCB2GD
 h
X-Google-Smtp-Source: AGHT+IF/ZJR39+15V0EgxBX5KIoZlMn4OUR0qvEDdmWVzzeiyXiEMufdIGzJE133IMuoQUeXjBjofg==
X-Received: by 2002:a05:6870:a2c7:b0:229:fce0:cf2a with SMTP id
 w7-20020a056870a2c700b00229fce0cf2amr3078986oak.49.1711738375353; 
 Fri, 29 Mar 2024 11:52:55 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a63ec0b000000b005dc5289c4edsm2861772pgh.64.2024.03.29.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 11:52:54 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 12:52:45 -0600
Message-ID: <20240329185246.387792-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711738375; x=1712343175;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xnwFa4t7YwBBdqQlUEynyiSUSnNxlSJJDQDqo6gjxd8=;
 b=Y7glv00AsR+j4o0OrlbrkztYk1CaaQ+K/WD/2R2uH/nxMSpgN6kOwUezem4vG1bXJn
 l/I5ZTzoOQbNtUGAm44k2RyFNicCXntKujoUtb67RlCsTMAO0eK0KryPvSfuDlgYL1fd
 JUENHZht93Klsj/VobtdXLGEUrv2POAf/rFZ4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Y7glv00A
Subject: [Buildroot] [PATCH 1/2] package/flutter-sdk-bin: bump version to
 3.19.5
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 1102c50cc6..b697b9cc90 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66adfe6b6559a2e2f1fdbf89c938d0af53add3860c854c79dbbd5452f5d2290a  flutter_linux_3.19.4-stable.tar.xz
+sha256  6590607e7f2fb23bcc7e0a2d6aac292f9208cbf12a40862c281058c758604fb3  flutter_linux_3.19.5-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index f8453c3090..321c08680f 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.19.4
+FLUTTER_SDK_BIN_VERSION = 3.19.5
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
