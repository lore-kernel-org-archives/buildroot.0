Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E411C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32AE60F56;
	Fri, 28 Jan 2022 21:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxLet7DSRgKH; Fri, 28 Jan 2022 21:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D2A6118C;
	Fri, 28 Jan 2022 21:58:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6D851BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9453E60F56
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSpx-gfvbI-V for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6BC760C24
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:58:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso1905456wms.2
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elTbsv3kj8C7p3hJvUpcgg1bCAqrJ0PQSU4HK6oueA4=;
 b=DLs4I8o75thfYI/XAVia0+CaR8lbpb7vtduFKf7ivglKW8D65K2Uc4JrMC8GJuT/s6
 Qz25ot0SjhfaIAyWVJt39YHmUlP8fhY+j7FelmKe/qx3Vy2B1hOELxQCXz6Y0AEnW+DZ
 S6NV6rdOyo0To5/1nfb7vFZE9Y2yQ+TyJhTOGKxELqf8DMnThV/yuWSCNPU8ZBTd5gTc
 5TkPQPevqM/A3jQDJcNAfz8O90I4C//XfzG+3FZQN6LG3j6D7iza6kV9BfNm3VCxqFRL
 KN/o968qQyuja9jlJN01jR0wksiowfaU1sOG6ADZy8A4LMG3bxW0mCfUDVPOw26K06b6
 /cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elTbsv3kj8C7p3hJvUpcgg1bCAqrJ0PQSU4HK6oueA4=;
 b=Ji14yMv+wnM6hDlOxAQQQ4lSeYlVli7Blk643nk1FtaB/csTG86bgYxcFDdcE0bxZh
 bwgjds+IBYugOcyuO076+YnBaezjAaA7DK5CTc9c7K7nJL8in0SYPIPtAf8xp+7yNgPF
 /mPvztugdtSMzjy7lvshMpZOJXM9JeK7+eRGAkot+nu8Qzpe79gEuRBICVmS5BI78z/S
 XEf6eXqeKr0tu9CFa6pMGo7fJ7NMSpk+52MYubOgNWfAzXtSR/l5B+93gOTQSRAOM9/i
 58DC7pZ8pk2eig4+lqrKJfDIKOD6yQ5RsXyxogKfflnr/HUVktjYZwjmoVr1oV92Qghy
 pIpA==
X-Gm-Message-State: AOAM530P8jUcuU4YsN4wcJeEaMXF0Ce144XQ83Q2Z/W+/CYSlP0Hq44D
 KUIw2V9y78nbwi1aV1b4+h3r+i6zbgo=
X-Google-Smtp-Source: ABdhPJyhKiaawAmfKoZ4ptJ8qVKDjesYrrJJl1nwibuTfVfK2fjA6CXubrpD0ESvU9oMa0RROVIw0Q==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr9132024wmc.71.1643407124749;
 Fri, 28 Jan 2022 13:58:44 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n18sm5363138wrm.47.2022.01.28.13.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 13:58:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:56:57 +0100
Message-Id: <20220128215657.3023442-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.24.1
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

Drop patch (already in version)

https://github.com/p11-glue/p11-kit/releases/tag/0.24.1
https://github.com/p11-glue/p11-kit/releases/tag/0.24.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-c-Add-stdint-h-to-fix-compilation.patch | 28 -------------------
 package/p11-kit/p11-kit.hash                  |  2 +-
 package/p11-kit/p11-kit.mk                    |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch

diff --git a/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch b/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
deleted file mode 100644
index d4828666d3..0000000000
--- a/package/p11-kit/0001-p11-kit-lists-c-Add-stdint-h-to-fix-compilation.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 507c394cfcf4edffc5e4450c5d737e545c26b857 Mon Sep 17 00:00:00 2001
-From: Daniel Engberg <daniel.engberg.lists@pyret.net>
-Date: Sat, 12 Dec 2020 18:56:38 +0100
-Subject: [PATCH] p11-kit/lists.c: Add stdint.h to fix compilation
-
-Add stdint.h otherwise compilation fails on FreeBSD 13-CURRENT with "use of undeclared identifier 'SIZE_MAX'"
-
-Signed-off-by: Daniel Engberg <daniel.engberg.lists@pyret.net>
-
-[Retrieved from:
-https://github.com/p11-glue/p11-kit/commit/507c394cfcf4edffc5e4450c5d737e545c26b857]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- p11-kit/lists.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/p11-kit/lists.c b/p11-kit/lists.c
-index 365a6d89..1d9062be 100644
---- a/p11-kit/lists.c
-+++ b/p11-kit/lists.c
-@@ -39,6 +39,7 @@
- 
- #include <assert.h>
- #include <ctype.h>
-+#include <stdint.h>
- #include <string.h>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 3481a40b00..e950060c91 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  8a8f40153dd5a3f8e7c03e641f8db400133fb2a6a9ab2aee1b6d0cb0495ec6b6  p11-kit-0.23.22.tar.xz
+sha256  d8be783efd5cd4ae534cee4132338e3f40f182c3205d23b200094ec85faaaef8  p11-kit-0.24.1.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 284eb0fa35..868e3a7c9b 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.22
+P11_KIT_VERSION = 0.24.1
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
