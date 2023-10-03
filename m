Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7ADE75455
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DC441722;
	Tue,  3 Oct 2023 12:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DC441722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTPZK-W5NXFv; Tue,  3 Oct 2023 12:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758BC417A5;
	Tue,  3 Oct 2023 12:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758BC417A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9123E1BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF79823DD
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AF79823DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DcCPah3Ei6b for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:34:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59022823AA
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59022823AA
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CD2FA4C00A8;
 Tue,  3 Oct 2023 14:34:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qnebe-0001EG-0Y;
 Tue, 03 Oct 2023 14:34:30 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:34:30 +0200
Message-Id: <20231003123430.2693572-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696336470;
 bh=u4HB54qiBRBoonJD8K+2/hbcRd3jZ9NuuYBmDyM29/o=;
 h=From:To:Cc:Subject:Date:From;
 b=aWWneqevJulN6iKQe3KFUtf4/pR7R/exsMtFCgwpx6RBVUxE6F1uwEQ6j4bT7wj9b
 JcApAJKKKIlnWUc4tgNQBYQ7vcChFGZKD1v3wZ+ipfHZJfPlF8NJWnm5erOh2vFxSA
 uzcx2aWaK7KE/SvS+aLW5gDTi+F5EYlwLueI7KKxDKyYcGXLoMFVjMR9RBHCM0oS3H
 Y4RGhTkQxLH7T8ISHLbrFRF6EZbVobzwcZFqNMC+ZEHGFQ1fItI6V9rRkW7y41+6nI
 cOP3oBuG5ZhQXOl67Pg64tQCrzRkdI8TPibUp6hMr8lKSxPPQ9qubewIgICoqNmgzO
 AAQYQNbfruJhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=aWWneqev
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.13.1
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which was backported from upstream and is now included
in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...02-VP8-disallow-thread-count-changes.patch | 38 -------------------
 package/libvpx/libvpx.hash                    |  2 +-
 package/libvpx/libvpx.mk                      |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/libvpx/0002-VP8-disallow-thread-count-changes.patch

diff --git a/package/libvpx/0002-VP8-disallow-thread-count-changes.patch b/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
deleted file mode 100644
index d625255a9f..0000000000
--- a/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3fbd1dca6a4d2dad332a2110d646e4ffef36d590 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Mon, 25 Sep 2023 18:55:59 -0700
-Subject: [PATCH] VP8: disallow thread count changes
-
-Currently allocations are done at encoder creation time. Going from
-threaded to non-threaded would cause a crash.
-
-Bug: chromium:1486441
-Change-Id: Ie301c2a70847dff2f0daae408fbef1e4d42e73d4
-
-Fixes CVE-2023-5217: https://www.cve.org/CVERecord?id=CVE-2023-5217
-
-Upstream: https://github.com/webmproject/libvpx/commit/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
-Upstream: https://chromium.googlesource.com/webm/libvpx/+/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
-
-[Bernd: Removed patch for test/encode_api_test.cc]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- vp8/encoder/onyx_if.c   | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/vp8/encoder/onyx_if.c b/vp8/encoder/onyx_if.c
-index c65afc643bf..c5e9970c3cc 100644
---- a/vp8/encoder/onyx_if.c
-+++ b/vp8/encoder/onyx_if.c
-@@ -1447,6 +1447,11 @@ void vp8_change_config(VP8_COMP *cpi, VP8_CONFIG *oxcf) {
-   last_h = cpi->oxcf.Height;
-   prev_number_of_layers = cpi->oxcf.number_of_layers;
- 
-+  if (cpi->initial_width) {
-+    // TODO(https://crbug.com/1486441): Allow changing thread counts; the
-+    // allocation is done once in vp8_create_compressor().
-+    oxcf->multi_threaded = cpi->oxcf.multi_threaded;
-+  }
-   cpi->oxcf = *oxcf;
- 
-   switch (cpi->oxcf.Mode) {
diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index c88e6840cf..7cda8cc2eb 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  cb2a393c9c1fae7aba76b950bb0ad393ba105409fe1a147ccd61b0aaa1501066  libvpx-1.13.0.tar.gz
+sha256  00dae80465567272abd077f59355f95ac91d7809a2d3006f9ace2637dd429d14  libvpx-1.13.1.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index b558c41981..ec2e39a74f 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.13.0
+LIBVPX_VERSION = 1.13.1
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
