Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B05C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 12:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A99606F2;
	Sat, 20 Jul 2024 12:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLGmi1jofYql; Sat, 20 Jul 2024 12:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C0C6062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C0C6062E;
	Sat, 20 Jul 2024 12:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD3D1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46026820C1
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f6iYHazGxd6 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 12:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAE82820BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE82820BA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAE82820BA
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:29:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-36858357bb7so1179925f8f.2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 05:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721478553; x=1722083353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9OVvdkR1NHs7fagQS4eyjjO/CD69nRGD9/vKUr/DWo=;
 b=RHq5vMhjP/XT1L6iVy8c9MzrdcMnAEzenuTaTuENiC/enqohNhrPNJB3Ke6TkkgUXr
 pmKXtfOoL40EPjeXUOhsElwW6rvgqdg3iHqtCWOZFLXVecfSnyaeOco+KCItxpWivXzX
 bRRoa9wTc8tLE6p4OSggSNhedKWvfMqBGwF0rugWGoMIBC/Pm5VpEoUyEaR6zvl/47gf
 FzWoli30WMA4rn8wAjUt56EBqW8rZS7aL4ZAIoNPUzoSG3Qg0Q6wIPRznBznncfkKm+q
 rUWezg56UHg6iKg1G7eVRmSUXuhlogm6wpvLdjwIg6H+xYJ+GqQ8PwXio/nxtRhXxkim
 2rzA==
X-Gm-Message-State: AOJu0YxJCiOWtZABycOnbcjnlKWUmK4rQYs/E8lzZvFVPyGWLcCPGjX5
 q1oVNKebHUJPi1EJTRgklQry7t+BZMw4HYSSQH8NhSIUQZUmjGVvC88r/g==
X-Google-Smtp-Source: AGHT+IFsGjwtlYQ4qxbQYqrnZbTZK5g1ckNhtsf9SmeCEHXtlerk2W/Va29An2KmXVVI1/tkQ3PxXw==
X-Received: by 2002:a05:6000:1284:b0:368:7564:5a1d with SMTP id
 ffacd0b85a97d-369bbbd886amr952817f8f.35.1721478552646; 
 Sat, 20 Jul 2024 05:29:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786847e6sm3834583f8f.18.2024.07.20.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 05:29:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 14:29:08 +0200
Message-ID: <20240720122908.453217-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721478553; x=1722083353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J9OVvdkR1NHs7fagQS4eyjjO/CD69nRGD9/vKUr/DWo=;
 b=BVNZeiAbLSYZQm2/olxDFsahsdefVcTnSkS/BxjCPFeA6F7rCunsiRiAOiga46eY/v
 dWezcAh/K4ofmEWUHsm4suuHBs6Xddxct1Zbha2c71AQM1G+Onu1H98zc/NvQDRvtD66
 U/DCVdFGesp+2aT2q3g5s1cGV+Aewx4yFBhZz4M+5j1qOFKfzryxqD+FaRkOxBEG1SAB
 x0Nu9e9m/TY4EUt7O09C5VgrgB1ryZksuPPof9mdlrPJN6dLdd4/f5E7QmYvLXxycxwp
 ECN5w64AIdS/a9XlFgqoVe1Ct5ZQo8QBeqcWlZjUOY153LwyBAJ/u/1YwG6nuyzV7xsF
 5Wmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BVNZeiAb
Subject: [Buildroot] [PATCH 1/1] package/mpir: fix build with host gcc >= 14
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with host gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

configure:9998: checking build system compiler /usr/bin/gcc
configure:10011: /usr/bin/gcc conftest.c
conftest.c: In function 'main':
conftest.c:4:3: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
    4 |   exit(0);
      |   ^~~~
conftest.c:1:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
  +++ |+#include <stdlib.h>
    1 | int
conftest.c:4:3: warning: incompatible implicit declaration of built-in function 'exit' [-Wbuiltin-declaration-mismatch]
    4 |   exit(0);
      |   ^~~~
conftest.c:4:3: note: include '<stdlib.h>' or provide a declaration of 'exit'
configure:10014: $? = 1
configure:10021: result: no
configure:10026: error: Specified CC_FOR_BUILD doesn't seem to work

Fixes:
 - http://autobuild.buildroot.org/results/3ab381f06d5dc030039b6f6f8d19feb55cf3367d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Fix-configure-failures-with-Xcode12.patch | 116 ++++++++++++++++++
 package/mpir/mpir.mk                          |   2 +
 2 files changed, 118 insertions(+)
 create mode 100644 package/mpir/0002-Fix-configure-failures-with-Xcode12.patch

diff --git a/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch b/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
new file mode 100644
index 0000000000..453515f926
--- /dev/null
+++ b/package/mpir/0002-Fix-configure-failures-with-Xcode12.patch
@@ -0,0 +1,116 @@
+From bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb Mon Sep 17 00:00:00 2001
+From: Mitchell Blank Jr <mitch@bodyfour.com>
+Date: Mon, 21 Dec 2020 12:05:19 +0000
+Subject: [PATCH] Fix configure failures with Xcode12
+
+Changes are needed becuase Xcode12 includes a default of
+-Werror,-Wimplicit-function-declaration which means that
+even something like calling "exit(0);" is a compile failure
+if you haven't done a "#include <stdlib.h>" first (as C99
+requires, but most other compilers will just warn about)
+
+I don't know if the "long long reliability test 2" test which
+tries to provoke a crash on a particular gcc 3.3 build still
+does what it was originally intended to do with my change.
+Of course, I doubt anyone has tried to use that compiler in
+years.
+
+Fixes #290
+
+Upstream: https://github.com/wbhart/mpir/commit/bbc43ca6ae0bec4f64e69c9cd4c967005d6470eb
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ acinclude.m4 | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 91c35bc23..620a629ef 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -589,9 +589,9 @@ extern
+ #endif
+ __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+-f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
++void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
+ for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+-h(){}g(){}
++void h(){} void g(){}
+ #else
+ int dummy;
+ #endif
+@@ -603,8 +603,9 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 2],
+    1666 to get an ICE with -O1 -mpowerpc64.  */
+ 
+ #ifdef __GNUC__
+-f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
+-g(){}
++extern int g();
++void f(int u){int i;long long x;x=u?~0:0;if(x)for(i=0;i<9;i++);x&=g();if(x)g();}
++int g(){return 0;}
+ #else
+ int dummy;
+ #endif
+@@ -3323,11 +3324,11 @@ check (va_alist)
+   ret = vsnprintf (buf, 4, fmt, ap);
+ 
+   if (strcmp (buf, "hel") != 0)
+-    exit (1);
++    return 1;
+ 
+   /* allowed return values */
+   if (ret != -1 && ret != 3 && ret != 11)
+-    exit (2);
++    return 2;
+ 
+   return 0;
+ }
+@@ -3336,7 +3337,7 @@ int
+ main ()
+ {
+ $i
+-  exit (0);
++  return 0;
+ }
+ ],
+       [:],
+@@ -3469,7 +3470,7 @@ cat >conftest.c <<EOF
+ int
+ main ()
+ {
+-  exit(0);
++  return 0;
+ }
+ EOF
+ gmp_compile="$1 conftest.c"
+@@ -3543,7 +3544,7 @@ AC_CACHE_CHECK([for build system executable suffix],
+ int
+ main ()
+ {
+-  exit (0);
++  return 0;
+ }
+ EOF
+ for i in .exe ,ff8 ""; do
+@@ -3577,7 +3578,7 @@ AC_CACHE_CHECK([whether build system compiler is ANSI],
+ int
+ main (int argc, char *argv[])
+ {
+-  exit(0);
++  return 0;
+ }
+ EOF
+ gmp_compile="$CC_FOR_BUILD conftest.c"
+@@ -3608,10 +3609,11 @@ AC_DEFUN([GMP_CHECK_LIBM_FOR_BUILD],
+ AC_CACHE_CHECK([for build system compiler math library],
+                gmp_cv_check_libm_for_build,
+ [cat >conftest.c <<EOF
++#include <math.h>
+ int
+ main ()
+ {
+-  exit(0);
++  return 0;
+ }
+ double d;
+ double
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index d26b6c39aa..431caf3e2b 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -11,6 +11,8 @@ MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
+# 0002-Fix-configure-failures-with-Xcode12.patch
+MPIR_AUTORECONF = YES
 
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
