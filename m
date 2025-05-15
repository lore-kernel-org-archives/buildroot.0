Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B51C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8ED70D29;
	Mon, 19 May 2025 10:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUP2IShF17si; Mon, 19 May 2025 10:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2742F70D18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2742F70D18;
	Mon, 19 May 2025 10:59:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5BC3D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B2A40D61
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yI8n7lz0EKck for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE9A416F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCE9A416F1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D955F82A2E; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 07:51:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c722fa1cf245039a28d3f10430d1841ff44fff4f
X-Git-Newrev: a4249a20243bb620d095a36e78d3722aa29f8da7
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.D955F82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libraw: security bump
 to version 0.21.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4249a20243bb620d095a36e78d3722aa29f8da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2025-43961: metadata/tiff.cpp has an out-of-bounds read in the
    Fujifilm 0xf00c tag parser.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
  - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

- CVE-2025-43962: phase_one_correct in decoders/load_mfbacks.cpp has
    out-of-bounds reads for tag 0x412 processing

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43962
  - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

- CVE-2025-43963: phase_one_correct in decoders/load_mfbacks.cpp allows
    out-of-buffer access

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43963
  - https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964

- CVE-2025-43964: tag 0x412 processing in phase_one_correct in
    decoders/load_mfbacks.cpp does not enforce minimum w0 and w1 values.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43964
  - https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0

For more details on the version bump, see the release notes:
  - https://github.com/LibRaw/LibRaw/releases/tag/0.21.4
  - https://github.com/LibRaw/LibRaw/releases/tag/0.21.3
  - https://github.com/LibRaw/LibRaw/compare/0.21.2...0.21.4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.hash | 2 +-
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 838c598d78..36d9d31948 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
+sha256  6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63  LibRaw-0.21.4.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 211b67f935..e320b2d835 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.21.2
+LIBRAW_VERSION = 0.21.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
