Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF54C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D32C281239;
	Thu, 21 Mar 2024 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSL8ySxkoIJI; Thu, 21 Mar 2024 21:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D90815CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D90815CE;
	Thu, 21 Mar 2024 21:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269DC1BF39F
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206C3409D3
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKhDxZt_DZak for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBA01409BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA01409BC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA01409BC
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:15:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-414793fdc55so1343985e9.0
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 14:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055700; x=1711660500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SVeSlQaLjgqNj5qQXR2iOcnV1RiQ2QtAy/1SKhdKNU=;
 b=OeSGs62rs1kbYZpN756hWIKWnBgSna5Qh0oIu2R2ggMUn0s3uIhqR7v0lbav8OXcdR
 fm+UP+4/haok6I9t7oMQGxycL90FIKH4Nxxt9YdHBJE210CrFu3YkqWhdV/EFZvUB6wM
 PsSssZ0eEsag+nLlFWBrmhclnGVapHPIHzUimJJ3lyX7vkW1o5HY/qmxVzv9lqHqxd+G
 RncLkkYalrRN2n1t+I0nYJdUWjkoVlNYiN9zUkdMzeU2lGHVzvgFaDdSpq5eRDAP+wcc
 Txwin/akP3V/sAyiEkwSLNCpF2BzGEOv0j8carH1QIa0bD4mVWziNS+LM6aJaUxe8cFM
 ZpFA==
X-Gm-Message-State: AOJu0YyvJQLOJwGP1mFDaeXXY7LwCQPb3HYZ3DxR5+/a0AQQ9tWxgkdJ
 ttHqx5uzINQD0fg1wf5DMYW3gsIshc5gf12Ufa28ny4uoWBnEvDrs3N/AZQ+
X-Google-Smtp-Source: AGHT+IG1ZL9zNHevzC0ORS0dFkjpkb50+1NwC3GTqHEJ0hqiT/Apv4iWJYS4K0/9yr1pGvVqL6AGew==
X-Received: by 2002:a05:600c:a3a4:b0:414:245:f6df with SMTP id
 hn36-20020a05600ca3a400b004140245f6dfmr224618wmb.21.1711055699840; 
 Thu, 21 Mar 2024 14:14:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a5d5a03000000b0033e9f6997c7sm5258wrb.66.2024.03.21.14.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:14:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 22:14:56 +0100
Message-ID: <20240321211456.510333-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711055700; x=1711660500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+SVeSlQaLjgqNj5qQXR2iOcnV1RiQ2QtAy/1SKhdKNU=;
 b=JwZw9chw8kmtKUDV7+dIA/k4IeZeExP3x9iBfrMs5F+skOHndmBAjg2mboWHizTfkw
 f67gwcki1pq1goWOBbWjtDD9P4EmRfkcoTWdRMNCh+g5an1C8s0Rv6i6qN1MSd2teOlP
 SZg0Dh73UkZciPtB1+ktF/VbWUYvJbe/YPbj2bkaMVmwR9koL1cJPnpRvVEEAmNBOqi/
 WV5aVgTNhElaeDislrXsKj2enmI25htISRxizz8fwmdVbRZCSZtY+4VOsXq6hGEjDkuB
 1P4iT/4KmTkPBIw00T1fysmOSE70noyPclDqoZZyaqdQRUyNcSnrXgx2CQfDj+K+XAzR
 HrUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JwZw9chw
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: fix btrfs handling
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

btrfs doesn't depend on btrfs-progs but on headers >= 4.12 since bump to
version 24.0.2 in commit 314f62eda347ba02b4688ac94c6bab55b4a4d6c9 and
https://github.com/moby/moby/commit/3208dcabdc8997340b255f5b880fef4e3f54580d
resulting in the following build failure:

daemon/graphdriver/btrfs/btrfs.go:13:6: error: #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
     #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
      ^~~~~
daemon/graphdriver/btrfs/btrfs.go:14:6: error: #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
     #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
      ^~~~~
daemon/graphdriver/btrfs/btrfs.go:18:10: fatal error: linux/btrfs_tree.h: No such file or directory
 #include <linux/btrfs_tree.h>
          ^~~~~~~~~~~~~~~~~~~~

Fixes: 314f62eda347ba02b4688ac94c6bab55b4a4d6c9
 - http://autobuild.buildroot.org/results/7d07eba37149d341dc86f9742bd166de874dcd5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-engine/Config.in        | 7 ++++---
 package/docker-engine/docker-engine.mk | 4 +---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 71bf670f17..d48ffe6484 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -21,12 +21,13 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
-	depends on BR2_USE_MMU # btrfs-progs
-	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
-	select BR2_PACKAGE_BTRFS_PROGS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs filesystem driver for Docker.
 
+comment "brtfs filesystem driver needs headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 9746093ffe..d25712d0ef 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,9 +35,7 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
-DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
-else
+ifneq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
