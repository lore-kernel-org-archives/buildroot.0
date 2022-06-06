Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D19C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08DED409B0;
	Mon,  6 Jun 2022 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJlt-FkrTzbO; Mon,  6 Jun 2022 21:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F9E44014C;
	Mon,  6 Jun 2022 21:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527581BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EFB961055
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku4a6LQexH8C for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:47:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 477E960EC7
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:47:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q26so11167410wra.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y1IxmEA3GOh50lplvt+e6Q3mP9UyDPbSaZmvSuB/vc8=;
 b=YUqkWNlmTxUiClJyB60sfh75ABjd9g+AErToT7Asx2WrQwkHL/P+32VWhx9rKncuyh
 nnkwOJIWj7SPvQwZKlAMHYNBszdtfiAL5gLs8iOzlK3R9GUAjCrX9Grn4AMTpXK9Q6EX
 KjYeN7S26BZVfYVIvFqj4OqgW/Zyhr/LE+c5+kRAD2pxJI73MR/oRqg1Rr9wImWhzEZm
 kPGSBku50k63zaUxZLcmgoAb6bPN5RkFx5cGKNWxDUP+HmyCN/hKY8ZREtP/TMsz6YoN
 KSi78mesEDgxmdR60ch+g9/fSATp/RrCDlaw159q/Tv0m5+t+KNy22VcrjuD6XnBMjOX
 Nq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y1IxmEA3GOh50lplvt+e6Q3mP9UyDPbSaZmvSuB/vc8=;
 b=4OUUSksrEm9PhMlqHlvPKEGBXr3Ao75elG4JulEyMdJIPvSrFu+K4zTd415Z1xOBq5
 wHyv6Fz3qs2PclfbE2yHMm89wsSV6COAIC+4ooQpqz6R6qYz17A9Nn6kM6u9+J2qU4Gd
 GE42bGo80Cs3aCTLxTGbSfLxL1OPEPeluVqQkXmpH0CwnkwJXmZKtjI06Nknn8TVdKPs
 UzT+uiMxbKRqDnlJj6wmu3zR5pDPR8IyojvZI9pWIKGamdcbyg65tUo/QDIJM6mwRKWu
 xM1ZIv5Ugvn/ITWeFm7YeMM+uiuS7T8dd6GBMp8eHRgt0d+o5fmdJacyCa7J2PMJOfbL
 V6Cw==
X-Gm-Message-State: AOAM533uwof4AtF7UDk90VkrM+3ndkm78erO9OXUfWKVOztgvBB1Xm3x
 7jmnkQZgX34BrMCa0h7bPE3WOQej0bo=
X-Google-Smtp-Source: ABdhPJxWGJv4kOMP3xPqcAxn5OkKFvv3662bGI3Z4d1ipt4mBv9tunbu4rctBbKRP6psZCTQL4Bcrg==
X-Received: by 2002:adf:d852:0:b0:218:3cfb:3c6 with SMTP id
 k18-20020adfd852000000b002183cfb03c6mr7989598wrl.691.1654552043224; 
 Mon, 06 Jun 2022 14:47:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002100aa69469sm16353962wrx.2.2022.06.06.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:47:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:44:52 +0200
Message-Id: <20220606214452.33295-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.13.1
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

https://littlecms.com/blog/2022/01/28/lcms2-2.13/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.hash | 4 ++--
 package/lcms2/lcms2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index d3ae1d934f..d20cf601fb 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/lcms/files/lcms/2.13
-sha1  1676097fb18fce83c9c876d56828c83a6ad829dd  lcms2-2.13.tar.gz
+sha1  72d0a0b7fbaeca12eb0186ab5728eb0f26806b22  lcms2-2.13.1.tar.gz
 # Locally computed:
-sha256  0c67a5cc144029cfa34647a52809ec399aae488db4258a6a66fba318474a070f  lcms2-2.13.tar.gz
+sha256  d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88  lcms2-2.13.1.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5a253d044b..63750c43f2 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.13
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
+LCMS2_VERSION_MAJOR = 2.13
+LCMS2_VERSION = $(LCMS2_VERSION_MAJOR).1
+LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION_MAJOR)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
