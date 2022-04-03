Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEC1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A876660E1A;
	Sun,  3 Apr 2022 15:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1g6zJVvYTPq; Sun,  3 Apr 2022 15:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD71360E09;
	Sun,  3 Apr 2022 15:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 323AE1BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2080D40438
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ThFcbbtd_IH for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A91A40125
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:47:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q19so4036674wrc.6
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cv3DeAiYktombtbxOOCeYOCmHELpX+ex52gk/tWCrqM=;
 b=XJOUvWSPM+a90l8OSr7RE1mj0lk0MIUVwQKRYhr/BJHl3S6ypXiEijANhgzn5Ar2A3
 vqq8pzfAbQGTK/RGWueyLgVJ8LVSiPnhXn0QstR6TWEkFaennRYZgg7oNJDbVU/dns6G
 GL71orCs9P5/gSNv/QQs3qrNyA+RDJ/jVSiYrOjurSygKK+qgepELQ4/hY0IJ2usUl+R
 oqCkhBMNbHHRiNpP0VzHfgvewAEodLtPBPYDBEWmVtwVaBw3z63DqiRDuls6bwUgepTC
 1nSCzVYGNWjJxUYuXMqSHiKqBl7fZN/pTbeqEUlvpX4b6pd4z96T0JVICyf/fwRo8V+S
 wGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cv3DeAiYktombtbxOOCeYOCmHELpX+ex52gk/tWCrqM=;
 b=5LjN30/SmdS6gqRzGqoJP2XzBjGfvbHQoNlnsmY7A5ehXSc0/Fw2EJod5jW5uQWRCB
 ef01uWmW5oJTKvivY6AUlGmdypA2Sk6vg/m3XvpJYlrD5+jJl+hpgMfGtWA5YK014uFp
 GgKX4OmQNe5K/yRrt/odopcF7dOABKBgzq2ypJzmA54E9ofG8TvcB0dBIkSrdrX2UQT7
 H+H/ly3Lgu4icSPHKYCW4ne50+1qQ0Mc0IZcLX4CzeAGNrkJvINQsf3ZFE5g0APRMlda
 jNBouYx6BsXz359C7e77JUaE6iy/QPikjcY+ULBswOL5cWM6rmZMGkgHc5wo0p4rtX7l
 PJ9g==
X-Gm-Message-State: AOAM5309CUPdTMKe8sM25BA8354qdwheFqdePFlnFrTS8VMdNWHBftaf
 zTeJdyoFVkExxzHlurn5Vu5SupSKZBA=
X-Google-Smtp-Source: ABdhPJyTuliTPR2PB4xi/EVyE0ZQIPTADnSi9Qfa/Jn/Ssjvy/RyY85eqvOkmri1m4u7o2BMZf/QJQ==
X-Received: by 2002:a5d:4e08:0:b0:205:89b6:1d4d with SMTP id
 p8-20020a5d4e08000000b0020589b61d4dmr14377893wrt.124.1649000876093; 
 Sun, 03 Apr 2022 08:47:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff58d000000b002060e84bcc9sm1406573wro.44.2022.04.03.08.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 08:47:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 17:46:09 +0200
Message-Id: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/cppcms: zlib is optional,
 not mandatory
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

zlib is not mandatory since at least version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/fc1c25f9c7af440f2fc579b150025addfa5421a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/Config.in | 1 -
 package/cppcms/cppcms.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 1d7635a83e..25fd93a7d0 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index b289617bbc..530b44427b 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
+CPPCMS_DEPENDENCIES = pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
@@ -28,6 +28,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=ON
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
+CPPCMS_DEPENDENCIES += zlib
+else
+CPPCMS_CONF_OPTS += -DDISABLE_GZIP=ON
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
 CPPCMS_CONF_OPTS += -DDISABLE_POSIX_LOCALE=on
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
