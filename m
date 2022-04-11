Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B001C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C257260E63;
	Mon, 11 Apr 2022 21:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cV8-cmlmPJpH; Mon, 11 Apr 2022 21:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A1760ACB;
	Mon, 11 Apr 2022 21:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58F741BF239
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 557624092E
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikqrmXlMd2Cm for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 21:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04EE14092D
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 21:59:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e8so8624712wra.7
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xp1q57qs8rHSVUXODMhjGLEqzDi9Nr39+7DNlbMVzOY=;
 b=OroT/j2hFEUiaMHfXmOngGy6nixvaVmZ6RCnEbOgEWxhdHaE/qxhYuI7+7FfXcBSvi
 /i5VUOwakzHBsANlnfnierejstf0yTYh1fQrEez/YlKUXNzTMUCsmgT4BkOAf6CG1ynv
 vc1thKy82wBnhXurCtjYkUUDyMfRV51NiBoQBDEW0HMGfHBj5IgmmqZ6SW0G+hqdiyMm
 RxZ+BSOeZBhKL28RrrgOwtVN1DLduvnX07gnVwkhr6yaPiOtg5ljQrd8uOuciiGUgwG3
 5TZT/pa7taosVqrsWY2PZFtkGzc/mI+2yUgtwCouAcb58W+2FUUCTORR8CMuI0dpKnDb
 rDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xp1q57qs8rHSVUXODMhjGLEqzDi9Nr39+7DNlbMVzOY=;
 b=Bu4kvllv07l32+DyIVRTWCF0M8fNfdd4T3E7uQEkPOWUDAw7CQlIeJauKR26bYs8nG
 21V0hSGwYeCWkCHRNCSP503PxRtRrMl4rZYVp6UDkmtVma7qs5/sPDrUXhUQXyUvUXY2
 r+3nGWjU+0wit2071RO693c3ZmEA9LpFP6lPfPo8/2JvD0Pr1XYE+OaebjNHWcfeeF+n
 sZPh8N5jX9FC8+k7tTNvzs/hoqNqNfjsQgNBrlpVJGMy4Z40Ng51BTf6VQ15MDlg1rC/
 WSek74SwqT92Wmwftfl8BXI/bZuSF9hV76BsolsKEPqos1SYxq9ihsd/SbyV6n7rhpo+
 4emw==
X-Gm-Message-State: AOAM533xSNhlUJ+lni/ARuQY9ZX1vtEO68W5ddPzvMi5KiRqBgV3CVkG
 rUfF3j0vESWEQ72Shz0vMVo/dOQPsy4=
X-Google-Smtp-Source: ABdhPJzQEZy/cGtbXxYe87/dZZjd3DOkR/ITSNsVuZIbyEJLSVkHrkhUZFPjPEDCvaa+smXFwYU4DA==
X-Received: by 2002:adf:d1cf:0:b0:207:8c13:f268 with SMTP id
 b15-20020adfd1cf000000b002078c13f268mr17983399wrd.345.1649714371898; 
 Mon, 11 Apr 2022 14:59:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm29560527wry.64.2022.04.11.14.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:59:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 23:57:40 +0200
Message-Id: <20220411215740.521106-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lvm2: update site
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

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14751

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index c52eaee1e1..126748d339 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,4 +1,4 @@
-# From http://sources.redhat.com/pub/lvm2/sha512.sum
+# From https://sourceware.org/ftp/lvm2/sha512.sum
 sha512  6a93bed1d5cf36f0f48d4d413d028b0e480cd4fc20e25d173770a892f265d2a0cc68d01a720b1513469953649e989532cd0c45f9538f92a4190eb3dc4555857d  LVM2.2.03.14.tgz
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f875b292f3..781b0c9f3f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -6,7 +6,7 @@
 
 LVM2_VERSION = 2.03.14
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE = http://sources.redhat.com/pub/lvm2
+LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
