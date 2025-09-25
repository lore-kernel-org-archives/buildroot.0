Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469C6CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12135617AC;
	Thu, 25 Sep 2025 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RBvv61o5QdM; Thu, 25 Sep 2025 20:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63AF615C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63AF615C9;
	Thu, 25 Sep 2025 20:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6038177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9F8412CA
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbgLTAGW4N9K for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99388412CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99388412CE
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 973798644A; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:41:02 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 8b0e1b7a98c5886ec09d0cc2b227bec61bec53e3
X-Git-Newrev: 2a81f918393c1233d5de100b7782f80c4c15a1e6
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.973798644A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/jasper: add patch
 for CVE-2025-8835
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a81f918393c1233d5de100b7782f80c4c15a1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This fixes the following vulnerability:

- CVE-2025-8835:

A vulnerability was found in JasPer up to 4.2.5. Affected by this
vulnerability is the function jas_image_chclrspc of the file
src/libjasper/base/jas_image.c of the component Image Color Space
Conversion Handler. The manipulation leads to null pointer dereference.
It is possible to launch the attack on the local host. The exploit has
been disclosed to the public and may be used. The identifier of the
patch is bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52. It is recommended to
apply a patch to fix this issue.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-8835
  - https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6e81b51f683e075d4a20a6c28a0fd778d977f4a4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0002-Fixes-400.patch | 169 ++++++++++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |   3 +
 2 files changed, 172 insertions(+)

diff --git a/package/jasper/0002-Fixes-400.patch b/package/jasper/0002-Fixes-400.patch
new file mode 100644
index 0000000000..b663f1e72e
--- /dev/null
+++ b/package/jasper/0002-Fixes-400.patch
@@ -0,0 +1,169 @@
+From bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 29 Jul 2025 20:16:35 -0700
+Subject: [PATCH] Fixes #400.
+
+Added a check for a missing color component in the jas_image_chclrspc
+function.
+
+CVE: CVE-2025-8835
+Upstream: https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
+[thomas: backport to v2.0.33]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/base/jas_image.c | 71 ++++++++++++++++++++++++++++------
+ 1 file changed, 59 insertions(+), 12 deletions(-)
+
+diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
+index 68a94e1..cd99ba2 100644
+--- a/src/libjasper/base/jas_image.c
++++ b/src/libjasper/base/jas_image.c
+@@ -112,6 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
+   unsigned newprec);
+ static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
+   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
+ 
+ /******************************************************************************\
+ * Global data.
+@@ -409,6 +411,31 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
+ 	jas_free(cmpt);
+ }
+ 
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
++{
++	jas_cmcmptfmt_t* cmptfmts;
++	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
++		return 0;
++	}
++	for (int i = 0; i < n; ++i) {
++		cmptfmts[i].buf = 0;
++	}
++	return cmptfmts;
++}
++
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
++{
++	assert(cmptfmts);
++	assert(n > 0);
++	for (int i = 0; i < n; ++i) {
++		if (cmptfmts[i].buf) {
++			jas_free(cmptfmts[i].buf);
++		}
++		cmptfmts[i].buf = 0;
++	}
++	jas_free(cmptfmts);
++}
++
+ /******************************************************************************\
+ * Load and save operations.
+ \******************************************************************************/
+@@ -1470,19 +1497,25 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
+ 	jas_cmcmptfmt_t *incmptfmts;
+ 	jas_cmcmptfmt_t *outcmptfmts;
+ 
++	assert(image);
++	assert(outprof);
++
+ #if 0
+ jas_eprintf("IMAGE\n");
+ jas_image_dump(image, stderr);
+ #endif
+ 
+-	if (image->numcmpts_ == 0)
++	if (!jas_image_numcmpts(image)) {
+ 		/* can't work with a file with no components;
+ 		   continuing would crash because we'd attempt to
+ 		   obtain information about the first component */
+ 		return NULL;
++	}
+ 
+ 	outimage = 0;
+ 	xform = 0;
++	incmptfmts = 0;
++	outcmptfmts = 0;
+ 	if (!(inimage = jas_image_copy(image)))
+ 		goto error;
+ 	image = 0;
+@@ -1565,15 +1598,21 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	inpixmap.numcmpts = numinclrchans;
+-	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	assert(numinclrchans != 0);
++	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
+ 		abort();
+ 	}
+ 	inpixmap.cmptfmts = incmptfmts;
+ 	for (unsigned i = 0; i < numinclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
+ 			goto error;
+ 		}
++		assert(j >= 0 && j < jas_image_numcmpts(inimage));
+ 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
+ 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
+ 		incmptfmts[i].width = width;
+@@ -1581,15 +1620,21 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	outpixmap.numcmpts = numoutclrchans;
+-	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
+ 		abort();
+ 	}
+ 	outpixmap.cmptfmts = outcmptfmts;
+ 
+ 	for (unsigned i = 0; i < numoutclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
+-		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
+ 			goto error;
++		}
++		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
++			goto error;
++		}
++		assert(j >= 0 && j < jas_image_numcmpts(outimage));
+ 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
+ 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
+ 		outcmptfmts[i].width = width;
+@@ -1612,14 +1657,8 @@ jas_image_dump(image, stderr);
+ 		}
+ 	}
+ 
+-	for (unsigned i = 0; i < numoutclrchans; ++i) {
+-		jas_free(outcmptfmts[i].buf);
+-	}
+-	jas_free(outcmptfmts);
+-	for (unsigned i = 0; i < numinclrchans; ++i) {
+-		jas_free(incmptfmts[i].buf);
+-	}
+-	jas_free(incmptfmts);
++	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
+ 	jas_cmxform_destroy(xform);
+ 	jas_image_destroy(inimage);
+ 
+@@ -1631,6 +1670,14 @@ jas_image_dump(outimage, stderr);
+ #endif
+ 	return outimage;
+ error:
++	if (incmptfmts) {
++		assert(numinclrchans);
++		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
++	}
++	if (outcmptfmts) {
++		assert(numoutclrchans);
++		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	}
+ 	if (xform)
+ 		jas_cmxform_destroy(xform);
+ 	if (inimage)
+-- 
+2.39.5
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index dd0badbc8f..527ad6fa8c 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -18,6 +18,9 @@ JASPER_CONF_OPTS = \
 # 0001-Fixes-367.patch
 JASPER_IGNORE_CVES += CVE-2023-51257
 
+# 0002-Fixes-400.patch
+JASPER_IGNORE_CVES += CVE-2025-8835
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
