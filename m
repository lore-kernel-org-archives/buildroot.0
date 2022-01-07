Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC79840010;
	Fri,  7 Jan 2022 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueh5mTsL-AjA; Fri,  7 Jan 2022 21:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DC0424B7;
	Fri,  7 Jan 2022 21:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4DA1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A91560B36
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlfiIFHXb7Lt for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:38:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71CC360A99
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:38:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a5so9503322wrh.5
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k02bGwe1Qd9L/Hs0dweWfoVa1bXb8d8PKEjYThqkfK4=;
 b=DJDPnsZrBnKPtITZFqR4Qe4aF62HnqMa2NqqQGAsJHnXwPEIHywp4OE6+/60eF3o2p
 uPIqEX2rIVp5+YlYWCxjnLaY8mqKSkNfUtn7A10gZdDa6H9ERrjy7mkDS9/u0DF1WKgk
 SGZrXYVRXmb33iE2NC7+R5+ul26SwwTBs8U3lO96mm+rf0PQQ6KZVtwNMSDZU5fzA3lb
 WBXsF5S5dd+Qox+tL0L96kg5HWx7JPO++5wYZt8r26PsDgnVjhZMgrlNBRIKCCQR7JPJ
 S1F9dY6BsFbklr1RhSG72DG5Dr0zhhin1dQjFCKRlmQmawW9EOXYsOI8EFEsc04URktS
 zveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k02bGwe1Qd9L/Hs0dweWfoVa1bXb8d8PKEjYThqkfK4=;
 b=ciJHa478b5osAGVWptMYj55sCps8H8Vy3Hhsmg90NfV3RyCZOtmzNG8Dmnc9obRov7
 BPi+AWYaZ5QJH79Fwit0TxzTB6jOZyixPpgz5sm0dnyqLSzssi+XBNg9eFHHu13NQbvO
 9Rm5EE5SPK2GJ7d+yeHvtwVUrr4fjMFr8xIgXt2qOr6pNtNmZyDNOfTZ2w3ZJo+7CEN5
 jdF5rkedlumZR7X8kQwbYCaP3J6aeCp/X2OwnHTplJ5WFOESN7Glcunwg0poFANAWhmZ
 LPFks8OdsVO47YPt5Wtlz/pnK0c03JxjkLWpLbnbAymbxZCUlcN2xjythfY7sU+brk9F
 6c1w==
X-Gm-Message-State: AOAM5302C8jp3jdaLrV1BVxukCHj4sjNfxBoEOSK8n6oMc1m9820c6uw
 Wzc5AkX2StTHEpYKd2ToIUqglSsKvPM=
X-Google-Smtp-Source: ABdhPJy2b+vzbacd69s2xP679GM7KSYfWuFZ//DGeYJUAaJq/BsxzRKEGbqnTIDU4Evo+c1tkVjsEg==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr6404773wrk.164.1641591537592; 
 Fri, 07 Jan 2022 13:38:57 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b13sm5773947wrf.64.2022.01.07.13.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:38:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 22:37:40 +0100
Message-Id: <20220107213741.1668818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/matchbox-lib: bump to version 1.12
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

Drop second and third patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-lib/0002-libpng15.patch      | 26 -------------------
 .../matchbox-lib/0003-include-setjmp-h.patch  | 17 ------------
 package/matchbox-lib/matchbox-lib.hash        |  3 +--
 package/matchbox-lib/matchbox-lib.mk          |  6 +++--
 4 files changed, 5 insertions(+), 47 deletions(-)
 delete mode 100644 package/matchbox-lib/0002-libpng15.patch
 delete mode 100644 package/matchbox-lib/0003-include-setjmp-h.patch

diff --git a/package/matchbox-lib/0002-libpng15.patch b/package/matchbox-lib/0002-libpng15.patch
deleted file mode 100644
index 3d68573b5f..0000000000
--- a/package/matchbox-lib/0002-libpng15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Support for libpng 1.5+ shamelessly taken from Gentoo.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/libmb/mbpixbuf.c
-+++ b/libmb/mbpixbuf.c
-@@ -247,7 +247,7 @@
-     return NULL;
-   }
- 
--  if ( setjmp( png_ptr->jmpbuf ) ) {
-+  if ( setjmp( png_jmpbuf(png_ptr) ) ) {
-     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
-     fclose(fd);
-     return NULL;
-@@ -269,8 +269,8 @@
-       ( color_type == PNG_COLOR_TYPE_GRAY_ALPHA ))
-     png_set_gray_to_rgb(png_ptr);
-  
--  if ( info_ptr->color_type == PNG_COLOR_TYPE_RGB_ALPHA 
--       || info_ptr->color_type == PNG_COLOR_TYPE_GRAY_ALPHA
-+  if ( color_type == PNG_COLOR_TYPE_RGB_ALPHA 
-+       || color_type == PNG_COLOR_TYPE_GRAY_ALPHA
-        )
-     *has_alpha = 1;
-   else
diff --git a/package/matchbox-lib/0003-include-setjmp-h.patch b/package/matchbox-lib/0003-include-setjmp-h.patch
deleted file mode 100644
index 72e1e45d8f..0000000000
--- a/package/matchbox-lib/0003-include-setjmp-h.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-matchbox-lib: include setjmp.h
-
-Based on this upstream patch:
-
-   http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/commit/?id=9315bcce1f01e7d6c00161442d61d3c676794d9d
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---- libmatchbox-1.9/libmb/mbpixbuf.c.orig	2014-02-21 12:45:46.867035956 +0000
-+++ libmatchbox-1.9/libmb/mbpixbuf.c	2014-02-21 12:46:43.482949583 +0000
-@@ -22,6 +22,7 @@
- 
- #include <strings.h>
- #include "mbpixbuf.h"
-+#include <setjmp.h>
- 
- #define BYTE_ORD_24_RGB  0
- #define BYTE_ORD_24_RBG  1
diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index d48fb32043..8144c10258 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,4 +1,3 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/1.9/libmatchbox-1.9.tar.bz2.md5
-md5	9f73e7515cc4679171a5db180dc1343b	libmatchbox-1.9.tar.bz2
 # Locally computed
+sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 5541867699..00ca4a0d15 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-MATCHBOX_LIB_VERSION = 1.9
+MATCHBOX_LIB_VERSION = 1.12
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
-MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
+MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
+# From git
+MATCHBOX_LIB_AUTORECONF = YES
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf xlib_libXext
 MATCHBOX_LIB_CONF_OPTS = --disable-doxygen-docs
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
