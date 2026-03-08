Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7881CEA8526
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3008181462;
	Sun,  8 Mar 2026 15:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WrRkRu_d1FL; Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3217381350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772982421;
	bh=r9SP7VMv5MJ00YQJLS/c1so7+2xm+pcQX1SHHDYjVL0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CJfP5FRNk8zsmrvrO5B1R0bNtb0moY8TXT8wWLGlZK3FL2DA5IsXhlAhyt1A8lrKH
	 +Kn1BVQlFK7PHrRobl3RGqho0EZmxIGC6CfuucklNuU+XkuiCK/baYFerid7DFCt8G
	 c+1TKwkfHKYf2cz/zMTwhsPLv0goUsPXybWg75sKP+S5+HaYjSPv8XFNPMsUMhGZ38
	 72aVeuXfMKROzJqo6/31rRrOBUB6x3vskLA7kmAfTrOK0dcVYcrf4acvbti7pP/IwA
	 sOE/DnVN+K74j9dWEGANM7Fe5fCTDCo4vXN3zBY2EI1A3K3YVAG0aWomSU5V+o1hJZ
	 NgB0MCEZlL6Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3217381350;
	Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64070158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49F9381462
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4ns_MvKBtz7 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 171FB81341
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171FB81341
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171FB81341
 for <buildroot@busybox.net>; Sun,  8 Mar 2026 15:06:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso6689698f8f.0
 for <buildroot@busybox.net>; Sun, 08 Mar 2026 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982417; x=1773587217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rMSQ9tbDIPUAiRKkNUhduc60KfqcRZW1f6K6jfVLW+w=;
 b=f9QvH2tSNyGDZZYmZBaAri5S0tpQw5MVjiJtVWNEzuc4Ob4OmO+66vx+eb2SFJ5/JV
 BfQxfgIxpbhHjq8eMTqkQ1fQyIg9+fwPcltbqbKFIymeVoxPwaWB4xfgX4n6+FQv9m2p
 OT1bBESLE46Hp3gcy7pm9pjHId07nEKDELBpg+5p6+QNWvWcYyYL3diJ+gdvfBJB096S
 +21IkLvrJdvJS3MoKGtbL5Nz3jgfABo61mIvau5fJuLDvvoLRQWQ9hyeTjArq04VuUzp
 2Nwjov1fiIPcqwEWnZq9cdiHRZjDEHBhEpxwNy1a/2nSvyc+FfresHhL0SobdGtwDPOj
 vIDg==
X-Gm-Message-State: AOJu0YxNxyd2+YDxqi0bwlhrqm2RihmUz7AhOKiZzLise/rZk6ImAo8G
 wa8ePSm3zSEaQ/ncTGu4Z0gkAusdvrcScdllk54UgyzJ/PqJ/AVh2/DGnyEfrRoucQ/Xsgu+t7m
 IBw+AlA==
X-Gm-Gg: ATEYQzzy/vabDXBXqazJXDWezAbIC8OELiODp64EIQ1tVMtlN6JaOd+xB3Quj8Of6QC
 ZHv7ah01/8Ib+hzR5nTfFZ6pdLUwE370ThPRCzBmTCKvIfPZw7cubIK7igglVJIM6dpUSzDV0oc
 3hxwjtukeIV5Bj5mrUiaqCyGXis7vzN1ZGGoyuu9KAh3UZ63pp+lzi5OAD786YRAs4ZqpIb4Q48
 vQ721DMqtj+oAhwpoy64w1gTyZI9GvT/ah8nMsj5jdamoKff7sH838mVkaqzv9l5XYPweTirQLn
 qEoNOycCMnVjfVJfKg7OqHGT11UWibrE1yJCBhoEnwn22w/5qOQor2g2/JoZsFOybxgCiJiQZeM
 Cd5XBxihTMaJC4vTN/JXLX3seHjX539evzI9Ed85oao7E+tOnAZRkFzjIrRm/U6yogefVEubwe8
 PRZ8+YmcxNu4GlkxOBJxGqEXEOSzT0rtBEd/H9RX3MTJvcGppoNbPETJFPaCPv
X-Received: by 2002:a05:600c:820c:b0:485:383b:d5bb with SMTP id
 5b1f17b1804b1-485383bd752mr31623305e9.27.1772982415304; 
 Sun, 08 Mar 2026 08:06:55 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a59fc36sm52380345e9.9.2026.03.08.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:06:55 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun,  8 Mar 2026 16:06:48 +0100
Message-ID: <20260308150650.48948-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308150650.48948-1-francois.perrad@gadz.org>
References: <20260308150650.48948-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772982417; x=1773587217; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMSQ9tbDIPUAiRKkNUhduc60KfqcRZW1f6K6jfVLW+w=;
 b=EbBcR98GUvYp2hzY373ZBNP0sV/ituTHtWz+Ry2cjiIVtAGfcNVb/Dh1mOnOULBdkW
 qehoHmgMdr098kCNajiQ9Nga3Hcsjjdq3b/ai4u8ziTlF1Ea7zi6WdSX2qoRhmUKiY+Z
 ccL5NMxnBEMS5inf+M/MQd4K73NhzPVnkA/uyXPiwob0tP9xMVMjREmfwjOs0NhQ7iZg
 RDkiUd0MOiufSNoiEZp9p8+LFQvFOUaYncGSwu+1cGH4cOpJ4YNt17EQAdFU4d7oBTSr
 rQ446p08CSEHSBQI8+o0nQKD2UyQnJHDdPp66DQC6OFQdbIhrzNR6dMxWihc8xgbS7nv
 QEoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=EbBcR98G
Subject: [Buildroot] [PATCH v2 1/2] package/ficl: downgrade to version 3.03
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
---
 .checkpackageignore                           |  1 -
 package/ficl/0001-fix-Makefile.patch          | 47 -------------------
 package/ficl/0001-missing-include.patch       | 26 ++++++++++
 .../0002-Makefile.linux-pass-LDFLAGS.patch    | 19 ++++----
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 19 ++++----
 6 files changed, 48 insertions(+), 68 deletions(-)
 delete mode 100644 package/ficl/0001-fix-Makefile.patch
 create mode 100644 package/ficl/0001-missing-include.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 695e0d50c..6b391d926 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -343,7 +343,6 @@ package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.
 package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
-package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ficl/0001-fix-Makefile.patch b/package/ficl/0001-fix-Makefile.patch
deleted file mode 100644
index d5a25c43f..000000000
--- a/package/ficl/0001-fix-Makefile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-fix dependency in Makefiles
-
-there is no longer a sysdep.h file.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-diff --git a/Makefile b/Makefile
-index 976d00a..7f73c44 100644
---- a/Makefile
-+++ b/Makefile
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) $(CFLAGS) $(LDFLAGS) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.ansi b/Makefile.ansi
-index e510fcd..170e6eb 100644
---- a/Makefile.ansi
-+++ b/Makefile.ansi
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
-diff --git a/Makefile.linux b/Makefile.linux
-index d447e7e..7f2cdfe 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -29,7 +29,7 @@ libficl.so.$(MAJOR).$(MINOR): $(OBJECTS)
- 	-o libficl.so.$(MAJOR).$(MINOR) $(OBJECTS)
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so
- 
--main: main.o ficl.h sysdep.h libficl.so.$(MAJOR).$(MINOR)
-+main: main.o ficl.h libficl.so.$(MAJOR).$(MINOR)
- 	$(CC) main.o -o main -L. -lficl -lm
- 	ln -sf libficl.so.$(MAJOR).$(MINOR) libficl.so.$(MAJOR)
- 
--- 
-
diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
new file mode 100644
index 000000000..a52089623
--- /dev/null
+++ b/package/ficl/0001-missing-include.patch
@@ -0,0 +1,26 @@
+From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 7 Dec 2025 10:15:27 +0100
+Subject: [PATCH] missing include
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: upstream is dead
+---
+ fileaccess.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fileaccess.c b/fileaccess.c
+index 738889d..c03d5d6 100644
+--- a/fileaccess.c
++++ b/fileaccess.c
+@@ -4,6 +4,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ #include "ficl.h"
+ 
+ #if FICL_WANT_FILE
+-- 
+2.43.0
+
diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
index dd9e16412..aa5c00edb 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: upstream is dead
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[francois: downgrade to 3.03]
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
  Makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,14 +25,15 @@ diff --git a/Makefile.linux b/Makefile.linux
 index 5f1a41f..df887e6 100644
 --- a/Makefile.linux
 +++ b/Makefile.linux
-@@ -14,6 +14,6 @@ MINOR = 1.0
- 
- ficl: main.o $(HEADERS) libficl.a
--	$(CC) main.o -o ficl -L. -lficl -lm
-+	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
- 
- lib: libficl.so.$(MAJOR).$(MINOR)
- 
+@@ -13,7 +13,7 @@ MAJOR = 3
+ MINOR = 0.1
+ 
+ ficl: testmain.o ficl.h sysdep.h libficl.a
+-	$(CC) testmain.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
+ 
+ lib: libficl.so.$(MAJOR).$(MINOR)
+ 
 -- 
 2.35.1
 
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index df53c843c..1a4a54e70 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
-sha256  1d1dd1f1cde52e8b607c5ccb6a2e5de878fd1719b8c5a4d31b9cdb343c203d0d  ReadMe.txt
+sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
+sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index c0698a343..da9a9a33f 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FICL_VERSION_MAJOR = 4.1
-FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
+FICL_VERSION = 303
+FICL_VERSION_SO = 3.0.1
+FICL_SOURCE = ficl$(FICL_VERSION).tar.gz
+FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/ficl$(FICL_VERSION)
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
@@ -26,14 +27,14 @@ endef
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-FICL_BUILD_TARGETS += main libficl.so.$(FICL_VERSION)
+FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
 define FICL_INSTALL_SHARED_BIN
-	$(INSTALL) -D -m 0755 $(@D)/main $(TARGET_DIR)/usr/bin/ficl
+	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
 endef
 define FICL_INSTALL_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.$(FICL_VERSION)
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so.4
-	ln -sf libficl.so.$(FICL_VERSION) $(1)/usr/lib/libficl.so
+	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
+	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
 endef
 endif
 
@@ -46,8 +47,6 @@ define FICL_INSTALL_STAGING_CMDS
 	$(FICL_INSTALL_STATIC_LIB)
 	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
 	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
-	$(INSTALL) -D -m 0644 $(@D)/ficllocal.h $(STAGING_DIR)/usr/include/ficllocal.h
-	$(INSTALL) -D -m 0644 $(@D)/ficlplatform/unix.h $(STAGING_DIR)/usr/include/ficlplatform/unix.h
 endef
 
 define FICL_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
