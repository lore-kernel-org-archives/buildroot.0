Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC35E7B5F5
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 542016140F;
	Wed,  4 Oct 2023 11:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542016140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bz6PicLbg35q; Wed,  4 Oct 2023 11:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AD261406;
	Wed,  4 Oct 2023 11:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42AD261406
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93D2B1BF861
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 11:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CE7416D9
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 11:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68CE7416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwEKU09L6VHk for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1B0416D0
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1B0416D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 191EB841F0; Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Oct 2023 13:46:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d2f4004d27d3937fd8a4a6d5ed244379ecc0fad
X-Git-Newrev: 07a03a8549b0e1ed92993311be337c7a382b6446
X-Patchwork-Hint: ignore
Message-Id: <20231004114740.191EB841F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpx: bump version to 1.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=07a03a8549b0e1ed92993311be337c7a382b6446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was backported from upstream and is now included
in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: drop CVE ignore for patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-VP8-disallow-thread-count-changes.patch   | 38 ----------------------
 package/libvpx/libvpx.hash                         |  2 +-
 package/libvpx/libvpx.mk                           |  5 +--
 3 files changed, 2 insertions(+), 43 deletions(-)

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
index b558c41981..9092ca6a8e 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.13.0
+LIBVPX_VERSION = 1.13.1
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
 LIBVPX_CPE_ID_VENDOR = webmproject
 LIBVPX_INSTALL_STAGING = YES
 
-# 0002-VP8-disallow-thread-count-changes.patch
-LIBVPX_IGNORE_CVES += CVE-2023-5217
-
 # ld is being used with cc options. therefore, pretend ld is cc.
 LIBVPX_CONF_ENV = \
 	LD="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
