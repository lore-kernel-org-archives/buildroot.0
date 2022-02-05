Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E8678271D;
	Sat,  5 Feb 2022 14:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d84fTrEi2MdS; Sat,  5 Feb 2022 14:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF25081367;
	Sat,  5 Feb 2022 14:59:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31AD41BF20B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20493408C0
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ot0T-4NRryWo for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:59:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C53408BB
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:59:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so5586490wms.1
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTturX5nu+czrPkZowPsZ06doEXJhnSJr3jXo6SuIj8=;
 b=SOlcSp4hMLV+ZGu8YR/j/MzlwZ05UG1ffe8rDQS42Lwb2HSt4DNDVxHBx0U+5Wc5O7
 Ka1OFEPb0+lcLJ/VfCoEOAzLgZAgXszNwuEip9q/Akt3MmmGHheogr0OIEbSRCldTXS9
 GXYIYriupeIUS1UYGiSIDuVElLUAUAdfOW1QdukMPi3/6nNz6JVePhQF8mnxZ1sj/YRo
 ZU2+RhU2w3uCPOQ+OGYNi1Jrjhrw4beYFsUJ2fDk49vA/ZZBplma0JfgEA7T+n06u36Y
 o/LJ+INiQgXJMOxyP9jDYV5BpbyHxE5Q9/KJ5ShwX4sVImkTw75+DXC8GOad+C1P3rwN
 rydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTturX5nu+czrPkZowPsZ06doEXJhnSJr3jXo6SuIj8=;
 b=Fk4lxpVG3rKxjp/WPQhza/sEN39/nc6taJIT8YwrrvJpepL/UtvxBjmfmK7RTQD+sF
 NyBQAGpVkSOpPieFfvVMk+E7tfTyBMVOMhkhXkiPf2rbGX6Jzzeaa9Kh0SRJS/0j/vxa
 7cFXoAuUjYVmI7lbgP2Uk8UAi/eRb9pQAFRH1A5qqgjB2qGFdzk4pztJ7pABikjDL75b
 0YBG/05yWZoKAd1MVXxGZZAQ0HeGBN7HwamLek03LTvSXVFv/E3sECCxo3ajKDmaOhLB
 XkaJvSaUWDDdBKG5UMsOVFxD0jcqyPC7F2dazKUUW/+Woucjymdp6qV5iScQ9kpm/kT9
 NWvg==
X-Gm-Message-State: AOAM532xJKe4/qrIKkGmw9puOT0KW0X2ZEGA8LLAqokpj2iBguvp84XK
 BSru+Nb1Xp3dsK8DSVK0uLmg26xpzEs=
X-Google-Smtp-Source: ABdhPJz9U+JoFr36b7Vh5JQMdhETuofcHUdstpOrruQ7ZMskx72JfdmknqznRJbf6gpSGkZ3Pyszjw==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr6680290wma.159.1644073162364; 
 Sat, 05 Feb 2022 06:59:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f20sm15619839wmg.2.2022.02.05.06.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:59:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:57:16 +0100
Message-Id: <20220205145716.459582-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4301
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

Fix CVE-2022-0393: Out-of-bounds Read in GitHub repository vim/vim prior
to 8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 49056b31cd..36a5842157 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8770c6308a6c0b0f8b93a4d7202451d195b4efad17787c0306f0be60947732c4  vim-8.2.4224.tar.gz
+sha256  8770c6308a6c0b0f8b93a4d7202451d195b4efad17787c0306f0be60947732c4  vim-8.2.4301.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 74ab1ec584..98a5f153a8 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4224
+VIM_VERSION = 8.2.4301
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
