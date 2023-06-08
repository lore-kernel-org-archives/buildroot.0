Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53590C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E423760F8E;
	Thu,  8 Jun 2023 18:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E423760F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcCWakpQ4SKW; Thu,  8 Jun 2023 18:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62D461549;
	Thu,  8 Jun 2023 18:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62D461549
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D28D11BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACAE58211B
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACAE58211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtviGEML46Ea for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7237B8210D
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7237B8210D
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso1117691e87.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247733; x=1688839733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6MYL4kE+fVpupHkoxnXp2L5NpbirGLemaf/JqIFXxQ=;
 b=An3QvAXYQDhELADq83rqASvtzX/pbRo/VpRCADrNL/iwIWifgHwFBtCfBuEWiL5ffg
 ZnHUkGwglOjimXpSVVmU2PY2PtGFCOkKPvvs73vLs5LKYlyDAnwJvE35TNyzmx20Y1Yn
 MeJgd5sTHvweQt9FKsWj0GsxAUsCYCaaVmnDIN9gEgm4mEvfP9Grh+8jGKt4aLFtbzWl
 UjXBk5RWJBvHDLXiWugjSiCjkbdkrC7N+qpc9Tzot9sZFREgWH6Ttl8Zc2ZJAbPBsn2P
 UggZCZtLKpd9okoLFW2f1oAhuCb27Nw+erUlRV1WiA1d+j1ttU849JuET2EWvbBebBej
 ouBg==
X-Gm-Message-State: AC+VfDzv5cq0QuNesGqWQxaoR9C8dd/ulwFU7+cwmyzxtWTx0GgDK61J
 WxIG7CM/I3w+Qx3ADIIbVAbDkEBb1JY=
X-Google-Smtp-Source: ACHHUZ5n0Z6Z5pjEL8FNTaslhoUBLfNZKc9+b4q8UHTpM8qRlCH2gaxU8t2ZeszlUGuhpC3Rmg4xKg==
X-Received: by 2002:a05:6512:4c3:b0:4f6:2c98:3957 with SMTP id
 w3-20020a05651204c300b004f62c983957mr3563700lfq.32.1686247732897; 
 Thu, 08 Jun 2023 11:08:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:52 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:33 +0200
Message-Id: <20230608180844.189528-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247733; x=1688839733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6MYL4kE+fVpupHkoxnXp2L5NpbirGLemaf/JqIFXxQ=;
 b=Ql11dsNNJzACOShE7YGeXpg/uJ0lpPKn8dVygP80jm9EchcNBxf1q0GX5YwmDqWZn3
 bczQEhxQE/xToouqUr/CmPc2OYCnhhtynFoqk3s0SQoJpCqqBHaOJlok1QbiaE+OSJDZ
 NLv8+j/mtmXtp+XXU5nU40nu2AeBC0Hozq1tksgb16BEzxAAj4C3ri1poCrgTn5hLzsO
 yKzUPR1k/Y6buVdFkx7Y9iUL8Yss0vePsdyLVKAtNA99v/+V53upal/XdwgMwCS3BcnX
 qcJ2TKZMSKlEghVYlE70LhvNo+CwVOoE8FATHz5kcklFpqeVJRkr2u9iF+csaZDq4W7P
 pO0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ql11dsNN
Subject: [Buildroot] [PATCH 05/16] support/testing/infra/basetest.py: use
 Bootlin toolchain stable 2022.08-1
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastian Weyer <sebastian.weyer@smile.fr>

This patch updates the default toolchain used for runtime tests. The
last time this toolchain was updated was in commit
0207a65323fc73fe9570f3d7e03bbfed4ab6d477 3 years ago. Since then,
multiple things have changed:

Firstly, it used uclibc-ng as the libc whereas since commit
4057e36ca9665edd5248512e4edba2c243b8f4be, glibc is used as the default
library.

And secondly, since commit 531b2a10cda6bae78ecc141c9fe48f2024f71dbc, buildroot
dropped the support for gcc 8 and it cannot be built internally anymore.
So the testsuite was executed using a toolchain that can't be built by
the Buildroot internal toolchain backend anymore.

This new Bootlin toolchain stable 2022.08-1 is based on gcc 11.3.0,
linux headers 4.9.327, glibc 2.35 and binutils 2.38.

The previous toolchain bleeding edge 2018.11-1 is based on gcc 8.2.0,
linux headers 4.14.80, uclibc 1.0.30 and binutils 2.31.1

Nowadays Bootlin toolchains are packaged in Buildroot and we can
directly select them from BASIC_TOOLCHAIN_CONFIG and avoid
setting the toolchain parameters (BR2_TOOLCHAIN_EXTERNAL_CUSTOM...).

The switch to Glibc requires to update some tests for the following
reasons:

- TestPython3Py, TestPython3Pyc and TestPython3PyPyc has been updated
  since they use the libc binary file name in their test
  (uClibc: libc.so.1 vs Glibc: libc.so.6).

- TestTmux needs at least one locale to pass (as stated in tmux help
  text "tmux needs a working UTF-8 locale"), so use "C.UTF-8".

- TestOpenSsh needs a toolchain >= 5.x due to a openssh issue
  (Similar to: https://bugs.busybox.net/show_bug.cgi?id=13671)
  Use the Bootlin toolchain bleeding-edge 2022.08-1 rhat provide
  kernel headers 5.4

- TestShadow needs a toolchain >= 4.14
  Use the Bootlin toolchain bleeding-edge 2022.08-1 rhat provide
  kernel headers 5.4

Runtime tested on the gcc farm server.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/infra/basetest.py             | 10 ++--------
 support/testing/tests/package/test_openssh.py |  8 +++++++-
 support/testing/tests/package/test_python.py  |  2 +-
 support/testing/tests/package/test_shadow.py  |  7 ++++++-
 support/testing/tests/package/test_tmux.py    |  1 +
 5 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 670c7213d6..12d96415da 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -9,14 +9,8 @@ BASIC_TOOLCHAIN_CONFIG = \
     """
     BR2_arm=y
     BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
     """
 
 MINIMAL_CONFIG = \
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 4b48059573..a28c28f797 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -32,9 +32,13 @@ class TestOpensshBase(infra.basetest.BRTest):
 
 
 class TestOpenSshuClibc(TestOpensshBase):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+    config = \
         TestOpensshBase.opensshconfig + \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
 
@@ -43,12 +47,14 @@ class TestOpenSshuClibc(TestOpensshBase):
 
 
 class TestOpenSshGlibc(TestOpensshBase):
+
     config = \
         TestOpensshBase.opensshconfig + \
         """
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index d6f69a83c7..c9ecf9acda 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -29,7 +29,7 @@ class TestPythonBase(infra.basetest.BRTest):
     def libc_time_test(self, timeout=-1):
         cmd = self.interpreter + " -c '"
         cmd += "import ctypes;"
-        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
+        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.6\");"
         cmd += "print(libc.time(None))'"
         self.assertRunOk(cmd, timeout)
 
diff --git a/support/testing/tests/package/test_shadow.py b/support/testing/tests/package/test_shadow.py
index 09b580de59..3352d454a5 100644
--- a/support/testing/tests/package/test_shadow.py
+++ b/support/testing/tests/package/test_shadow.py
@@ -5,9 +5,14 @@ from infra.basetest import BRTest, BASIC_TOOLCHAIN_CONFIG
 
 class TestShadow(BRTest):
     username = 'user_test'
-    config = BASIC_TOOLCHAIN_CONFIG + \
+    # Need to use a different toolchain than the default due to
+    # shadow package requiring a toolchain w/ headers >= 4.14
+    config = \
         """
         BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_SHADOW=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
index 7a10b7a2b0..f2c620d5ca 100644
--- a/support/testing/tests/package/test_tmux.py
+++ b/support/testing/tests/package/test_tmux.py
@@ -9,6 +9,7 @@ class TestTmux(infra.basetest.BRTest):
         BR2_PACKAGE_TMUX=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_GENERATE_LOCALE="C.UTF-8"
         """
 
     def test_run(self):
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
