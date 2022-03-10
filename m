Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DF6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 196FE8471F;
	Thu, 10 Mar 2022 11:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rumZOmVmoNU6; Thu, 10 Mar 2022 11:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CAE84390;
	Thu, 10 Mar 2022 11:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 323D41BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2130384390
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmyntEVQdU3U for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CF9F8438D
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:42:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j17so7584625wrc.0
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWnUO2vyA/lQ732G1BfA/8LQamrnT4LuzMmZ0rkooTI=;
 b=UqZV21j8OuOB4IBsnUqk37r7pyYVT+PODH4kSCKIt6Ft/k6sVJUkAbov3lINpewdoS
 zuvNgg3js8JwHBx7MJJn7FpztTeSUvNbR7YKostDqrmvXSo3sbj2DFMLjPcMs/tEvNhK
 KSqEEFT/NckJj3cHspGX0MnHTovXN/6AXc3Fy+/TgQIFrjlUyEiFyc9ROE2FtbZF/UwR
 DQoHGRV7TrMhJhQdZeMY8Lt7G5wCoY3eqbbbKtCACrJJ6lpGc8p8HspiYYN29otFPSys
 2ZaQ5ZI2omvSTKuVyKj43427IxDPFRPeZkMGdwI9bTlIUFqJI2udoa+UXEZJCoZjsNCs
 owng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWnUO2vyA/lQ732G1BfA/8LQamrnT4LuzMmZ0rkooTI=;
 b=7AbD381YStTkR9lO3hXHgp8bkMK5tvkcyO0M9mM7ojRbrcs3p3YSjqO2tJ8CAAKmRS
 hWWVpHgEUmKElh0TKdPQU2aY44UpJo0tlEbiSF2qyQ5aLMFeSEjz7F27Nftxohbiuinm
 UOWnKZ46GYtokTSnpHoiWOmYQIL4NhXAivIViK0pe/ZJcrbf6FaqzAYEgoqGPdc5fUXV
 OdFiPIHUKr2x1o7Uwnaes4jc/VFIgNi/tUOaD+zLMLtsvKGM4qV0P3dS6egKP182C1DK
 pzpuHaqfwtOXOMBK33KSDjWP+TmaSmV3n7oCiuH70xzflfyjoYjxlrFyeqm+53cmO+0q
 8dIA==
X-Gm-Message-State: AOAM533xS1z3YZle9Idm5DlUS418+Cde2f82n59/OI9lwPosx+2F9tNA
 My4EuUyE1xtIvrMyPK+zDr3Nvel0exk=
X-Google-Smtp-Source: ABdhPJyD0Ai8NBUOCNbkSUmjh36RHYQFY1s0W2XMFGgRTopufXs7HkzeZTGrcxN2IPKqztOy05GHkQ==
X-Received: by 2002:adf:f006:0:b0:203:723d:a2e5 with SMTP id
 j6-20020adff006000000b00203723da2e5mr3361524wro.188.1646912546467; 
 Thu, 10 Mar 2022 03:42:26 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 s8-20020adfc548000000b001f07639a704sm4069229wrf.7.2022.03.10.03.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:42:26 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:42:20 +0100
Message-Id: <20220310114220.920056-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.2.2
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
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index cf7b1dc9d..a95086e81 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018  libwebp-1.2.1.tar.gz
+sha256  7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6  libwebp-1.2.2.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index f23e1c92e..670a7b801 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.2.1
+WEBP_VERSION = 1.2.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
