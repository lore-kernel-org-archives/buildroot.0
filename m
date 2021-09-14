Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13231C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D85610CE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0D85610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3407402EC;
	Tue, 14 Sep 2021 12:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwIorSCWYdv3; Tue, 14 Sep 2021 12:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63B8402FD;
	Tue, 14 Sep 2021 12:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 556A51BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BFC402EC
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yv_XWXYplMDt for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 12:35:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E3774013A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 12:35:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 652E28B2E6; Tue, 14 Sep 2021 12:33:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:12:09 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7aed9ce6c51c725278f2b63d45b845890a8a74da
X-Git-Newrev: 2b33ea382f5d610f5254340b7b05b6525ddafd1d
X-Patchwork-Hint: ignore
Message-Id: <20210914123327.652E28B2E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libexif: security
 bump to version 0.6.23
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b33ea382f5d610f5254340b7b05b6525ddafd1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- Drop patches (already in version)
- Fix some more denial of service (compute time or stack exhaustion)
  counter-measures added that avoid minutes of decoding time with
  malformed files found by OSS-Fuzz

https://github.com/libexif/libexif/releases/tag/v0.6.23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2f805097611b4828d2cba6168472aac6dedeafe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-fixed-another-unsigned-integer-overflow.patch | 63 ----------------------
 .../0002-fixed-a-incorrect-overflow-check.patch    | 36 -------------
 package/libexif/libexif.hash                       |  2 +-
 package/libexif/libexif.mk                         |  8 +--
 4 files changed, 3 insertions(+), 106 deletions(-)

diff --git a/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch b/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch
deleted file mode 100644
index 77bdfe89d2..0000000000
--- a/package/libexif/0001-fixed-another-unsigned-integer-overflow.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Mon, 8 Jun 2020 17:27:06 +0200
-Subject: [PATCH] fixed another unsigned integer overflow
-
-first fixed by google in android fork,
-https://android.googlesource.com/platform/external/libexif/+/1e187b62682ffab5003c702657d6d725b4278f16%5E%21/#F0
-
-(use a more generic overflow check method, also check second overflow instance.)
-
-https://security-tracker.debian.org/tracker/CVE-2020-0198
-
-Downloaded from upstream commit:
-https://github.com/libexif/libexif/commit/ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libexif/exif-data.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c
-index 8b280d3..b495726 100644
---- a/libexif/exif-data.c
-+++ b/libexif/exif-data.c
-@@ -47,6 +47,8 @@
- #undef JPEG_MARKER_APP1
- #define JPEG_MARKER_APP1 0xe1
- 
-+#define CHECKOVERFLOW(offset,datasize,structsize) (( offset >= datasize) || (structsize > datasize) || (offset > datasize - structsize ))
-+
- static const unsigned char ExifHeader[] = {0x45, 0x78, 0x69, 0x66, 0x00, 0x00};
- 
- struct _ExifDataPrivate
-@@ -327,7 +329,7 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
- 		return;
- 	}
--	if (s > ds - o) {
-+	if (CHECKOVERFLOW(o,ds,s)) {
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
- 		return;
- 	}
-@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 	}
- 
- 	/* Read the number of entries */
--	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
-+	if (CHECKOVERFLOW(offset, ds, 2)) {
- 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
--			  "Tag data past end of buffer (%u > %u)", offset+2, ds);
-+			  "Tag data past end of buffer (%u+2 > %u)", offset, ds);
- 		return;
- 	}
- 	n = exif_get_short (d + offset, data->priv->order);
-@@ -431,7 +433,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 	offset += 2;
- 
- 	/* Check if we have enough data. */
--	if (offset + 12 * n > ds) {
-+	if (CHECKOVERFLOW(offset, ds, 12*n)) {
- 		n = (ds - offset) / 12;
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
- 				  "Short data; only loading %hu entries...", n);
diff --git a/package/libexif/0002-fixed-a-incorrect-overflow-check.patch b/package/libexif/0002-fixed-a-incorrect-overflow-check.patch
deleted file mode 100644
index 1946f78228..0000000000
--- a/package/libexif/0002-fixed-a-incorrect-overflow-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9266d14b5ca4e29b970fa03272318e5f99386e06 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Thu, 5 Nov 2020 09:50:08 +0100
-Subject: [PATCH] fixed a incorrect overflow check that could be optimized
- away.
-
-inspired by:
-https://android.googlesource.com/platform/external/libexif/+/8e7345f3bc0bad06ac369d6cbc1124c8ceaf7d4b
-
-https://source.android.com/security/bulletin/2020-11-01
-
-CVE-2020-0452
-
-Downloaded from upstream commit, rebased for 0.6.22:
-https://github.com/libexif/libexif/commit/9266d14b5ca4e29b970fa03272318e5f99386e06
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libexif/exif-entry.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libexif/exif-entry.c b/libexif/exif-entry.c
-index 3fc0ff9..4b866ce 100644
---- a/libexif/exif-entry.c
-+++ b/libexif/exif-entry.c
-@@ -1371,8 +1371,8 @@ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
- 	{
- 		unsigned char *utf16;
- 
--		/* Sanity check the size to prevent overflow */
--		if (e->size+sizeof(uint16_t)+1 < e->size) break;
-+		/* Sanity check the size to prevent overflow. Note EXIF files are 64kb at most. */
-+		if (e->size >= 65536 - sizeof(uint16_t)*2) break;
- 
- 		/* The tag may not be U+0000-terminated , so make a local
- 		   U+0000-terminated copy before converting it */
diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index 1a2157b3f5..e087daf58a 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56  libexif-0.6.22.tar.xz
+sha256  a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431  libexif-0.6.23.tar.xz
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 9a25e90d26..49637f1519 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,18 +4,14 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.22
+LIBEXIF_VERSION = 0.6.23
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
 LIBEXIF_SITE = \
-	https://github.com/libexif/libexif/releases/download/libexif-$(subst .,_,$(LIBEXIF_VERSION))-release
+	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPL-2.1+
 LIBEXIF_LICENSE_FILES = COPYING
 LIBEXIF_CPE_ID_VENDOR = libexif_project
-# 0001-fixed-another-unsigned-integer-overflow.patch
-LIBEXIF_IGNORE_CVES += CVE-2020-0198
-# 0002-fixed-a-incorrect-overflow-check.patch
-LIBEXIF_IGNORE_CVES += CVE-2020-0452
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
