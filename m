Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01532EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D8641DAC;
	Wed, 14 Jun 2023 11:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D8641DAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHaBOkhKq3eR; Wed, 14 Jun 2023 11:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6F841D87;
	Wed, 14 Jun 2023 11:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6F841D87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431081BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B1A8204D
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49B1A8204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BeAxT4gQlbv for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DA9C832EA
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA9C832EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E22583630; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 13:51:45 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 20b899f38a9e8bdda11aa865167188d3d78ce89c
X-Git-Newrev: 056ef01371b8c776f7d4c32bed4287126cb90e8b
X-Patchwork-Hint: ignore
Message-Id: <20230614115310.4E22583630@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mesa3d: needs gcc
 >= 8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=056ef01371b8c776f7d4c32bed4287126cb90e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Needed since upstream commit
https://github.com/Mesa3D/mesa/commit/f9057cea517e01e05f08f00a741aad5bae154d62
which was first released with mesa3d-22.3.0, added to buildroot with
commit e4a1183d8f7d8422dbc23432248b984745a428b7.

Fixes:
http://autobuild.buildroot.net/results/011/01109560288f933019eea726a91c4109fbcca794/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 51b60c8acf3f4b534d0954b801f1034491b59c94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-mediadriver/Config.in |  5 +++--
 package/mesa3d/Config.in            | 16 +++++-----------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 537e4abd2f..c59437ec73 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # mesa3d, libva
 	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-gmmlib, libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
@@ -28,7 +29,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
 
 endif # BR2_PACKAGE_INTEL_MEDIADRIVER
 
-comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
+comment "intel-mediadriver needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cae2161aa3..e21bbbe3e4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -4,7 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
@@ -24,7 +24,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -33,10 +32,9 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_HOST_GCC_AT_LEAST_5
 
@@ -393,11 +391,7 @@ config BR2_PACKAGE_PROVIDES_LIBOPENCL
 
 endif # BR2_PACKAGE_MESA3D
 
-comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
+comment "mesa3d needs a toolchain w/ gcc >=8, C++, NPTL, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-
-comment "mesa3d needs a toolchain w/ gcc >= 7"
-	depends on BR2_m68k
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
