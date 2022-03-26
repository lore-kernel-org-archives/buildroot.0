Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E71409A7;
	Sat, 26 Mar 2022 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dg6zywVR-EKb; Sat, 26 Mar 2022 20:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5AE40998;
	Sat, 26 Mar 2022 20:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A97C1BF46D
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9725681CEF
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lw-hLuOCX1o6 for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 20:50:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E45CB81CE9
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 20:50:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m30so15131646wrb.1
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAjnEMMelhkkVoaClHiQzRNDEBJOZTy+ro5tdrryESk=;
 b=KZ5+x5Pn6W2w61WTgOLRNqIlkLMd9PVVYKmmTHRdGImwba9svWLGE8joycWgG21E6A
 bO8zU7iKmgOQaDk6etTEfixuUB+OYlUQYckMJ0RMVSrJseoY4BCwdk2I2t60p8cQXJIN
 VXkVShQ9z4wDwh3oO9LiSkGnTwt5aiosEtVRFxRYtHBRYe0av92sMNSy01qjxGoX36jb
 wURgS57Ebz/SmpHk/FuYEA1uollssIYmMkYDzL6Or1c9ROYjG5Olyf0RsWmt6jVKymO6
 TGaQOKNyUAAepLign2xXLz1xI0+TlqQjke+id2Odw3QDoqgNlks+Utin86Tsd8CkedM+
 NLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAjnEMMelhkkVoaClHiQzRNDEBJOZTy+ro5tdrryESk=;
 b=qo5KK70nYWJnk4PbGpOJ7g/0nLCBMpgpCIcc4Un6o8V5h75hSRLaC7LUcQfF9Kt7+S
 tNWpBGuZmUWog5W3dq1o6P2Mw9OYvcOpgN6Ys5Z7EzAT7ZtvXsrlItqjLYN523ENFRsS
 em/BArVDbyWnx57GsALqINPZhyzqRc900P24S6woI1BNdTNdCOLAFVMFhbpDEc6tNBrP
 UKLprR4JIcpoRfRLRWbpE9bz2/zFBSQKWmmy6SgqT4gMfQU+gz6tynRl/EjMRW/ZgtdH
 e48NRdSixqCKGG+YJOrQJxiCCMjqnYd932TP0XKrwEGyo2C3fjoKR+bKCHSilsoLoN9C
 ufAg==
X-Gm-Message-State: AOAM533/rOrtziUxOJxIowD5XwORNP5G1jmd7P3pEwIZBLRCaag9IxOS
 LEC8t+BhRFBeiVReLHf2Bre0Cws6+gc=
X-Google-Smtp-Source: ABdhPJyRqad7ZMCv1t91EWUU2LRCxz3X1/YR812ohjcScjR8IY0LTn5+whrR90n0LavCSCcgWMJbsQ==
X-Received: by 2002:adf:f78e:0:b0:205:85d3:fa33 with SMTP id
 q14-20020adff78e000000b0020585d3fa33mr14752784wrp.675.1648327841856; 
 Sat, 26 Mar 2022 13:50:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm8364242wmq.36.2022.03.26.13.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 13:50:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Mar 2022 21:49:15 +0100
Message-Id: <20220326204915.1019331-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4632
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

Fix CVE-2022-0943: Heap-based Buffer Overflow occurs in vim in GitHub
repository vim/vim prior to 8.2.4563.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 8b60b7461f..d2c91dcfa5 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b0a5acbe83bbdd4b1412abd9dc2ae2e3593c6cff8ff11c551fda3e6e2a87ec81  vim-8.2.4450.tar.gz
+sha256  acca7330e41d01b53d4455ff98fafbf13282ba6461cd92eb1188836f6b03ec0f  vim-8.2.4632.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 28fd33c8ef..71aa735eff 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4450
+VIM_VERSION = 8.2.4632
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
