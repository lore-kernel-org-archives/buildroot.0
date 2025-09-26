Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECD9CAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 19:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B867E41674;
	Fri, 26 Sep 2025 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9HIJhPw2UEg; Fri, 26 Sep 2025 19:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0BC41766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0BC41766;
	Fri, 26 Sep 2025 19:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCDA3198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A369784D4D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biya5k0PNdwJ for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C95C84D49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C95C84D49
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57F7986503; Fri, 26 Sep 2025 19:36:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 21:25:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 740412aefc57770cd5be71012c19eec8bc576637
X-Git-Newrev: 9e67ae519feeb5449329ed950878b91ac2c945c4
X-Patchwork-Hint: ignore
Message-Id: <20250926193633.57F7986503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: security bump to v4.7.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e67ae519feeb5449329ed950878b91ac2c945c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more details on the version bump, see:
  - https://gitlab.com/libtiff/libtiff/-/releases/v4.7.1

This bump includes the security fix for CVE-2025-8176, CVE-2025-8177
that were addressed in commit [1][2].

Also fixes the following vulnerabilities:

- CVE-2024-13978

    A vulnerability was found in LibTIFF up to 4.7.0. It has been
    declared as problematic. Affected by this vulnerability is the
    function t2p_read_tiff_init of the file tools/tiff2pdf.c of the
    component fax2ps. The manipulation leads to null pointer
    dereference. The attack needs to be approached locally. The
    complexity of an attack is rather high. The exploitation appears to
    be difficult. The patch is named
    2ebfffb0e8836bfb1cd7d85c059cd285c59761a4. It is recommended to apply
    a patch to fix this issue.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2024-13978
  - https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4

- CVE-2025-8961

    A weakness has been identified in LibTIFF 4.7.0. This affects the
    function main of the file tiffcrop.c of the component tiffcrop.
    Executing manipulation can lead to memory corruption. The attack can
    only be executed locally. The exploit has been made available to the
    public and could be exploited.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-8961
  - https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5

- CVE-2025-9165

    A flaw has been found in LibTIFF 4.7.0. This affects the function
    _TIFFmallocExt/_TIFFCheckRealloc/TIFFHashSetNew/InitCCITTFax3 of the
    file tools/tiffcmp.c of the component tiffcmp. Executing
    manipulation can lead to memory leak. The attack is restricted to
    local execution. The exploit has been published and may be used.
    This patch is called ed141286a37f6e5ddafb5069347ff5d587e7a4e0. It is
    best practice to apply a patch to resolve this issue.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-9165
  - https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0

This commit also updates the LICENSE.md hash file, which was updated
upstream to include a historical license. See:
https://gitlab.com/libtiff/libtiff/-/commit/a0b623c7809ea2aa4978d5d7b7bd10e519294c78

[1] b3974df966 package/tiff: add patches to fix CVE-2025-8176
[2] 3db725d71d package/tiff: add patch to fix CVE-2025-8177

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-t-skip-the-first-line-of-the-input-image.patch | 61 ----------------------
 package/tiff/0002-fix-tiffmedian-bug.patch         | 31 -----------
 package/tiff/0003-conflict-resolution.patch        | 28 ----------
 package/tiff/0004-fix-for-thumbnail-issue.patch    | 35 -------------
 package/tiff/tiff.hash                             |  6 +--
 package/tiff/tiff.mk                               |  8 +--
 6 files changed, 4 insertions(+), 165 deletions(-)

diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
deleted file mode 100644
index bdf4bd8e94..0000000000
--- a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Mon, 19 May 2025 10:53:30 -0700
-Subject: [PATCH] Don't skip the first line of the input image.  Addresses
- issue #703
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffdither.c | 4 ++--
- tools/tiffmedian.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/tiffdither.c b/tools/tiffdither.c
-index 714fe03d4..bfed6df18 100644
---- a/tools/tiffdither.c
-+++ b/tools/tiffdither.c
-@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
-     nextptr = nextline;
-     for (j = 0; j < imagewidth; ++j)
-         *nextptr++ = *inptr++;
--    for (i = 1; i < imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         tmpptr = thisline;
-         thisline = nextline;
-@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
-                     nextptr[0] += v / 16;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             goto skip_on_error;
-     }
-     goto exit_label;
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 02b0bc2b4..f6cf26c2c 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 1; i <= imagelength; ++i)
-+    for (i = 0; i <= imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
-@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-                 nextptr += 3;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             break;
-     }
- bad:
--- 
-GitLab
-
diff --git a/package/tiff/0002-fix-tiffmedian-bug.patch b/package/tiff/0002-fix-tiffmedian-bug.patch
deleted file mode 100644
index 880bade7d8..0000000000
--- a/package/tiff/0002-fix-tiffmedian-bug.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:25:16 -0700
-Subject: [PATCH] Fix tiffmedian bug #707
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ce46f002eca4148497363f80fab33f9396bcbeda
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffmedian.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index f6cf26c2c..8c9978bab 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
-     for (i = 0; i < imagelength; i++)
-     {
-         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
--            break;
-+        {
-+            fprintf(stderr, "Error reading scanline\n");
-+            exit(EXIT_FAILURE);
-+        }
-         inptr = inputline;
-         for (j = imagewidth; j-- > 0;)
-         {
--- 
-GitLab
-
diff --git a/package/tiff/0003-conflict-resolution.patch b/package/tiff/0003-conflict-resolution.patch
deleted file mode 100644
index 0c16aa3271..0000000000
--- a/package/tiff/0003-conflict-resolution.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:38:09 -0700
-Subject: [PATCH] conflict resolution
-
-Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ecc4ddbf1f0fed7957d1e20361e37f01907898e0
-CVE: CVE-2025-8176
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/tiffmedian.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 8c9978bab..47e0524bc 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 0; i <= imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
--- 
-GitLab
-
diff --git a/package/tiff/0004-fix-for-thumbnail-issue.patch b/package/tiff/0004-fix-for-thumbnail-issue.patch
deleted file mode 100644
index 237306f6c2..0000000000
--- a/package/tiff/0004-fix-for-thumbnail-issue.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Wed, 25 Jun 2025 17:14:18 +0000
-Subject: [PATCH] Fix for thumbnail issue #715
-
-CVE: CVE-2025-8177
-Upstream: https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- tools/thumbnail.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/tools/thumbnail.c b/tools/thumbnail.c
-index 9cade913..7e21f521 100644
---- a/tools/thumbnail.c
-+++ b/tools/thumbnail.c
-@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
-             }
-             acc += bits[*src & mask1];
-         }
--        *row++ = cmap[(255 * acc) / area];
-+        if (255 * acc / area < 256)
-+        {
-+            *row++ = cmap[(255 * acc) / area];
-+        }
-+        else
-+        {
-+            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
-+            *row++ = cmap[0];
-+        }
-     }
- }
- 
--- 
-GitLab
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 5e2dcca73c..ff0b698345 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-# https://download.osgeo.org/libtiff/tiff-4.7.0.tar.xz.sig
+# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
 # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
-sha256  273a0a73b1f0bed640afee4a5df0337357ced5b53d3d5d1c405b936501f71017  tiff-4.7.0.tar.xz
-sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
+sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
+sha256  0e27c2382d7b8147972bbb746e04059a1152c8d0fda9d03ef1399d1a433c4ade  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index dd23c2bd43..32bebcf95f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.7.0
+TIFF_VERSION = 4.7.1
 TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
 TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
@@ -13,12 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
-TIFF_IGNORE_CVES += CVE-2025-8176
-
-# 0004-fix-for-thumbnail-issue.patch
-TIFF_IGNORE_CVES += CVE-2025-8177
-
 # Fixed in 4.7.0
 TIFF_IGNORE_CVES += CVE-2025-8851
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
