Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACFD540C14;
	Mon, 30 May 2022 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0_ZbIA_DrMR; Mon, 30 May 2022 21:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A337F403E5;
	Mon, 30 May 2022 21:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0B081BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD39741A62
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEBz9C1B_-Yw for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:56:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D2E41A21
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HFjg0nCo0Wgq+3C/PQ8W9PXydtHZU1I6nS3xvvLp0Hs=; b=o6QoJTwNdjURwe9UfUBsGbvApE
 lsiUAx+VFt9u5DW+KAD/9VqslyH/08kFovhfudnOq3fc48+M2QdbXRBeiWxzdxaYKohYOf/NuugP6
 1+01tIvOvD6nWXISBS8JNxIV9vmWPtg28js0+L2RbB8KD86VHTiQ5gfuOnaCiBj1XwE79OODehmyZ
 NNVmuNRYy7uITFhchk116iA9zpXxxciegEk2Jp+YteEgYrW5SL/rPGk9S5UfIbortQCyn0EyjqYon
 Em0zS67AKX1mp9Q79fRGSbZtNvk9dz9+0T5VojIJz9Vo08+AaRkuUDMjG703lYq7KqRAC62R9o3Zm
 ZU0ws+qg==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nvnNO-005yd2-BE; Mon, 30 May 2022 23:56:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 07d24e54;
 Mon, 30 May 2022 21:56:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 00:56:27 +0300
Message-Id: <20220530215627.1441783-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.36.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...en-cross-building-for-64-bit-ARM-htt.patch | 32 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  8 ++---
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 package/wpewebkit/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch

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
index 9c9a9a2838..abd09829a5 100644
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
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
