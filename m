Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E167BC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 04:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D05180FAF;
	Mon, 26 Aug 2024 04:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11g3vKf-k_xh; Mon, 26 Aug 2024 04:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2156F80FB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2156F80FB3;
	Mon, 26 Aug 2024 04:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0E31BF2C0
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A58C40289
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 04:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-uyufM5agKT for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 04:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2B7740284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B7740284
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2B7740284
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 04:21:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E9CE83536441; Mon, 26 Aug 2024 06:21:30 +0200 (CEST)
Date: Mon, 26 Aug 2024 06:21:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZswCynAhR6LqiAGJ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724646090; bh=vKNHMr+bgfRyHpXUGVX8i3CI2TcBTrTzax7s2I2zEy8=;
 h=Date:From:To:Subject:From;
 b=OhTKhlx9o9YzHX/HhwCz6Y9029razhxbVWxYfiNO2rudspAChY/DUaRU/tWQr4bCO
 O4UuGTqmrWQkTxOZgaa6vwJuc4IhD0liyLnvtMQ0n7SsEglZyl53CzF1gT1jP5E77I
 GE/n9WeYG2ZIch9KchodUpYosnSuwqsjYf5/MuO01sUnUzD/AgJwwnFs5Iq663mGY6
 coxfgSJR7PECbLluhoCC1K4Y++XUAzeyzVQ8qlcYOnoElyrhv+cNWNpf0J9qr6cMMI
 ezae9q0AsPtBTDENGXZkjRBQ7z2XzbtdiX0FMgLCCYVvbYYQlnWk0lqyaCgzHlZiRC
 affg7ZRLaA5yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=OhTKhlx9
Subject: [Buildroot] [PATCH next] package/wireshark: update to 4.2.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes see following page:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.6.html

Support for QT6 was disabled in this update and could be
added in a later commit.

Patch 0001 is upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  1 -
 ...-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch | 31 -------------------
 package/wireshark/wireshark.hash              |  6 ++--
 package/wireshark/wireshark.mk                |  4 +--
 4 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 778e3b8651..9e70fee06b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1371,7 +1371,6 @@ package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.pa
 package/wilc-driver/0005-Fix-cast-warnings.patch lib_patch.Upstream
 package/wipe/0001-musl.patch lib_patch.Upstream
 package/wireless_tools/0001-remove-bzero.patch lib_patch.Upstream
-package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch lib_patch.Upstream
 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch lib_patch.Upstream
 package/wpa_supplicant/ifupdown.sh Shellcheck
 package/x11r7/xapp_luit/0001-posix-openpt.patch lib_patch.Upstream
diff --git a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
deleted file mode 100644
index edf24fc6d0..0000000000
--- a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 33270f56477542dedf978e660cf8d08464f28797 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 26 Nov 2021 17:45:23 +0100
-Subject: [PATCH] cmake: lemon: wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} if needed
-
-Wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} when LEMON_C_COMPILER is set to
-avoid a build failure when cross-compiling (e.g. with buildroot)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/wireshark/wireshark/-/merge_requests/5224]
----
- tools/lemon/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/lemon/CMakeLists.txt b/tools/lemon/CMakeLists.txt
-index 8742aa9fc9..7a9263fe0d 100644
---- a/tools/lemon/CMakeLists.txt
-+++ b/tools/lemon/CMakeLists.txt
-@@ -12,6 +12,8 @@ add_executable(lemon lemon.c)
- if(DEFINED LEMON_C_COMPILER)
- 	set(CMAKE_C_COMPILER "${LEMON_C_COMPILER}")
- 	set(CMAKE_C_FLAGS "")
-+	set(CMAKE_EXE_LINKER_FLAGS "")
-+	set(CMAKE_SYSROOT "")
- endif()
- 
- # To keep lemon.c as close to upstream as possible, deliberately ignore
--- 
-2.33.0
-
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 6610eb7781..06119861f2 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.12.txt
-sha1  e00d90769995bf786b05c05bdd9a2c6c8e372e70  wireshark-4.0.12.tar.xz
-sha256  e4e3d618ba11e159fb163f0dc4716a8b72a065aafd1111db9405332552a5a115  wireshark-4.0.12.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.6.txt
+sha1  db0374dce360b99d8abb9a3f3471f3fc98d6d099  wireshark-4.2.6.tar.xz
+sha256  5ec6028df29068d889c98489bf194a884b00831106fea1e921fea3c65f2003f5  wireshark-4.2.6.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 3759f9bf94..242430194f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.12
+WIRESHARK_VERSION = 4.2.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -40,7 +40,7 @@ WIRESHARK_CONF_OPTS += -DENABLE_LTO=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),y)
-WIRESHARK_CONF_OPTS += -DBUILD_wireshark=ON
+WIRESHARK_CONF_OPTS += -DBUILD_wireshark=ON -DUSE_qt6=OFF
 WIRESHARK_DEPENDENCIES += qt5base qt5multimedia qt5svg qt5tools
 else
 WIRESHARK_CONF_OPTS += -DBUILD_wireshark=OFF
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
