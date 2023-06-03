Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE12C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624BF41C57;
	Sat,  3 Jun 2023 19:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624BF41C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxENBgZ_Wdjx; Sat,  3 Jun 2023 19:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E158141E1F;
	Sat,  3 Jun 2023 19:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E158141E1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E8F1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BB483CA9
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BB483CA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5-CJIw4e3JP for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCE2483C6F
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE2483C6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC9D7867B9; Sat,  3 Jun 2023 19:27:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 21:23:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 558afd87d943ec39880ab98704f0d41c6b0e2817
X-Git-Newrev: 51b60c8acf3f4b534d0954b801f1034491b59c94
X-Patchwork-Hint: ignore
Message-Id: <20230603192700.BC9D7867B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: needs gcc >= 8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51b60c8acf3f4b534d0954b801f1034491b59c94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed since upstream commit
https://github.com/Mesa3D/mesa/commit/f9057cea517e01e05f08f00a741aad5bae154d62
which was first released with mesa3d-22.3.0, added to buildroot with
commit e4a1183d8f7d8422dbc23432248b984745a428b7.

Fixes:
http://autobuild.buildroot.net/results/011/01109560288f933019eea726a91c4109fbcca794/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
index 9ac946269a..dfd0dc105d 100644
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
 
@@ -391,11 +389,7 @@ config BR2_PACKAGE_PROVIDES_LIBOPENCL
 
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
