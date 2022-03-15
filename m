Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434AAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E721B841F8;
	Tue, 15 Mar 2022 09:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IugB8ef3F6VW; Tue, 15 Mar 2022 09:02:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B43841C4;
	Tue, 15 Mar 2022 09:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4B931BF2A0
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 09:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF1B404F4
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 09:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b48KkRt-8dZF for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 09:02:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E83140201
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 09:02:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r23so863407edb.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNCwoH2hpNquTsCBkPtLpk/jG2F4G3C1+EE2vCHUNAs=;
 b=Oab3ICUYgsvesXZWPnDAcDL2xcx2gwEA5+quL4bFoCspQGbxl6jR61EAQzjsQJ4Obw
 vCd5UajtLvCcnI8Np64BAB6EX4OY07HOLO6DtR19LgrafOjiCrg55v1nd7mU47XUVcBI
 VfYVzGzLAjSqoz8iUPJ+Nwr8NxM40wr2TI2/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNCwoH2hpNquTsCBkPtLpk/jG2F4G3C1+EE2vCHUNAs=;
 b=ik0mGltLnYZDctiLHkBAEYRgeSdt//6z+myIKSBUp3I95cKcTId6E4wnhG4TMA42Z6
 bHloyL6VydZoUm3SlGJVf5i6jK0WnL3z33vCvEfeYbm7UZAkjChX2zqQW/v9GB+Frp8t
 mC3rn2pXSfTtxDt1YP8BQVggGqgEut0nCjDRUx/rvSl+OAhmcR5kKzbFfDfOdEN0VshH
 v8Su1ON6ZeeI3dTIeOICPdDJTS+4U5ZCeVnY22rPCv7HrCBz/HhVBLMEx0ZRiL2B3a5l
 QalR1AXy/DjHMRkANg1GwjqeBV0QEN62V5ncUbjsodovNzm0F+zvueEX8fRZe5dI0+rH
 lYdw==
X-Gm-Message-State: AOAM533HOqPVbak2e9orEHbZZ4iQ1Mi58jz8/mkyVD+TT5swO5f55J3Z
 i8WGhypI0N4SFH7bgYBQ1lAo8lj637DwAQ==
X-Google-Smtp-Source: ABdhPJxK3FWqtlzeMbFQZK9+U03+rZH0FwaSJzW6+JjibTS4gTkreeK23h170CbcZjYDKszQVUQHxQ==
X-Received: by 2002:a05:6402:170a:b0:416:5376:4952 with SMTP id
 y10-20020a056402170a00b0041653764952mr24029404edu.289.1647334943425; 
 Tue, 15 Mar 2022 02:02:23 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch ([31.24.139.5])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a17090649cc00b006d0bee77b9asm7915162ejv.72.2022.03.15.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 02:02:23 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 10:02:20 +0100
Message-Id: <20220315090220.206426-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: bump CIP kernel to version
 5.10.104-cip3-rt3
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3678ee061f..9d2ccd59cb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.100-cip2-rt2)"
+	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.26" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.100-cip2-rt2" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 18480a87bf..976f1d07c0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-
 sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
 # Locally computed
 sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
-sha256  945b63f280c5bd9aad66016ef6fbed57612864192bc0f54f6800562f56cfd518  linux-cip-5.10.100-cip2-rt2.tar.gz
+sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
