Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C35C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D99813DD;
	Tue, 11 Jan 2022 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyWpki63BY6r; Tue, 11 Jan 2022 22:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CEE583E9B;
	Tue, 11 Jan 2022 22:10:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4E171BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2ED483E9D
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4voLFQdo8MfM for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD0D3813DD
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:10:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x4so771185wru.7
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSn9Lq7rq/pE+6QSVURwmNQC6hGPNSRuaVjysph83Pk=;
 b=ISwiirtE/QqhBU5N6plXjA1gEL7z98ujnbtAEU9qjj1ZZ9odyAP4bjoE4TvUlylkLM
 7DWSyRTnDyIvC70R7hpWEOLLe4nfvI4uHZN3HhuBDQGgxndHofTPI5vGEbyXCMtM9aN2
 hOgAPrC0qavz7ymgnT+s3meJsuvsLsT9glcWqJmNSJDWf2oHR0iPhFbuLV727tqtxHRG
 JG+K4Th7TRjDoh+tuvA5nUI4bWiI5UBOqYB9uMujhQpVsQm0o2K81I0BvGVk520uBhr2
 5rRMC7ARMIo2w8mmOxUJNv2mLkXBXndC/MmyLaqdjKPfazFnOPuLHXzppf0wevMiVyin
 QFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSn9Lq7rq/pE+6QSVURwmNQC6hGPNSRuaVjysph83Pk=;
 b=GuLLDf5ExrLJPC1RqXR5UxQxCLRvSAOI00m4/mRdv9LmW7YfDqTDe7EtFmt1U+QngB
 6YqaXRLktkang/wtq0wpsawg2uRhcuVfeoaxzvb665ywA4n23WJX6echHiTzbU19DQRi
 oUYVmHWq3Mk5FIT5Fce6xvOeJWm3yBeTJuvHEVE5qB0/p95pKZLw9zOMLkp3YEKwwDTt
 yGm61HPh1dT4gvAixre2nRzH04Mr1yNdG/WsHCYa+26/QdgMOKBu4jNJDRB7+MA8hYNd
 NlCeVckXUaj5ssFtjLpJM0nB8F0oC78EoPAUu4vyxxBrIdWvcA1duGZmTze+feYdFfS0
 PYAA==
X-Gm-Message-State: AOAM533MNgmyy04E4bt4gTps1idW6R7mJ/TVUCbO4/oBJSxkIk6+xuiS
 +4JA8m6ecXuRQFmAGNxM9GgcAr27A6g=
X-Google-Smtp-Source: ABdhPJx77VDhxf6SPNZZsIFEa5JTC9nyRxs2b89XP32Ax3aaTyHzp+k1ozi/DIlaG92f569Vup0CXw==
X-Received: by 2002:adf:e792:: with SMTP id n18mr5449679wrm.34.1641939041929; 
 Tue, 11 Jan 2022 14:10:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a20sm2602841wmb.27.2022.01.11.14.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 14:10:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 23:08:15 +0100
Message-Id: <20220111220815.2570293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix host dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
78d7c5f803c2f59385b57525e2d1d09da15e22a6:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU
  Depends on [n]: (BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS [=n] || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]) && BR2_HOST_GCC_AT_LEAST_8 [=y]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
  Depends on [n]: BR2_PACKAGE_HOST_QEMU [=y] && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU
  Depends on [n]: (BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS [=n] || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]) && BR2_HOST_GCC_AT_LEAST_8 [=y]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
  Depends on [n]: BR2_PACKAGE_HOST_QEMU [=y] && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_HOST_NODEJS [=y] && BR2_HOST_GCC_AT_LEAST_7 [=y]

Fixes:
 - http://autobuild.buildroot.org/results/d78f660ca4a609a0a072b3f2e04d456bf8cf663f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/Config.in.host | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 86eaf21dac..4ceaf0c73e 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
@@ -11,3 +12,7 @@ config BR2_PACKAGE_HOST_NODEJS
 	  V8.
 
 	  http://nodejs.org/
+
+comment "host nodejs needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_8
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
