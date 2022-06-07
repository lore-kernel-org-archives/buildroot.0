Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2707C410C2;
	Tue,  7 Jun 2022 12:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRQwuyboZVyA; Tue,  7 Jun 2022 12:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 215CB410C6;
	Tue,  7 Jun 2022 12:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE1611BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875B84155E
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7pMWljF7IAY for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D272410A7
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB72A84D86; Tue,  7 Jun 2022 12:11:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 11:44:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e3b00c58d1e41f15459d33c732563761d7b5cdfd
X-Git-Newrev: c481f5f326c018959be5f42f7033be48ff78c56b
X-Patchwork-Hint: ignore
Message-Id: <20220607121132.CB72A84D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/webkitgtk:
 security bump to version 2.36.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c481f5f326c018959be5f42f7033be48ff78c56b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, mostly with build fixes, media playback improvements,
an important fix for when using threaded rendering, and security patches
for CVE-2022-26700, CVE-2022-26709, CVE-2022-26717, CVE-2022-26716, and
CVE-2022-26719.

Release notes:

  https://webkitgtk.org/2022/05/28/webkitgtk2.36.3-released.html
  https://webkitgtk.org/2022/05/18/webkitgtk2.36.2-released.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0005.html

This also imports a build fix which has not made it into the release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 93f831bf5d90b689474671cc9bb790d2305fc07a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re-when-cross-building-for-64-bit-ARM-htt.patch | 32 ++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash                   |  8 +++---
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch b/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
new file mode 100644
index 0000000000..7c9c8666ad
--- /dev/null
+++ b/package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
@@ -0,0 +1,32 @@
+From b0c63502f004db68b485354967bb1c56c071f4eb Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 31 May 2022 00:48:21 +0300
+Subject: [PATCH] Build failure when cross-building for 64-bit ARM
+ https://bugs.webkit.org/show_bug.cgi?id=241109
+
+Unreviewed build fix.
+
+* Source/WebCore/bindings/js/JSDOMMapLike.cpp: Add missing
+  JavaScriptCore/HashMapImplInlines.h header inclusion.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream status: https://github.com/WebKit/WebKit/pull/1165
+---
+ Source/WebCore/bindings/js/JSDOMMapLike.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WebCore/bindings/js/JSDOMMapLike.cpp b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
+index e132c39fa54..2cb4b1b59a3 100644
+--- a/Source/WebCore/bindings/js/JSDOMMapLike.cpp
++++ b/Source/WebCore/bindings/js/JSDOMMapLike.cpp
+@@ -28,6 +28,7 @@
+ 
+ #include "WebCoreJSClientData.h"
+ #include <JavaScriptCore/CatchScope.h>
++#include <JavaScriptCore/HashMapImplInlines.h>
+ #include <JavaScriptCore/JSMap.h>
+ #include <JavaScriptCore/VMTrapsInlines.h>
+ 
+-- 
+2.36.1
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 00a342ed7f..1176bbc7a1 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.1.tar.xz.sums
-md5  e6100df7f82d95a4e65176b10f5ab011  webkitgtk-2.36.1.tar.xz
-sha1  36a95b906e54bcf94d2be04e1cbaac3584da7eb1  webkitgtk-2.36.1.tar.xz
-sha256  0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f  webkitgtk-2.36.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.3.tar.xz.sums
+md5  8ad4b1bfbbe3115ee163a8b2ba7b908f  webkitgtk-2.36.3.tar.xz
+sha1  59ee6ee820be360ad57391870fa158064091c525  webkitgtk-2.36.3.tar.xz
+sha256  732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1  webkitgtk-2.36.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9e85c5b78f..39b16a90e7 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.1
+WEBKITGTK_VERSION = 2.36.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
