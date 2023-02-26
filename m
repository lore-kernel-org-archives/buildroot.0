Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44955C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE711606ED;
	Sun, 26 Feb 2023 10:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE711606ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUAoJ40Ik8jI; Sun, 26 Feb 2023 10:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F9860BD5;
	Sun, 26 Feb 2023 10:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F9860BD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF771BF3CA
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3517E60BD5
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 10:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3517E60BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9bKb5y-gfOK3 for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 10:22:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2666960A68
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2666960A68
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 10:22:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so5213112wmb.3
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 02:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APma8Mk8xAn7NjNJZiyT88foVeDeEuwBMeAWOaP7P+Y=;
 b=ikbivPlleWt9RsY1fIZdDbWffjSBUNoxgRq7fRHR1A5fxRO5OqiN4ifchzHOWHaNou
 hzzqQQKnVZctcS/t4XRGuUhAPLoVs8x+xWAhaWuOpHG+RGHWsllFM/8L8u6grdAuTjAB
 mJ3ioDhxJcmCIsZpkv/nuxh0R8znOrmsg4fJiATgEUqV4a+7nL7S6ffdM1Zc0cAfdnIL
 G3JqGYE1Aytr1hoqAZdnBIKatHuE5E40Jhk6Gd4mOu1deO8iTD0LVj4PtcTFslNNmrm2
 slAYJOFuS/fuMUULAKl2FQMaUyF6tI7qFcJV988ZF8qXp79C3m/lwHd9eNZdIdoh0IPe
 LMQw==
X-Gm-Message-State: AO0yUKXemmKECIW3aD87AoLYggUAtIqApqIJN5xQNj2SrlPAdY8Lz6gx
 tdaxQAxrtKOmGtCMD6FLDTv40chuRfs=
X-Google-Smtp-Source: AK7set8uyxcewSLaVKPNypvxtLZLYCjZTjIbSG5R7FK8MNgc9f+gM96pYfgzaJ6JipKMMogkV7iLNg==
X-Received: by 2002:a05:600c:ccc:b0:3df:db20:b0ae with SMTP id
 fk12-20020a05600c0ccc00b003dfdb20b0aemr4075276wmb.17.1677406950812; 
 Sun, 26 Feb 2023 02:22:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c379300b003e2052bad94sm8874611wmr.33.2023.02.26.02.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 02:22:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 11:22:23 +0100
Message-Id: <20230226102223.325041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=APma8Mk8xAn7NjNJZiyT88foVeDeEuwBMeAWOaP7P+Y=;
 b=ajLqWeVbdlaQvGNAy6w9z61+wlZEyLbCtn+QwQZmVZhsw1dpkoEyp/G2Oleq8e1ZeN
 ohoaJ3YuUvRdCG7b02objtOTiCxxQdTOZfRKH5HJxAxyulmQSyPCkumOSV1FN4aB4qVW
 sINKIZXVDmJaZHfbsYKqtfkpi4FOUePcRvpzu2rGTm6cJ+Oi7/bJ+OhDhSGCRu0u9HoI
 0B8kl8DtI7JRgTd+8+Cv2hWRb27DnECq+lMalrmr+Q4J/yRK0Icuc095gg9ON3FG3hLy
 /wHJvY0ru/Ayf0k9yZUZFyts6lgq9wWFdt/rwuMBaAXRnodea2Q6qAEM3TPKOMiSseJ2
 7+1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ajLqWeVb
Subject: [Buildroot] [PATCH 1/1] package/php-xdebug: bump to version 3.2.0
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

- Use official tarball
- This bump will fix the following build failure raised since bump of
  php to version 8.2.1 in commit
  90ab065162a35b8aa2c429903e3d59d4ad2c0d7f:

  checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 7.2.0 and < 8.2.0 (found 8.2.1)

https://xdebug.org/announcements/2022-12-08
https://xdebug.org/updates#x_3_2_0

Fixes:
 - http://autobuild.buildroot.org/results/092a6d388fc6801c109eb46635e8df80d06a803e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 72bfac67ce..fa92ee82ed 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7e4f28fc65c8b535de43b6d2ec57429476a6de1d53c4d440a9108ae8d28e01f4  php-xdebug-3.0.4.tar.gz
+sha256  7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7  xdebug-3.2.0.tgz
 sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 18ebc32592..9429d4afee 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.0.4
-PHP_XDEBUG_SITE = $(call github,xdebug,xdebug,$(PHP_XDEBUG_VERSION))
+PHP_XDEBUG_VERSION = 3.2.0
+PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
+PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
 PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
 PHP_XDEBUG_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
