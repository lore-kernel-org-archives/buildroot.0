Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0F5CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECEE61B58;
	Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDEU5_8xcZ3r; Thu, 21 Aug 2025 19:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEDB61B64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEDB61B64;
	Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BA1525B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B7F784199
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70jC6oAZG20h for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BF983F45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BF983F45
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 263BA81525; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:32:27 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ca84c57b2856a1ada6ee832107f354c9bd2c70c0
X-Git-Newrev: 5d271fea62d9a847fcd83c31d721496ba7eb5f08
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.263BA81525@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 support/testing/tests/fs/test_iso9660.py: use a more recent toolchain
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d271fea62d9a847fcd83c31d721496ba7eb5f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The ISO9660 tests are currently using an old 2017 toolchain. Let's
switch to a modern toolchain, which is regularly updated. Also, we use
a toolchain based on glibc since grub2 doesn't build with recent
uClibc toolchains.

It will work around build issues with syslinux.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828871
  https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828770

(Even though those should be fixed separately, as syslinux should
continue to build with old compilers not supporting std=gnu17)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2e2bfd678b9e868ddb6ad559a726b138d2ec5110)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/fs/test_iso9660.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 3d08f2e895..1b86bfbfc1 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -4,16 +4,9 @@ import infra.basetest
 
 BASIC_CONFIG = \
     """
-    BR2_x86_pentium4=y
+    BR2_x86_core2=y
     BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.05-1078-g95b1dae.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
     BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
