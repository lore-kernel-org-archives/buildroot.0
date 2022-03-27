Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD1C433FE
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DB24162D;
	Sun, 27 Mar 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xJ9p33IWBS5; Sun, 27 Mar 2022 19:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9324415F8;
	Sun, 27 Mar 2022 19:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F08C1BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07484415F8
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhJs1FQ6WZeu for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B37D415EB
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 19:27:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n35so7191296wms.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 12:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0GvvHE1oDN+d2kRozMQnu/aS/+d9B6ZeZj3XYE/jYcA=;
 b=RuRUT3U7Qn7gyuHysRKihjB2VwWKDKhDCvuGaCqneCMHAloVfyUQ0xqI2G86G+MisE
 90+Gn7d8bRpgh6F0pQe9jvQvFQ/PZ90X93fc/q8laJo2iqV/QTQ4WajKwMu+gc2mwZOW
 2rSM+uUTHwH/s6YfIvG0p8g9Gkrvbkqdz3OdC5o/H/UdXlAD5e81LtV/d080ZjTOA38U
 2MhOSeeNgrw/0JSm5WJEWaVNYjXVXoWbujLin0t5vHgyN9dISdgTH3sniNyMN5KgXxZM
 gNItRxwMk7Mdb2LM6mfi1Pwe/503Vq/EfkOYWdq73u42/F6pN0ruQkLZhakcy9UpkS7E
 ooLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0GvvHE1oDN+d2kRozMQnu/aS/+d9B6ZeZj3XYE/jYcA=;
 b=C1AE1qM6mEwDMymeAKBOPOYzJ50eKlCqsfhjRyOo/uqYlrB72y5XkI9kXWp+yywALE
 w8zfdHJ8pSLmvIU3P6s4u80sB4mmJP/fDTPOIq2gvzqcpajQSZguGH0+AdkJAvtHQEOj
 yrvvdUv/Qvlj9kAc/jVCo2Z9XgA/z9PWbuVQyvQTAJkc9aj2ulgUHr/s4Udj9/3L6nQ1
 iV1bybrW5/LX25ty+Gv6Uvko1+NxYW6v4JQbXdMoCgDoxB6OESWxiakRvMuiBbD65OVc
 1MJxtPqu52DbfF8ZZO/wYHO6NVFY9mxzv9MOZPXer0P3SNZB73WuNP+1EdoL0Ol9tJ0F
 vpVA==
X-Gm-Message-State: AOAM533t3yKbEHUFUz/V4I7KmtwYYdKqJnB30iijklZvGj1vS5nlDHgs
 aPMRTCJ9UQgLj7YdlLv9m4THDJLuxh4=
X-Google-Smtp-Source: ABdhPJwjXXGe2YmYjmeBgf7C0INRmlq18xgv00xVlyRezXUSXsUhuhITWJyzDibwrwDRRmZWlTbSQw==
X-Received: by 2002:a7b:ce04:0:b0:38c:6c34:9aac with SMTP id
 m4-20020a7bce04000000b0038c6c349aacmr20908909wmc.142.1648409256712; 
 Sun, 27 Mar 2022 12:27:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm12001784wrs.73.2022.03.27.12.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 12:27:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 21:26:13 +0200
Message-Id: <20220327192613.1239929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jack1: bump to version 0.126
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
Cc: Adam Heinrich <adam@adamh.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest release
- libsndfile and readline are not a dependency since removal of
  example-clients and tools with
  https://github.com/jackaudio/jack1/commit/ca3af4b0d8a8a8fd6c4ae72c24e4df6e18f83af9
- Update indentation in hash file (two spaces)

https://jackaudio.org/news/2022/01/15/jack1-v01260-and-jack2-v1920-releases.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack1/jack1.hash |  8 ++++----
 package/jack1/jack1.mk   | 14 +++-----------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/jack1/jack1.hash b/package/jack1/jack1.hash
index d7787ac2ad..d82b9daffd 100644
--- a/package/jack1/jack1.hash
+++ b/package/jack1/jack1.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 3517b5bff82139a76b2b66fe2fd9a3b34b6e594c184f95a988524c575b11d444  jack-audio-connection-kit-0.125.0.tar.gz
-sha256 661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
-sha256 ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
+sha256  7b290e9dc7b9262ac328d41eef80c1053c97013efacbefa30477cb9b2a5445ea  jack1-0.126.0.tar.gz
+sha256  661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
+sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 6dca56001f..4e16d7e96e 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JACK1_VERSION = 0.125.0
-JACK1_SOURCE = jack-audio-connection-kit-$(JACK1_VERSION).tar.gz
-JACK1_SITE = http://jackaudio.org/downloads
+JACK1_VERSION = 0.126.0
+JACK1_SITE = \
+	https://github.com/jackaudio/jack1/releases/download/$(JACK1_VERSION)
 JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
@@ -17,14 +17,6 @@ ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 JACK1_DEPENDENCIES += libsamplerate
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-JACK1_DEPENDENCIES += libsndfile
-endif
-
-ifeq ($(BR2_PACKAGE_READLINE),y)
-JACK1_DEPENDENCIES += readline
-endif
-
 JACK1_CONF_OPTS = --without-html-dir --disable-oss
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
