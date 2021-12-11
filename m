Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7689C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D03A40017;
	Sat, 11 Dec 2021 18:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKgZquvjChD2; Sat, 11 Dec 2021 18:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4087F403B4;
	Sat, 11 Dec 2021 18:17:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22D7F1BF426
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B0E6403B4
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzXPdKxKYVDY for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:16:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2BD240017
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 18:16:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so20165599wrd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxzADhk0VtPfSfv9NzwOSRYzwYjXQeBB4yCK+gl4fV0=;
 b=LO1ug5C0Omg71Cw7TTOTQ/DIGPuBeP8FBqCWTl0wLEXxyeyUKQzZDRff6CpYHHGS8E
 qAH+vp/mH1lh6tCe3kvPlGjjCY18rbrlZMAkpTbPd8rnNJe5ivC8pl79BG25RL4gH9jX
 8BnrVywhqcQpFNxwvUHGi+zXgQhrJE7l1YMTGalc3zSRCRIGPH03cFWYGiX6gmu2V+hl
 VJ/dLgtsaCQINGsv3vbETPNxW5vU4CgjiuEzaMtNvMBIhXUZ1MZ286E0cloCvpYth5Fh
 GglVDodM1G2v3fFIRjCGV5PlLQgBhgOLrAS9oQWDAGyTbdbxdKcCFLHW2hnvOzZMo4Bn
 /siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxzADhk0VtPfSfv9NzwOSRYzwYjXQeBB4yCK+gl4fV0=;
 b=UyasY9VfPDkg3BdmH5mbo728Hwj2xRU8+TUR9Hg1M8BMHCQ0SIS17+CIQQ2ARLcycb
 H2UMu9XKYSBC52r1eZLokz45BFUMCJ/8loNsdkUdL6cI3fXdvySyH6d4EmVIEw/av1y0
 CoF9HKouWoau+t6t8BPG/MOgwzkqbiMazyi+UMyfFJosiR2vUotqac/+HuVG5U/TZ9Fc
 oEZpdaDRa8908++Xdx3BOwY85G2FH1wCuJjDGncC3bgBlJ9y6ZP+fzEfb4H9l00sETEm
 rJ+KJS8nF4XSXpLRKDOymvl/z8VTJE3+Xv135N55YbB3B4iRLpWGZXJZ5gPUlMvbEE9z
 FjiQ==
X-Gm-Message-State: AOAM531/nJ15mF1ZIPp4fTlh38HLNG34Meen3uCRv98lHeqg7qY+fhqx
 QANX/aCKNCSXMS7uUF+PDOYwujrlvHNRsg==
X-Google-Smtp-Source: ABdhPJwBimTspgQ0H7HxXvuGl0VWVufba7Y4HPSQ6UlGtEg1+PVdpF8pR2INTo1B3LiJr9n26l0nsw==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr21530815wry.110.1639246615649; 
 Sat, 11 Dec 2021 10:16:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id e18sm5609053wrs.48.2021.12.11.10.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 10:16:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 19:16:45 +0100
Message-Id: <20211211181645.58049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libexif: bump to version 0.6.24
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/libexif/libexif/releases/tag/v0.6.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xif-gps-ifd.c-fix-build-with-gcc-4.8.patch | 40 -------------------
 package/libexif/libexif.hash                  |  2 +-
 package/libexif/libexif.mk                    |  4 +-
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch

diff --git a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 7bbf3b3e4d..0000000000
--- a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0c925491dea995ca96770159158bb8d57a48d84b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Sep 2021 07:56:32 +0200
-Subject: [PATCH] libexif/exif-gps-ifd.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 raised since version 0.6.23 and
-https://github.com/libexif/libexif/commit/e12c3529813cd16d50bf0a1c759093e1039dffec:
-
-exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
-exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-   ^
-exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code
-
-Fixes:
- - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libexif/libexif/pull/72]
----
- libexif/exif-gps-ifd.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libexif/exif-gps-ifd.c b/libexif/exif-gps-ifd.c
-index 9c9ba70..de5f950 100644
---- a/libexif/exif-gps-ifd.c
-+++ b/libexif/exif-gps-ifd.c
-@@ -59,7 +59,8 @@ const static struct ExifGPSIfdTagInfo exif_gps_ifd_tags[] = {
- };
- 
- const ExifGPSIfdTagInfo *exif_get_gps_tag_info(ExifTag tag) {
--  for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-+  int i;
-+  for (i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
-     if (tag==exif_gps_ifd_tags[i].tag)
-       return &exif_gps_ifd_tags[i];
-   }
--- 
-2.33.0
-
diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index e087daf58a..0d082aedb0 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431  libexif-0.6.23.tar.xz
+sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 49637f1519..921029b4ac 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.23
-LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
+LIBEXIF_VERSION = 0.6.24
+LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
