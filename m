Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34445C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 00:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A6D415AD;
	Mon,  4 Apr 2022 00:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjHnwleGutCH; Mon,  4 Apr 2022 00:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48369415A8;
	Mon,  4 Apr 2022 00:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E347B1BF9AA
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 00:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA89E415A8
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 00:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fTZY7UKXCpG for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 00:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE0B4155B
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 00:57:31 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id g21so9479700iom.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YimIhwKsnLp5GtpjyvOCBgG7eM1Fy0E1x8ew1VZRyoQ=;
 b=MnqJL+E+/XQkHNIkCdq+lnte81Plw48kRb4LC/N/Z9hlfd6Vcu8HduNNZCFZk6ecfD
 nn/JjvCXzw0Xd31UlXvGtScc6fRZCxo3ZuZ4i6bFI0OOlVI5YaxXbScedgn3jhhjswGo
 HzJJWilCNZpGPsRxkvDlSGA3pSKXK//+zil/++Au4mwoeVScjXa+RikL2rRaU4jdlbjJ
 WdXpchPcDSnovPq0v7PUbsosEmXQkrJfsqma+h0wp+vAPG9UOCBBn5sXomDEbsxJO0lC
 lZEiPcsIfViteJBmx8mKQ/1g05OM1TovNQeomayFvqk91GZXUIcMQ8Xl8hB9PAmCqua5
 r1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YimIhwKsnLp5GtpjyvOCBgG7eM1Fy0E1x8ew1VZRyoQ=;
 b=SJfSV4uKGjEoPfUIOdlergeSdDwX1cW7ge9gZNZokCqYcem8YXS9tOTR3gPBITTd0P
 drPMivJDqSbWSsifBmIE7x+sYqlZVjDj2ZPs5dS70KoC2Z6+wVWH7eGV7zqO0/RGtIKO
 5SmuSl5vvwC7rH6Ko2lDQW6X5aBGrkEPFm4l31gh+5X/DG3rORMHMXd9Rz6UQGDEt07p
 bOu0jHuUUxOdx7JbfEcHRHRO8wJS9+0Oxbj2bE2V4nxw7mWc7myO/cXrLD6Oe6YsDOU2
 ZISCfHWLVS1Wt+Ym7ukI4QTGtIein5bcNGsscsXyA3yxSstzALKYTaB0ZI09zTCm4CD0
 ZhDg==
X-Gm-Message-State: AOAM531tSZ55G614SrugwGumB2w9K45rOU6eMaIbwKfJVxYijNUd22Iz
 RL67kFgglsLPtpBO5TjRXGxGz7PBpQmtqQ==
X-Google-Smtp-Source: ABdhPJwwGWnrltOf4Vkx6ox153HSRt+el57O2/ZK3LcKPIbqWyahSlNSRxNGsyX6P1oAaruZrjdyUw==
X-Received: by 2002:a02:ab89:0:b0:321:2f3f:ae96 with SMTP id
 t9-20020a02ab89000000b003212f3fae96mr10952846jan.253.1649033850485; 
 Sun, 03 Apr 2022 17:57:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 m9-20020a0566022ac900b0064cf3d9f35fsm687519iov.35.2022.04.03.17.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 17:57:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 18:57:25 -0600
Message-Id: <20220404005725.564691-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{rustc,
 rust-bin}: add s390x target arch support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 3 +++
 package/rustc/Config.in.host   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9f8788a295..ec1c09b7ea 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -88,6 +88,9 @@ sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-s
 # From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
 sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  e990778d618a213a0825625277505850e222df9ab5b514fec927fbf2d2d21a66  rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
 sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 80d1d1a3d8..d38b57386c 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -53,6 +53,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
 			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
 			BR2_TOOLCHAIN_USES_GLIBC
+	# s390x-unknown-linux-gnu
+	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-musl
 	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_MUSL
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
