Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D6ECD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 11:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9408B610D1;
	Sun, 17 Sep 2023 11:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9408B610D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbHBOr3uLZnJ; Sun, 17 Sep 2023 11:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81894610CF;
	Sun, 17 Sep 2023 11:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81894610CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3ABE01BF38D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17DA94151B
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DA94151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zs9qTdQj73Uu for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 11:51:46 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E5D44150F
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E5D44150F
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32008b5e2d2so414583f8f.0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 04:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694951503; x=1695556303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f3VKK5yC3bbgbv8gIPFSDDz0pQIIAB68+JCOqoOApM8=;
 b=i5Jz4uo7/Et85C96C0ZSPMV9XlrT1OvE7/SHhA+72+M3E1QD4/5xxU2ArYEHwx91Sb
 H3cHFvAy7u/LrgAvoHmeAZBulphp3wb2v818R4t48BWYoP6kOaStYM0LFkRp2WTWElFd
 l2j0gwWqLSx+ye5e4O/LfY4+eJg5qkbopjSMzYMROSVCysWvtZ/ZdDvNtfJVAH4UeP7W
 iiHjIxbpZ4mmgPxYjlJ2uvWqHN8Tmr/s6CxA4ZQF5iNpA9anzYcqo+VX+5U7VGvJQCty
 4Ezupg3DwIkGyhGNDGaWWIzwQnP3Qo+Au/UC1pL1/BUIXoW0WhYQgzD1JfeL721sDWVj
 NKRw==
X-Gm-Message-State: AOJu0Yy1nvXHxNeZ5c/fOSduX64hZ44hB+fhflObvUvjj5FnytMQwmST
 zpCjw/QceI1y8lu7BPVzZOqX2MsaTQg=
X-Google-Smtp-Source: AGHT+IEwDS/j2fXC7AEr67DURuvL9nKtpJrm8QleVTKGpg9XJmxMONb8BZv0hSqPtocGLNXZ1PT2dQ==
X-Received: by 2002:adf:dcc1:0:b0:314:c6b:b9a2 with SMTP id
 x1-20020adfdcc1000000b003140c6bb9a2mr4402715wrm.13.1694951503036; 
 Sun, 17 Sep 2023 04:51:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m12-20020a056000024c00b0031989784d96sm7382261wrz.76.2023.09.17.04.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 04:51:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 13:51:39 +0200
Message-Id: <20230917115139.21621-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694951503; x=1695556303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f3VKK5yC3bbgbv8gIPFSDDz0pQIIAB68+JCOqoOApM8=;
 b=JbXHvFUKh20AoOxMhXrbgCEjvSd6MzB51PGWhAXyS+0C0H6Dbm+iSnszFSlybyCsFz
 V/eSbLM4WX8B3MpDTD4gQHTS3zV6NvF2upPupOYXhPXx1BvMRxZe1VgQO7KqNWRh6Bt6
 6tEXYLwPfpraWDkTwFCh7Igqsgj1ChjMDrx6sjc9x5svtTk+gy5fBMIkGcYvMVAoANBp
 FsM/4dJHNXd/FEhomeIHaYw+lNMYixREBc7VVRAp/IHz595OJIKULq+sCQZUvLeJ4Lx+
 c8kHVJtXf5VMSjBTony4O2iSJ33nAIQ5rQZu7ibK8ZqXiMogC/Jf5IGov3IeivF1TkSh
 QWlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JbXHvFUK
Subject: [Buildroot] [PATCH v2,1/1] package/libraw: fix CVE-2023-1729
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

A flaw was found in LibRaw. A heap-buffer-overflow in raw2image_ex()
caused by a maliciously crafted file may lead to an application crash.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix title typo

 ...shrink-flag-for-3-4-component-images.patch | 24 +++++++++++++++++++
 package/libraw/libraw.mk                      |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch

diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
new file mode 100644
index 0000000000..ef93e0901b
--- /dev/null
+++ b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
@@ -0,0 +1,24 @@
+From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 14 Jan 2023 18:32:59 +0300
+Subject: [PATCH] do not set shrink flag for 3/4 component images
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
+---
+ src/preprocessing/raw2image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
+index e65e2ad7..702cf290 100644
+--- a/src/preprocessing/raw2image.cpp
++++ b/src/preprocessing/raw2image.cpp
+@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
+ 
+   // adjust for half mode!
+   IO.shrink =
++	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
++	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
+       P1.filters &&
+       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
+ 
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index b6616f0c10..cbd509cfea 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,6 +18,9 @@ LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
+# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
