Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26464C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C12984040B;
	Sat,  8 Jan 2022 22:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNFgvcszJ6vo; Sat,  8 Jan 2022 22:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B38402FF;
	Sat,  8 Jan 2022 22:40:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5929E1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42B79402FF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQgddmE2DZEc for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3690D4021E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:39:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id e5so6344755wmq.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/E7GNY8BdroBbmQZqkh+3O3Blk8DRpa9be8d1V7TRY=;
 b=CdT81XIO/9Gn1mNkxGNiYkRprm8wdflczy092gz8mLrKghmOK5Z5sA8T0YMGwWH+jP
 M0EtDpJJfyaqIrQ7crtRWKQGYP73FKH4A8V3BL+SWrn9qlhjReqo0oXHlrOyzv58yxOU
 BJ4NoAT3zRzORIZeP/foP/gATC0bh3mNLsGh8+0vSOkp9H1c65R8Skw/v3arW6Huj1kH
 Ma6x1Pmx0VFWqcuo/Ks05iGE8vNBfnfCgj9vTdlCYZorfdUZlU5QOsNT45rwLJxr96Ix
 nuNIlzyn9ABokaowMmeJOJXFgy17/IIC3Xrki/x8M83hWaDJYOJjSCRkRvy9kbou2F6k
 TpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/E7GNY8BdroBbmQZqkh+3O3Blk8DRpa9be8d1V7TRY=;
 b=szhW+54DtrT9KRXZ9e12qwOgKBdm27JiIjp6tHcOB4TzbngLA+c1tckaZd844dV1TF
 vI45p0f7hk0QNN4sEjuYJ6pAYmGY9aL1DQGSvTjZmyBmkFSy6wLXNcMuUficdbTljklK
 2Xu8e+Jf/GP5thWqoXFb5lJl1M9gg8BjnxmB3zciSWoJJSU2ElaNLUPCfp+KRgn8iUwc
 T3TsTO+Jsrn0Jw9GAQr148BlO/5LCb6EQrcT933o2yMUq93mctyp8fpJN4lI08ImdYp4
 Mvm8fkjuIDxopu0UINVOLKyEPd1OH2uTGtFg6Fk7OIECoUwWQEp4+l+kmMVF9dkD3bSB
 lmUA==
X-Gm-Message-State: AOAM530V3zsIF5N+X0Z4fHamyZASWkx4e6K0Rn8veozPLjxMDUQ+sOGG
 jeUvg5NZLw3hBrS/6A5ZbCMFbFbg39g=
X-Google-Smtp-Source: ABdhPJyTWdHFERsBOBW5WFlrx9SBvv7lLCynkdP+aZ1aLb9KoqW8eFQpjqgxsaS1bf2XChSXgdu85Q==
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr16277771wmq.91.1641681590375; 
 Sat, 08 Jan 2022 14:39:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g9sm2778267wmq.22.2022.01.08.14.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:39:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:38:29 +0100
Message-Id: <20220108223829.3701891-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108223829.3701891-1-fontaine.fabrice@gmail.com>
References: <20220108223829.3701891-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libbsd: bump to version 0.11.3
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update indentation in hash file (two spaces)
- Update hash of COPYING:
  - files added and year updated with
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/01f0d1ea1e71f1018a009ebd9203dd48e6d90c45
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/37a9b56c05339301510213c41fc507ea31cc2464
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/d54ceb37ce9d7c04fa450a6638eaee31375bbde1
  - files removed with
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/847e682f8de452d5f0038458f06ae68ae3959b3a
- libmmd is a mandatory dependency since version 0.11 and
  https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/847e682f8de452d5f0038458f06ae68ae3959b3a

https://lists.freedesktop.org/archives/libbsd/2021-February/000298.html
https://lists.freedesktop.org/archives/libbsd/2021-February/000302.html
https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbsd/Config.in   | 1 +
 package/libbsd/libbsd.hash | 6 +++---
 package/libbsd/libbsd.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 845a22162b..093a2e646c 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBBSD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBMD
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 95887bd607..17bb32e01c 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html
-sha256	34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887	libbsd-0.10.0.tar.xz
-sha256	933d14a6bc89ee1fd7adbf5b6ec97f6ff0e002549d0b0c164f8a8895371d78f8	COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
+sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
+sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 256a75f15e..86df8a97a2 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.10.0
+LIBBSD_VERSION = 0.11.3
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
@@ -12,5 +12,6 @@ LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_CPE_ID_VENDOR = freedesktop
 LIBBSD_INSTALL_STAGING = YES
+LIBBSD_DEPENDENCIES = libmd
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
