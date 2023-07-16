Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4196EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73BB740602;
	Sun, 16 Jul 2023 09:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73BB740602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mN6BPrLwS-Ff; Sun, 16 Jul 2023 09:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 972AD40354;
	Sun, 16 Jul 2023 09:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 972AD40354
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC211BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF78F405EC
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF78F405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhmARl19UyI2 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:42:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93F0C40461
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93F0C40461
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:42:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66CF1A4C0D0A;
 Sun, 16 Jul 2023 11:41:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52154)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKyGG-0001tw-0s;
 Sun, 16 Jul 2023 11:41:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 11:41:52 +0200
Message-Id: <20230716094152.3773711-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230716094152.3773711-1-bernd@kuhls.net>
References: <20230716094152.3773711-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689500513;
 bh=GHYC+aKfbv9XGeBuV7HC80+EVsnAmsdlcxzhvtj8O1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMee6pGyGGdHQo2SxJkuEtavG8S7IHnzegOfz90hrVB3FnxZmqwtCI3mYkizw0gwg
 /smjgVKCda84ey1C2GmaN9Jrc8AbtO5hRJD1yVH52o0i3WKl2IIMacr8JuGq9IGNNc
 tzKj6SuRPgr2bFKufUeS5PLaCkltLSeg1px+yENEt44YQSf130JcLLsW31bR+24xjJ
 HSqB1sj2YPVVUzJMFgDrs8fQwAzG+hkQdinm7TZpsCgrfDQTeS6GcO6aOB0t4/dgNJ
 AH61172iKldwSTF/yNEHBWDTJYTrI6twdY4PaDmzSKgPfkxHRGzSjaNEjsDr0Ld4n6
 9FG6wqs5kgrhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IMee6pGy
Subject: [Buildroot] [PATCH 3/3] package/wpewebkit: security bump version to
 2.40.3
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
 package/wpewebkit/wpewebkit.hash | 7 +++----
 package/wpewebkit/wpewebkit.mk   | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

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
index 7b8ac67d92..fef06a19b9 100644
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
