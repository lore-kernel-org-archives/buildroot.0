Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0277DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 12:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65959416EE;
	Sun,  3 Apr 2022 12:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLnRUdw2BrKd; Sun,  3 Apr 2022 12:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3205040872;
	Sun,  3 Apr 2022 12:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8251BF4D6
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A11660C19
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 12:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_T4dfCuijWk for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 12:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6227607C0
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 12:15:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4030187wmz.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYIwFBeDApQgQ5HGk5h03KITA1vqAGeg2kJVQqIWAUw=;
 b=iVxkmhejMh1PaZdhf2CXpkrcdn1oOxzsILUTYifnQIIzV8NgN7UZMj733aouEA+ovC
 i7JUm/dPnd8eW0d1BlrWJ5O4ygosJIro39KgOVdHFbyW2UHHaRzhFznNRLWu9buh6yNh
 uChRBI1dtiHkbDSyD4glJyYS0RXvfOCB/+xTPJPSkVo2Fe0PHDbu+1Face+0GUhCLDlZ
 xccV0FR1lYuTo2EG1eoItmr0iUJt9zyUhjSk3v8aJOmuU8nxgW0m85NAbb/NNaFTxscV
 SafsPWYm69kXFwF5xocCGTufO2Y7FHIoO+xIRAwJgx7ap5c1wmzOryl4loXQNeMF8J3l
 Vh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYIwFBeDApQgQ5HGk5h03KITA1vqAGeg2kJVQqIWAUw=;
 b=IFVui1O+Lg76bl1uIJ9aAR4Y4Dja3KZAyvAu3nRSlVkXiORr6xwYCvq2BpFEAnyj0G
 l6QrTKWuEwgez8+1ozNAnsKQIT1PgKT9RbHP5f7PURHS0FpD44ZbQ2E61+VRrkjr6MDe
 14ssqT0kxnd+ATDEEARXnY2VLccS+Zo+YKhVgWN5lVbmW3HJ+GYBVPUVglQ2auJzqncB
 hIch/kNU5pJm3aejUK2tuoxe1BKzmAXjpIxNJeIJNo5E1nmktiFmOUvCR9NGnfSrnXqL
 Mo20qwTImXq7owerIVhGa4qyo3EwuHYqI5q5fmDIb/kgfxYZOmEB8oENADWuz57V5tD6
 FLOw==
X-Gm-Message-State: AOAM533IBW9eladvha52RvCkzxipO9kbTDNoQ0cB+OTTOMeP0Q4WzaXo
 23nQ5kBjY6EIzc0lTootIbmHU9TzuNw=
X-Google-Smtp-Source: ABdhPJzocWRzlQGAULc8xRtbVDq9mrujhVPs9odIPkLta/f9djBK54Bm4lJ+EFIrqOT5/s4aZFb3iA==
X-Received: by 2002:a05:600c:ad1:b0:38c:8bf6:7d6b with SMTP id
 c17-20020a05600c0ad100b0038c8bf67d6bmr15723512wmr.84.1648988118549; 
 Sun, 03 Apr 2022 05:15:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm6689876wru.78.2022.04.03.05.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 05:15:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 14:13:27 +0200
Message-Id: <20220403121327.3234177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libpsl: fix build with libiconv
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 47acda3a95bd4310f884e741f20785d374af7b22:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libpsl.so.5.3.2.p/psl.c.o: in function `psl_str_to_utf8lower':
psl.c:(.text+0x1584): undefined reference to `libiconv_open'

Fixes:
 - http://autobuild.buildroot.org/results/8f012331acd3edb96a69d374436884679add8860

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-libiconv-dep-to-meson-build-again.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch

diff --git a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
new file mode 100644
index 0000000000..72f50aa593
--- /dev/null
+++ b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
@@ -0,0 +1,60 @@
+From 5b63816e82287808e81b8603a528af3cc6fab354 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Thu, 7 Jan 2021 20:59:17 +0800
+Subject: [PATCH] Add libiconv dep to meson build again
+
+Build success on macOS and ubuntu.
+
+[Retrieved from:
+https://github.com/rockdaboot/libpsl/commit/5b63816e82287808e81b8603a528af3cc6fab354]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build     | 14 ++++++++++++++
+ src/meson.build |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f248171..fb2de31 100644
+--- a/meson.build
++++ b/meson.build
+@@ -20,6 +20,7 @@ libicu_dep = notfound
+ libidn_dep = notfound
+ libunistring = notfound
+ networking_deps = notfound
++libiconv_dep = notfound
+ 
+ # FIXME: Cleanup this when Meson gets 'feature-combo':
+ # https://github.com/mesonbuild/meson/issues/4566
+@@ -86,6 +87,19 @@ endif
+ if libidn2_dep.found() or libidn_dep.found()
+   # Check for libunistring, we need it for psl_str_to_utf8lower()
+   libunistring = cc.find_library('unistring')
++  found_iconv = false
++  if cc.has_function('iconv_open')
++    libiconv_dep = []
++    found_iconv = true
++  endif
++  if not found_iconv and cc.has_header_symbol('iconv.h', 'iconv_open')
++    libiconv_dep = [cc.find_library('iconv')]
++    found_iconv = true
++  endif
++
++  if not found_iconv
++    error('iconv implementation not found')
++  endif
+ endif
+ 
+ if host_machine.system() == 'windows'
+diff --git a/src/meson.build b/src/meson.build
+index 0d1dcdf..746bf44 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -19,7 +19,7 @@ cargs = [
+ libpsl = library('psl', sources, suffixes_dafsa_h,
+   include_directories : [configinc, includedir],
+   c_args : cargs,
+-  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps],
++  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps, libiconv_dep],
+   version: lt_version,
+   install: true,
+ )
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
