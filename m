Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B40C25B7C
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B07B8400F1;
	Wed, 22 May 2024 13:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf8ixtaG8E9s; Wed, 22 May 2024 13:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8607C4010C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8607C4010C;
	Wed, 22 May 2024 13:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5EE41C5BBD
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92EAF60687
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuMwxkBb3ObY for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FEB60586
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7FEB60586
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC4AD87525; Wed, 22 May 2024 13:14:44 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 15:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a734700d714d799b5d42489071b0f7759552987
X-Git-Newrev: 376f00166f3cbd974164cad1a7ed2c5fdf95bddf
X-Patchwork-Hint: ignore
Message-Id: <20240522131444.BC4AD87525@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: bump Linux
 to 5.10.217 to fix gcc 13.x build
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5596031206413804224=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5596031206413804224==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=376f00166f3cbd974164cad1a7ed2c5fdf95bddf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.10.79 kernel fails to build with GCC 13.x:

In file included from <command-line>:
drivers/ata/libahci.c: In function ‘ahci_led_store’:
././include/linux/compiler_types.h:315:45: error: call to ‘__compiletime_assert_321’ declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
  315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
././include/linux/compiler_types.h:296:25: note: in definition of macro ‘__compiletime_assert’
  296 |                         prefix ## suffix();                             \
      |                         ^~~~~~
././include/linux/compiler_types.h:315:9: note: in expansion of macro ‘_compiletime_assert’
  315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
./include/linux/nospec.h:58:9: note: in expansion of macro ‘BUILD_BUG_ON’
   58 |         BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
      |         ^~~~~~~~~~~~
drivers/ata/libahci.c:1137:23: note: in expansion of macro ‘array_index_nospec’
 1137 |                 pmp = array_index_nospec(pmp, EM_MAX_SLOTS);
      |                       ^~~~~~~~~~~~~~~~~~

This is fixed upstream by commit f07788079f515ca (ata: ahci: fix enum
constants for gcc-13), which has been backported to 5.10.x as of 5.10.184,
so bump to v5.10.217 to fix the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/beagleboneai_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index 586a75317e..1373ba662e 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.79"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am5729-beagleboneai"

--===============5596031206413804224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5596031206413804224==--
