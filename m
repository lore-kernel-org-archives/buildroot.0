Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7996C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEC082BE5;
	Fri, 15 Apr 2022 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9WGIkySFxnG; Fri, 15 Apr 2022 16:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45FD682AC3;
	Fri, 15 Apr 2022 16:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D25621BF33A
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 16:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C019D6074C
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 16:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrTISFfsdOlQ for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 16:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4461606FF
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 16:52:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso8060010wme.5
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iENraI4+pcZTs7akMbgb68O/fY1Modc2L3hSYjdDinE=;
 b=liqW5vn0E0sIcmhCmLtYCPZsqpOb/0sfht/XkVpkuYhEY/Tq/GwpEHp/yXsXu/tW/m
 ilDQ+UNqRWtcjckNurE+Sqqz/Hfz0z5Ju2Uu7b+kyS+ydx3VkYPCvz/UE2vJ0YrIGEJg
 jyjtFJMgchQTxvRYNJt8qPOgJkXECsCVOYtPlIcoFmg9nS+sVKDcPh9MPV5Gj5v/SyNq
 OlsDuO/pvyBMbUIbu+tPlI+8K9h2R62sQLQPqGiX2vJl6K2gIA7meVk635GHKYDNFAuY
 qlRt9qdVqOOJSclaZIweLMCdEf3R6FXROr77l0RS5vDV+5d7bMqOBdRcqlGhLZdAKCB6
 0Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iENraI4+pcZTs7akMbgb68O/fY1Modc2L3hSYjdDinE=;
 b=uDeNSDNRGkguayKAL5owGlntxDdlPDsA/Q7CcgyzNacmF+8CTphk9/i4FzAolfGJ/6
 Nl+YU0AB1gHJ5Yb1keo0v3U75JDL4Di8UhehyCXJ8e5I19/TqQz6gLkhWBGUiEQYLusd
 x+JjiapCVW9exTZIIlM6zwXXRgPn98H1hqdR5A9tFm2KI+Ta5jWwEECdlH/xLlIMtUIx
 C8Nh/BqAQFX5Y7d053AZ3+9IwX5/ANHvuCZMwHm99xAWiOKYGqVu2zzNFKc/EhBIqD2W
 2Y5XJaUiarT+K6Gl6e4ANCLEkNf6pCbjVTT7buwCd9fPAS4kl6TiqVH8riN6dJDKvENj
 Rl+Q==
X-Gm-Message-State: AOAM531jxqQ50T7mrkIu8sFKBQQ39eC4u1iYQrL6oPta8XzvDPzB8smb
 nOC4iKc0E8w4ORMcbJfN5ZWuwgByZI4=
X-Google-Smtp-Source: ABdhPJzxydg+El5OqF4LN8A7SCw/YO5YI6+kxf4GXm5+LTbNTzX6lxKn/PuUOqlcbYuyeKzkTHm7/A==
X-Received: by 2002:a05:600c:6006:b0:38f:fb25:3bb4 with SMTP id
 az6-20020a05600c600600b0038ffb253bb4mr4013392wmb.78.1650041539696; 
 Fri, 15 Apr 2022 09:52:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm4462835wry.64.2022.04.15.09.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 09:52:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Apr 2022 18:49:47 +0200
Message-Id: <20220415164947.13025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnu-efi: fix build on mips64el
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop -Werror to fix the following build failure on mips64el raised since
commit 11b347c03ab0b38389ec11b48f63236a3b4d6547:

/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c: In function 'FileDevicePath':
/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efilink.h:145:46: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  145 | #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
      |                                              ^
/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efidevp.h:404:38: note: in expansion of macro 'EFI_FIELD_OFFSET'
  404 | #define SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)
      |                                      ^~~~~~~~~~~~~~~~
/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c:250:41: note: in expansion of macro 'SIZE_OF_FILEPATH_DEVICE_PATH'
  250 |     FilePath = AllocateZeroPool (Size + SIZE_OF_FILEPATH_DEVICE_PATH + sizeof(EFI_DEVICE_PATH));
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d19e57004c36f2904c5eea988e0c38fbdb557c7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Make.defaults-drop-Werror.patch      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/gnu-efi/0002-Make.defaults-drop-Werror.patch

diff --git a/package/gnu-efi/0002-Make.defaults-drop-Werror.patch b/package/gnu-efi/0002-Make.defaults-drop-Werror.patch
new file mode 100644
index 0000000000..79c847d178
--- /dev/null
+++ b/package/gnu-efi/0002-Make.defaults-drop-Werror.patch
@@ -0,0 +1,48 @@
+From 0e43bcb3876d4000790b0a6784453f333c1db701 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Apr 2022 18:42:36 +0200
+Subject: [PATCH] Make.defaults: drop -Werror
+
+Drop -Werror to avoid the following build failure on mips64el:
+
+/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c: In function 'FileDevicePath':
+/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efilink.h:145:46: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+  145 | #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
+      |                                              ^
+/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efidevp.h:404:38: note: in expansion of macro 'EFI_FIELD_OFFSET'
+  404 | #define SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)
+      |                                      ^~~~~~~~~~~~~~~~
+/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c:250:41: note: in expansion of macro 'SIZE_OF_FILEPATH_DEVICE_PATH'
+  250 |     FilePath = AllocateZeroPool (Size + SIZE_OF_FILEPATH_DEVICE_PATH + sizeof(EFI_DEVICE_PATH));
+      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d19e57004c36f2904c5eea988e0c38fbdb557c7e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ Make.defaults | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index 47ed361..d43c3ff 100755
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -168,11 +168,11 @@ ifneq (mingw32,$(findstring mingw32, $(GCCMACHINE)))
+ endif
+ 
+ ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
+            -fshort-wchar -fno-strict-aliasing \
+            -ffreestanding -fno-stack-protector
+ else
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
+            -fshort-wchar -fno-strict-aliasing \
+ 	   -ffreestanding -fno-stack-protector -fno-stack-check \
+            -fno-stack-check \
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
