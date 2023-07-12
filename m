Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E054EB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 10:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FC8612AF;
	Wed, 12 Jul 2023 10:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92FC8612AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIAk2Hf7T8CE; Wed, 12 Jul 2023 10:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C1B612AC;
	Wed, 12 Jul 2023 10:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C1B612AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D39A1BF409
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35E9041B1A
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E9041B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kz0uR-YCcu7a for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 10:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3315941B55
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 10:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3315941B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 208EE86EA2; Wed, 12 Jul 2023 10:05:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 12:05:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb3273ba9bec6b45f94edab9a83646f1363444b4
X-Git-Newrev: 876ad67ac07be4b7900a4ea6464e7459e2b40604
X-Patchwork-Hint: ignore
Message-Id: <20230712100516.208EE86EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestGlxinfo: bump the
 toolchain to x86 core2 Bootlin toolchain stable 2022.08-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=876ad67ac07be4b7900a4ea6464e7459e2b40604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new Bootlin toolchain stable 2022.08-1 is based on gcc 11.3.0,
linux headers 4.9.327, glibc 2.35 and binutils 2.38.

Nowadays Bootlin toolchains are packaged in Buildroot and we can
directly select them from BASIC_TOOLCHAIN_CONFIG and avoid
setting the toolchain parameters (BR2_TOOLCHAIN_EXTERNAL_CUSTOM...).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_glxinfo.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index c7d62a690b..6bedee5298 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -10,14 +10,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         """
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
