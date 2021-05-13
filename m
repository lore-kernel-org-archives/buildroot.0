Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A432CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6661B60F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6661B60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E4860646;
	Tue,  3 Aug 2021 21:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3Zut2D3hmtO; Tue,  3 Aug 2021 21:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5046560653;
	Tue,  3 Aug 2021 21:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3EC1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D7774015B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiCxzyi8ZjPa for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E6840001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8AEC07FF41; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 May 2021 09:45:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 080bcd047d364c22fdb09dc490fcf348c1a84d5d
X-Git-Newrev: 6a075914849457d0c52e6bb3235faa9f3fcdbefb
X-Patchwork-Hint: ignore
Message-Id: <20210803210935.8AEC07FF41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vlc: security bump
 version to 3.0.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4209347111043566252=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4209347111043566252==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6a075914849457d0c52e6bb3235faa9f3fcdbefb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch 0002 which was applied upstream:
https://code.videolan.org/videolan/vlc/-/commit/41caaa08cde60c4fec4bf2e5f9610e2a1b9e6a23

Renumbered remaining patches.

Release notes:
https://www.videolan.org/vlc/releases/3.0.13.html
https://www.videolan.org/vlc/releases/3.0.12-update.html

Version 3.0.13 fixes VideoLAN-SB-VLC-3013:
https://www.videolan.org/security/sb-vlc3013.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... 0002-automake-add-subdir-objects-option.patch} |  0
 ...LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch | 41 ----------------------
 ...-build-use-pkg-config-to-get-tremor-libs.patch} |  0
 ...error-using-uClibc-by-adding-sys-types.h.patch} |  0
 ...005-Don-t-assume-strerror_l-is-available.patch} |  0
 ...-ancient-run-time-fallback-to-real-time-.patch} |  0
 ...2.patch => 0007-Add-support-for-freerdp2.patch} |  0
 ...-also-use-AC_PATH_PROG-to-check-for-wayl.patch} |  0
 ...o_filter-opencv_example.cpp-fix-build-wi.patch} |  0
 package/vlc/vlc.hash                               |  8 ++---
 package/vlc/vlc.mk                                 |  2 +-
 11 files changed, 5 insertions(+), 46 deletions(-)

diff --git a/package/vlc/0003-automake-add-subdir-objects-option.patch b/package/vlc/0002-automake-add-subdir-objects-option.patch
similarity index 100%
rename from package/vlc/0003-automake-add-subdir-objects-option.patch
rename to package/vlc/0002-automake-add-subdir-objects-option.patch
diff --git a/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch b/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch
deleted file mode 100644
index 11eaaf3b20..0000000000
--- a/package/vlc/0002-lua-Define-LUA_COMPAT_APIINTCASTS-for-Lua-5.3.0-comp.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 00135e21bec84a2fe5920d02fa0982ceb9f89a35 Mon Sep 17 00:00:00 2001
-From: Vinson Lee <vlee@freedesktop.org>
-Date: Thu, 5 Feb 2015 14:48:53 -0800
-Subject: [PATCH] lua: Define LUA_COMPAT_APIINTCASTS for Lua >= 5.3.0
- compatibility.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In Lua 5.3.0, luaL_checkint was deprecated.
-
-This patch fixes this build error with Lua 5.3.0.
-
-lua/demux.c: In function ‘vlclua_demux_peek’:
-lua/demux.c:55:5: error: implicit declaration of function ‘luaL_checkint’ [-Werror=implicit-function-declaration]
-     int n = luaL_checkint( L, 1 );
-     ^
-
-Signed-off-by: Vinson Lee <vlee@freedesktop.org>
-Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
-[Backport upstream commit 41caaa08cde60c4fec4bf2e5f9610e2a1b9e6a23]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/lua/vlc.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/lua/vlc.h b/modules/lua/vlc.h
-index 71f381d334..b46b5f67a1 100644
---- a/modules/lua/vlc.h
-+++ b/modules/lua/vlc.h
-@@ -38,6 +38,7 @@
- #include <vlc_stream.h>
- #include <vlc_demux.h>
- 
-+#define LUA_COMPAT_APIINTCASTS
- #define LUA_COMPAT_MODULE
- #include <lua.h>        /* Low level lua C API */
- #include <lauxlib.h>    /* Higher level C API */
--- 
-2.14.4
-
diff --git a/package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch b/package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
similarity index 100%
rename from package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch
rename to package/vlc/0003-build-use-pkg-config-to-get-tremor-libs.patch
diff --git a/package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch b/package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
similarity index 100%
rename from package/vlc/0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
rename to package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch
diff --git a/package/vlc/0006-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
similarity index 100%
rename from package/vlc/0006-Don-t-assume-strerror_l-is-available.patch
rename to package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
diff --git a/package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch b/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
similarity index 100%
rename from package/vlc/0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch
rename to package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
diff --git a/package/vlc/0008-Add-support-for-freerdp2.patch b/package/vlc/0007-Add-support-for-freerdp2.patch
similarity index 100%
rename from package/vlc/0008-Add-support-for-freerdp2.patch
rename to package/vlc/0007-Add-support-for-freerdp2.patch
diff --git a/package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
similarity index 100%
rename from package/vlc/0009-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
rename to package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
diff --git a/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
similarity index 100%
rename from package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
rename to package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index f404cbf335..396c3a2ab1 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha256
-sha256  eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879  vlc-3.0.12.tar.xz
-# From https://get.videolan.org/vlc/3.0.12/vlc-3.0.12.tar.xz.sha1
-sha1  39ef414a07202ec6569acda4c5d91e8576d453bf  vlc-3.0.12.tar.xz
+# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha256
+sha256  49b93e5b33deaa37060e6b24a98200cad70c407947f14eb2a8b6a0c64d8535a6  vlc-3.0.14.tar.xz
+# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha1
+sha1  8a8613f16a9053668d7a7dcfa1e6d8be93af3e89  vlc-3.0.14.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 020c37aa5d..c1e190099e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.12
+VLC_VERSION = 3.0.14
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+

--===============4209347111043566252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4209347111043566252==--
