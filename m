Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:19:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138BF6103D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 138BF6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E59605C4;
	Mon,  8 Nov 2021 23:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUCijG2fy5Li; Mon,  8 Nov 2021 23:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3577605CA;
	Mon,  8 Nov 2021 23:18:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BCA01BF2C4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B87280BEE
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUuSEnhEPHvD for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16F1680B92
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636413533;
 bh=s7zVJquoUXS3SY3H/+ic2mAJ3aA+4tDOdc6a5KfMHo8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GDrJ2plkkx7zYDoVgSkD+NKJmmTxdKRyduAjuOktkXuupof0vwd/PzSEgHYjteUfT
 EfhtUqz9oHmiJNFfT5hAJn88UiUMhCOxsPYkrKPUQgU37sf2KKE8M+3UVu9i+I/mOY
 1PWyD5cXm2PIXA4GW+UoszUP4d/PIRRvCGxtEXv8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N8GQs-1mfhgz02rI-014B8v; Tue, 09 Nov 2021 00:18:53 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:18:52 +0100
Message-Id: <20211108231852.15687-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:4aDlg4V4WlpR2yZbuVMNEjAWOcqJZGQ77M57t+HEzS8NAhtdjvt
 zr9fa9ZP6Pmx5sDvxBoHkAfrqZqP1FORBbqY/hEEVog5o6AAgOMtFY4qVnSH5MqRBwHVyiM
 noMC3AoYM0EfpHayEPg2Qz/SLmnmr2GBy4rWv5AEKmAkVj6T1CUV9A2bkMWJhbsBfSjCISd
 RUaZ4NM8THqRVZER5/uxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yBz2vJo8O9U=:0HZZzEI+QjR0ib8x5dWIRm
 TBgZETPYGPvInYhsmthWx+iK2a3jpWt70qtFm3wYInI/r+SJgV8gPYICdlNW5eNcMGy3LHeXM
 yJCjdih+/GZgyffZEK+fN0f0TRyaXkb5z6bHxY1nfxTfVuzrogX7JgSvuhnFkFSOIfPfrgKUw
 ehJwM1rFUakojcMUN/LKa5e514O4UtNhtmAlCim1iNPPRPwsn8FlqUxmmlHuEV2KjsgjgrL3Y
 rSZFngoYs9d1w6bWURpMTBd7IPq+Oh2azvfNYLowNE52bSPU7yu5/zO/Y6DsuT8H6M1J7YF0n
 lDJPsVYqr2X2kljUwGLk1uMG3AnWmyKltf+hEH4tNra9QPZLsOGerGUMuUAlVvdAadeKO5jiG
 O3pbLbEcDlg85BPYKC6u35v4Trfyr2avREcFihx3+2dZIR3PlnBkd2nG7r50yKrtvspcXCslg
 6W33CWPqTlE2Y5+0vV8pyXKnPx2I04Mq4GHIWpj5UhHHWqC9hi+jvbPuEkhSHQxfLqdRjZAp0
 ijdQNuK7HidyFUJAZKe776DOKoX/tWlhD0LaJHPwbCN1Q3Zyj7j5frhLiea/96S6KX3wDjB1f
 JZyqz9vsBg0UNy0UtgplUz0S0EoV4GN3MgNEoBctpRW8DCMcz/LwCL+VcRPU31zajXF9b7Sfi
 T1nuJvSinhM8enEe48QJCbxIGEodd9IoOObnTh5sR8VyNIZbXRjAaurWSWZgKiCMw/IuS33Nm
 FlgcAAUXgeq40wrdJAhC7ipHM3NQ48tOoGHfMl4APyMbVXAniYRvBNRx70dw5PwBiYPnQCn70
 BZ95Zft9YMXN5yU2LKq75XH09TurUsYQulfFwC1BnN24bR3+czbuWG2FzfxNcJhD8fPR6erVO
 lg16gT+OdXXBnEEBvrcORzZO+9w6rBbQlxTa3DH5RmKXVWuJpOTio8XDPOAScc/UZItQhBnTh
 oCPCIUwI0y9Kq5jFLpf6nCROnyiTrCbd8mgpFHKZ4xd/lMfTdDxxWMX6zHMyTafxmUpaVV5/b
 VYbM6JzxVrY9JX/iFDdM7ohQBl8+uJ/7TAzJM9VdVuoFRc7dZNA/UTYjuBG7mp08J2jK1cYMZ
 IR6suDmXPm0JLQ=
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.22.1
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

- remove 001-keymap.h-add-missing-includes-to-fix-musl-build.patch
  (superseeded by upstream commit [1])

- add handling of new --with-libudev/--without-libudev option

For details see [2].

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=976a2f681b4e4e16edffd972d53a623b895c5646
[2] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.22

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...d-missing-includes-to-fix-musl-build.patch | 68 -------------------
 package/libv4l/libv4l.hash                    |  2 +-
 package/libv4l/libv4l.mk                      |  6 +-
 3 files changed, 5 insertions(+), 71 deletions(-)
 delete mode 100644 package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch

diff --git a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
deleted file mode 100644
index 238f8fc377..0000000000
--- a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From baba68cdcb44fc11d0ba8ce2c13eb5b06bbd9b33 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Wed, 30 Oct 2019 07:15:23 +0100
-Subject: [PATCH] keymap.h: add missing includes to fix musl build
-
-Needed to fix these build errors:
-
-In file included from keymap.c:13:0:
-keymap.h:23:2: error: unknown type name 'u_int32_t'
-  u_int32_t scancode;
-
-keymap.h:36:1: error: unknown type name 'error_t'
- error_t parse_keymap(char *fname, struct keymap **keymap, bool verbose);
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch was not sent upstream due to broken mailing list setup:
-
-<majordomo@vger.kernel.org>: host vger.kernel.org[209.132.180.67] said: 553
-    5.7.1 Hello [xx.xx.xx.xx], for your MAIL FROM address
-    <bernd.kuhls@t-online.de> policy analysis reported: Your address is not
-    liked source for email (in reply to MAIL FROM command)
-
-Hello [xx.xx.xx.xx], for your MAIL FROM address <berndkuhls@hotmail.com>
- policy analysis reported: Your address is not liked source for email 
-
- utils/common/keymap.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utils/common/keymap.h b/utils/common/keymap.h
-index f2b29632..bb1edce9 100644
---- a/utils/common/keymap.h
-+++ b/utils/common/keymap.h
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
-diff -uNr v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h v4l-utils-1.18.0/utils/ir-ctl/keymap.h
---- v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h	2019-09-22 11:22:54.000000000 +0200
-+++ v4l-utils-1.18.0/utils/ir-ctl/keymap.h	2019-10-30 07:06:18.250548011 +0100
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
-diff -uNr v4l-utils-1.18.0.orig/utils/keytable/keymap.h v4l-utils-1.18.0/utils/keytable/keymap.h
---- v4l-utils-1.18.0.orig/utils/keytable/keymap.h	2019-09-22 11:22:54.000000000 +0200
-+++ v4l-utils-1.18.0/utils/keytable/keymap.h	2019-10-30 07:06:56.218816126 +0100
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
--- 
-2.20.1
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index e45dd576bd..d99d5e0992 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256 956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7  v4l-utils-1.20.0.tar.bz2
+sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 7b61823cec..b11c8975d1 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.20.0
+LIBV4L_VERSION = 1.22.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
@@ -45,8 +45,10 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-udevdir=/usr/lib/udev
+LIBV4L_CONF_OPTS += --with-libudev --with-udevdir=/usr/lib/udev
 LIBV4L_DEPENDENCIES += udev
+else
+LIBV4L_CONF_OPTS += --without-libudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
