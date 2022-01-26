Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99DF760FE9;
	Wed, 26 Jan 2022 21:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsEX5jUenMVe; Wed, 26 Jan 2022 21:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29DD60FCC;
	Wed, 26 Jan 2022 21:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE1EC1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CD3183E65
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CkOFPZcDbks for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1C4A83E35
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:14:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c2so543020wml.1
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i3mbGqbtwWMB/Xp6iBNvs2OU0I3a1qSHAbTNUHYHWpE=;
 b=Y3p4DgxG1BSd9y7smsvzDzhq+nHCJQBIYf0WdLkhEgy2o/kgc50koNEvmd+cHeKzeV
 D9BLzvfPnKcNW4AdQKY+Na2fykovSgQbQh14420vG8eqmtT1kIGReTvQ9W5W6W8klwlr
 ki4OlVEdTQukEu4NFjo1ZyUnnPo5YKjKxxdYO7GbWrX6ni7evMDh8kN2PPIBxaDoEVL0
 FCzhgVjM2SEASF7KMdTWsddfeBx7XDpin4rSU82miN5kOpibnW6+QqSYfxj5OT0k9Eg1
 G/s3dCxTp8CZsznTcGYCZZ7VMkBM0XtDCV0hdujhHGuqPuTBNP9cYTScV0LpecrRFiUA
 a6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i3mbGqbtwWMB/Xp6iBNvs2OU0I3a1qSHAbTNUHYHWpE=;
 b=d2CmiC98sZDsP/dD7hK7yYhYPuvO+PyKVI00nTiAxCiM5T2V9t4YUcAKncGbPDBgLt
 Dw1JlgE+fxYMUtAHA7o613dXZ3cSSkddDOcAHbaEYLreQlitZqchUfGY34w46QwpUN5e
 s1T9b5aME6+j+aMr1NalM7e8CmmXz1V4xIB3aP2wcjOlj/EykP5MqIXoE7e93gHsGZHR
 FyZKc4MA2QiunpIkZTOk7uDKBn3majO68vH5b+w4ZWi7osKizG06KcPXJdIkoYrTDCPw
 V2yzq3aA+DupdCZwZU9YJToZiHc6H/t4s3wJp/oR6kcLRNpyw/uO5bLwMYlLIfL+3SSI
 MGQQ==
X-Gm-Message-State: AOAM532uAIDEt0GZRATmGUscx5L9kqRY4wxDXlAD/enMltSCUEjGIytm
 jB0WOlYn4995pe05/GfizF7Uqm7VLvk=
X-Google-Smtp-Source: ABdhPJxNGrv2V9v6Svu8zRvibaLBjQcUkfJLNFGcIY+oxDkIFmWyK4Ttl7q7TAsbsMld5b2tTSEYpw==
X-Received: by 2002:a7b:cbd2:: with SMTP id n18mr451845wmi.189.1643231644536; 
 Wed, 26 Jan 2022 13:14:04 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b1sm439595wrd.12.2022.01.26.13.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:14:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:12:20 +0100
Message-Id: <20220126211220.1550407-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bullet: bump to version 3.21
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...HACD-inc-vhacdMutex.h-fix-musl-build.patch | 42 -------------------
 package/bullet/bullet.hash                    |  4 +-
 package/bullet/bullet.mk                      |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch

diff --git a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
deleted file mode 100644
index d01bb97d99..0000000000
--- a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dd37b97e79aea231ae026ac93c6ca4c7a2667582 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Aug 2021 17:11:24 +0200
-Subject: [PATCH] Extras/VHACD/inc/vhacdMutex.h: fix musl build
-
-Fix the following build failure on musl (which does not provide
-PTHREAD_MUTEX_RECURSIVE_NP):
-
-In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
-/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
-/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
-   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
-      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/bulletphysics/bullet3/pull/3930]
----
- Extras/VHACD/inc/vhacdMutex.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Extras/VHACD/inc/vhacdMutex.h b/Extras/VHACD/inc/vhacdMutex.h
-index 4d1ad2a7d..78c111383 100644
---- a/Extras/VHACD/inc/vhacdMutex.h
-+++ b/Extras/VHACD/inc/vhacdMutex.h
-@@ -69,7 +69,7 @@
- #include <pthread.h>
- #endif
- 
--#if defined(__APPLE__)
-+#if defined(__APPLE__) || !defined(__GLIBC__)
- #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
- #endif
- 
--- 
-2.30.2
-
diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 813e8299e1..5c70c683b0 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2feef9322329c0571d9066fede2db0ede92b19f7f7fdf54def3b4651f02af03  bullet-3.09.tar.gz
-sha256 885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
+sha256  49d1ee47aa8cbb0bc6bb459f0a4cfb9579b40e28f5c7d9a36c313e3031fb3965  bullet-3.21.tar.gz
+sha256  885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index cc72be7c60..9afd922ec9 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 3.09
+BULLET_VERSION = 3.21
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
