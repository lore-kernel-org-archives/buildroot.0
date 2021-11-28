Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C56C433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAE381022;
	Sun, 28 Nov 2021 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uidagDuh3Vtc; Sun, 28 Nov 2021 20:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF1480FFD;
	Sun, 28 Nov 2021 20:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC5301BF429
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A930F409C4
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 20:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGxI6Yqlvubp for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 20:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78046403D7
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 20:52:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 137so13002824wma.1
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 12:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCYmZIFJNjrzN9NCOgFih+4/RbhBw9fQq/J/Q9HPeO4=;
 b=TCvu4y54kzEnkfQxgys/e1pK7TORIl7LD2sd4j0Jlztu11ejHdC+2exq6XFGWE7ii5
 yCrARy0w/UVO02QEsdoqGvIA91CMpirZuHupLR3WujSL9qC+7HiAAvUI5CscBE7ALoXP
 hS9zg24AylW2EL3gUaJ14sKIoANPqmf+rJGUY6/bL9XtMvVHTF+Z+ajJFwPRxz8C5VXd
 Y5Gk8XqGCtJgZivH5irGOib4pGin0MosGrdmJR0sgULoWvsY33egzCwsHeLfhvBvJ/vA
 IVegasoObcZFvI77DKu1cDGeZ4lRfVk4DdiSoynGgEEulLdoL6M7/ro+gKVjeHxEuGry
 VSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCYmZIFJNjrzN9NCOgFih+4/RbhBw9fQq/J/Q9HPeO4=;
 b=IBGoOBmFXYVI3bukGDRTGJcpOIXVk72g8Q6ubRW2Op9UvsT/RGEThrY6+q9ov9Msv6
 zzy8Ret8e634vHEp3uT8cgChkBUhqvrbx40A6wuWsJzY14BT39CYKowrlmbg63oQgOzh
 NOR6DLM0yMMmCDeDbFdSS+mUEOpARqqptQsd+66lOy//5DGLP047gK1sTci0RbFkHafZ
 K0K6QoGPXSOREspBIXpahyDzQ/Fkcb/Z+AfcLxYI9HhmXFQM2ZTBsw0ClsJRv1+otj2X
 Wrsyu4Pb4KjLfCuDFpOAAbjac/2fOtFpPAmxj8Oc5zXTAARVoxXxO9zOzkblNnTdy3Jc
 h+kw==
X-Gm-Message-State: AOAM533M6LHrKIpDUyeC50j+JAxKviDZ8mQrxKWduVKjYA+wmjHpKuBg
 mVMoLSPmRQT8sMkjVN3WltW21b0QeBM=
X-Google-Smtp-Source: ABdhPJyWefkGB8l23BY4LTSjdmQyqbcADLGfx2ajAV796ugwWtqjmExwAn5hllgejNkPELm2c3G50g==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr31075915wmc.39.1638132740279; 
 Sun, 28 Nov 2021 12:52:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id y6sm17224632wma.37.2021.11.28.12.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 12:52:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 21:49:42 +0100
Message-Id: <20211128204942.2085595-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3690
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

- Fix CVE-2021-3973: vim is vulnerable to Heap-based Buffer Overflow
- Fix CVE-2021-3974: vim is vulnerable to Use After Free
- Fix CVE-2021-3968: vim is vulnerable to Heap-based Buffer Overflow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index e07e48c68f..6ab309fd9a 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  363a90e45eb93c73340a711223c7ce5e564432f9eb34624e1a545f4fd57dd49d  vim-8.2.3582.tar.gz
+sha256  16ff13ea2a11da96080510fdfccf5f3a05f82e2c7027494bd8c98704bbf14428  vim-8.2.3690.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 0eb96dc835..1fd090b4fc 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3582
+VIM_VERSION = 8.2.3690
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
