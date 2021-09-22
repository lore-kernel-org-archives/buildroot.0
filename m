Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5834C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A7E60EE0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57A7E60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C20D40121;
	Wed, 22 Sep 2021 19:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sryS_qk9aly4; Wed, 22 Sep 2021 19:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D06040611;
	Wed, 22 Sep 2021 19:29:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 637BE1BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 335C340601
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyfXR8woJqgI for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:28:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23AB14061F
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 081A18C9E3; Wed, 22 Sep 2021 19:26:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:21:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d6842130b456499d3ff230a3b70cec756cbccd1
X-Git-Newrev: cb18218ad125c1e4c13010c8ee946057ee07103c
X-Patchwork-Hint: ignore
Message-Id: <20210922192613.081A18C9E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: add security patch for
 CVE-2021-3246
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb18218ad125c1e4c13010c8ee946057ee07103c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A heap buffer overflow vulnerability in msadpcm_decode_block of libsndfile
1.0.30 allows attackers to execute arbitrary code via a crafted WAV file.

https://nvd.nist.gov/vuln/detail/CVE-2021-3246

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-ms_adpcm-Fix-and-extend-size-checks.patch | 40 ++++++++++++++++++++++
 package/libsndfile/libsndfile.mk                   |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
new file mode 100644
index 0000000000..edacbda01a
--- /dev/null
+++ b/package/libsndfile/0001-ms_adpcm-Fix-and-extend-size-checks.patch
@@ -0,0 +1,40 @@
+From deb669ee8be55a94565f6f8a6b60890c2e7c6f32 Mon Sep 17 00:00:00 2001
+From: bobsayshilol <bobsayshilol@live.co.uk>
+Date: Thu, 18 Feb 2021 21:52:09 +0000
+Subject: [PATCH] ms_adpcm: Fix and extend size checks
+
+'blockalign' is the size of a block, and each block contains 7 samples
+per channel as part of the preamble, so check against 'samplesperblock'
+rather than 'blockalign'. Also add an additional check that the block
+is big enough to hold the samples it claims to hold.
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26803
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ms_adpcm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/ms_adpcm.c b/src/ms_adpcm.c
+index 5e8f1a31..a21cb994 100644
+--- a/src/ms_adpcm.c
++++ b/src/ms_adpcm.c
+@@ -128,8 +128,14 @@ wavlike_msadpcm_init	(SF_PRIVATE *psf, int blockalign, int samplesperblock)
+ 	if (psf->file.mode == SFM_WRITE)
+ 		samplesperblock = 2 + 2 * (blockalign - 7 * psf->sf.channels) / psf->sf.channels ;
+ 
+-	if (blockalign < 7 * psf->sf.channels)
+-	{	psf_log_printf (psf, "*** Error blockalign (%d) should be > %d.\n", blockalign, 7 * psf->sf.channels) ;
++	/* There's 7 samples per channel in the preamble of each block */
++	if (samplesperblock < 7 * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error samplesperblock (%d) should be >= %d.\n", samplesperblock, 7 * psf->sf.channels) ;
++		return SFE_INTERNAL ;
++		} ;
++
++	if (2 * blockalign < samplesperblock * psf->sf.channels)
++	{	psf_log_printf (psf, "*** Error blockalign (%d) should be >= %d.\n", blockalign, samplesperblock * psf->sf.channels / 2) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+ 
+-- 
+2.20.1
+
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index c955b9d088..ed9e8e3d14 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -12,6 +12,9 @@ LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 
+# 0001-ms_adpcm-Fix-and-extend-size-checks.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2021-3246
+
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
