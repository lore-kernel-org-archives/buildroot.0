Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5341FC87FDA
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 14:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A88440BFB;
	Fri,  8 Aug 2025 14:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBlRHwhObXPw; Fri,  8 Aug 2025 14:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C2240BCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C2240BCD;
	Fri,  8 Aug 2025 14:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1989510A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0097040433
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVc1T0FawJtX for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 14:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC6B40BCD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DC6B40BCD
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BAA786FC9; Fri,  8 Aug 2025 14:48:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Aug 2025 16:36:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c897f16a98644c1eb4883cdf3cc2ce38dcff7e73
X-Git-Newrev: b3974df96614b08d418b291b86248ea0ff93c462
X-Patchwork-Hint: ignore
Message-Id: <20250808144813.0BAA786FC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: add patches to fix
 CVE-2025-8176
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3974df96614b08d418b291b86248ea0ff93c462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following vulnerability:

- CVE-2025-8176

    A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
    as critical. This vulnerability affects the function get_histogram of
    the file tools/tiffmedian.c. The manipulation leads to use after free.
    The attack needs to be approached locally. The exploit has been
    disclosed to the public and may be used. The patch is identified as
    fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8176
  - https://gitlab.com/libtiff/libtiff/-/merge_requests/727

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-t-skip-the-first-line-of-the-input-image.patch | 61 ++++++++++++++++++++++
 package/tiff/0002-fix-tiffmedian-bug.patch         | 31 +++++++++++
 package/tiff/0003-conflict-resolution.patch        | 28 ++++++++++
 package/tiff/tiff.mk                               |  3 ++
 4 files changed, 123 insertions(+)

diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
new file mode 100644
index 0000000000..bdf4bd8e94
--- /dev/null
+++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
@@ -0,0 +1,61 @@
+From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH] Don't skip the first line of the input image.  Addresses
+ issue #703
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 714fe03d4..bfed6df18 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
+     nextptr = nextline;
+     for (j = 0; j < imagewidth; ++j)
+         *nextptr++ = *inptr++;
+-    for (i = 1; i < imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         tmpptr = thisline;
+         thisline = nextline;
+@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
+                     nextptr[0] += v / 16;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             goto skip_on_error;
+     }
+     goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 02b0bc2b4..f6cf26c2c 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 1; i <= imagelength; ++i)
++    for (i = 0; i <= imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+                 nextptr += 3;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             break;
+     }
+ bad:
+-- 
+GitLab
+
diff --git a/package/tiff/0002-fix-tiffmedian-bug.patch b/package/tiff/0002-fix-tiffmedian-bug.patch
new file mode 100644
index 0000000000..880bade7d8
--- /dev/null
+++ b/package/tiff/0002-fix-tiffmedian-bug.patch
@@ -0,0 +1,31 @@
+From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH] Fix tiffmedian bug #707
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ce46f002eca4148497363f80fab33f9396bcbeda
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index f6cf26c2c..8c9978bab 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
+     for (i = 0; i < imagelength; i++)
+     {
+         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-            break;
++        {
++            fprintf(stderr, "Error reading scanline\n");
++            exit(EXIT_FAILURE);
++        }
+         inptr = inputline;
+         for (j = imagewidth; j-- > 0;)
+         {
+-- 
+GitLab
+
diff --git a/package/tiff/0003-conflict-resolution.patch b/package/tiff/0003-conflict-resolution.patch
new file mode 100644
index 0000000000..0c16aa3271
--- /dev/null
+++ b/package/tiff/0003-conflict-resolution.patch
@@ -0,0 +1,28 @@
+From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH] conflict resolution
+
+Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ecc4ddbf1f0fed7957d1e20361e37f01907898e0
+CVE: CVE-2025-8176
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 8c9978bab..47e0524bc 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 0; i <= imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 5d7219d7da..bd95fdca7f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,6 +13,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
+TIFF_IGNORE_CVES += CVE-2025-8176
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
