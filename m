Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04412FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA6484DBF;
	Fri, 24 Apr 2026 16:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDU1svC3ji50; Fri, 24 Apr 2026 16:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE0C184DA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047958;
	bh=izBfLCIHeMVQhGILwQiU2Xf1uatc6NY8j7kfu/2v/bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DerHqtFRtKdBupdGky/jbluNql1qkgFtwHs2klwDIJzhvbupe1IzPyd2uuFTEjuP2
	 0g4arntNKTapL1PQ9NkJSyoQXFDWHpiib6lQ8ND58Yj/lDCH/35KlcNFzctoWxMruC
	 UbkmGtK/zq+yUetXkSJzpWo4xaE5QxsXM9OycVCJcEW+pXPmL12DhwGfNLPt8Vy5vn
	 QwRJ48WyicRlQKYC0x1tGx8761XhNvUDOKMWH54vKFstxPa24VBYd6ledHSLBUH3PP
	 GaQBAk9mWSULU8qQDciB5qLS47lnSB18kXt7Pb+WDgYOtAeNvogx04YRUAjsQBW/WP
	 Trkfs9k4z9Ppw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0C184DA2;
	Fri, 24 Apr 2026 16:25:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C6A206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF5CA61C2E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lj7nKwue0Cqf for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 508FB61C30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 508FB61C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE0B682B2E; Fri, 24 Apr 2026 16:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4afa94f4fb9662a8655eca8d035b510352de1694
X-Git-Newrev: 97203c48f9c36d87fe13fc0486d93718e4dcaa48
X-Patchwork-Hint: ignore
Message-Id: <20260424162538.EE0B682B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/giflib: patch
 CVE-2021-40633, CVE-2025-31344, CVE-2026-23868
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97203c48f9c36d87fe13fc0486d93718e4dcaa48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2021-40633:
    A memory leak (out-of-memory) in gif2rgb in util/gif2rgb.c in giflib
    5.1.4 allows remote attackers trigger an out of memory exception or
    denial of service via a gif format file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2021-40633
  - https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/

- CVE-2025-31344:
    Heap-based Buffer Overflow vulnerability in openEuler giflib on Linux.
    This vulnerability is associated with program files gif2rgb.C.  This
    issue affects giflib: through 5.2.2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-31344
  - https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af

- CVE-2026-23868:
    Giflib contains a double-free vulnerability that is the result of a
    shallow copy in GifMakeSavedImage and incorrect error handling. The
    conditions needed to trigger this vulnerability are difficult but may
    be possible.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23868
  - https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106

This package is still vulnerable to CVE-2024-45993 [1] & CVE-2026-26740
[2] that doesn't have a documented fix yet.

[1] https://security-tracker.debian.org/tracker/CVE-2024-45993
[2] https://security-tracker.debian.org/tracker/CVE-2026-26740

(cherry picked from commit 5388405cfd6df463ec01643d371ec9eef95360a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/giflib/0003-CVE-2021-40633.patch | 24 ++++++++++++++++++++++++
 package/giflib/0004-CVE-2025-31344.patch | 26 ++++++++++++++++++++++++++
 package/giflib/0005-CVE-2026-23868.patch | 29 +++++++++++++++++++++++++++++
 package/giflib/giflib.mk                 |  9 +++++++++
 4 files changed, 88 insertions(+)

diff --git a/package/giflib/0003-CVE-2021-40633.patch b/package/giflib/0003-CVE-2021-40633.patch
new file mode 100644
index 0000000000..4e0070401e
--- /dev/null
+++ b/package/giflib/0003-CVE-2021-40633.patch
@@ -0,0 +1,24 @@
+commit ccbc956432650734c91acb3fc88837f7b81267ff
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Feb 21 18:55:00 2024 -0500
+
+    Clean up memory better at end of run (CVE-2021-40633)
+
+CVE: CVE-2021-40633
+Upstream: https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d51226d..fc2e683 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -525,6 +525,9 @@ static void GIF2RGB(int NumFiles, char *FileName, bool OneFileFlag,
+ 	DumpScreen2RGB(OutFileName, OneFileFlag, ColorMap, ScreenBuffer,
+ 	               GifFile->SWidth, GifFile->SHeight);
+ 
++	for (i = 0; i < GifFile->SHeight; i++) {
++        	(void)free(ScreenBuffer[i]);
++	}
+ 	(void)free(ScreenBuffer);
+ 
+ 	{
diff --git a/package/giflib/0004-CVE-2025-31344.patch b/package/giflib/0004-CVE-2025-31344.patch
new file mode 100644
index 0000000000..2d74b526c4
--- /dev/null
+++ b/package/giflib/0004-CVE-2025-31344.patch
@@ -0,0 +1,26 @@
+commit 7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Feb 18 18:06:50 2026 -0500
+
+    Resolve SourceForge bug #187: CVE-2025-31344
+
+CVE: CVE-2025-31344
+Upstream: https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index b80ebcd..da4fa23 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -327,6 +327,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+ 			GifRow = ScreenBuffer[i];
+ 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+ 			for (j = 0; j < ScreenWidth; j++) {
++				/* Check if color is within color palete */
++				if (GifRow[j] >= ColorMap->ColorCount) {
++					GIF_EXIT(GifErrorString(
++					    D_GIF_ERR_IMAGE_DEFECT));
++				}
+ 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+ 				Buffers[0][j] = ColorMapEntry->Red;
+ 				Buffers[1][j] = ColorMapEntry->Green;
diff --git a/package/giflib/0005-CVE-2026-23868.patch b/package/giflib/0005-CVE-2026-23868.patch
new file mode 100644
index 0000000000..176325ef77
--- /dev/null
+++ b/package/giflib/0005-CVE-2026-23868.patch
@@ -0,0 +1,29 @@
+commit f5b7267aed3665ef025c13823e454170d031c106
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Mar 4 18:49:49 2026 -0500
+
+    Avoid potentuial double-free on weird images.
+
+CVE: CVE-2026-23868
+Upstream: https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gifalloc.c b/gifalloc.c
+index 01a845d..ff70cb0 100644
+--- a/gifalloc.c
++++ b/gifalloc.c
+@@ -349,6 +349,14 @@ SavedImage *GifMakeSavedImage(GifFileType *GifFile,
+ 			 * aliasing problems.
+ 			 */
+ 
++			/* Null out aliased pointers before any allocations
++			 * so that FreeLastSavedImage won't free CopyFrom's
++			 * data if an allocation fails partway through. */
++			sp->ImageDesc.ColorMap = NULL;
++			sp->RasterBits = NULL;
++			sp->ExtensionBlocks = NULL;
++			sp->ExtensionBlockCount = 0;
++ 
+ 			/* first, the local color map */
+ 			if (CopyFrom->ImageDesc.ColorMap != NULL) {
+ 				sp->ImageDesc.ColorMap = GifMakeMapObject(
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 00922ce2db..db9886342c 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -12,6 +12,15 @@ GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
 GIFLIB_CPE_ID_VALID = YES
 
+# 0003-CVE-2021-40633.patch
+GIFLIB_IGNORE_CVES += CVE-2021-40633
+
+# 0004-CVE-2025-31344.patch
+GIFLIB_IGNORE_CVES += CVE-2025-31344
+
+# 0005-CVE-2026-23868.patch
+GIFLIB_IGNORE_CVES += CVE-2026-23868
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
 GIFLIB_INSTALL_LIBS = install-static-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
