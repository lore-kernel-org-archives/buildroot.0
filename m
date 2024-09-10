Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F22EDE9AC
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D48E402F3;
	Tue, 10 Sep 2024 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KBsdTYWCT3E; Tue, 10 Sep 2024 18:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5D4C40B24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5D4C40B24;
	Tue, 10 Sep 2024 18:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD6B91BF329
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 18:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA77940B24
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 18:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynbjpJeiHK84 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 18:31:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69A8F402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A8F402F3
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69A8F402F3
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 18:31:06 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso197111539f.2
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 11:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725993065; x=1726597865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yyonDvaNYPHbKxwX4pmnZArPLkrl0FHGt0Fo23u+lK0=;
 b=KRkZn+WJGlP5ey2MBdZ1E3Im4NGCgnFspDHK0Ye4BFS/mofxOMVTtmXOJK4Bhu/fB8
 thmgzduD6KBqt6fh469K0JFEd1xsBqynJGUNmB+6e1JurC8fJBNOZEQ4mwQoogcbXU3v
 /bxquZB4oAIx/gAhzwUiyIZCwKDt4AtKQIVJO0vRs1UtfzVqPzLR/cu2Q1TLG6eK+F7m
 Nzh5t1x7aMUWQCu3tqHL+IhejOtWeZUn9VgRaCagzAnERTj7U0P1HvSEpXQIlP3dhgQz
 ilfl0j7MG7E1+klC0ZMblLK/uNkQOekw0d8z1nEYS0Cbk2UlJYjK/veQ3T1wV28QuewB
 RdrA==
X-Gm-Message-State: AOJu0YzFjbuC5MkfXlgsQROiDKrg8+oih/K3YEt9c5CFLh+IjDEI8ReX
 lyS90FDI3begpAhTJIcQLmA4/qlixK+/9F4yNO6h1OL54OghgrpkoS/WZA==
X-Google-Smtp-Source: AGHT+IE2xpQ6JYj+8QhHtm+X6yslFNfOolMATgruZXMSWjdxXpQ5YUTIgx2SjsxYBhA5iE7aDfmURg==
X-Received: by 2002:a05:6602:29cf:b0:806:31ee:132 with SMTP id
 ca18e2360f4ac-82a961891c6mr2169863939f.4.1725993065072; 
 Tue, 10 Sep 2024 11:31:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d09464b949sm1766041173.147.2024.09.10.11.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 11:31:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 12:31:03 -0600
Message-Id: <20240910183103.2837260-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725993065; x=1726597865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yyonDvaNYPHbKxwX4pmnZArPLkrl0FHGt0Fo23u+lK0=;
 b=UG9tDq1eYcC0Am2Gs4sXKOF0JL7KtJVeNyYdCbzMGWZwIKPyMtCdE2mSPsLblAyG8H
 7UtvuLHPfkwEeDckSp/3H31VdQve9ZlC6ivFV8TTMitMc0y5buxv1rzunIslqzeAUBfs
 n1JN52DRuVrvC5lAJmVvJwqQEItHH5ZgOymJvpWgBCDvzPJxRuo5x4iBrf9UWNEZ4I70
 QVo0G3nL9lpfjhaisujc0/Pv20K9ymZyFXJuIlz9ljcMcZeSIOf4kCsBSOllB6Bcr5Lc
 r9qDUf/olcqVvKZSdcvEvcbhG/qn+RXceA9XWYDt8dxUICh3F/NIlq6cx4lRBQ89SNzP
 VT8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UG9tDq1e
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: bump to version 3.2.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new smart and smartmontools config options.

Add new libyaml dependency to lvm config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libblockdev/Config.in        | 20 ++++++++++++++++++++
 package/libblockdev/libblockdev.hash |  2 +-
 package/libblockdev/libblockdev.mk   | 20 +++++++++++++++++---
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 62ecaa1ac2..dc975535d3 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LVM2
 
 comment "lvm2 support needs a toolchain w/ locale, gcc >= 5"
@@ -72,6 +73,25 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 comment "part plugin needs a toolchain w/ locale, gcc >= 5"
 	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
+config BR2_PACKAGE_LIBBLOCKDEV_SMART
+	bool "smart"
+	depends on BR2_PACKAGE_HAS_UDEV # libatasmart
+	select BR2_PACKAGE_LIBATASMART
+
+comment "smart needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_LIBBLOCKDEV_SMARTMONTOOLS
+	bool "smartmontools"
+	depends on BR2_INSTALL_LIBSTDCPP # smartmontools
+	depends on BR2_USE_MMU # smartmontools
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_SMARTMONTOOLS # runtime
+
+comment "smartmontools needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 1438fad741..9cc3817870 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a5cb33a53ff5969067982704f45399d02555fdb2313ed0c56eac9555397dc2db  libblockdev-3.1.1.tar.gz
+sha256  f2918de9ce1b54ac1aee5e5757e555947896a74674cdca9d05940a53d19e32a8  libblockdev-3.2.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 9ffa15a7a9..6232f243b1 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.1.1
-LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
+LIBBLOCKDEV_VERSION = 3.2.0
+LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
 LIBBLOCKDEV_INSTALL_STAGING = YES
@@ -47,7 +47,7 @@ LIBBLOCKDEV_CONF_OPTS += --without-loop
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
-LIBBLOCKDEV_DEPENDENCIES += lvm2 parted
+LIBBLOCKDEV_DEPENDENCIES += libyaml lvm2 parted
 LIBBLOCKDEV_CONF_OPTS += --with-lvm
 else
 LIBBLOCKDEV_CONF_OPTS += --without-lvm
@@ -67,6 +67,20 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-part
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMART),y)
+LIBBLOCKDEV_DEPENDENCIES += libatasmart
+LIBBLOCKDEV_CONF_OPTS += --with-smart
+else
+LIBBLOCKDEV_CONF_OPTS += --without-smart
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMARTMONTOOLS),y)
+LIBBLOCKDEV_DEPENDENCIES += json-glib
+LIBBLOCKDEV_CONF_OPTS += --with-smartmontools
+else
+LIBBLOCKDEV_CONF_OPTS += --without-smartmontools
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
 LIBBLOCKDEV_DEPENDENCIES += util-linux
 LIBBLOCKDEV_CONF_OPTS += --with-swap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
