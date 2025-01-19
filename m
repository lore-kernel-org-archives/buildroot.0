Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4FCC02187
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0764254D;
	Sun, 19 Jan 2025 12:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2sjPzSbPZA0; Sun, 19 Jan 2025 12:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423A64256C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423A64256C;
	Sun, 19 Jan 2025 12:22:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63485958
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F10E40B00
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sOEDo8hoMQf for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FE840AFF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40FE840AFF
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 349FB85ECC; Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 11:36:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3181a1b572ba19f0221d3ee34933b710a256f5e5
X-Git-Newrev: f6cc52627d866c5a6277ab78970a491e3b89de40
X-Patchwork-Hint: ignore
Message-Id: <20250119122213.349FB85ECC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_syslinux:
 use newer toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6cc52627d866c5a6277ab78970a491e3b89de40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_syslinux.py | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 467d564e18..41152cde7e 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -6,13 +6,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
         BR2_x86_i686=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE=y
         """
 
     x86_64_toolchain_config = \
@@ -20,14 +14,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         BR2_x86_64=y
         BR2_x86_corei7=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2018.11-1.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
         """
 
     syslinux_legacy_config = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
