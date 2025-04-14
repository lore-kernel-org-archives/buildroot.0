Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C74C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F6581FC4;
	Mon, 14 Apr 2025 21:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBcImeuWTB91; Mon, 14 Apr 2025 21:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E4F81F30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E4F81F30;
	Mon, 14 Apr 2025 21:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB026CF
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A10C640C62
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPPNvcw0FdSI for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F9E40570
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F9E40570
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DE8284701; Mon, 14 Apr 2025 21:39:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 23:32:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efdf0cdbcb2cf11d54ef8eee123529f264fe8ce9
X-Git-Newrev: 9abf662cfd35c101b2c4c0e191adc3b949846663
X-Patchwork-Hint: ignore
Message-Id: <20250414213903.8DE8284701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: security bump to
 version 10.05.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9abf662cfd35c101b2c4c0e191adc3b949846663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2025-27830: An issue was discovered in Artifex Ghostscript before
  10.05.0.  A buffer overflow occurs during serialization of DollarBlend in
  a font, for base/write_t1.c and psi/zfapi.c.

- CVE-2025-27831: An issue was discovered in Artifex Ghostscript before
  10.05.0.  The DOCXWRITE TXTWRITE device has a text buffer overflow via
  long characters to devices/vector/doc_common.c.

- CVE-2025-27832: An issue was discovered in Artifex Ghostscript before
  10.05.0.  The NPDL device has a Compression buffer overflow for
  contrib/japanese/gdevnpdl.c.

- CVE-2025-27833: An issue was discovered in Artifex Ghostscript before
  10.05.0.  A buffer overflow occurs for a long TTF font name to
  pdf/pdf_fmap.c.

- CVE-2025-27834: An issue was discovered in Artifex Ghostscript before
  10.05.0.  A buffer overflow occurs via an oversized Type 4 function in a
  PDF document to pdf/pdf_func.c.

- CVE-2025-27835: An issue was discovered in Artifex Ghostscript before
  10.05.0.  A buffer overflow occurs when converting glyphs to Unicode in
  psi/zbfont.c.

- CVE-2025-27836: An issue was discovered in Artifex Ghostscript before
  10.05.0.  The BJ10V device has a Print buffer overflow in
  contrib/japanese/gdev10v.c.

- CVE-2025-27837: An issue was discovered in Artifex Ghostscript before
  10.05.0.  Access to arbitrary files can occur through a truncated path
  with invalid UTF-8 characters, for base/gp_mswin.c and base/winrtsup.cpp.

https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10050

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c64ab80eb0..8f44c444f1 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/SHA512SUMS
-sha512  2e711f8ba86491570684f13851190f41e6eee87dcfacce0a4adfd09a4523abf2e0b6727f0958ee2683834218f5705675b531fd2419cb7fc314ed4becf51f3ce3  ghostscript-10.04.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/SHA512SUMS
+sha512  5a8695726ea2c70fd153bac47696c9e9046e9f74eccf8eea500794f79f09d5d2be70597c9d85c0b51b71d46d7974f50c5c9e3b0e242816bb84e64f1098a306a6  ghostscript-10.05.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index a29ab9b66e..9e2342e5ac 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.04.0
+GHOSTSCRIPT_VERSION = 10.05.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
