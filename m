Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7480FC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6151C8177A;
	Fri, 28 Feb 2025 22:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lsoYIK0wnwy; Fri, 28 Feb 2025 22:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D41D808BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D41D808BF;
	Fri, 28 Feb 2025 22:08:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A1D068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD8C708CC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHG6krDfn7kg for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDA3276C3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA3276C3F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:57:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4FF187C34; Fri, 28 Feb 2025 21:57:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 22:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 35b50e9b03377e9400d750bd0489bc980c495eba
X-Git-Newrev: dcae760d1147e865b7a7073aa7e1190c3e43f4da
X-Patchwork-Hint: ignore
Message-Id: <20250228215711.D4FF187C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcec: bump version
 to 7.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dcae760d1147e865b7a7073aa7e1190c3e43f4da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/Pulse-Eight/libcec/releases/tag/libcec-7.0.0

Removed patch which is included in this release.

License file was renamed upstream:
https://github.com/Pulse-Eight/libcec/commit/da640961528178e82a447038446db4afe31a899e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update .checkpackageignore to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../libcec/0001-cecloader-h-fix-null-return.patch  | 37 ----------------------
 package/libcec/libcec.hash                         |  4 +--
 package/libcec/libcec.mk                           |  4 +--
 4 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e97d2ebdf9..08285eadcc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -620,7 +620,6 @@ package/libavl/0001-fix-makefile.patch lib_patch.Upstream
 package/libb64/0001-Integer-overflows.patch lib_patch.Upstream
 package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
-package/libcec/0001-cecloader-h-fix-null-return.patch lib_patch.Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
diff --git a/package/libcec/0001-cecloader-h-fix-null-return.patch b/package/libcec/0001-cecloader-h-fix-null-return.patch
deleted file mode 100644
index 424e41c0ae..0000000000
--- a/package/libcec/0001-cecloader-h-fix-null-return.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 452b2049b2ee3e73968c603e5524b2d349ac0c3e Mon Sep 17 00:00:00 2001
-From: psykose <alice@ayaya.dev>
-Date: Sat, 9 Apr 2022 17:59:11 +0000
-Subject: [PATCH] cecloader.h: fix null return
-
-returning NULL is invalid for a return type of bool when NULL is defined
-as `nullptr` instead of 0L
-
-[Retrieved from:
-https://github.com/Pulse-Eight/libcec/pull/599/commits/452b2049b2ee3e73968c603e5524b2d349ac0c3e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/cecloader.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/cecloader.h b/include/cecloader.h
-index be76468f..550f598e 100644
---- a/include/cecloader.h
-+++ b/include/cecloader.h
-@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
-     if (!g_libCEC)
-     {
-       std::cout << dlerror() << std::endl;
--      return NULL;
-+      return false;
-     }
-   }
- 
-@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
-   if (!LibCecBootloader)
-   {
-     std::cout << "cannot find CECStartBootloader" << std::endl;
--    return NULL;
-+    return false;
-   }
- 
-   bool bReturn = LibCecBootloader();
diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 3e5a443057..b019f53a5f 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  090696d7a4fb772d7acebbb06f91ab92e025531c7c91824046b9e4e71ecb3377  libcec-6.0.2.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
+sha256  7f9e57ae9fad37649adb6749b8f1310a71ccf3e92ae8b2d1cc9e8ae2d1da83f8  libcec-7.0.0.tar.gz
+sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 33e0463eb8..a45f074c30 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 6.0.2
+LIBCEC_VERSION = 7.0.0
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
-LIBCEC_LICENSE_FILES = COPYING
+LIBCEC_LICENSE_FILES = LICENSE.md
 
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
