Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6467BC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F2D410C8;
	Tue,  7 Jun 2022 12:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnrwBOpjOqq5; Tue,  7 Jun 2022 12:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BAB540B09;
	Tue,  7 Jun 2022 12:25:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DFC51BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E66C760F3C
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuDvtTAmy2we for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6513C600B8
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F016F8674C; Tue,  7 Jun 2022 12:11:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 11:45:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 05cdfaa6d98bc6c31b4a50bf0c04ac125cdde92d
X-Git-Newrev: a45f9080d8d5ace6a576749446865399c91880a2
X-Patchwork-Hint: ignore
Message-Id: <20220607121132.F016F8674C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpewebkit:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a45f9080d8d5ace6a576749446865399c91880a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, mostly with build fixes, media playback improvements,
an important fix for when using threaded rendering, and security patches
for CVE-2022-26700, CVE-2022-26709, CVE-2022-26717, CVE-2022-26716, and
CVE-2022-26719.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.2.html
  https://wpewebkit.org/release/wpewebkit-2.36.3.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0005.html

This also imports a build fix which has not made it into the release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bab6100b515b3851c88cf2af87d82830e1a9fca4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re-when-cross-building-for-64-bit-ARM-htt.patch | 32 ++++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash                   |  8 +++---
 package/wpewebkit/wpewebkit.mk                     |  2 +-
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch b/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
new file mode 100644
index 0000000000..7c9c8666ad
--- /dev/null
+++ b/package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch
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
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 3923c32111..253b4756d0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums
-md5  7ba1c7fd0f67891ad137d11cac12f7a9  wpewebkit-2.36.1.tar.xz
-sha1  0918a4daded01f42e65ec02a69f21cd6705311db  wpewebkit-2.36.1.tar.xz
-sha256  ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5723  wpewebkit-2.36.1.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.3.tar.xz.sums
+md5  8bc53f86a3489da31fdbb581e1b87f7a  wpewebkit-2.36.3.tar.xz
+sha1  44a3d99ae48481917ddc478c5f91e6a4faa21ff5  wpewebkit-2.36.3.tar.xz
+sha256  66275debca7497daff3a7826734cd56262a807adb76c5dccdf257c89968c2fc8  wpewebkit-2.36.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index aac9173566..c3d3b3ed89 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.1
+WPEWEBKIT_VERSION = 2.36.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
