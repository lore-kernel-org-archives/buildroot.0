Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BABCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6332660DD9;
	Fri,  5 Jun 2026 12:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZfOnY6MxbmK; Fri,  5 Jun 2026 12:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 702A960E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663224;
	bh=yJBpM8DgWnbZC6BBGnok6Jt3QFrrKyJiLFDjuKgFzTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i3j0jp94gsLPNdZiwXl+Qy8SzN91Dnj5W1Yuo7+vsDlshw7eFTbPSpFQe3AYWx3/l
	 3hqsYJDsW/tmb402kqkdX3GLX1p7vcXvQUzOIvg5UYkBcFfcZQ/sBDh9xdFaUDPiWb
	 O8Gz5KBwsSCJnIVcndRrLyb8PBEjSOnoMrI9q7YAxf7XjnGueAy44ORNwVgMeiox0x
	 w1cU82QMRj5m++jg82+QNeffJYUOUOZy14c6B63THHjjgsJhJac+p+FUgTR/yW02Fl
	 vd7mFpg9RaA/BICQ9/nHTQVLJqIkT+GaffHCCWPSCmUYE0NC4HSrnDVzubbCqpjbd3
	 EXIrvZP2DoMjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 702A960E67;
	Fri,  5 Jun 2026 12:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D321388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 801EE81FE2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfIU2WbmIPAR for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DE381FC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0DE381FC2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA5F087B22; Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:23:23 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 66066ece804f4590fc5050a653f859b366f4806c
X-Git-Newrev: 0c465e005f54dda1075703a97e7ad21a98ecfb6b
X-Patchwork-Hint: ignore
Message-Id: <20260605123833.EA5F087B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libheif: security
 bump version to 1.22.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c465e005f54dda1075703a97e7ad21a98ecfb6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 08f3757b0f2133b0ed50e1ef3d7a5a1d9c80de1c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
