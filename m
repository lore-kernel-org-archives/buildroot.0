Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5F7FF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 08:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC82422A0;
	Wed, 29 Apr 2026 08:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIeD2ZsjQ6XI; Wed, 29 Apr 2026 08:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F274229E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777452391;
	bh=0Ac+neTUVn/dEFvu0vzkLalbOQDbBIG4P4AOvYJuje8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qf/nwIJl4evdEp3+9uCRxER8kpyrFLND3hgWQxi639itWpQbJ18q+ELRkvTz92RKR
	 Mno8Q9j6sIL2SlsAHA0+zqgLjqGe/zxocblh/m/kRA8vQh71vFY80vLqBeHPTdRKq9
	 FHhOpXSBugLmRCAofra/fhuW1xDhtrWAM6LOZGSTV4DSKSiZ53Zv/oFoKLKUfoceE0
	 0naf8waROkfMP2dr3qf/MgTK3+wsRL+LIWEEhHZys9N2hiN4RVaEloUnV52FIyvc28
	 00Js6Ij1U+/cxXP5B5w9k2/exEfomwWtI1HyMGGQUIp5Ga9oIGfMj/i1BsJ8phfug9
	 GEjg2hXsjNQ5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F274229E;
	Wed, 29 Apr 2026 08:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7118D231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 575AF42296
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo3vTDsFTOJr for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 08:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A82B42294
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A82B42294
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52767800A3; Wed, 29 Apr 2026 08:46:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 10:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd9e30470f66fc491b7a4cef2b0c803e87095b71
X-Git-Newrev: baa0a1365335560bdfec6339cfb4b5785dafe3c9
X-Patchwork-Hint: ignore
Message-Id: <20260429084629.52767800A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: security bump version to
 0.27.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/baa0a1365335560bdfec6339cfb4b5785dafe3c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenSC/OpenSC/blob/0.27.1/NEWS

Switched to sha256 tarball hash provided by upstream.

Removed patch which is included in this release.

Fixes the following CVEs:
* CVE-2025-13763: Several uses of potentially uninitialized memory
                  detected by fuzzers
* CVE-2025-49010: Possible write beyond buffer bounds during processing
                  of GET RESPONSE APDU
* CVE-2025-66215: Possible write beyond buffer bounds in oberthur driver
* CVE-2025-66038: Possible read beyond buffer bounds when parsing
                  historical bytes in PIV driver
* CVE-2025-66037: Possible buffer overrun while parsing SPKI

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...-disable-wrap-unwrap-test-until-OpenSC-17.patch | 41 ----------------------
 package/opensc/opensc.hash                         |  4 +--
 package/opensc/opensc.mk                           |  2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
deleted file mode 100644
index 9bf601370a..0000000000
--- a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 768c9bfcd91206f0d85cd4757fde48e00850a014 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 6 Jan 2025 22:36:10 +0100
-Subject: [PATCH] pkcs11-tool: disable wrap/unwrap test until OpenSC#1796 is
- resolved
-
-Similar to ab74fae4d71d1705b77b9459141987a95dcfc91e ("pkcs11-tool:
-disable wrap/unwrap test until OpenSC#1796 is resolved"), but for
-0.26, since OpenSC#1796 is still open.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/OpenSC/OpenSC/pull/3303
----
- src/tools/pkcs11-tool.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
-index d701d76d6..871a39977 100644
---- a/src/tools/pkcs11-tool.c
-+++ b/src/tools/pkcs11-tool.c
-@@ -7681,7 +7681,7 @@ static int test_verify(CK_SESSION_HANDLE sess)
- 	return errors;
- }
- 
--#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
-+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
- #else
- #ifdef ENABLE_OPENSSL
- static int wrap_unwrap(CK_SESSION_HANDLE session,
-@@ -7805,7 +7805,7 @@ static int wrap_unwrap(CK_SESSION_HANDLE session,
-  */
- static int test_unwrap(CK_SESSION_HANDLE sess)
- {
--#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
-+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
- 	/* temporarily disable test, see https://github.com/OpenSC/OpenSC/issues/1796 */
- 	return 0;
- #else
--- 
-2.47.1
-
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
index e12d2d4bfa..b24a6bca98 100644
--- a/package/opensc/opensc.hash
+++ b/package/opensc/opensc.hash
@@ -1,5 +1,5 @@
-# Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
-sha256  837baead45e1505260d868871056150ede6e73d35460a470f2595a9e5e75f82b  opensc-0.26.0.tar.gz
+# From https://github.com/OpenSC/OpenSC/releases/tag/0.27.1
+sha256  976f4a23eaf3397a1a2c3a7aac80bf971a8c3d829c9a79f06145bfaeeae5eca7  opensc-0.27.1.tar.gz
 
 # Computed locally
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 11d1507d45..dbc83c2b0e 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSC_VERSION = 0.26.0
+OPENSC_VERSION = 0.27.1
 OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
