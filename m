Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1E4C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBFB4057C;
	Tue, 27 Aug 2024 16:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJq1LBRl5nt3; Tue, 27 Aug 2024 16:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513EC4062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513EC4062C;
	Tue, 27 Aug 2024 16:44:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8381BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 380918056E
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmuBROrJnBLn for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 573C480510
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 573C480510
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:44:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44F2E815BE; Tue, 27 Aug 2024 16:44:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:43:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c84b89fd0e32b7a23def6f1f7014e4dcd19be5c0
X-Git-Newrev: 3ded56bd1bca34f30331618ad38b74457942c5e7
X-Patchwork-Hint: ignore
Message-Id: <20240827164418.44F2E815BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: update to
 4.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ded56bd1bca34f30331618ad38b74457942c5e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release notes see following page:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.6.html

Support for QT6 was disabled in this update and could be
added in a later commit.

Patch 0001 is upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch | 31 ----------------------
 package/wireshark/wireshark.hash                   |  6 ++---
 package/wireshark/wireshark.mk                     |  4 +--
 4 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4380bc1a99..4017438f5e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1369,7 +1369,6 @@ package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.pa
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
