Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23EEC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A62761141;
	Sat, 17 Sep 2022 19:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A62761141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlDjCg-R7A9w; Sat, 17 Sep 2022 19:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4C16114C;
	Sat, 17 Sep 2022 19:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4C16114C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 143531BF96B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B4641CA0
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B4641CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3YIruFc9fAf for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93BD141C98
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BD141C98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81E1F84633; Sat, 17 Sep 2022 19:30:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:53:21 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3d41bf63d27339cc76b5123ee3d1884d7931c67b
X-Git-Newrev: abc9c24de9536fd028680781915310d3942fa9cd
X-Patchwork-Hint: ignore
Message-Id: <20220917193046.81E1F84633@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libcamera: needs
 gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=abc9c24de9536fd028680781915310d3942fa9cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libcamera needs gcc >= 8 since bump to
8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98 in commit
64f67ede01699c47ca3c8801ae5dd440295f1874 and
https://git.libcamera.org/libcamera/libcamera.git/commit/?id=a7ab5ef1d2f9b05056db450e631a99a73382d589:

../output-1/build/libcamera-ba6435930f08e802cffc688d90f156a8959a0f86/meson.build:82:8: ERROR: Problem encountered: gcc version is too old, libcamera requires 8.0 or newer

Fixes:
 - http://autobuild.buildroot.org/results/f8eba0e564d03b83fcda4085baec16a4857c7d25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 204002f672a7acb9af326b3ad4e378246cdc65ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera-apps/Config.in | 6 +++---
 package/libcamera/Config.in      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 492a99cf55..711fd6de05 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	select BR2_PACKAGE_BOOST
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index fd7b3c92c4..908e5a3ec5 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
@@ -91,7 +91,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
