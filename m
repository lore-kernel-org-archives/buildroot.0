Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92071C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 16:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C60240636;
	Mon,  4 Mar 2024 16:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTDMlIoApN90; Mon,  4 Mar 2024 16:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 692EB4064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 692EB4064A;
	Mon,  4 Mar 2024 16:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0794E1BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 16:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E945060C20
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 16:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUWlPa38ZrFI for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 16:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCB9D60C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB9D60C12
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB9D60C12
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 16:19:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d2305589a2so70018261fa.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 08:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709569197; x=1710173997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UD1d9azRXBl0jV/J9I1eY7HdpP4yzUPUkmP7VYtsQs=;
 b=wQ2CZohQrj1n8yt0J0LlwZ48OowME2mPXpcm9YHNandgKcjRJM4SPm0wOuRMwiN0eg
 GIrwR3hPcrTr7K0Ea2/WleYyr4ZawGwKDD/QleHqOEhwxVhJUen0/vZbaQnhoXAPn9cX
 5DMWm4D1z8kvO05VoRDTHE4JzMSXMZk33czWChzJi6//By0j2xwJRd6JIm0W+qc7+9xr
 umn04E4YsEhYi/2R/2cQ3jzE/yFswOI4BDA3UjJIlKatDu2imbPCuVNpCUX27qS9dZ6d
 B3z3GQib6nt9kFGeG4/7sXcXyM9wWBTAYKhptgl68N4thoDfvU4Q7xl8abAr0SHHAkBp
 QjRA==
X-Gm-Message-State: AOJu0YwtuAc6CZB10eqX7Z6argKbuXW2uNatb/9egvVqC1Mvso3hpOGk
 aECtpZNfV3ud0Ve7N7wZUIO77LTi02tcUoF9NRtQ0sKv6Bjos+SBcYrasuii
X-Google-Smtp-Source: AGHT+IE41RVOydyTg0b7H5S9iP8Px27+BcthDn1yAmhETcrl3wmW7NRc8k5/DcgCWs/2UMoXrfdZbQ==
X-Received: by 2002:a05:651c:b0c:b0:2d3:d050:3f15 with SMTP id
 b12-20020a05651c0b0c00b002d3d0503f15mr2016859ljr.35.1709569197045; 
 Mon, 04 Mar 2024 08:19:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c3b0900b0041294d015fbsm15102313wms.40.2024.03.04.08.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:19:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 17:19:53 +0100
Message-ID: <20240304161953.3529614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709569197; x=1710173997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0UD1d9azRXBl0jV/J9I1eY7HdpP4yzUPUkmP7VYtsQs=;
 b=BRO5Gojge9v1ySWf7u0rK0Pqv9PYnI+/tLNR2QX8I2MmneSvX1MyOXfhOteDDYBSbh
 V7JzZhqDENoKv7kqE9sK61vpGIRxdCJPGmuG4mh1oHzVVnqlicIwYCN6h2u8e0J+qLYq
 2ZNUtJRlUD8AexD7Y1J7tgRG1W6mBZKmHxwHA6p36RAPYgQ9eR84vni7o5mKbdfNRGTC
 0ek2R/+sF6eHFnuZx6yMkq4+wT/hnfM79TF8HhDon2/vKLt8o+V3V3MEr/jP7kgDMT28
 UOls75dlgxcKpCdEiiFYmhnpzzaRvzz+7yK7EoAX53lWwCipL8zZJBt8ordkB1yC337H
 DloA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BRO5Gojg
Subject: [Buildroot] [PATCH 1/1] package/libva: fix build with gcc 4.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 2.20.0 in commit e926c83928e08c0ecd6cd4383e1cca151a8a4d2c and
https://github.com/intel/libva/commit/4f5a4345fc9f92565763ca22026891475e3cf835:

../va/va.c: In function 'va_new_opendriver':
../va/va.c:695:9: error: 'for' loop initial declarations are only allowed in C99 mode
         for (unsigned int i = 0; i < num_drivers; i++)
         ^
../va/va.c:695:9: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes: e926c83928e08c0ecd6cd4383e1cca151a8a4d2c
 - http://autobuild.buildroot.org/results/b9dbd104fa05c59883d87f74e6522c55620a4252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libva/libva.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 9e9d5d698c..4481be9e7b 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -10,6 +10,7 @@ LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
+LIBVA_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
