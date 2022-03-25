Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AF5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BAD840239;
	Fri, 25 Mar 2022 21:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShfcQumOSkoz; Fri, 25 Mar 2022 21:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C6140AD0;
	Fri, 25 Mar 2022 21:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B68BB1BF380
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4BBA60BB0
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nAxKpg6XritO for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 21:37:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C6CE60BAA
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 21:37:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u3so12484829wrg.3
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9+hAXudF7tHSdGec1IfZlVLtWMffHjsoZLXffu5VLk=;
 b=GJwNpy6tu5jD7/2H9nZfUApFS9afqI9rxU0JxcZhr7gZETuZC0Ve62hef4bF6zAjgm
 pCTJYjYCxt7liMmE2EYFW323LhbTbMFbRkdRnooAOdrFsTAPTbuTfeqF6yUmbYW5wTl9
 gxEr37H39eK9pIj40yPkV1/DkhVFHl/qipiaZBmgN0NzGgQbGzsiFidNGbe/sHOwGKJh
 EZyqG/tyaNsVscFzIkFTJ6TijDurbgJJMD50uwL1uW/QaPm9yAZNIHQmdxmvk7gDbbgp
 nyWS1oah6n+WJsRPqwUFQ6/Ec59r5u0X0cNDBZzvqUv/Fs1FirHlyCCPbt9FFztD7xrJ
 MXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9+hAXudF7tHSdGec1IfZlVLtWMffHjsoZLXffu5VLk=;
 b=KpV2Bvfu9Ay8zJVhm/eb1Sgq7GRxetn8Bpt0WANbBXKU1mOPQDUMlG7QyquE+7LqGf
 vxwWAGm9bHpW/f7rOsQvVWRQ5q2H9FLHneTRQelHkXwVKsy21Ja6GGhFoORo+FKaZNIY
 +z9RvDUkPy+N7U65/EsDQWhy90bnAYni+VRNDSZbj83H4YKuaBNqdhR1B4hLe1i4jpDA
 DzyBgDo1zT35vodPDlAQ/n+0U6KK9uq+5qzUIwtiKSth8omoCc6Xxc3onKJPKPx0wXoR
 Vo3ncjbKzbONKCiHl47jGK50PRDZ+lrA/UqHKyc+rgji1Cd3OeyqO3nB8PMKep58rTw1
 +RPA==
X-Gm-Message-State: AOAM5336aSeZzGoHKRz0syS5f4sCzoNvhM61r3L4OSCKdHGeVgZD+byB
 vmzYzlVYjiKWKXgY8B+ZdD15LTSQwLw=
X-Google-Smtp-Source: ABdhPJz1B71ut6MptulorLlgurD/uIZlQIr8LkYzAm4AzJU2YcueuMW5MadYugKzKFUBDPPdO2uGHQ==
X-Received: by 2002:adf:fcce:0:b0:203:dcdb:dd80 with SMTP id
 f14-20020adffcce000000b00203dcdbdd80mr11325130wrs.455.1648244238285; 
 Fri, 25 Mar 2022 14:37:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000188100b002041a652dfdsm6571215wri.25.2022.03.25.14.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 14:37:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 22:35:57 +0100
Message-Id: <20220325213557.757894-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump to version 5.16.2
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

Drop patches (already in version)

https://github.com/kdave/btrfs-progs/blob/v5.16.2/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nst-h-to-fix-build-with-5-12-headers.patch | 43 ----------------
 ...-sys-sysinfo-h-conditionally-on-musl.patch | 49 -------------------
 ...ocal-definition-for-alignment-macros.patch | 46 -----------------
 package/btrfs-progs/btrfs-progs.hash          |  2 +-
 package/btrfs-progs/btrfs-progs.mk            |  2 +-
 5 files changed, 2 insertions(+), 140 deletions(-)
 delete mode 100644 package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
 delete mode 100644 package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
 delete mode 100644 package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch

diff --git a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
deleted file mode 100644
index b6c1a42456..0000000000
--- a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b28f7bd9bba6f65258da48955154794f466b4104 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 30 Dec 2021 15:23:59 +0200
-Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
- headers
-
-btrfs-tools compile fails with mips, musl and 5.12+ headers.
-
-The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
-add an explicit include of const.h to pickup the macro:
-
-  | make: *** [Makefile:595: mkfs.btrfs] Error 1
-  | make: *** Waiting for unfinished jobs....
-  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
-  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
-  | collect2: error: ld returned 1 exit status
-
-This is safe for older kernel's as well, since the header still
-exists, and is valid to include.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-[remove invalid OE Upstream-status]
-Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/b28f7bd9bba6f65258da48955154794f466b4104]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kerncompat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index df167fe6c..2503d1afa 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -29,6 +29,7 @@
- #include <stddef.h>
- #include <linux/types.h>
- #include <linux/kernel.h>
-+#include <linux/const.h>
- #include <stdint.h>
- 
- #include <features.h>
diff --git a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
deleted file mode 100644
index 7473fe67cb..0000000000
--- a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 Jan 2022 22:44:44 +0100
-Subject: [PATCH] btrfs-progs: include sys/sysinfo.h conditionally on musl
-
-Make inclusion of sys/sysinfo.h conditional to avoid the following build
-failure on musl:
-
-In file included from .../i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
-                 from ./kerncompat.h:31,
-                 from common/utils.c:42:
-.../i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
-    7 | struct sysinfo {
-      |        ^~~~~~~
-In file included from common/utils.c:27:
-.../i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
-   10 | struct sysinfo {
-      |        ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
-
-The 'struct sysinfo' is defined in linux/sysinfo.h and sys/sysinfo.h,
-while both must not be included at the same time. Stop including
-linux/kernel.h that sometimes unconditionally includes sys/sysinfo.h and
-causes the double definition for some reason. As we now include
-linux/const.h directly, there's no other effective change.
-
-Pull-request: #433
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5]
----
- kerncompat.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 2503d1afa..6ca1526e2 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -28,7 +28,6 @@
- #include <assert.h>
- #include <stddef.h>
- #include <linux/types.h>
--#include <linux/kernel.h>
- #include <linux/const.h>
- #include <stdint.h>
- 
diff --git a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
deleted file mode 100644
index 86c63edc30..0000000000
--- a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
-From: David Sterba <dsterba@suse.com>
-Date: Thu, 13 Jan 2022 14:47:08 +0100
-Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
- macros
-
-There's still problem left with compilation on musl and kernel < 5.11,
-because __ALIGN_KERNEL is not defined anymore:
-
-../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
-volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
-
-Due to the entangled includes and unconditional definition of
-__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
-eventually (as kerncompat.h is the first include). Instead add local
-definitions of the macros and rename them to avoid name clashes.
-
-Pull-request: #433
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kerncompat.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 6ca1526e2..f0a6e196e 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -359,7 +359,14 @@ do {					\
- 
- /* Alignment check */
- #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
--#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-+
-+/*
-+ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
-+ * issues caused by moving the definition in 5.12
-+ */
-+#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
-+#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
-+#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
- 
- static inline int is_power_of_2(unsigned long n)
- {
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 339eab02aa..14eeb1ca07 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  6230f8f33961bd62633d601b0d049a3c6b833c1a1a7a2f2782d0c5796e7ab920  btrfs-progs-v5.15.1.tar.xz
+sha256  9e9b303a1d0fd9ceaaf204ee74c1c8fa1fd55794e223d9fe2bc62875ecbd53d2  btrfs-progs-v5.16.2.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 54922df839..9bf50ccfda 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.15.1
+BTRFS_PROGS_VERSION = 5.16.2
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
