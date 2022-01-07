Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE1AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433FB60AEB;
	Fri,  7 Jan 2022 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFN0KmKcmK2D; Fri,  7 Jan 2022 20:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982B060AE6;
	Fri,  7 Jan 2022 20:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B584F1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF29B404C5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7ZEQEbIv8LV for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EA1C40010
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:34:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e9so11709930wra.2
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kJbPmd8/tCccfrDL7cdofXGYnv4FhxRLPd32p9BdG8=;
 b=QRSDe9gkvQJQidHBGYqirIRBsZv3TyfAOl24JuF157vlgj9eg1Rn6ywQ6ow8m3C41c
 5yjSGDlNAGySv7a2WUi+qjcTJXzmvaos4PY7YGfQHAfEb1vQsk5EqDQVPGK05MIDpfjj
 B+J+ofYvsJGu8TBKQunzRyO+WjbJQZyEKCrL0R5EcQ4A94TjygzNY2vdkddOYu6uB7j+
 fa3YGNY2edNhiAZR18f68O7uUTYwc1+EwKWcZ3r2UEMGf+bIp6mT1cXjcuaCQCeeXzVr
 ECKZm2Taxnkhri8jpGuesMnkXeXkxBGBcMTUWT8icFqxYZ9W9zT58yJ4wGqmF1wu7/XV
 kZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kJbPmd8/tCccfrDL7cdofXGYnv4FhxRLPd32p9BdG8=;
 b=HPNAyVrzswww40BdeC8uV7JdEywmv7YzuS/QkRQu6KUqDYzWgUom/yrwIOS28k7NVY
 9Wulx075Xo48Fh5TgchDizr8uGkInRhNcNAPpdXO8FuFjgXP4C65D1aHop/dCcczRVP7
 Y3oxqzFd57vL5CpCCy3Cj4DD1j8J6Qz7pL0di/ZQEBvPrVdMdoOOuTwqgb1YHMKDy+WH
 By5muggNKDxBTTjjgrA0uOqODQtXjsMzgGIWuUR8qlUUN+sBlPxzhrFeF++FqJChM8q2
 DkoeG0M4iM67i56nrSjVeejT3ZJ5rF5ypuuG1XZjkfAMzFnwMnODCF9j3vuDqbGl+lxQ
 gWLw==
X-Gm-Message-State: AOAM531cTRojrVqTCzLIvpbaujQWMJsF9C1X532ipJ3T7OkHMuYRxif2
 D0YqPXXT/De7xJNwItHTXruUChUdH1M=
X-Google-Smtp-Source: ABdhPJzmyw+hbSE3l0l9w4A1Er47GIdID2b9Z5Efu6omqc9WY2aTT32hbTZ/yIW7dJil7mJSKt3r2Q==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr4447161wrp.557.1641587688228; 
 Fri, 07 Jan 2022 12:34:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c12sm5639884wrr.7.2022.01.07.12.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:34:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:33:32 +0100
Message-Id: <20220107203332.1461209-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libedit: bump to version
 20210910-3.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refresh patch

https://www.thrysoee.dk/editline

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libedit/0001-check-bsd-functions-in-libbsd.patch | 4 ++--
 package/libedit/libedit.hash                             | 2 +-
 package/libedit/libedit.mk                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libedit/0001-check-bsd-functions-in-libbsd.patch b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
index 7438340d48..0af9472f17 100644
--- a/package/libedit/0001-check-bsd-functions-in-libbsd.patch
+++ b/package/libedit/0001-check-bsd-functions-in-libbsd.patch
@@ -1,7 +1,7 @@
 configure: on Linux, the BSD functions require linking against libbsd
 
 Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
-(Rebased against 20170329-3.1)
+(Rebased against 20210910-3.1)
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 (Rebased against 20150325-3.1)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
@@ -17,6 +17,6 @@ diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure
 +# Search for libbsd for *vis functions
 +AC_CHECK_LIB([bsd], [vis])
 +
- AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat getline vis strvis strunvis __secure_getenv secure_getenv])
+ AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat vis strvis strunvis __secure_getenv secure_getenv])
 
  # strlcpy
diff --git a/package/libedit/libedit.hash b/package/libedit/libedit.hash
index d405e47b42..6d139730e8 100644
--- a/package/libedit/libedit.hash
+++ b/package/libedit/libedit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071  libedit-20191231-3.1.tar.gz
+sha256  6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5  libedit-20210910-3.1.tar.gz
 sha256  9da6c9c74987a36c84302982799d17d2f748ba1c1c0c471425716173c1d07649  COPYING
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index cb18b97f6d..595a59f702 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDIT_VERSION = 20191231-3.1
+LIBEDIT_VERSION = 20210910-3.1
 LIBEDIT_SITE = http://www.thrysoee.dk/editline
 LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
