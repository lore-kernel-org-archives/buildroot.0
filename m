Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E7EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D534177A;
	Tue, 18 Jul 2023 18:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D534177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5Lk_7vd0rdu; Tue, 18 Jul 2023 18:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB3B4179A;
	Tue, 18 Jul 2023 18:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB3B4179A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8D5E1BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE6741795
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE6741795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IM_irrZMlleS for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:32:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED2D4177D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ED2D4177D
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:32:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7EA2A4C0FEA;
 Tue, 18 Jul 2023 20:32:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42438)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpV0-0004TJ-2O;
 Tue, 18 Jul 2023 20:32:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:32:38 +0200
Message-Id: <20230718183238.688311-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718183238.688311-1-bernd@kuhls.net>
References: <20230718183238.688311-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689705159;
 bh=SEO3iqnhosx/zSBSh2O+yA3Ftb3yGZPT3ZeQJysUWsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tIWS8rQnvWO5AEYh+9KVlwGiUB8Ogy2EZnnkTRnNlf8GoTH3O7OAarTnN2fCqLXHu
 i5UMSR/DY1t+Kwdi7NwSTWA1unJqBebQkkPJI9NH/barGdLSIwb02phd0Ga36um1l6
 GV6ve7ub/ND3FlzE4MEGiY3vVkX+r7NrFWISGrNfSG9KCdTMbRkk1fHghIX4HVyZMT
 TzKN4SUf4q1evgss2BOfrKL8MnjaJtHgr/LIYcv1werWQ+g2+TZmE+Lv0Ozm6ZQaWe
 PsJrKKCVM3Tx4AoODpmPLBig9o7/j/G8l1hJIxpFdW7t2qenBfFvJVHRKe1T78SRXh
 CB/UWIDSlK/LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tIWS8rQn
Subject: [Buildroot] [PATCH v2 4/4] package/wpewebkit: security bump version
 to 2.40.3
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
---
v2: added host-unifdef dependency

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
