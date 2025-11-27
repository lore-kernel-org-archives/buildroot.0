Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BEAD11183
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 13:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB4060B98;
	Thu, 27 Nov 2025 13:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRemNpXqgqjP; Thu, 27 Nov 2025 13:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D9B60B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D9B60B99;
	Thu, 27 Nov 2025 13:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E31FBDE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 13:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2FFE4024E
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 13:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smeHnD7PQgFx for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 13:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E39594019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39594019A
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E39594019A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 13:39:57 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id OcDyv77kgwf0DOcDyv9Id0; Thu, 27 Nov 2025 14:39:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Nov 2025 14:39:53 +0100
Message-ID: <20251127133953.1894470-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHNQAV0otsBzUdMNzqYE350vSCG1eWRkaS1nSA0Kp+MDFvef0qGyRR6cSwWGG4XFUjHggBdPJNh7nk4gQwWF0wwa8oNU+yPFzWyiohrpRZl4UlWDBuP6
 EJVMKs4KdjfMvoq9IWczlT+RZmqdrXOQRCjNxgpbZlYaAi/emC6f46x55ng+6L2hNKtyYO2a7mLpqxc6ZGG4MkaLWoG84irkW89QkROc2kKUDushQhyJx9em
 WWAk8dtsCGblAYXOyS2oRC01VVXf9gaxU3xOvsZGcwyIV3DFdyZs17zlOtTihIsg3Q115xBjFHgnOpRixaV9W4WwH3zbDdDVW0YI+d+pZgw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764250795; bh=gxOWcFGNQ98XRNGUbH6Yyghlm9teY4vNpuw/KPitVPI=;
 h=From:To:Subject:Date:MIME-Version;
 b=CzL7PlukrmJrLKEnXEzPD/xdiV3ySeGKmWgLTQNE39Kl5tUiDIGxF66o8wYA/LuyE
 vB29/kZ3SriQNzh6/oJSTBS2IQtcXpew7ChAMU6l9xcoDRu1RWSFXuwGJShZoswdmF
 7QhDjNRalslkIIPyXYz6Rp5FuI/WmK/Q0sBIJmZ62IT67LXPxTVktS4EvNyzMQgoiq
 MTtavDIMfNjDN7xHu4o3dwh3jgv7N8avxt8+xob8ViOjWjfRI2+wE42H91Q9D3qvN1
 clpoy3bqP4VzBU929WH3X7K3s6yVaqQ/ghz/9CegKE4ydtlSEznhx+q/9ISfDb89HR
 Okeb9Wx8hqreQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CzL7Pluk
Subject: [Buildroot] [PATCH] package/liburing: bump to version 2.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to github since git.kernel.dk is not always reachable and actual
tarball sha256 has changed. Also note that local patch is required because
it's been reverted wit this commit [1].

Release Notes:
https://github.com/axboe/liburing/releases/tag/liburing-2.12

[1]:
https://github.com/axboe/liburing/commit/6f8b3481cf511ade803fe7a2ea8fe3b99fce3658

Fixes:
https://autobuild.buildroot.net/results/ddf/ddfd0bb8f5623a1ce7aa4168c5759b2c54a933da/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/liburing/Config.in     | 2 +-
 package/liburing/liburing.hash | 4 ++--
 package/liburing/liburing.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/liburing/Config.in b/package/liburing/Config.in
index fc13f1c17c..29df944ce1 100644
--- a/package/liburing/Config.in
+++ b/package/liburing/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBURING
 	  simplified interface for applications that don't need (or
 	  want) to deal with the full kernel side implementation.
 
-	  https://git.kernel.dk/cgit/liburing
+	  https://github.com/axboe/liburing
 
 comment "liburing needs a toolchain w/ gcc >= 4.9, headers >= 5.1"
 	depends on BR2_USE_MMU
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index f06dd187a7..d37b69497f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  78bcc0dc0d004a238d8b5f597adbb4ec74926352a3983b872db7f0efdb72565d  liburing-2.6.tar.bz2
+sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  b0731ca09e6f4718d456a989d32b6c61bf27e5d4bab6ca31e409d75c5120d19e  README
+sha256  d98e81bb7a8fcfb5506f02c3190b5bc2e286970591072edc4575c26624d827dd  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index fc3993b38c..24ceb281b5 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.6
-LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
-LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
+LIBURING_VERSION = liburing-2.12
+LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
+LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
