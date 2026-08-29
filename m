Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F281AC61DD9
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F38760607;
	Sat, 29 Aug 2026 18:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHGZeonyDw8E; Sat, 29 Aug 2026 18:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788028064;
	bh=60koHI5Za7ZDgY4er5c4jvd/BG4pnJsck13jJhQZcO4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2GBVrbU7i7cGxznWpXKggP7rwFO2hx+Raq5rb3O3CXb56nxRXbhzPp1SN1U2VFN7
	 MrJuxEMJXBSb2zQMHB80i3Tw3sY2hGWm2iy8u5b2ydbMbmiENtfvLUbdxBfxFRd6uX
	 hGqH8env1NiF56SprQStbSskIYeXGIDxtE9m1+0FOnJDtDvSRsWODYG8t6gDYc9wP7
	 86OY82dFkUQ1TbFcHeh0YoUXtDObMR/BDT4EZT/AHLazlYGWdFZbU+cVDn50mnbqk+
	 R9JvvLcp3UDkMZ/78nBpWQN+FoAijw+2ksSvHirRANh7RjJZhcSr78k1dnaV1cOEoz
	 GIsnDeUchtWfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AFA6060C;
	Sat, 29 Aug 2026 18:27:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E72739D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8EA0404FF
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoiQVwJeA4D6 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5194052D
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7050692291; Sat, 29 Aug 2026 18:26:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 20:24:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83fc4aa55eeab8f6dab64e6fe26a04284fa73881
X-Git-Newrev: 0fe2d74ffd1290422d0fb721481f4acd60d12cc0
X-Patchwork-Hint: ignore
Message-Id: <20260829182643.7050692291@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0fe2d74ffd1290422d0fb721481f4acd60d12cc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.2

Fixes the following CVEs:

(CVE numbers will be added upstream when assigned.)

CVE-2026-XXXXX (GHSA-g89c-p67h-r497)
 Heap buffer overflow in scale_nearest_neighbor() via duplicate alpha
 planes from nested iden/auxl items. (critical)

(GHSA-2jg2-4ch7-h545)
 Out-of-bounds read and write in derived-item and pixel-plane handling.
 Through iden and auxl item chains, a crafted file could attach pixel
 planes whose size differs from the image geometry; crop, scale, and
 plane-extraction code then indexed those planes with the wrong size.
 A working code-execution exploit was confirmed. Plane sizes are now
 validated wherever they are consumed. (critical)

CVE-2026-XXXXX (GHSA-24wx-9w62-c96w)
 brotli/zlib decompression of mime metadata and unci image data had no
 effective output-size limit, so a decompression bomb could exhaust
 memory. Decompressed output is now bounded by the security limits.
 (high)

CVE-2026-XXXXX (GHSA-x8xm-cm2c-cfc8)
 Chains of derived-image references (grid, iovl, iden) bypassed decode
 caching and memory limits, causing CPU and memory amplification. (high)

CVE-2026-XXXXX (GHSA-xw34-mjcp-jqh8)
 Sequence sample-timing initialization could produce non-terminating
 decode loops and unbounded memory, bypassing max_sequence_frames.
 (high)

CVE-2026-XXXXX (GHSA-j264-xvrp-5v7q)
 Out-of-bounds write in the unci encoder when
 heif_context_add_image_tile() is given a tile whose planes do not match
 its declared size. (high)

CVE-2026-XXXXX (GHSA-p58j-h3vm-3fp5)
 Heap out-of-bounds read in the inline-mask region API when
 mask_data_len does not match the region geometry. (medium)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index ff8c05c7e4..31fe79b16e 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.1
-sha256  0de0327f60fcd47de90d5654c6fe152232738d60d84fe084ec3e0f35e03b166a  libheif-1.23.1.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.2
+sha256  8bd5d41d19dc84536d118b04774709f244df6104ef66d623dad5fa4650143405  libheif-1.23.2.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 124dba7c24..755a9909c4 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.1
+LIBHEIF_VERSION = 1.23.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
