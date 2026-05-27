Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8322CD5BDE
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 06:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9219C61346;
	Wed, 27 May 2026 06:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUO3pb4pFUnm; Wed, 27 May 2026 06:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782A161335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779864304;
	bh=B87epTNIoztDvkpp04N+LBwdF+gT1eaP6Lnzpbt4amo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mokogvkBhjafQd3roglFUM7DJ+uBdR93VEDOGGESfXw2L1XOiA3pnJuI4k9+50qFA
	 E4JCk7aC9rW0s4GoDvZ6CPjgNNiGFlfn5iSMPb9fYSgIXjp62UvdJ3iaVvXE1OXQ0+
	 5XDDdbeSu7Fi4pUVfUyqOPDCtqJWLRDHYvRm/6y48rbZ4vYRQ8/yr0AV/U30ebb/Yd
	 T9bWp9kiPp7G4TKz4dsl89JMcBWsgS1BM1B0IDwPHzQSdrf5/v2fQ4Xb4Dpf2Qlj7O
	 0a1/YstAgKvtgsj27CnSRHQq9gUAaVOfoikQCGmTCLexa6kRkedVNk+5rbCg3SR9pX
	 OfBcJqieCnmcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782A161335;
	Wed, 27 May 2026 06:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9506623F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CBC61335
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFMQrdCkEIrw for <buildroot@buildroot.org>;
 Wed, 27 May 2026 06:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B31F261333
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B31F261333
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:45:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45A4D86FEA; Wed, 27 May 2026 06:44:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 08:38:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46a4dcd0e1bfcb1be3c8ee5580476c3aa5dbd2e6
X-Git-Newrev: 08f3757b0f2133b0ed50e1ef3d7a5a1d9c80de1c
X-Patchwork-Hint: ignore
Message-Id: <20260527064449.45A4D86FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.22.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08f3757b0f2133b0ed50e1ef3d7a5a1d9c80de1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.22.2
"Fixes missing heif_image_get_bayer_pattern_size() function."

https://github.com/strukturag/libheif/releases/tag/v1.22.1
"Security
- CVE TBD (GHSA-r7qj-cg5r-r6vf) - Wrapped icef compressed-unit range
 check causes out-of-bounds read in uncompressed HEIF decoder
 - (GHSA-5hqq-636x-r3cr) - Out-of-bounds write in inline mask region API
                           when source mask exceeds declared region"

Removed patch which is included in version 1.22.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-heif_properties.h-fix-bad_pixels-type.patch | 28 ----------------------
 package/libheif/libheif.hash                       |  4 ++--
 package/libheif/libheif.mk                         |  2 +-
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch b/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
deleted file mode 100644
index 69c5d170fe..0000000000
--- a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ef124f9988e57a06ad6d102c236d2bb4b82aef5d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C8=98tefan=20Talpalaru?= <stefantalpalaru@yahoo.com>
-Date: Wed, 20 May 2026 00:37:24 +0200
-Subject: [PATCH] heif_properties.h: fix "bad_pixels" type
-
-Upstream: https://github.com/strukturag/libheif/commit/ef124f9988e57a06ad6d102c236d2bb4b82aef5d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libheif/api/libheif/heif_properties.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libheif/api/libheif/heif_properties.h b/libheif/api/libheif/heif_properties.h
-index 9432bd46..0dec3a37 100644
---- a/libheif/api/libheif/heif_properties.h
-+++ b/libheif/api/libheif/heif_properties.h
-@@ -335,7 +335,7 @@ heif_error heif_image_add_sensor_bad_pixels_map(heif_image*,
-                                                  uint32_t num_bad_columns,
-                                                  const uint32_t* bad_columns,
-                                                  uint32_t num_bad_pixels,
--                                                 const heif_bad_pixel* bad_pixels);
-+                                                 const struct heif_bad_pixel* bad_pixels);
- 
- // Returns the number of sensor bad pixels maps on this image (0 if none).
- LIBHEIF_API
--- 
-2.47.3
-
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index b88784b309..22697f307c 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.22.0
-sha256  8bd20cfa3201997b8f63266cddfabea2e1481467d7f992e6a2595e0bec691fc2  libheif-1.22.0.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
+sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index e47620b167..4b23f1fda3 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.22.0
+LIBHEIF_VERSION = 1.22.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
