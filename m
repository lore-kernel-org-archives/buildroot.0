Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA87C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 15:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F192440019;
	Wed,  8 Dec 2021 15:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IoUdAEP2_U0; Wed,  8 Dec 2021 15:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E83DD403B6;
	Wed,  8 Dec 2021 15:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 710201BF32B
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 15:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D960403FB
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 15:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQprXkr-iAqy for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 15:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05149403EA
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 15:46:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y13so9667090edd.13
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35c8GkQTKXfj5x8624AJtAtPQ+DCqT3O829WuhfQI60=;
 b=n7cGxMf73YjROZc1+7cv1HMLCmv4O2tEL0pA579NjEA9cM+CGNy9i7MqbGR140c/Iw
 /M8uIdS1u1GiY3f6mgAN5LSU47tejDLyt2RXd18E804qWZ4SeQhliZLvNT0xMlJkoxf1
 sjuWPbOJxFrxI+YK/JRyS7or2xEDoeVUFzgjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35c8GkQTKXfj5x8624AJtAtPQ+DCqT3O829WuhfQI60=;
 b=cgckHGF5ONRJdbjzC6L1sIM/OSiIQrB4doIKO0ggzf0nLc4vYAIvyw65aoKkZ7DAeR
 lIlLjMVm8WzU7OzQxlRzyb8PzdR2P02w+5IDS7gefMIoufkhAr4pW/07NDh+6mvBk8XZ
 NwEG9RK+mUkERSke6WKuWM+sMeE0uDkmlOIryZCsu0smu+twk2Dwalj9F7HjeUx5uEEV
 iTrYSc0FrYomsmBzrZoUrzIARf0DPy9DFjhNmoLJ+BlNvjDZgGYDUPyCXisDmhk/nAKT
 Fv4F7YOd4k6nayB9a6tdihZQ8cpeXJHG3vf3qpTmKPAMGphM9IcBeE97TlYn05ZegL00
 SAyQ==
X-Gm-Message-State: AOAM532wwPvRsS13+YYg8lH+LxC/pHTmBYpdStl/Qy9Vp+jwaf9Gluf/
 Cppdbw6QEBV1fl8uxHD3MDN3rQdHYZFO1A==
X-Google-Smtp-Source: ABdhPJwwpBQZyJK56fxatLsMA/bD+3oeKqnZN9TNDSF/TLTu+kwTTrpB/R/aWsE9oW5OZx9PpXpE9w==
X-Received: by 2002:a17:907:7b98:: with SMTP id
 ne24mr8909483ejc.14.1638978405368; 
 Wed, 08 Dec 2021 07:46:45 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id gs17sm1673977ejc.28.2021.12.08.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 07:46:44 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Dec 2021 16:46:40 +0100
Message-Id: <20211208154641.58478-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 5.10.83-cip1
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

This patch bumps Linux CIP to version 5.10.83-cip1.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 6 +++---
 linux/linux.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index db0c58129f..e21d1681f7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.198-cip54)"
+	bool "Latest CIP SLTS version (5.10.83-cip1)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -44,7 +44,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.19 for security and
+	  The CIP community plans to maintain 5.10 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9062b72a0e..6d3b31c5a4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -9,7 +9,7 @@ sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-
 sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
 sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
 # Locally computed
-sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
+sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
 
 # Licenses hashes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
