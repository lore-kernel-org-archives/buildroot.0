Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 03:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B76404A4;
	Sat, 25 Dec 2021 03:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yq5eCT_j9o0E; Sat, 25 Dec 2021 03:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A150640169;
	Sat, 25 Dec 2021 03:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA6F71BF4DD
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 03:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7218415E0
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 03:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQiJt12wFHHi for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 03:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9235409F9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 03:36:30 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id e8so7660602ilm.13
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 19:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VB1acKtgfNR3B4k/tq/7mtXyuYC0gW+a3LhH3g3Teko=;
 b=o3cPyOYrmUb+3X0ZOKMiHfM2PeAOCFkNQPpKrh9coqdipVjGsDVteitbOYL3jW6BOU
 ahcc7Lau1oFd2ykRKO1HTH4U1mdbQGyJisQ1ZEiFF7pjzAdUy1p2NVQbmqGDBYhdSuwQ
 xVJIIYuieLbY4tPMVbPm81fo/dGx9Z/XRNpBhxbPWxelZFnx9pg20N93STez3Isz/NnC
 37fk69/Vc07hcTZlU3jpgEHupERfaQRoNAdUIWc4lOqD4h9HajyzMkwzlidSD163WkjN
 t2ZzvsvhyFVPMA/9iFXI6KNjwY8AJgyS34rCo1o4O+9H+37c3CEQql0SDUTFYXR8VUQA
 EOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VB1acKtgfNR3B4k/tq/7mtXyuYC0gW+a3LhH3g3Teko=;
 b=D6zS5Mr1Pfj4s0yeg34qe6o98S8f6Gj8H1VXSr3kX5++PpvSKW1ThWR4xXFNmlCKqs
 8uVtQRsLIHVwjFcv8MCkieQVYswBx6p8JQVseUhwcmJdbdUo2pHCSSG/FMLqFur6OCD1
 f58QpkzQfAwQoP8gi9R4X/1S743LyYBOkz/az/p74CH+MCIPQzENcBS5Dw9Lai7hz4pF
 tBkWDtoW026fSbsMIbDzEdXSd58L14rSmK1X8hhgkYkqrNdQZGQSHDaZ4Kvy+FIbSiWS
 dttmb8QXdAx7SlrUZV3xpNqy6u0V8s/SoAoCdmN4FcFx8I3QehFjBacTNhq2GLiRUilq
 y7PQ==
X-Gm-Message-State: AOAM531rzF3GvJ0A1P+wwh2wUphAxSk/H9dGbpX33BqEB+BkURzNo+Nc
 TCrctnykg8DHpowfnalmlwSDOhNZtftGMw==
X-Google-Smtp-Source: ABdhPJwl0LYGkrDcy9Dc1ign3q5ZE2o1Jx2wSoRCjJsAOR3kNmmQMqLrnmGu+QrQR0AFOjRplKcEOw==
X-Received: by 2002:a05:6e02:190e:: with SMTP id
 w14mr3825499ilu.191.1640403389484; 
 Fri, 24 Dec 2021 19:36:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-252-115.hlrn.qwest.net.
 [71.218.252.115])
 by smtp.gmail.com with ESMTPSA id b8sm6507404iow.2.2021.12.24.19.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 19:36:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Dec 2021 20:36:25 -0700
Message-Id: <20211225033626.776325-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/cryptsetup: bump to version 2.4.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Martin Hicks <mort@bork.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable optional ssh-token support when available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Remove-json_object-typedef.patch     | 48 -------------------
 package/cryptsetup/cryptsetup.hash            |  4 +-
 package/cryptsetup/cryptsetup.mk              | 12 ++++-
 3 files changed, 12 insertions(+), 52 deletions(-)
 delete mode 100644 package/cryptsetup/0001-Remove-json_object-typedef.patch

diff --git a/package/cryptsetup/0001-Remove-json_object-typedef.patch b/package/cryptsetup/0001-Remove-json_object-typedef.patch
deleted file mode 100644
index bbfd1aa075..0000000000
--- a/package/cryptsetup/0001-Remove-json_object-typedef.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 567e7f8664c621f8aeaa95d9f4ab4b590574f572 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 15 Aug 2018 14:13:46 +0300
-Subject: [PATCH] Remove json_object typedef
-
-The json-c header already defines the same typedef. While C11 allows
-typedef redefinition to the same type, older versions of gcc disallow
-that.
-
-In file included from lib/luks2/luks2_internal.h:32,
-                 from lib/luks2/luks2_disk_metadata.c:24:
-lib/luks2/luks2.h:86: error: redefinition of typedef 'json_object'
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Upstream status:
-https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/91]
----
- lib/luks2/luks2.h | 1 -
- lib/setup.c       | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/luks2/luks2.h b/lib/luks2/luks2.h
-index ee57b41ba974..25e36190da45 100644
---- a/lib/luks2/luks2.h
-+++ b/lib/luks2/luks2.h
-@@ -83,7 +83,6 @@ struct luks2_hdr_disk {
- /*
-  * LUKS2 header in-memory.
-  */
--typedef struct json_object json_object;
- struct luks2_hdr {
- 	size_t		hdr_size;
- 	uint64_t	seqid;
-diff --git a/lib/setup.c b/lib/setup.c
-index fddbe7ef7897..856f6e80f465 100644
---- a/lib/setup.c
-+++ b/lib/setup.c
-@@ -28,6 +28,7 @@
- #include <sys/utsname.h>
- #include <fcntl.h>
- #include <errno.h>
-+#include <json-c/json.h>
- 
- #include "libcryptsetup.h"
- #include "luks.h"
--- 
-2.18.0
-
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 0aa3f79df7..b3bb859bdc 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
-sha256  b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f  cryptsetup-2.3.6.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.4/sha256sums.asc
+sha256  170cc2326a9daeeeb578579176bd10d4a60ee5c4fc5bc69018ce67dafc540b9c  cryptsetup-2.4.2.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 3cf6c8a301..980a36faa8 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.3
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
+CRYPTSETUP_VERSION_MAJOR = 2.4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
@@ -33,6 +33,13 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+CRYPTSETUP_DEPENDENCIES += libssh
+CRYPTSETUP_CONF_OPTS += --enable-ssh-token
+else
+CRYPTSETUP_CONF_OPTS += --disable-ssh-token
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
 CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
 else
@@ -49,6 +56,7 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
 
 HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
 	--disable-kernel_crypto \
+	--disable-ssh-token \
 	--enable-blkid \
 	--with-tmpfilesdir=no
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
