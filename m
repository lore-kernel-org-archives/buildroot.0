Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF094C47DDF
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 21:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6A284570;
	Wed, 31 Jan 2024 21:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6A284570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90gYgn_v5DHD; Wed, 31 Jan 2024 21:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D1084573;
	Wed, 31 Jan 2024 21:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D1084573
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4474D1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D4E1614EA
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4E1614EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_lvVjnIqY1V for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 21:35:18 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D91E614E4
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D91E614E4
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so88946e87.0
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 13:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706736915; x=1707341715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwYEIhWy6KFzqZ40WUO4vSKT4QL9flM1jhd2bSREOsI=;
 b=eIlnNkmBD7dK2Ha+pG4jG2/+CWnF6kmfXjy9natm6mB0PE4kc3nBqBQqd8PF9tuc/u
 9//0pOUklnh8gHigrBw1yHJG3ZP64We0prVgqYPOSs9PwJo0rYlrCLObMH+/tnREuEAB
 qk/sf3kjwvmJxYFNZwkE1cxt2h9DRA1khuhQsYP1YOscEX2A57dWhofm73NmcvsNhFrv
 hUSS0bfZcmZSW/7zBuKu7IU+cbtLzwdXQRVG1UiQa9d3KyFQkP/IH/ZE+wgq2nklqJso
 U+ULdTxKVZDwQrdie/nmAZI9XzVBHxua7pniWtGFU9jPU/qFIWF1cnen+7WhRrWfYaAJ
 W3Dg==
X-Gm-Message-State: AOJu0YzU0ZLOolV84O/1pUGnvl8K0VUQuXxPhnNCDDY2wO4f2T9KljL/
 oVGBRbKf6ggmctkzQ21FpFrf7bhf55hIw3918sYC+9Lg0PfydRA3395KkU+F+lI=
X-Google-Smtp-Source: AGHT+IExf4h9iY+ZfYQme+eHL9vlW75FkbjZmC2QuHBre7CjLT7HgHiKzZubmluyl+1L5VKnNcX74Q==
X-Received: by 2002:ac2:4834:0:b0:510:128d:d384 with SMTP id
 20-20020ac24834000000b00510128dd384mr277436lft.28.1706736914850; 
 Wed, 31 Jan 2024 13:35:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b0040ee4f38968sm2614618wmq.2.2024.01.31.13.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 13:35:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 22:35:12 +0100
Message-ID: <20240131213512.2261698-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706736915; x=1707341715; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BwYEIhWy6KFzqZ40WUO4vSKT4QL9flM1jhd2bSREOsI=;
 b=AklotZfhbNF0bKPe9MFzcpMBsOa7n+g6W6/ANOttMPbd2AfR7NFxnTKqvl4BttYfcV
 YqBpm0ru5r0vzfunFqUilHXn6ZQIEeeSBHXtkSekS6WDsAavvQAaVv5A2CJR94XPnuDN
 ffzvT4TIvsDiRBuNj5uJe9H9MMb2x9xsf623YVHeH6MDMcIczxb3G//Hh9Zpczvn6lnl
 t1u8UMXHQltcNaNDhDZteUAVzmnQLLTzJgSdbaJIjhEDj+wIeb5EwX6f+1GZe6Yc7BvB
 2O3FQy2f+OLer5lfiZmt4pejxwUqvkw3jW2OHg/St1Z+zHiXXCFRwiRH3z2hX++s1cZ2
 x8QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AklotZfh
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version 4.3.3
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

Drop first patch (already in version)

https://github.com/warmcat/libwebsockets/compare/v4.3.2...v4.3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...Lists.txt-fix-build-with-pkg-config.patch} |  0
 ...eLists.txt-fix-build-without-threads.patch | 47 -------------------
 package/libwebsockets/libwebsockets.hash      |  2 +-
 package/libwebsockets/libwebsockets.mk        |  2 +-
 5 files changed, 2 insertions(+), 50 deletions(-)
 rename package/libwebsockets/{0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch => 0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch} (100%)
 delete mode 100644 package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 144b020f9e..5097251ee5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -730,7 +730,6 @@ package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch Upstream
 package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch Upstream
 package/libwebsock/0002-fix-ssl.patch Upstream
 package/libwebsock/0003-fix-incorrect-inline.patch Upstream
-package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch Upstream
 package/libyuv/0001-i386-sse2.patch Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch Upstream
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
diff --git a/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
similarity index 100%
rename from package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
rename to package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
diff --git a/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
deleted file mode 100644
index ae46602a53..0000000000
--- a/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c83cf48b9095a6914a0844bec4439763bb0c9138 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 May 2022 23:15:40 +0200
-Subject: [PATCH] lib/tls/CMakeLists.txt: fix build without threads
-
-openssl can be built without threads resulting in the following build
-failure:
-
--- Looking for HMAC_CTX_new
--- Looking for HMAC_CTX_new - not found
-
-[...]
-
-In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
-/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
-   85 |         HMAC_CTX ctx;
-      |                  ^~~
-
-To fix this build failure, don't unconditionally add pthread if openssl
-has been found through pkg-config as openssl.pc will contain the
-appropriate dependencies (i.e. -lpthread but also -lz or -latomic)
-
-Fixes:
- - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/warmcat/libwebsockets/commit/c83cf48b9095a6914a0844bec4439763bb0c9138]
----
- lib/tls/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
-index 559be9abb..a2b78c252 100644
---- a/lib/tls/CMakeLists.txt
-+++ b/lib/tls/CMakeLists.txt
-@@ -311,7 +311,7 @@ endif()
- if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
- 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_DL_LIBS})
- endif()
--if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
-+if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT ((${CMAKE_SYSTEM_NAME} MATCHES "QNX") OR PC_OPENSSL_FOUND))
- 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} pthread)
- endif()
- 
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 4bff068241..01e7c7bfd1 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a85a1bccf25acc7e8e5383e4934c9b32a102880d1e4c37c70b27ae2a42406e1  libwebsockets-4.3.2.tar.gz
+sha256  6fd33527b410a37ebc91bb64ca51bdabab12b076bc99d153d7c5dd405e4bdf90  libwebsockets-4.3.3.tar.gz
 sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index daf481b3bc..c00c44cac3 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.3.2
+LIBWEBSOCKETS_VERSION = 4.3.3
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
