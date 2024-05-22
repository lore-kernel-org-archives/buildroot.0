Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E2C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2083F6079F;
	Wed, 22 May 2024 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D47JLP1IdxJg; Wed, 22 May 2024 16:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 994D660AD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 994D660AD3;
	Wed, 22 May 2024 16:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23F6F1C5D47
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C90760737
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko_A8FGML0K1 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1F960631
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1F960631
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 298FF87557; Wed, 22 May 2024 16:09:46 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 17:53:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 113eeb55d6701ce01e7401cc322d16604a829513
X-Git-Newrev: 69202bfe7325269e79cb01bd3d5f59e66eedceae
X-Patchwork-Hint: ignore
Message-Id: <20240522160946.298FF87557@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_r1_defconfig: bump Linux
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
Content-Type: multipart/mixed; boundary="===============2157941883361092461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2157941883361092461==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69202bfe7325269e79cb01bd3d5f59e66eedceae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.10.10 kernel fails to build with GCC 13.x:

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
 configs/orangepi_r1_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index d7a21894bd..318fa126a7 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi R1"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-r1"

--===============2157941883361092461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2157941883361092461==--
