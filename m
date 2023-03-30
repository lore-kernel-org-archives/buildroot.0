Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC50CC761AF
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 11:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48690402E7;
	Thu, 30 Mar 2023 11:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48690402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnN7Heg4PBjS; Thu, 30 Mar 2023 11:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 522424014E;
	Thu, 30 Mar 2023 11:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 522424014E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6363D1BF2EB
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 11:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0DB60AD0
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 11:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A0DB60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdE1KsSfpvTT for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 11:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9771760B32
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9771760B32
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 11:28:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so7926009wmq.3
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 04:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ocx1kLW+BAxG1yhaejkOEKcx5JCCT9oECd03dlnDIDI=;
 b=l2EDtRDq9L6jp5FPXYT86n7w2G50OrWN03c9jSZiRl+gdZM6qcZVHblbvmODv+/le/
 LFBlg2vRggQkv8NN/UJC4PIHGzqWqTa0huVEJS0OoTDC202+b6V4Dj3YEOsUdaFPtA2f
 We7/0rEG9TQ3+BN+tHmbNTm6uDGEeo1cZ7jzEZQuOoERiIvMOL5Bp4JXPF2jQt1yrdpM
 YZd7MkGGWNlFfbH+Sb91p2wjYOYNmglYrIlYZNNDLHry1KNwbTOVvd98w+XgQaOo7uAr
 8+yn4NUpvDJKa5puDb+VYi7YWf8ADJH3i9dzwT/0VvVj+IJifnMP4uwzNGJnG90QV83R
 Vwhw==
X-Gm-Message-State: AO0yUKWD/kUh10+E8TDdjLHaPExnaxL+UJKqM3aP4ZVhvT3moNEXaHqh
 iKpC14IQegieRlyb4uFpvTz+jEJLrybUonJHwcE=
X-Google-Smtp-Source: AK7set8+zFBctlaoEie0WYeqn5sg4RiIfxh6vo7QfTQj0lMV2LiWfCYbP9qb3CktfnYxWVgy3chQMQ==
X-Received: by 2002:a05:600c:210d:b0:3ed:418a:ec06 with SMTP id
 u13-20020a05600c210d00b003ed418aec06mr17550367wml.28.1680175691129; 
 Thu, 30 Mar 2023 04:28:11 -0700 (PDT)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a05600c21cf00b003ee1b2ab9a0sm5458379wmj.11.2023.03.30.04.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 04:28:10 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 30 Mar 2023 13:27:49 +0200
Message-Id: <20230330112750.1710771-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680175691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ocx1kLW+BAxG1yhaejkOEKcx5JCCT9oECd03dlnDIDI=;
 b=fX65sRmnCRNle7+Zjz/xXeALm7Qs4lFpp40FHAhPnHoa6351Ds7JIqBFBEc2ogCy+t
 K79CflSRW9xCvzuw9ozVYAo9bYXEZB1L/rkLlQAmG88CrsHC0/9DOm2FM3tf+BiRPcmp
 xv3U6GVPfkE1q2L5CpX4aj2ZQzFjZ/idsmsDDxKVC/Rh89CZZqPyqgZtP/ThHhiLANGa
 lIsH3jycI2J99zXa3fh+bbt6tq9vNRsYZFkYIZY7iChwZ+e5oCh5j2VeAELoEcBh6LqU
 PZoresY102GnK/aEjR+CylVoTxEddP3SXcfIzPqD5gvMnXRTfPPU80spw0vXEFqlH/VG
 CZJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fX65sRmn
Subject: [Buildroot] [PATCH 1/1] support/testing/infra/basetest.py: use
 Bootlin toolchain bleeding edge 2022.08-1
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates the default toolchain used for runtime tests. The
last time this toolchain was updated was in commit
0207a65323fc73fe9570f3d7e03bbfed4ab6d477 3 years ago. Since then,
multiple things have changed:

Firstly, it used uclibc-ng as the libc whereas since commit
4057e36ca9665edd5248512e4edba2c243b8f4be, glibc is used as the default
library.

And secondly, since commit 531b2a10cda6bae78ecc141c9fe48f2024f71dbc, buildroot
dropped the support for gcc 8 and it cannot be built internally anymore.

This new toolchain bleeding edge 2022.08-1 is based on gcc 12.2.0, linux
headers 5.4.212, glibc 2.35 and binutils 2.39.
It is now required to add enable BR2_TOOLCHAIN_USES_GLIBC and
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC since uclibc-ng is still the
standard choice when using an external toolchain. If one were to change
this, it would break the builds for people using a uclibc toolchain with
a recent version of buildroot. BR2_TOOLCHAIN_EXTERNAL_LOCALE doesn't
need to be enabled anymore since it is implicit in glibc.
BR2_TOOLCHAIN_EXTERNAL_INET_RPC needs to be disabled since support has
been dropped by glibc but it is selected by default when choosing glibc.

The previous toolchain bleeding edge 2018.11-1 is based on gcc 8.2.0,
linux headers 4.14.80, uclibc 1.0.30 and binutils 2.31.1

Tested with gitlab:
https://gitlab.com/DocSepp/buildroot/-/pipelines/821745386/

Due to gitlab constraints it's not possible to check all the tests. Most
of the tests that did not succeed didn't because of such constraints.
The remaining fails are missing python or perl modules, timeouts because
the test takes more than 3h, tests.package.test_kexec.TestKexec  is
executed with a property that is unknown to qemu and several tests use a
different toolchain.

I noticed 4 tests, TestPython3Py, TestPython3Pyc, TestPython3PyPyc and
TestTmux that failed due to locale and libc.so.1 not found errors. I
verified that they did run with the previous toolchain and subsequently
introduced changes in their configs so the tests succeed with the new
toolchain.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 support/testing/infra/basetest.py            | 10 ++++++----
 support/testing/tests/package/test_python.py |  2 +-
 support/testing/tests/package/test_tmux.py   |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 670c7213d6..586b51e56e 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -10,13 +10,15 @@ BASIC_TOOLCHAIN_CONFIG = \
     BR2_arm=y
     BR2_TOOLCHAIN_EXTERNAL=y
     BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+    BR2_TOOLCHAIN_USES_GLIBC=y
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
     BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2022.08-1.tar.bz2"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_12=y
+    BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
     BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
     BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
     """
 
 MINIMAL_CONFIG = \
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
