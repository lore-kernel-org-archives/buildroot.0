Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E1EC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B053660EAC;
	Sun, 17 Jul 2022 13:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B053660EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkAMn_OCw7qh; Sun, 17 Jul 2022 13:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA78560F2F;
	Sun, 17 Jul 2022 13:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA78560F2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68CAE1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8E2B600D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E2B600D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KDpCAscKM4D for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2ABE60AFD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2ABE60AFD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AA88D83BCE; Sun, 17 Jul 2022 13:06:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7a16ee3beb5192a5e745026af777b05496d5114
X-Git-Newrev: 86ddd028c42918cf327f6cafec4620c0a9d36f45
X-Patchwork-Hint: ignore
Message-Id: <20220717130654.AA88D83BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavpack: bump to version 5.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=86ddd028c42918cf327f6cafec4620c0a9d36f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of license file (update in year:
  https://github.com/dbry/WavPack/commit/30d4161c47e135bda2c25a2161b9e3e44e4980ce)

https://github.com/dbry/WavPack/releases/tag/5.5.0
https://github.com/dbry/WavPack/blob/5.5.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...nitize-DSD-file-types-for-invalid-lengths.patch | 42 ----------------------
 package/wavpack/wavpack.hash                       |  4 +--
 package/wavpack/wavpack.mk                         |  5 +--
 3 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
deleted file mode 100644
index 76c1e81674..0000000000
--- a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 773f9d0803c6888ae7d5391878d7337f24216f4a Mon Sep 17 00:00:00 2001
-From: David Bryant <david@wavpack.com>
-Date: Tue, 23 Nov 2021 13:14:35 -0800
-Subject: [PATCH] issue #110: sanitize DSD file types for invalid lengths
-
-[Retrieved from:
-https://github.com/dbry/WavPack/commit/773f9d0803c6888ae7d5391878d7337f24216f4a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cli/dsdiff.c | 6 ++++++
- cli/dsf.c    | 1 +
- 2 files changed, 7 insertions(+)
-
-diff --git a/cli/dsdiff.c b/cli/dsdiff.c
-index d7adb6a..5bdcae3 100644
---- a/cli/dsdiff.c
-+++ b/cli/dsdiff.c
-@@ -278,6 +278,12 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
-             }
- 
-             total_samples = dff_chunk_header.ckDataSize / config->num_channels;
-+
-+            if (total_samples <= 0 || total_samples > MAX_WAVPACK_SAMPLES) {
-+                error_line ("%s is not a valid .DFF file!", infilename);
-+                return WAVPACK_SOFT_ERROR;
-+            }
-+
-             break;
-         }
-         else {          // just copy unknown chunks to output file
-diff --git a/cli/dsf.c b/cli/dsf.c
-index e1d7973..dddd488 100644
---- a/cli/dsf.c
-+++ b/cli/dsf.c
-@@ -113,6 +113,7 @@ int ParseDsfHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackC
- 
-     if (format_chunk.ckSize != sizeof (DSFFormatChunk) || format_chunk.formatVersion != 1 ||
-         format_chunk.formatID != 0 || format_chunk.blockSize != DSF_BLOCKSIZE || format_chunk.reserved ||
-+        format_chunk.sampleCount <= 0 || format_chunk.sampleCount > MAX_WAVPACK_SAMPLES * 8 ||
-         (format_chunk.bitsPerSample != 1 && format_chunk.bitsPerSample != 8) ||
-         format_chunk.numChannels < 1 || format_chunk.numChannels > 6 ||
-         format_chunk.chanType < 1 || format_chunk.chanType > NUM_CHAN_TYPES) {
diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index abc9ab6905..021703df74 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  4bde6a6b2a86614a6bd2579e60dcc974e2c8f93608d2281110a717c1b3c28b79  wavpack-5.4.0.tar.xz
-sha256  f38defde000d62c4ff158f1445cb85a0c2f67cbc1d3cfa34ed882f439f6e3b43  COPYING
+sha256  ef749d98df46925bc2916993e601cc7ee9114d99653e63e0e304f031ba73b8e6  wavpack-5.5.0.tar.xz
+sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 2e0438ac80..a3d952e29b 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.4.0
+WAVPACK_VERSION = 5.5.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
@@ -14,9 +14,6 @@ WAVPACK_LICENSE = BSD-3-Clause
 WAVPACK_LICENSE_FILES = COPYING
 WAVPACK_CPE_ID_VENDOR = wavpack
 
-# 0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
-WAVPACK_IGNORE_CVES += CVE-2021-44269
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
