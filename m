Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE95CDB46D
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 16:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365C18264A;
	Wed, 11 Oct 2023 16:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 365C18264A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFN2TtUbK4zx; Wed, 11 Oct 2023 16:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D498266A;
	Wed, 11 Oct 2023 16:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D498266A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0E1D1BF420
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 16:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90678264A
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 16:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A90678264A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yYQwUorlzzW for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 16:34:15 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 274CB8261C
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 16:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274CB8261C
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so6687420f8f.3
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 09:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697042053; x=1697646853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+oQUQC8K3TxCHyGEFYBexodcIQ4ZZC5Xsmms/rl3Njo=;
 b=YTgBxNnltFWBPQ+251+yftRi6y4lDTEzU5KtBDaKRnvul4M0zF54LTDBh4OHVyON5R
 UfnLSmEBApl/3fZHaC7F/3I1CCMnUJn4hs49tiPr8AZS4LO8KEEaX4I7i1sO0TivgAhl
 CFpYEm22w3EkrghS9WjrIhuaZElAqsKeXNhBWZd7gPnydxJ7WI9bIrWCwCoRDIV42TxF
 O3/nao8oTo89pj25TXc3JZY82tDKs+nKYov34dNVMrK8rfy7ZDCLm4/ZujhR4p1PLYbW
 anvOjRfXB7QBwqg4WB4rQXNDPHzh8CSO26Bi8s9N/0LFzc02ZRgBGgEqElU3qhiPx+wb
 IHJw==
X-Gm-Message-State: AOJu0YxrkMtltiRdX1jXvhywY5BcCCEgdPrSWVrF+Uk89HDwBqY571I9
 lJMRWmkIvXhysQlPH6FlsrchlBB4Cl0=
X-Google-Smtp-Source: AGHT+IE/fRVDZCBDjcpPvCrvstnhB3ExyGAlsvJ/PpjWtKxh8L9NTz8sBuivgzvz/IITOesbljMdNg==
X-Received: by 2002:a5d:484a:0:b0:320:1d1:71c4 with SMTP id
 n10-20020a5d484a000000b0032001d171c4mr19201785wrs.23.1697042052782; 
 Wed, 11 Oct 2023 09:34:12 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 bq6-20020a5d5a06000000b0032d895d24desm1501325wrb.65.2023.10.11.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 09:34:12 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 18:34:08 +0200
Message-ID: <20231011163408.32325-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697042053; x=1697646853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+oQUQC8K3TxCHyGEFYBexodcIQ4ZZC5Xsmms/rl3Njo=;
 b=nFsQga4OEYHOz23Nry/C8syIZUMvLKCBLJ2I84mCsoaG2YWBNxHKZQl4ChHAxEjimG
 x7K9pHn1rHWIqzxmwb3yn3xVBh8xc+DkQj2QdKR/Thr1EQFdKA2wd7H3BvwwG1zQPsnb
 wQ7OcrtV5gbb5pJTK8sSySxGypXRe8YpYiR6svJr4d11B5tnpTbnzZ2y3QeTHM1LiODK
 AO+NWuaON1BGXP7H/tg2JKIh4xyZ3kjkcLVnCQNI4TjzUtXqANMzfhti1f2TyRz+IdWr
 lHQU4r/X3ZbXh6FwHmJpSR0IVJwDoQNbaIH8nKB0xuCKdXhvyyDWlebstRCPm7cfijtW
 dVAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nFsQga4O
Subject: [Buildroot] [PATCH] package/python3: really disable zlib
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Bootlin toolchain 2023.08-1 provide (by mistake [1]) libz.so in its
sysroot and break several python test in the gitlab-ci [2] since the
python package detect zlib while the zlib package is not build. So
there is no zlib library installed to the target rootfs.

The issue [1] has been fixed in Buildroot [3] but the Bootlin toolchain
needs to be rebuild with the fix to remove libz.so from the sysroot.

With Bootlin toolchain 2023.08-1, zlib is detected by pkg-config and
enable zlib support in binascii python module (-DUSE_ZLIB_CRC32) even
if the zlib module is disabled.
If binascii python module is used at runtime, it fail to load zlib:

  Failed to run: python sample_python_pyyaml_enc.py
  output was:
    Traceback (most recent call last):
      File "/root/sample_python_pyyaml_enc.py", line 1, in <module>
        import yaml
      File "/usr/lib/python3.11/site-packages/yaml/__init__.py", line 8, in <module>
      File "/usr/lib/python3.11/site-packages/yaml/loader.py", line 8, in <module>
      File "/usr/lib/python3.11/site-packages/yaml/constructor.py", line 14, in <module>
      File "/usr/lib/python3.11/base64.py", line 11, in <module>
    ImportError: libz.so.1: cannot open shared object file: No such file or directory

This is also a reproducible build issue since python doesn't provide
the same features if zlib is buid before or after the python build.

Fix this issue by disabling zlib support along with the zlib python
module (--disable-zlib).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302864 (TestPythonPy3Pyyaml)
https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302828 (TestPythonPy3Mako)
(and many other)

[1] 3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5 (package/gdb: zlib is mandatory, not optional)
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302864
[3] 8ce33fed49aea319da556eab388211a705afe7d0 (package/gdb: gdbserver does not need zlib)

Cc; Asaf Kahlon <asafka7@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
runtime tested:
  TestPythonPy3Flask.test_run (with zlib & zlib python module enabled)
  TestPythonPy3Pyyaml (without zlib)
---
 ...032-configure.ac-really-disable-zlib.patch | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 package/python3/0032-configure.ac-really-disable-zlib.patch

diff --git a/package/python3/0032-configure.ac-really-disable-zlib.patch b/package/python3/0032-configure.ac-really-disable-zlib.patch
new file mode 100644
index 0000000000..6d9fb2c3f1
--- /dev/null
+++ b/package/python3/0032-configure.ac-really-disable-zlib.patch
@@ -0,0 +1,96 @@
+From 9b5a79f7b5bc5ccfa8f3909ee6d3a94b2efb617d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 11 Oct 2023 15:33:54 +0200
+Subject: [PATCH] configure.ac: really disable zlib
+
+Commit "Add options to disable zlib, bzip2 and xz modules" allowed
+to disable the python zlib module but the configure script still
+check for zlib library using pkg-config even if --disable-zlib is
+provided.
+
+If zlib is detected by pkg-config it enable zlib support in binascii
+python module (-DUSE_ZLIB_CRC32) even if the zlib module is disabled.
+This is also a reproducible build issue since python doesn't provide
+the same features if zlib is buid before or after the python build.
+
+Fix this issue by disabling zlib support along with the zlib python
+module (--disable-zlib).
+
+Upstream: Not applicable
+(patching a BR patch 0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch)
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 45 ++++++++++++++++++++++++---------------------
+ 1 file changed, 24 insertions(+), 21 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3f5e7400c6..fa7cdfa0df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4288,7 +4288,8 @@ AC_ARG_ENABLE(zlib,
+ 	AS_HELP_STRING([--disable-zlib], [disable zlib]),
+ 	[ if test "$enableval" = "no"; then
+ 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
+-	  fi])
++	     enable_zlib=${enableval}
++	  fi], [enable_zlib=auto])
+ 
+ AC_ARG_ENABLE(xz,
+ 	AS_HELP_STRING([--disable-xz], [disable xz]),
+@@ -4899,30 +4900,32 @@ if test "$ac_cv_have_lchflags" = yes ; then
+   AC_DEFINE(HAVE_LCHFLAGS, 1, [Define to 1 if you have the 'lchflags' function.])
+ fi
+ 
+-dnl Check for compression libraries
+-AH_TEMPLATE([HAVE_ZLIB_COPY], [Define if the zlib library has inflateCopy])
++if test "x$enable_zlib" != xno; then
++  dnl Check for compression libraries
++  AH_TEMPLATE([HAVE_ZLIB_COPY], [Define if the zlib library has inflateCopy])
+ 
+-dnl detect zlib from Emscripten emport
+-PY_CHECK_EMSCRIPTEN_PORT([ZLIB], [-sUSE_ZLIB])
++  dnl detect zlib from Emscripten emport
++  PY_CHECK_EMSCRIPTEN_PORT([ZLIB], [-sUSE_ZLIB])
+ 
+-PKG_CHECK_MODULES([ZLIB], [zlib >= 1.2.0], [
+-  have_zlib=yes
+-  dnl zlib 1.2.0 (2003) added inflateCopy
+-  AC_DEFINE([HAVE_ZLIB_COPY], [1])
+-], [
+-  WITH_SAVE_ENV([
+-    CPPFLAGS="$CPPFLAGS $ZLIB_CFLAGS"
+-    LDFLAGS="$LDFLAGS $ZLIB_LIBS"
+-    AC_CHECK_HEADERS([zlib.h], [
+-      PY_CHECK_LIB([z], [gzread], [have_zlib=yes], [have_zlib=no])
+-    ], [have_zlib=no])
+-    AS_VAR_IF([have_zlib], [yes], [
+-      ZLIB_CFLAGS=${ZLIB_CFLAGS-""}
+-      ZLIB_LIBS=${ZLIB_LIBS-"-lz"}
+-      PY_CHECK_LIB([z], [inflateCopy], [AC_DEFINE([HAVE_ZLIB_COPY], [1])])
++  PKG_CHECK_MODULES([ZLIB], [zlib >= 1.2.0], [
++    have_zlib=yes
++    dnl zlib 1.2.0 (2003) added inflateCopy
++    AC_DEFINE([HAVE_ZLIB_COPY], [1])
++  ], [
++    WITH_SAVE_ENV([
++      CPPFLAGS="$CPPFLAGS $ZLIB_CFLAGS"
++      LDFLAGS="$LDFLAGS $ZLIB_LIBS"
++      AC_CHECK_HEADERS([zlib.h], [
++        PY_CHECK_LIB([z], [gzread], [have_zlib=yes], [have_zlib=no])
++      ], [have_zlib=no])
++      AS_VAR_IF([have_zlib], [yes], [
++        ZLIB_CFLAGS=${ZLIB_CFLAGS-""}
++        ZLIB_LIBS=${ZLIB_LIBS-"-lz"}
++        PY_CHECK_LIB([z], [inflateCopy], [AC_DEFINE([HAVE_ZLIB_COPY], [1])])
++      ])
+     ])
+   ])
+-])
++fi
+ 
+ dnl binascii can use zlib for optimized crc32.
+ AS_VAR_IF([have_zlib], [yes], [
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
