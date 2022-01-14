Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC67C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 288CA8249E;
	Fri, 14 Jan 2022 22:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olJdQmoMiZnY; Fri, 14 Jan 2022 22:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8107E82443;
	Fri, 14 Jan 2022 22:22:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86B41BF59C
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948B540118
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kE2GVkqQ2xK for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 22:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4951740103
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 22:22:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so8254254wme.0
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gmHIuRkz3zc93CUa2HJaixq8pqccGjfBeHDvr82HQc=;
 b=eHzRfRXpN7qI3Bfu6bO0IWNt8d8waA+NcRuo0UGkFdTP6SFUBpJlgLLdU6YraCXWtx
 H8uxffgCwjzz1W/wg2wbM8tiuFfxoW77RGWqRg9Xv1ZPHBYo9++nxMr2j9Xjexl/YNOe
 AHZbsL88yU7rfXGRNRBOTaPqcjXud6Bo3Z5WB2XQV86x3DVv84cEp9LwxKwRc9zYy6yE
 2qmzgawmqz1dsUhCVcZSikGQUi1ki+MzY769S8MW1HowO1grGrLISla2dhB4IuKUoihj
 v+YyUHz+W7RdveuTdhvZ8RFWN0sIUXiBWSJeWWHJ2GjroZd2Z2s9aFP4xXuqUrZD28bF
 7Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8gmHIuRkz3zc93CUa2HJaixq8pqccGjfBeHDvr82HQc=;
 b=DpwrgdDFh+5IVOzFTutogvtUNPHTckuH2Dk590wb9Kj3Bi14ZfODwU0W2sHHZm0jdL
 LWimEAVDmbGxRNhp82BjDvOsQNxycTF7JMNpBEe9e4czf/3D6E6wxbZ2E4bgo9aP0jLX
 o7gQI4raUxY6+m67inoukKwdel/O6Ldjt4jNKqgkB7tOk5ItNMqmUlFdxURuamC445Tt
 Fe3zn6S7p98E5+thwPGKfDdyNBdBo0mtiNlWJJ3dp7RwfTeROTDimH4qulayS9/QFxG8
 rQ4dWq1jmnOdQ6tLG7YKhVEnwnIJf7PiEJt/v8XoXgXa8QXBP9dg5czJb/VY4kumkeat
 3H+Q==
X-Gm-Message-State: AOAM531aS3YkgZMKLCVEpHmJ2gvH1Xr0vLt98YlOVeeueMdtTMCYu4oN
 O8AoEG1VpekAzknCtwucp3oawJkXCzA=
X-Google-Smtp-Source: ABdhPJyXFLPX4ty19aKPeGme5tZk9/IYa1wmwbIreLustWjT/aZATALthkppuicK4/PB+uhOiU5U3w==
X-Received: by 2002:a5d:4e44:: with SMTP id r4mr10200073wrt.593.1642198938201; 
 Fri, 14 Jan 2022 14:22:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id f9sm7814651wry.115.2022.01.14.14.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 14:22:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 23:20:55 +0100
Message-Id: <20220114222055.1202119-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4092
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

Fix CVE-2021-4192: vim is vulnerable to Use After Free
Fix CVE-2021-4193: vim is vulnerable to Out-of-bounds Read

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 6fa5d1bef0..fff5072063 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  39579f7d50a6e8d7c13105a288fd85f4cdfad7f11df49706bd8f16ab37fe43b8  vim-8.2.3930.tar.gz
+sha256  2464110940c3d8d53bfef6d16912653c85187132fc0f87e937a382cafc4c6370  vim-8.2.4092.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 6643ef0841..408b33a409 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3930
+VIM_VERSION = 8.2.4092
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
