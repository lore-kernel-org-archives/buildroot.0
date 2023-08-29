Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC9C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A0E41551;
	Tue, 29 Aug 2023 17:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A0E41551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9dKLkIMZJeq; Tue, 29 Aug 2023 17:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A67415BA;
	Tue, 29 Aug 2023 17:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A67415BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1431B1BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C52AA61142
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52AA61142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65VXzWVWLc8l for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0F46112A
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0F46112A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EDB38649A; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:42:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1d2861ea8d06bb46f729582779dc6a86d52f54d2
X-Git-Newrev: 6fc43d90b4c9327d838ccb1b32f8fb51a2ac83e4
X-Patchwork-Hint: ignore
Message-Id: <20230829170309.5EDB38649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/wpewebkit:
 security bump version to 2.40.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fc43d90b4c9327d838ccb1b32f8fb51a2ac83e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Removed md5 hash.
Switch _SITE to https and update URL.

Added dependency to host-unifdef, needed since upstream commit
https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552

Release notes:
2.40.3
- https://lists.webkit.org/pipermail/webkit-wpe/2023-June/000603.html
2.40.2
- https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000598.html
  Fixes CVE-2023-28204 & CVE-2023-32373:
  https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000599.html
2.40.1
- https://lists.webkit.org/pipermail/webkit-wpe/2023-April/000591.html
2.40.0
- https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000589.html
2.39.91
- https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000581.html
2.39.90
- https://lists.webkit.org/pipermail/webkit-wpe/2023-February/000577.html
2.39.5
- https://lists.webkit.org/pipermail/webkit-wpe/2023-January/000571.html
  USE_AVIF was enabled by default upstream:
  https://github.com/WebKit/WebKit/commit/3d60d9f93c64aac55c890160d00d008367e11e91
  Add -DUSE_AVIF=OFF to _CONF_OPTS due to missing libavif package

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1c978d782d92d4623156ba7d88d375de43f7ba5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 7 +++----
 package/wpewebkit/wpewebkit.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index d5f628e1ee..aaeea2bcda 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,6 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.6.tar.xz.sums
-md5  eb44d3132208218f3752170cae3220b8  wpewebkit-2.38.6.tar.xz
-sha1  5c541a10e216d8d9ca48572b3dc0f82bfb2236c5  wpewebkit-2.38.6.tar.xz
-sha256  dcb6591456393c5366ad9abc62a808137d4fea039cbc7ef4c8d64ead506d035b  wpewebkit-2.38.6.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.40.3.tar.xz.sums
+sha1  c840bd76b2c86cb8ca0d68b56598cb0abbafc727  wpewebkit-2.40.3.tar.xz
+sha256  05b6a9cb1d7d03485e0dc41b2a8e6f99a36aea23d32ba3ecb38d0d6860747ada  wpewebkit-2.40.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 7b8ac67d92..c13a7201e6 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.6
-WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
+WPEWEBKIT_VERSION = 2.40.3
+WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
 WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
@@ -14,7 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
+WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
@@ -26,6 +26,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
+	-DUSE_AVIF=OFF \
 	-DUSE_SOUP2=ON
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
