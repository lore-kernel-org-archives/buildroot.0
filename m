Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC38C7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 15:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 448308329D;
	Tue, 23 May 2023 15:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448308329D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8F1zucuOqxIc; Tue, 23 May 2023 15:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE59831FB;
	Tue, 23 May 2023 15:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE59831FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C54FF1BF398
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 15:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0B460C33
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 15:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0B460C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSDWYIbNLc-H for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 15:31:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5505D60777
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5505D60777
 for <buildroot@buildroot.org>; Tue, 23 May 2023 15:31:50 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout12.t-online.de (Postfix) with SMTP id 1D708AD50;
 Tue, 23 May 2023 17:31:47 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q1TzG-0zOr4b0; Tue, 23 May 2023 17:31:46 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36440)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q1TzG-0000HW-0X;
 Tue, 23 May 2023 17:31:46 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 17:31:46 +0200
Message-Id: <20230523153146.418509-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684855906-637E49E6-89736765/0/0 CLEAN NORMAL
X-TOI-MSGID: a9399b08-8b14-4fea-b687-5a81b6cc4a09
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: needs gcc >= 8
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed since upstream commit
https://github.com/Mesa3D/mesa/commit/f9057cea517e01e05f08f00a741aad5bae154d62
which was first released with mesa3d-22.3.0, added to buildroot with
commit e4a1183d8f7d8422dbc23432248b984745a428b7.

Fixes:
http://autobuild.buildroot.net/results/011/01109560288f933019eea726a91c4109fbcca794/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediadriver/Config.in |  5 +++--
 package/mesa3d/Config.in            | 14 ++++----------
 2 files changed, 7 insertions(+), 12 deletions(-)

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
index b01aeb391b..f7c59e60ce 100644
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
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_HOST_GCC_AT_LEAST_5
 
@@ -392,11 +390,7 @@ config BR2_PACKAGE_PROVIDES_LIBOPENCL
 
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
