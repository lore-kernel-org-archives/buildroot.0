Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583FBCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CADAF60A8C;
	Sun, 24 Sep 2023 21:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CADAF60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L78IY4M2P2hW; Sun, 24 Sep 2023 21:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A62A60E19;
	Sun, 24 Sep 2023 21:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A62A60E19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB6A71BF313
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92CD241621
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CD241621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vz3crxMayFZp for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:02:31 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128C74161C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128C74161C
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32164a6af64so4388301f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695589349; x=1696194149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uqxEqGM101IvFeL4SHR2oipkr9xq9YeYAH4KGN0BaY=;
 b=hVIV7in3xxN3uVB8x6OufbNR3efsvqMQQb3BiwFXAPHkNswKhizIujksTCFNh3MaGz
 C3YfVRLyPFSzBOS7n1OBCWPr9sxKYE2JmypzoxeiIw2W8GkDD9ww6cRrfuB/ln3vbmig
 mZkpGoCNVcLZuc4rrKyclbYojO2BSTuoQKcDIsN4HFsNOws5XglBwJ5MI/1tItNs7at0
 WYPpfS30fLGVQI3lkkEl5TcZFC2mtSanhlbL5GBrlAueQDhtx3N6r6fhnztfphBk1FaF
 1BZLF/hJ6ysj7c8pScKjHNMjau0MU6tnYdzDaXVmvyb36B8+Xfw+1kvOgcZtW2rLhGKY
 MuTg==
X-Gm-Message-State: AOJu0YzGo9+K6mL2ys/fhRFtgUTLPmT+K0xyUeHseEXzQTWkJtLeD/d9
 8V7PMf6954LED9r/79dY8iPn+H4PjXM=
X-Google-Smtp-Source: AGHT+IH8W4biE8IBnyCRv65QLx4Z348x53Rn+kMsVjY0YZuRlc1r56BK9sJdVVtqigf3I5BmXypVCA==
X-Received: by 2002:a5d:66c5:0:b0:315:a043:5e0a with SMTP id
 k5-20020a5d66c5000000b00315a0435e0amr3906331wrw.56.1695589348678; 
 Sun, 24 Sep 2023 14:02:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d5051000000b003197c7d08ddsm9999160wrt.71.2023.09.24.14.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 14:02:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:02:24 +0200
Message-Id: <20230924210224.1565024-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695589349; x=1696194149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4uqxEqGM101IvFeL4SHR2oipkr9xq9YeYAH4KGN0BaY=;
 b=VDIw+iErgHvh6GozszjoP9Cp7azbI+GAFE4nT36yshPyYLDRMWhqtGEXvLib8YnRe7
 0ZP9IP9nQMlt3XI/k2wxru1LSyDYn5RFWIo+JoLlPSNtaD8IUTZf3D5M5h5IFBcmdb8u
 BcqjQN1XAEbeuG9U8cCX3M9tAesr0yuGtYkePGb5Wi2gb/bczZqxQyUEzFGuNZN6YTMT
 uJ+xfRupEoCR8+CydyGSd83nlWn8zJwlUxSloB27TTWPYZE9l5SS48akzcd05bQ69aRx
 fOOHWlCicxZduXKAIL+AEGSqb3bNwdTn8axdqL8hniFSJZ9HF352XrmBYfhloCY+ntwQ
 U7zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VDIw+iEr
Subject: [Buildroot] [PATCH 1/1] package/libdnet: bump to version 1.16.4
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

Drop second patch (already in version)

https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.2
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.3
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...02-Correct-path-to-string-h-from-bsd.patch | 26 -------------------
 package/libdnet/libdnet.hash                  |  2 +-
 package/libdnet/libdnet.mk                    |  2 +-
 4 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 760a0619d1..31e229997f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -650,7 +650,6 @@ package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
 package/libcuefile/0001-fix-static-link.patch Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch Upstream
 package/libdnet/0001-python-makefile.patch Upstream
-package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch Upstream
 package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch Upstream
 package/libdvbcsa/0001-altivec-powerpc64.patch Upstream
 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch Upstream
diff --git a/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch b/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
deleted file mode 100644
index 2aa4f4516b..0000000000
--- a/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 347c23da1ec6f19b0b0143d53edcc209e522bbf2 Mon Sep 17 00:00:00 2001
-From: Oliver Falk <oliver@linux-kernel.at>
-Date: Wed, 29 Jun 2022 13:27:45 +0200
-Subject: [PATCH] Correct path to string.h (from bsd); Fixes #74
-
-[Retrieved (and backported) from:
-https://github.com/ofalk/libdnet/commit/347c23da1ec6f19b0b0143d53edcc209e522bbf2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- python/dnet.c   | 64 +++++++++++++++++++++++--------------------------
- python/dnet.pyx |  2 +-
- 2 files changed, 31 insertions(+), 35 deletions(-)
-
-diff --git a/python/dnet.pyx b/python/dnet.pyx
-index d9cbc90..af65a11 100644
---- a/python/dnet.pyx
-+++ b/python/dnet.pyx
-@@ -40,7 +40,7 @@ cdef extern from *:
-     unsigned long htonl(unsigned long n)
-     unsigned long ntohl(unsigned long n)
- 
--cdef extern from "string.h":
-+cdef extern from "bsd/string.h":
-     int     strlcpy(char *dst, char *src, int size)
- 
- cdef __memcpy(char *dst, object src, int n):
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index c31ec90596..0ffeca603a 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b151c4913758ef80daf4558361b4f2680a37b01d59272625bb78c77183062c63  libdnet-1.16.1.tar.gz
+sha256  7df1f0a3db9cf03b48cf50ab273fd6a20c1be99eb9344b9663fe3fd9ed9dab65  libdnet-1.16.4.tar.gz
 sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 14af07e6d5..fc2995979d 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.16.1
+LIBDNET_VERSION = 1.16.4
 LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
