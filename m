Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975710ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24799612BE;
	Fri, 27 Mar 2026 09:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4GarzGS9FIL; Fri, 27 Mar 2026 09:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F160A612DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605566;
	bh=aBnc5P4GJ2UO7kVBukXbhPwRLP81e82DSU7sjVYE5Us=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LZIdT8IGf8haQenjZbpuEKERD6wcVleQS2ZrbX2GJkmr6A46RVTzIrA2THR7Jy67c
	 fJbX42YVDzwe4+tOS0JNVrEE7xR5mFsN0XFh5sQDhplg1USchM01QLtk0xlYagy3Bd
	 BpNy6Tylh246FCs/ZGFU/vS5PHV3NfVOrTetmsguIZfisx2iqjnvdoyJUp9gYGW6Ya
	 pIwO6FaCQ41mVmVO6pLHpFylkQ3oNfc0YppGaL6gi8r9Kh5/E/th1sywntmW9Ap1F5
	 JMfL01Kj8ZRjXU18sziko4DW7xg2QJuNQkYwY7OPgTS/HdTIZykc4y/Soza05WcVFl
	 kE1sHHeqz+HJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F160A612DA;
	Fri, 27 Mar 2026 09:59:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DFD1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67ADC612A5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEDQm7fIVr6Y for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16142612A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16142612A0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BC3B7FBB8; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f53b596f15ca98cba142921cfad43503da3377c
X-Git-Newrev: b2c698886f9046c4ea37a34f6ccc5f0c20c93ec5
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.5BC3B7FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: patch
 CVE-2025-68431
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2c698886f9046c4ea37a34f6ccc5f0c20c93ec5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2025-68431:
    libheif is an HEIF and AVIF file format decoder and encoder. Prior to
    version 1.21.0, a crafted HEIF that exercises the overlay image item
    path triggers a heap buffer over-read in `HeifPixelImage::overlay()`.
    The function computes a negative row length (likely from an unclipped
    overlay rectangle or invalid offsets), which then underflows when
    converted to `size_t` and is passed to `memcpy`, causing a very large
    read past the end of the source plane and a crash. Version 1.21.0
    contains a patch. As a workaround, avoid decoding images using `iovl`
    overlay boxes.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-68431
  - https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46

(cherry picked from commit a8aed698c706ec534ddc41cdce651c18016c28ca)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-fix-wrong-copy-width-in-overlay-images.patch | 26 ++++++++++++++++++++++
 package/libheif/libheif.mk                         |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
new file mode 100644
index 0000000000..4d845b2f90
--- /dev/null
+++ b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
@@ -0,0 +1,26 @@
+From b8c12a7b70f46c9516711a988483bed377b78d46 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 11 Nov 2025 19:47:50 +0100
+Subject: [PATCH] fix wrong copy width in overlay images (thanks to Aldo
+ Ristori for reporting this)
+
+CVE: CVE-2025-68431
+Upstream: https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libheif/pixelimage.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
+index f202c61049..84a8dd739e 100644
+--- a/libheif/pixelimage.cc
++++ b/libheif/pixelimage.cc
+@@ -1508,7 +1508,7 @@ Error HeifPixelImage::overlay(std::shared_ptr<HeifPixelImage>& overlay, int32_t
+       if (!has_alpha) {
+         memcpy(out_p + out_x0 + (out_y0 + y - in_y0) * out_stride,
+                in_p + in_x0 + y * in_stride,
+-               in_w - in_x0);
++               in_w);
+       }
+       else {
+         for (uint32_t x = in_x0; x < in_w; x++) {
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 8d91a109db..325502ad00 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -23,6 +23,9 @@ LIBHEIF_CONF_OPTS = \
 	-DWITH_REDUCED_VISIBILITY=ON \
 	-DWITH_SvtEnc=OFF
 
+# 0001-fix-wrong-copy-width-in-overlay-images.patch
+LIBHEIF_IGNORE_CVES += CVE-2025-68431
+
 ifeq ($(BR2_PACKAGE_DAV1D),y)
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
 LIBHEIF_DEPENDENCIES += dav1d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
