Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C1CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B07D61230;
	Fri, 19 Sep 2025 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Pvo29uheZUu; Fri, 19 Sep 2025 18:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9528E61233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9528E61233;
	Fri, 19 Sep 2025 18:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92875150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9006B40CB3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCyA7hbbL0Ft for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C71E5404A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71E5404A7
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C71E5404A7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:21:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EDEF631E02D3; Fri, 19 Sep 2025 20:21:00 +0200 (CEST)
Date: Fri, 19 Sep 2025 20:21:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758306061; bh=Mwpompy0hfmZpwTgfVck6cR/u8NNH6I/j/JEtIdeDFY=;
 h=Date:From:To:Subject:From;
 b=dwXFWJdENncPltWOsgeC1AK6jTitTaebt5IbYUMHPbQKLu2nQbU55Rkn+TeMfqFb1
 75q5Z/6FhYKvpRMB0dNkztEGPcrUqAyJbjrcK6glY703g0cmTL2mIKuj9PjYHzneYJ
 f0ucVlMiEaxoUPAhBA6VZyQrefWdLqeftDXL9xT5bRImmlYmm/B04QB5ByNAflytlI
 P+Ybq4AOhN6mohIsiRyHL4LABv/aPgexlXR2EhjAXGiAQGn6g6UsOQx7xTiOCf48SO
 996GA8HQQGVlV3QOdni6Xn/fNNM7wA4+Zm6esMrAaPYCcPYtXQEdT2M7hHg49N86ZL
 OHugG2FctUBRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=dwXFWJdE
Subject: [Buildroot] [PATCH] package/uclibc: bump to 1.0.55
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Finally the aarch64 tls bug is fixed. (python 3.13 segfault)
Unfortunately it is not covered by any testcase of uClibc-ng-test.

Here is the git shortlog for the release:

Marius Melzer (1):
      malloc-standard: Fix truncation problem in malloc

Waldemar Brodkorb (5):
      Fix Sysvipc for ARM, AARCH64, RISCV64, KVX and m68k
      remove uClibc specific gettext_printf
      aarch64: do not force tls-model in CPU_CFLAGS, this isn't required
      aarch64: respect r_addend for TLSDESC relocations
      bump version for 1.0.55 release

yliu (5):
      mips32: Preventing FORCE_FRAME_POINTER from being optimized away
      mips32: Define __IPC_64 according to kernel version
      time64: fixed msgctl/semctl/shmctl result errors for for MIPS32/RISCV32
      time64: fix *ctl functions in mips32eb/mips64
      time64: fix *ctl functions in mips32eb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---

Dear stable Maintainers, it would be nice if you could update all
stable branches with this maintenance release.

---
 ...emove-uClibc-specific-gettext_printf.patch | 34 -------------------
 package/uclibc/uclibc.hash                    |  4 +--
 package/uclibc/uclibc.mk                      |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch

diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
deleted file mode 100644
index 96736da562..0000000000
--- a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 15 Aug 2025 20:29:52 +0200
-Subject: [PATCH] remove uClibc specific gettext_printf
-
-Other C libraries like musl/glibc does not define it.
-Including stdio.h here breaks Grub2 compilation with
-gcc 14 and above.
-Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
----
- include/libintl.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/include/libintl.h b/include/libintl.h
-index b7123a963..6d8b9f342 100644
---- a/include/libintl.h
-+++ b/include/libintl.h
-@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
- 
- #endif
- 
--#include <stdio.h>
--#define gettext_printf(args...) printf(args)
--
- /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
-    including libintl.h */
- #include <locale.h>
--- 
-2.47.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 8d8b333958..56174a33b8 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.54/uClibc-ng-1.0.54.tar.xz.sha256
-sha256  d1ecf65cc2217dd4118a4dafc1abf27c585b5cb578f3bd7991fc640b79643ff2  uClibc-ng-1.0.54.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
+sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1e49463dd4..0c303d77f8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.54
+UCLIBC_VERSION = 1.0.55
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
