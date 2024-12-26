Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0BDE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 12:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2712560782;
	Thu, 26 Dec 2024 12:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPcizcnDP11m; Thu, 26 Dec 2024 12:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A2A607C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A2A607C4;
	Thu, 26 Dec 2024 12:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7E0E757
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 12:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95745409B1
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 12:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2ae_JJRygGj for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 12:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 396D94094F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 396D94094F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 396D94094F
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 12:13:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 44DD0B0056A;
 Thu, 26 Dec 2024 13:13:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 26 Dec 2024 13:13:14 +0100
Message-ID: <20241226121314.661260-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735215205;
 bh=YlvmZtKFmuf0ppfxH8UhKBj23BUP81RX7ny1ee/03gE=;
 h=From:To:Cc:Subject:Date:From;
 b=bfJPaOuXc46nZS+xLvL7icwF6LBYIHUs5MGQLiIWMW0nLG6ZcGS0YBy+t/gO1p5DB
 F9Q+qDNvH2p1Iz0Ohg3ZWuywdtY+2/vMwoXjsl4oUgzH8qtmWxnyKcOmi3EytvPx15
 mO5uZvLrWHeZKICjgV2GBrV4c20uorxOEmSf/xeuf3l7IBN46jRNcaSn57Wfgyiz5Z
 Jw2f9Z4jSW0Lize+UJsYJR9kUDNaJsain7Zkpmt8YMpdJKUo4EF/ABaog6A45CtRco
 vt2Ii/XwT7NYBsAsvNqZdWZVdQ4Mk9k7iIuNA5m82cNOjc46h29a3zHaUSbZAFgcyf
 Si083KD0BQhnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bfJPaOuX
Subject: [Buildroot] [PATCH 1/1] package/libcamera: bump to version 0.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 0.3.2, see:
https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.4.0

libcamera dropped the gcc 8 support in [1] and increased the minimal
version to 9. This commit updates that requirement in the package
Config.in and in reverse dependency (in libcamera-apps).

This commit also updates the libcamera runtime test to the new format
of the "cam --list-properties" output.

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=9f513439b6896d1a33c91a400bd02b7b8829feb6

Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
compilation: https://gitlab.com/jolivain/buildroot/-/pipelines/1603076681
runtime: https://gitlab.com/jolivain/buildroot/-/jobs/8725706819

Compilation also tested with pipewire and libcamera-apps.
---
 package/libcamera-apps/Config.in                | 2 +-
 package/libcamera/Config.in                     | 2 +-
 package/libcamera/libcamera.hash                | 2 +-
 package/libcamera/libcamera.mk                  | 2 +-
 support/testing/tests/package/test_libcamera.py | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index f169d8c52e..fa41d1be2d 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 4699e382c7..1df97edc41 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index d4554af190..8c845d0e21 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  d396bebe49aa7f605403594be3a9e970173d4c98061033c75f816946ff907eb8  libcamera-v0.3.2-git4.tar.gz
+sha256  0b45861dc0430074bf10aaa78a69439b319e9df4ed041496fd5f95e546c8f575  libcamera-v0.4.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 3367eb60b2..dcfa54e5dd 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.3.2
+LIBCAMERA_VERSION = v0.4.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index 8953021b82..91df427b6f 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -64,7 +64,7 @@ class TestLibCamera(infra.basetest.BRTest):
         cmd = f"cam --camera {cam_idx} --list-controls"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
-        self.assertIn("Control: Brightness:", "\n".join(out))
+        self.assertIn("Control: [inout] libcamera::Brightness:", "\n".join(out))
 
         # List the camera properties and check we have a camera
         # "Model" property.
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
