Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6BEE8784C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB9440BF0;
	Tue,  3 Feb 2026 17:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL5L8Jfcv2nd; Tue,  3 Feb 2026 17:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079A540B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139733;
	bh=9t5zeJGy/otQxvLW2Ntdev+cYW+y8UGwMP31yZuG/QY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ka2Hym2UoSMYXyXmu9g3/Qpw2UfdWESvFQFrOphTecwxQ6gj1iLYfniThBEq9GtOW
	 wh7uF22JkqKFoze9Amer9w84RmwqVMthqVwnEfwc4LNzZDX2gHTnoODTXS+IxpHpo1
	 CApPTB2M8vUXf5n+pfJ0CoGIgAxRmjmQ3UvaGMatI8AI9+f+/ifrEhg0lLRt/T+YXN
	 yJmiCF2BKzGiJjJBVFL2g8bVl9WlBSOn3JBEHwiICf09h2j/Ij8gf6AFMvvmCaC3Y7
	 03ya7yFJynfgvw5QOCnEcbwP9hUv9Ax5QEG++JRuk7uBHTjQGv9mzIw4CG1dKU9urz
	 OOy7a3XYpWPSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079A540B91;
	Tue,  3 Feb 2026 17:28:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFBC4F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A004583D5E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMg0kbiFNQN8 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A20EC83D5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A20EC83D5A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C95286700; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 18:23:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db1a28435d22b8dad391be6ee8c1af282bc72fde
X-Git-Newrev: 03a1732dea67e088ec85f92853ca14f5a3c0f7b7
X-Patchwork-Hint: ignore
Message-Id: <20260203172844.8C95286700@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: bump version to 4.2.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03a1732dea67e088ec85f92853ca14f5a3c0f7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which are included in this release.

License file was renamed upstream:
https://github.com/jasper-software/jasper/commit/688601c736165d424b95413ea40d5571a5ccfe02

Added configure option to force builddir:
https://github.com/jasper-software/jasper/blob/version-4.2.8/build/cmake/modules/InSourceBuild.cmake

Added configure option for JAS_STDC_VERSION:
https://github.com/jasper-software/jasper/commit/b8ecbfbf293ee6086e4d40108ad730229388cd8d

This new release also fixes compatibility with CMake 4.x, fixing build
issues encountered in the autobuilders.

Fixes:

  https://autobuild.buildroot.net/results/0b12e9428342e551e47e359598eecf18d81249b3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jasper/0001-Fixes-367.patch |  46 ----------
 package/jasper/0002-Fixes-400.patch | 169 ------------------------------------
 package/jasper/jasper.hash          |   4 +-
 package/jasper/jasper.mk            |  21 +++--
 4 files changed, 16 insertions(+), 224 deletions(-)

diff --git a/package/jasper/0001-Fixes-367.patch b/package/jasper/0001-Fixes-367.patch
deleted file mode 100644
index 11dfb5672f..0000000000
--- a/package/jasper/0001-Fixes-367.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From aeef5293c978158255ad4f127089644745602f2a Mon Sep 17 00:00:00 2001
-From: Michael Adams <mdadams@ece.uvic.ca>
-Date: Thu, 14 Dec 2023 19:04:19 -0800
-Subject: [PATCH] Fixes #367.
-
-Fixed an integer-overflow bug in the ICC profile parsing code.
-Added another invalid image to the test set.
-
-CVE: CVE-2023-51257
-Upstream: https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/libjasper/base/jas_icc.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
-index 905b823..2d1e91e 100644
---- a/src/libjasper/base/jas_icc.c
-+++ b/src/libjasper/base/jas_icc.c
-@@ -1295,10 +1295,22 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
- {
- 	jas_icctxt_t *txt = &attrval->data.txt;
- 	txt->string = 0;
--	if (!(txt->string = jas_malloc(cnt)))
-+	/* The string must at least contain a single null character. */
-+	if (cnt < 1) {
- 		goto error;
--	if (jas_stream_read(in, txt->string, cnt) != cnt)
-+	}
-+	if (!(txt->string = jas_malloc(cnt))) {
-+		goto error;
-+	}
-+	if (jas_stream_read(in, txt->string, cnt) != cnt) {
- 		goto error;
-+	}
-+	/* Ensure that the string is null terminated. */
-+	if (txt->string[cnt - 1] != '\0') {
-+		goto error;
-+	}
-+	/* The following line is redundant, unless we do not enforce that
-+	  the last character must be null. */
- 	txt->string[cnt - 1] = '\0';
- 	if (strlen(txt->string) + 1 != cnt)
- 		goto error;
--- 
-2.39.5
diff --git a/package/jasper/0002-Fixes-400.patch b/package/jasper/0002-Fixes-400.patch
deleted file mode 100644
index b663f1e72e..0000000000
--- a/package/jasper/0002-Fixes-400.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52 Mon Sep 17 00:00:00 2001
-From: Michael Adams <mdadams@ece.uvic.ca>
-Date: Tue, 29 Jul 2025 20:16:35 -0700
-Subject: [PATCH] Fixes #400.
-
-Added a check for a missing color component in the jas_image_chclrspc
-function.
-
-CVE: CVE-2025-8835
-Upstream: https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
-[thomas: backport to v2.0.33]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/libjasper/base/jas_image.c | 71 ++++++++++++++++++++++++++++------
- 1 file changed, 59 insertions(+), 12 deletions(-)
-
-diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
-index 68a94e1..cd99ba2 100644
---- a/src/libjasper/base/jas_image.c
-+++ b/src/libjasper/base/jas_image.c
-@@ -112,6 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
-   unsigned newprec);
- static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
-   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
-+static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
-+static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
- 
- /******************************************************************************\
- * Global data.
-@@ -409,6 +411,31 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
- 	jas_free(cmpt);
- }
- 
-+static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
-+{
-+	jas_cmcmptfmt_t* cmptfmts;
-+	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
-+		return 0;
-+	}
-+	for (int i = 0; i < n; ++i) {
-+		cmptfmts[i].buf = 0;
-+	}
-+	return cmptfmts;
-+}
-+
-+static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
-+{
-+	assert(cmptfmts);
-+	assert(n > 0);
-+	for (int i = 0; i < n; ++i) {
-+		if (cmptfmts[i].buf) {
-+			jas_free(cmptfmts[i].buf);
-+		}
-+		cmptfmts[i].buf = 0;
-+	}
-+	jas_free(cmptfmts);
-+}
-+
- /******************************************************************************\
- * Load and save operations.
- \******************************************************************************/
-@@ -1470,19 +1497,25 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
- 	jas_cmcmptfmt_t *incmptfmts;
- 	jas_cmcmptfmt_t *outcmptfmts;
- 
-+	assert(image);
-+	assert(outprof);
-+
- #if 0
- jas_eprintf("IMAGE\n");
- jas_image_dump(image, stderr);
- #endif
- 
--	if (image->numcmpts_ == 0)
-+	if (!jas_image_numcmpts(image)) {
- 		/* can't work with a file with no components;
- 		   continuing would crash because we'd attempt to
- 		   obtain information about the first component */
- 		return NULL;
-+	}
- 
- 	outimage = 0;
- 	xform = 0;
-+	incmptfmts = 0;
-+	outcmptfmts = 0;
- 	if (!(inimage = jas_image_copy(image)))
- 		goto error;
- 	image = 0;
-@@ -1565,15 +1598,21 @@ jas_image_dump(image, stderr);
- 	}
- 
- 	inpixmap.numcmpts = numinclrchans;
--	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
-+	assert(numinclrchans != 0);
-+	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
- 		abort();
- 	}
- 	inpixmap.cmptfmts = incmptfmts;
- 	for (unsigned i = 0; i < numinclrchans; ++i) {
- 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
-+		if (j < 0) {
-+			jas_eprintf("missing color component %d\n", i);
-+			goto error;
-+		}
- 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
- 			goto error;
- 		}
-+		assert(j >= 0 && j < jas_image_numcmpts(inimage));
- 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
- 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
- 		incmptfmts[i].width = width;
-@@ -1581,15 +1620,21 @@ jas_image_dump(image, stderr);
- 	}
- 
- 	outpixmap.numcmpts = numoutclrchans;
--	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
-+	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
- 		abort();
- 	}
- 	outpixmap.cmptfmts = outcmptfmts;
- 
- 	for (unsigned i = 0; i < numoutclrchans; ++i) {
- 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
--		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
-+		if (j < 0) {
-+			jas_eprintf("missing color component %d\n", i);
- 			goto error;
-+		}
-+		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
-+			goto error;
-+		}
-+		assert(j >= 0 && j < jas_image_numcmpts(outimage));
- 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
- 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
- 		outcmptfmts[i].width = width;
-@@ -1612,14 +1657,8 @@ jas_image_dump(image, stderr);
- 		}
- 	}
- 
--	for (unsigned i = 0; i < numoutclrchans; ++i) {
--		jas_free(outcmptfmts[i].buf);
--	}
--	jas_free(outcmptfmts);
--	for (unsigned i = 0; i < numinclrchans; ++i) {
--		jas_free(incmptfmts[i].buf);
--	}
--	jas_free(incmptfmts);
-+	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
-+	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
- 	jas_cmxform_destroy(xform);
- 	jas_image_destroy(inimage);
- 
-@@ -1631,6 +1670,14 @@ jas_image_dump(outimage, stderr);
- #endif
- 	return outimage;
- error:
-+	if (incmptfmts) {
-+		assert(numinclrchans);
-+		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
-+	}
-+	if (outcmptfmts) {
-+		assert(numoutclrchans);
-+		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
-+	}
- 	if (xform)
- 		jas_cmxform_destroy(xform);
- 	if (inimage)
--- 
-2.39.5
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 410bcfc683..3bda474dfa 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.33.tar.gz
-sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
+sha256  98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae  jasper-4.2.8.tar.gz
+sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE.txt
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 527ad6fa8c..88633c9661 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,22 +4,29 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.33
+JASPER_VERSION = 4.2.8
 JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-JASPER_LICENSE_FILES = LICENSE
+JASPER_LICENSE_FILES = LICENSE.txt
 JASPER_CPE_ID_VALID = YES
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DJAS_ENABLE_DOC=OFF \
 	-DJAS_ENABLE_PROGRAMS=OFF
 
-# 0001-Fixes-367.patch
-JASPER_IGNORE_CVES += CVE-2023-51257
-
-# 0002-Fixes-400.patch
-JASPER_IGNORE_CVES += CVE-2025-8835
+# Despite using JASPER_SUPPORTS_IN_SOURCE_BUILD = NO jasper detects an
+# in-source-build because a subdirectory inside the source directory
+# is used so we need to force the build.
+JASPER_CONF_OPTS += \
+	-DALLOW_IN_SOURCE_BUILD=ON
+
+# When cross-compiling, we have to feed in the C++ standard to use,
+# upstream doesn't want to auto-detect it:
+# https://github.com/jasper-software/jasper/issues/358
+JASPER_STDC_VERSION="`echo __STDC_VERSION__ | $(TARGET_CROSS)cpp -E -P -`"
+JASPER_CONF_OPTS += \
+	-DJAS_STDC_VERSION=$(JASPER_STDC_VERSION)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
