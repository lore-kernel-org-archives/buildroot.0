Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEF7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FEC64FEE4;
	Fri, 28 Feb 2025 16:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P4u8Q-QP0XS; Fri, 28 Feb 2025 16:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72504FCA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72504FCA9;
	Fri, 28 Feb 2025 16:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1349F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C08242E83
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0Cwu2kCg3Qh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C809B426B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C809B426B8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2AFD86612; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 18:54:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b7882d024ae484c52473955fbbcbf3b5f0717c2f
X-Git-Newrev: c26da4256031989df1d4a11c2dc2028e16c95fcc
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.C2AFD86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: bump to
 version 0.4.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c26da4256031989df1d4a11c2dc2028e16c95fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
