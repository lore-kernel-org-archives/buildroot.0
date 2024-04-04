Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9556CD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 19:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E75861008;
	Thu,  4 Apr 2024 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0t_Vm0GJLHev; Thu,  4 Apr 2024 19:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E5461078
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E5461078;
	Thu,  4 Apr 2024 19:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C86A31BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5CA141CB3
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrZ23rLAZK86 for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 19:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11A2A40195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A2A40195
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11A2A40195
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 19:55:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4155baa696eso10429705e9.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 12:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712260502; x=1712865302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sSAp7ZJh8kG9sDXgbNVWyuMOnHBdxBkQNF9/NpJOwY=;
 b=ZHA/yfYcFC3SYEU0QPkEsOxIrkJAmQAaiASlu7d8UAYSlAnWhi2ijIPlExaCKiIJPi
 bhpAVfmn2y+P2ciFjSn3YiKRARxW+3YWFevx4zptGe4CFhfCuhVjKHZWXzrvBq5KmGJ2
 UpwAWIU6jAyXE/WQVv3eNtPItHxWnunzNrBh+y/QRFgGkC/mbm/1D+NsHgkeeCfedfKN
 x4dyFPPsniDr2YvnB/89CD4pvO0aTATBdMBqYHTYZYI6CgfnlXzdw7rbvDgJzyPesqbg
 +gbcP+gCKQLbmJJY1VKRWDkRA+VBPwBfzGdHTYQLRMYjjwh4WzD489zhIXB+MygcVkp2
 L1Bg==
X-Gm-Message-State: AOJu0YySRXv0hxfU/zAR9Xjz2ZEu0OY7BTmU6vQk+91qqegaAEqQrDyV
 Rk125VJzyR7V1pF9/5Pq8/UdH9He6QNt4SWwNggQtqmE7agHq4aSZ2N5fGfo
X-Google-Smtp-Source: AGHT+IGEbHIPpIe8Z3SOpRqf6Te9z1Avu83zPquN/Q1jsQm7M8aNjAzidCtTFbCg3UoUWAqcLJgyYQ==
X-Received: by 2002:a05:600c:3c88:b0:415:4599:ca70 with SMTP id
 bg8-20020a05600c3c8800b004154599ca70mr2683107wmb.5.1712260501557; 
 Thu, 04 Apr 2024 12:55:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b0041477f3f99fsm3766949wms.30.2024.04.04.12.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 12:55:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 21:53:46 +0200
Message-ID: <20240404195346.1434611-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712260502; x=1712865302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7sSAp7ZJh8kG9sDXgbNVWyuMOnHBdxBkQNF9/NpJOwY=;
 b=d4OAEv6m51HhPImGqxz9Kdtgp8hyG0QoIGpbqwsBALGg44/3Mt4N0M4phRbro32LXs
 nSrqm751D0/SNyYyJgCSnWRqlagd0D/GAx+rDlGWmXDC1B+g+XfPhltoK050PMGW2tlr
 giY/QMLC/E1DWj80gLbAa1iAgd5ufKlf3o8IFa8AYJTZEyPFNJvubC1zppBzBkfK2z7a
 NSLCmpN70Dt7EobT3NGjGkq8tYdO8B2IGUNKDTUhSLM2KEisEDs0BASpRKCgT+vc2eTq
 aekmSWZZX1c/h/EejpdWcCJVynpsUbkwntZ3Fs8ntKMxYT4slEjiRQfplKqkK8Wn4lyR
 YWTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d4OAEv6m
Subject: [Buildroot] [PATCH 1/1] package/nut: bump to version 2.8.2
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version) and so also drop autoreconf

https://github.com/networkupstools/nut/releases/tag/v2.8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...iler_family.m4-fix-cross-compilation.patch |  55 ---------
 ...hon.m4-allow-overriding-of-PYTHON-2-.patch | 106 ------------------
 package/nut/nut.hash                          |   4 +-
 package/nut/nut.mk                            |   5 +-
 4 files changed, 4 insertions(+), 166 deletions(-)
 delete mode 100644 package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
 delete mode 100644 package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch

diff --git a/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch b/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
deleted file mode 100644
index 6356990749..0000000000
--- a/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a743617099ea50fcce333a8a074751434d25b7ac Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 3 Nov 2023 18:29:29 +0100
-Subject: [PATCH] m4/nut_compiler_family.m4: fix cross-compilation
-
-Do not use isystem with host paths when cross-compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/networkupstools/nut/pull/2146
----
- m4/nut_compiler_family.m4 | 28 +++++++++++++++-------------
- 1 file changed, 15 insertions(+), 13 deletions(-)
-
-diff --git a/m4/nut_compiler_family.m4 b/m4/nut_compiler_family.m4
-index f47b1ae9..99608bab 100644
---- a/m4/nut_compiler_family.m4
-+++ b/m4/nut_compiler_family.m4
-@@ -178,19 +178,21 @@ dnl # confuse the compiler assumptions - along with its provided headers)...
- dnl # ideally; in practice however cppunit, net-snmp and some system include
- dnl # files do cause grief to picky compiler settings (more so from third
- dnl # party packages shipped via /usr/local/... namespace):
--    AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
--dnl #        CFLAGS="-isystem /usr/include $CFLAGS"
--        AS_IF([test -d /usr/local/include],
--            [CFLAGS="-isystem /usr/local/include $CFLAGS"])
--        AS_IF([test -d /usr/pkg/include],
--            [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
--    ])
--    AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
--dnl #        CXXFLAGS="-isystem /usr/include $CXXFLAGS"
--        AS_IF([test -d /usr/local/include],
--            [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
--        AS_IF([test -d /usr/pkg/include],
--            [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
-+    AS_IF([test "x$cross_compiling" != xyes], [
-+        AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
-+dnl #            CFLAGS="-isystem /usr/include $CFLAGS"
-+            AS_IF([test -d /usr/local/include],
-+                [CFLAGS="-isystem /usr/local/include $CFLAGS"])
-+            AS_IF([test -d /usr/pkg/include],
-+                [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
-+        ])
-+        AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
-+dnl #           CXXFLAGS="-isystem /usr/include $CXXFLAGS"
-+            AS_IF([test -d /usr/local/include],
-+                [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
-+            AS_IF([test -d /usr/pkg/include],
-+                [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
-+        ])
-     ])
- 
- dnl # Default to avoid noisy warnings on older compilers
--- 
-2.42.0
-
diff --git a/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch b/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
deleted file mode 100644
index d2571cf438..0000000000
--- a/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 511ee899ee687216fa8fcf2231a60941b9e4cf81 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 3 Nov 2023 14:34:54 +0100
-Subject: [PATCH] m4/nut_check_python.m4: allow overriding of
- PYTHON{2,3}_SITE_PACKAGES
-
-Allow the end-user to override PYTHON{2,3}_SITE_PACKAGES as this can be
-useful when cross-compiling
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/networkupstools/nut/pull/2147
----
- m4/nut_check_python.m4 | 60 +++++++++++++++++++++---------------------
- 1 file changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/m4/nut_check_python.m4 b/m4/nut_check_python.m4
-index 995a3e7c..7f29558e 100644
---- a/m4/nut_check_python.m4
-+++ b/m4/nut_check_python.m4
-@@ -116,17 +116,17 @@ AC_DEFUN([NUT_CHECK_PYTHON],
-         AM_CONDITIONAL([HAVE_PYTHON], [test -n "${PYTHON}" && test "${PYTHON}" != "no"])
-         AS_IF([test -n "${PYTHON}" && test "${PYTHON}" != "no"], [
-             export PYTHON
--            AC_MSG_CHECKING([python site-packages location])
--            PYTHON_SITE_PACKAGES="`${PYTHON} -c 'import site; print(site.getsitepackages().pop(0))'`"
--            AS_CASE(["$PYTHON_SITE_PACKAGES"],
--                [*:*], [
--                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
--                    PYTHON_SITE_PACKAGES="`cd "$PYTHON_SITE_PACKAGES" && pwd`"
--                    ]
--                )
--            AC_MSG_RESULT([${PYTHON_SITE_PACKAGES}])
-+            AC_CACHE_CHECK([python site-packages location], [nut_cv_PYTHON_SITE_PACKAGES], [
-+                nut_cv_PYTHON_SITE_PACKAGES="`${PYTHON} -c 'import site; print(site.getsitepackages().pop(0))'`"
-+                AS_CASE(["$nut_cv_PYTHON_SITE_PACKAGES"],
-+                    [*:*], [
-+                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
-+                        nut_cv_PYTHON_SITE_PACKAGES="`cd "$nut_cv_PYTHON_SITE_PACKAGES" && pwd`"
-+                        ]
-+                   )
-+               ])
-             ])
--        AC_SUBST([PYTHON_SITE_PACKAGES], [${PYTHON_SITE_PACKAGES}])
-+        AC_SUBST([PYTHON_SITE_PACKAGES], [${nut_cv_PYTHON_SITE_PACKAGES}])
-         AM_CONDITIONAL([HAVE_PYTHON_SITE_PACKAGES], [test x"${PYTHON_SITE_PACKAGES}" != "x"])
-     ])
- ])
-@@ -228,17 +228,17 @@ AC_DEFUN([NUT_CHECK_PYTHON2],
-         AM_CONDITIONAL([HAVE_PYTHON2], [test -n "${PYTHON2}" && test "${PYTHON2}" != "no"])
-         AS_IF([test -n "${PYTHON2}" && test "${PYTHON2}" != "no"], [
-             export PYTHON2
--            AC_MSG_CHECKING([python2 site-packages location])
--            PYTHON2_SITE_PACKAGES="`${PYTHON2} -c 'import site; print(site.getsitepackages().pop(0))'`"
--            AS_CASE(["$PYTHON2_SITE_PACKAGES"],
--                [*:*], [
--                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
--                    PYTHON2_SITE_PACKAGES="`cd "$PYTHON2_SITE_PACKAGES" && pwd`"
--                    ]
--                )
--            AC_MSG_RESULT([${PYTHON2_SITE_PACKAGES}])
-+            AC_CACHE_CHECK([python2 site-packages location], [nut_cv_PYTHON2_SITE_PACKAGES], [
-+                nut_cv_PYTHON2_SITE_PACKAGES="`${PYTHON2} -c 'import site; print(site.getsitepackages().pop(0))'`"
-+                AS_CASE(["$nut_cv_PYTHON2_SITE_PACKAGES"],
-+                    [*:*], [
-+                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
-+                        nut_cv_PYTHON2_SITE_PACKAGES="`cd "$nut_cv_PYTHON2_SITE_PACKAGES" && pwd`"
-+                        ]
-+                    )
-+                ])
-             ])
--        AC_SUBST([PYTHON2_SITE_PACKAGES], [${PYTHON2_SITE_PACKAGES}])
-+        AC_SUBST([PYTHON2_SITE_PACKAGES], [${nut_cv_PYTHON2_SITE_PACKAGES}])
-         AM_CONDITIONAL([HAVE_PYTHON2_SITE_PACKAGES], [test x"${PYTHON2_SITE_PACKAGES}" != "x"])
-     ])
- ])
-@@ -340,17 +340,17 @@ AC_DEFUN([NUT_CHECK_PYTHON3],
-         AM_CONDITIONAL([HAVE_PYTHON3], [test -n "${PYTHON3}" && test "${PYTHON3}" != "no"])
-         AS_IF([test -n "${PYTHON3}" && test "${PYTHON3}" != "no"], [
-             export PYTHON3
--            AC_MSG_CHECKING([python3 site-packages location])
--            PYTHON3_SITE_PACKAGES="`${PYTHON3} -c 'import site; print(site.getsitepackages().pop(0))'`"
--            AS_CASE(["$PYTHON3_SITE_PACKAGES"],
--                [*:*], [
--                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
--                    PYTHON3_SITE_PACKAGES="`cd "$PYTHON3_SITE_PACKAGES" && pwd`"
--                    ]
--                )
--            AC_MSG_RESULT([${PYTHON3_SITE_PACKAGES}])
-+            AC_CACHE_CHECK([python3 site-packages location], [nut_cv_PYTHON3_SITE_PACKAGES], [
-+                nut_cv_PYTHON3_SITE_PACKAGES="`${PYTHON3} -c 'import site; print(site.getsitepackages().pop(0))'`"
-+                AS_CASE(["$nut_cv_PYTHON3_SITE_PACKAGES"],
-+                    [*:*], [
-+                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
-+                        nut_cv_PYTHON3_SITE_PACKAGES="`cd "$nut_cv_PYTHON3_SITE_PACKAGES" && pwd`"
-+                        ]
-+                    )
-+                ])
-             ])
--        AC_SUBST([PYTHON3_SITE_PACKAGES], [${PYTHON3_SITE_PACKAGES}])
-+        AC_SUBST([PYTHON3_SITE_PACKAGES], [${nut_cv_PYTHON3_SITE_PACKAGES}])
-         AM_CONDITIONAL([HAVE_PYTHON3_SITE_PACKAGES], [test x"${PYTHON3_SITE_PACKAGES}" != "x"])
-     ])
- ])
--- 
-2.42.0
-
diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 9cd5fcc8de..4c962ee9d8 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,5 +1,7 @@
+# From https://github.com/networkupstools/nut/releases/download/v2.8.2/nut-2.8.2.tar.gz.sha256
+sha256  e4b4b0cbe7dd39ba9097be7f7d787bb2fffbe35df64dff53b5fe393d659c597d  nut-2.8.2.tar.gz
+
 # Locally computed
-sha256  7da48ee23b1f0d8d72560bb0af84f5c5ae4dbe35452b84cb49840132e47f099c  nut-2.8.1.tar.gz
 sha256  8a3de48b86daffcbe822dd94e514c8a77fe70f77c9005ffd9dcf1709dbdc80c7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 371c783783..93522d017e 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.1
+NUT_VERSION = 2.8.2
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf
-# We're patching m4/nut_compiler_family.m4
-# We're patching m4/nut_check_python.m4
-NUT_AUTORECONF = YES
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
