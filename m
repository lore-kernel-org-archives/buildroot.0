Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96658C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4796E41797;
	Mon, 27 Jun 2022 20:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4796E41797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gedOqld6xPRk; Mon, 27 Jun 2022 20:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB6841588;
	Mon, 27 Jun 2022 20:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB6841588
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF471BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE81283F8F
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE81283F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyGHLTf-Ljny for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D0382C3C
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25D0382C3C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E46CD875B3; Mon, 27 Jun 2022 20:31:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:41:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff4c9cebfe18b5beb7d3f9571223a22996ee90c9
X-Git-Newrev: c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9
X-Patchwork-Hint: ignore
Message-Id: <20220627203135.E46CD875B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: security bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following security issues:
 - Heap buffer overflow in wavlike_ima_decode_block()
 - Heap buffer overflow in msadpcm_decode_block()
 - Heap buffer overflow in psf_binheader_readf()
 - Index out of bounds in psf_nms_adpcm_decode_block()
 - Heap buffer overflow in flac_buffer_copy()
 - Heap buffer overflow in copyPredictorTo24()
 - Uninitialized variable in psf_binheader_readf()

Drop patch (already in version)

While at it, also drop mention of CVE-2018-13419 which is correctly
tagged as only affecting version 1.0.28 in NVD NIST database:
https://nvd.nist.gov/vuln/detail/CVE-2018-13419

https://github.com/libsndfile/libsndfile/releases/tag/1.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ms_adpcm-Fix-and-extend-size-checks.patch | 40 ----------------------
 package/libsndfile/libsndfile.hash                 |  2 +-
 package/libsndfile/libsndfile.mk                   | 10 ++----
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
deleted file mode 100644
index edacbda01a..0000000000
--- a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
-From: bobsayshilol <bobsayshilol@live.co.uk>
-Date: Thu, 18 Feb 2021 21:52:09 +0000
-Subject: [PATCH] ms_adpcm: Fix and extend size checks
-
-'blockalign' is the size of a block, and each block contains 7 samples
-per channel as part of the preamble, so check against 'samplesperblock'
-rather than 'blockalign'. Also add an additional check that the block
-is big enough to hold the samples it claims to hold.
-
-https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ms_adpcm.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
-index 5e8f1a31..a21cb994 100644
---- a/src/ms_adpcm.c
-+++ b/src/ms_adpcm.c
-@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
- 	if (psf->file.mode == SFM_WRITE)
- 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
- 
--	if (blockalign < 7 * psf->sf.channels)
--	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
-+	/* There's 7 samples per channel in the preamble of each block */
-+	if (samplesperblock < 7 * psf->sf.channels)
-+	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
-+		return SFE_INTERNAL ;
-+		} ;
-+
-+	if (2 * blockalign < samplesperblock * psf->sf.channels)
-+	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
- 		return SFE_INTERNAL ;
- 		} ;
- 
--- 
-2.20.1
-
diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index 14dfe823f9..67d10d03c4 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163  libsndfile-1.0.31.tar.bz2
+sha256  0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41  libsndfile-1.1.0.tar.xz
 # Locally calculated
 sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index ed9e8e3d14..12a6601b6b 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.0.31
-LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.bz2
+LIBSNDFILE_VERSION = 1.1.0
+LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.xz
 LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
-# 0001-ms_adpcm-Fix-and-extend-size-checks.patch
-LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
-
-# disputed, https://github.com/erikd/libsndfile/issues/398
-LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
-
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
