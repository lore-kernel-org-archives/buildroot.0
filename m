Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF26C25B7E
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3DA842BF;
	Thu, 30 May 2024 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cqh2vgLXZfqB; Thu, 30 May 2024 20:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BB9E843A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB9E843A2;
	Thu, 30 May 2024 20:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93DFA1D4ACF
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8063E843A2
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4wDzjvWx94e for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 20:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79D83842BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D83842BF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79D83842BF
 for <buildroot@buildroot.org>; Thu, 30 May 2024 20:47:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4202ca70289so3522395e9.1
 for <buildroot@buildroot.org>; Thu, 30 May 2024 13:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717102034; x=1717706834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fKSKBnlPlKOOLL+i3P0KjmGRlYK6QSqca20/eT7Z/68=;
 b=qmWKLO8vuVZrW1Ol4nIxr1n5ZxAHhjSbkuVn9gzox7N6IBJAZNPyCx0OF7AfVzhBs4
 +Un9Iylm3RnlULLe6k+82n1Ih57E9hEJCRBaecJQ18eCtsQ4BHFHV8yVcRJoWAmmYdkQ
 Cc0Teiyz0BhDC9mwdZKz6ji7I6NEs4qm5WueSOODC+EUrmCrHEoncoCr5rU2hlP3WhrX
 bLh6vZXoUpUl+f36PINJ0t3NJcmHIjLaF/+8PqT+xdHOLp2s0mpgcncZuvnUcZLVhsj9
 Hz6t4TsF0yU6kyoadblaIKLLTc+h9qlOwJx2F0wlRGqiWfWCHnT7B5b/ltTNwoaNcCe/
 JtiA==
X-Gm-Message-State: AOJu0YyJ8k/WqCXrBnuFPDr2ZuZBqQCc5dI556nmXwVeH9hgGw/BwcaV
 m42mh/tUz0w1hSRy76yrsUvc6ZEmG/t3dUvwx71RDWI59Ds9cutW6v4t8qEyq+Xnu4mdVjS3YDX
 g00A=
X-Google-Smtp-Source: AGHT+IEtwSBmagB7nDkQn4inltzylyx+YriD+PeFpjASbBBdT9KHyewNGW3qZcaq5QHKyVe4kQyJ7Q==
X-Received: by 2002:a05:600c:46d5:b0:421:28f2:c254 with SMTP id
 5b1f17b1804b1-42128f2c491mr24548175e9.3.1717102034260; 
 Thu, 30 May 2024 13:47:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.40])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b84ae09sm4736375e9.18.2024.05.30.13.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 13:47:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 22:47:03 +0200
Message-ID: <20240530204706.2132204-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717102034; x=1717706834;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fKSKBnlPlKOOLL+i3P0KjmGRlYK6QSqca20/eT7Z/68=;
 b=fx2zrHLKHAiGOMeZbXkjOVJjfNjdntTt4O0APqOe7jZjuFBBm0J9bM6pjvHg1GBnPR
 T/k0/KRPN7MFzBsoT66LtwK7iKpnMQs6xmDFTTh3E6SWSTR2GSEES2iK4K2/+4ZEA+ZF
 MgwnRD5WCckUXCZo+E4ID6cdcrYFVJNDNQ6eI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fx2zrHLK
Subject: [Buildroot] [PATCH 1/4] configs/acmesystems_aria_*: bump Linux to
 4.19.315 to fix compilation error
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
 linux-amarula@amarulasolutions.com, Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel failed to build since commit e88225ed882 (package/binutils:
make 2.41 the default version). The new version contains the commit
790756c7e0229 ("ARM: 8933/1: replace Sun/Solaris style flag on section
directive") that fixes the issue.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig | 2 +-
 configs/acmesystems_aria_g25_256mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index c428e318d219..acf24d1fed51 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 83f7625dc707..2713c3ca79c1 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
