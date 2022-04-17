Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E561EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 20:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C71140FDC;
	Sun, 17 Apr 2022 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyVXGn-dSGXt; Sun, 17 Apr 2022 20:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC15B40B5E;
	Sun, 17 Apr 2022 20:54:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E153C1BF3AE
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 20:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF25740B5E
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 20:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ebhv-oU0oNH3 for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 20:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC50440195
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 20:54:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p18so15760018wru.5
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MkGDOg6JgEkJ0ZFBSZLRnWsZZJ5CGbLO5/OQg2bi0Ug=;
 b=po4K1K6yvZ6h/CJwAN1BfDg2OtzWLMcXvLww/7OrltpinN0UE2UQ+xG94VWqnZijkM
 dzpcEd5lBzBusgLxeQ8h5hoYony+PxgzMjAZr+RRSrlAzWnpGvHfLfg8aYac77HPNoVG
 r4hJV6c1yqtEsIR0Wn5vTYVTSX3ca/S2B9/4eyPfaZh5hmI9usKasinwaekS3JO//Vym
 6H5MEMVc/gMFiMrZLo9m0WEO2wBjIFVe4ckrrlBIyQ7LX+nqJRxwCGv+PQqJuTiuyU/D
 NCdRJ2zpHwBAzHEevtA3A0k2KIBmsONcYS4LuoZeF6sdZlKQ20c8PfPcPPlnlg/kAOBR
 Qyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MkGDOg6JgEkJ0ZFBSZLRnWsZZJ5CGbLO5/OQg2bi0Ug=;
 b=5zM4FSdLr8+queT7I22s4L4oJrlMd+n+fDfd8L/6BdRyW3JYA9FTjJZz4w9nFsotBf
 itVl/+3o9OvSFCTky53oSF9LPBD/Z5KRF+k9FZJWfKQFiVLkFiZU0nAMsPNqjR9j+H9F
 gX+h7OIjOD7zL3p8uTZXoq1ylSHFY++GpHNMTckd8SqHmu8WaCELsUAQh3UdlStA/6LZ
 5LeBDXJhd8DP1UFd5vgK41fKS/aeJUr5np+v3UF7WQLzL3WRDCUEk91gF7BR/JHdZ9oy
 OyZ7dVB7bwkC6V9Y0CTw51DABzV58H5JtDUn5MdlzC3S8znVQQaWF2/yff8aTJycTKac
 Lk7g==
X-Gm-Message-State: AOAM5310i7SUMqjlHYGGG/RxrQ3pCI94II71v/4GnzvxsiUmE6cKurQp
 iQhW7UrvU9mlX0VvL7nDqPw/PKJVyms=
X-Google-Smtp-Source: ABdhPJykkXlKD4hozMUdWZPCifNCrLH3etxzqNtOew5Faq+pBKJ5Hq07ZJXMKAc4mYzXEpQXN976Rg==
X-Received: by 2002:a5d:6d8b:0:b0:20a:97c6:9a0f with SMTP id
 l11-20020a5d6d8b000000b0020a97c69a0fmr1497954wrs.418.1650228880821; 
 Sun, 17 Apr 2022 13:54:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm2998394wrf.10.2022.04.17.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 13:54:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Apr 2022 22:52:41 +0200
Message-Id: <20220417205241.396289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix build without C++
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

Fix the following build failure raised since bump to version 2.5.3 in
commit fd03e8192f1b4d5eae9a9458c5a06bebfa95fb7c and
https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:

CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch

diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..b0cb6a6c1e
--- /dev/null
+++ b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,41 @@
+From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 18:20:14 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without a working C++ compiler raised
+since version 2.0.0 and
+https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
+
+CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/c++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fef46c3..83adaf3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -661,7 +661,7 @@ endif()
+ list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
+ 
+ # Create minizip library
+-project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
++project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
+ 
+ if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
+     message(STATUS "Project configured as ${PROJECT_NAME}")
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
