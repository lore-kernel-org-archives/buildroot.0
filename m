Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BE1606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KsUBXBrp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E998B408F2;
	Thu, 26 Nov 2026 10:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHcOFDPlXE33; Thu, 26 Nov 2026 10:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFF10408C7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795689821;
	b=LAfMA9U5DT/4+Vpc6EzrFXpUCXeG6R9R1F5s6mZNOOSdj+aFOaRZgQYIJ6MhjmBrcM7B
	 rdMmvmQrXtvlTV6AYE6RwQjQUO34AM/wIUu5JvzTGeMlZFBOWmL2QFJUzf0U3j8ciAsAx
	 XZ37fuHa9GGavf4svNUS6BxT//Few9znFSbKKGBA8cdkJkXT2mt5b5gmYfAirvRVJH4NZ
	 Y2SamNu9L04aHcO2WH9BdBUkuz4erIW//hM0leUhPv+OoYmmbpAEAY4kOmkTusn/iR7b9
	 vzCMhQe9TcoUA7tylxDajz0iUSTdUjCM2Y6UUMlQIE3KoP/rU6zEs/QbbwmoZZl2vbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795689821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jaPAU+458Hoi04lmercSXqMhFIza2UGdbzRBhxSpnGg=;
	b=V4u9uyjT6a5q9KPnzixfc7f1ni7f2UNvpJpNBu20yAs27/0ZQMtN5VzWSvn3ox5a4Pr1
	 x+QpGTgpyT2v3WeU4PcCXrPM3/G633PXBmvthA9qIEvwb/k/GrAjAUaS+S/v9RnfOi6Zz
	 8bbQcYnRwiGM9nL8VyxCDTRLQvGbjOLQhnXJ0oklISz+L7Cbwzup+egfHnaS7tZ2MTwYO
	 33CkUuYTmZr3hYO2L1w9B3bdNGx4LOrPzJ43JhE7zFobMfUMUiPS5pgWuBJ4UwJxR8IJO
	 S7BKqeM/n1UKzr5egjt3IWo8wq1vRK+5v+h382PyAsvwod9cxJdZcC9dj2IyFdtmGhQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795689821;
	bh=jaPAU+458Hoi04lmercSXqMhFIza2UGdbzRBhxSpnGg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KsUBXBrpxEd1YZKEtBUHxd1qTH5L6XjHfSBedfSmcr+oJwals3hgLFA9ywan5DHab
	 L0imTXEnwOl6Z0tOSHwD/QBQ1k1I2QZJzoIzoOkpglPEpg9hjqFbcXkH9KUrjLjBRT
	 3jujPV38EyZNdzlblGgfg3QVhIclzbCxL5p0u0N17pCb8h54fOu/zaHR/qcPsT4cZb
	 sB6tcQFRPgUVkMLxc1XrK5BcqcWL53dHiKlkbVZxmkPyg09ucLV8DhBBUl3I0woeJj
	 Q8uMAg2Vt7lfIUbQlveyjrU8k6gMT7efukjtGue1QBTl9ZPu7FO0j5SDYtFCzCegXW
	 Hr5ArhqV2XJEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF10408C7;
	Thu, 26 Nov 2026 10:43:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E20543
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 10:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E349404A4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 10:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CegI5vKKfLQP for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 10:43:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 61E41401CD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61E41401CD
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 10:43:38 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CD0CA2C850D0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:43:35 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 26 Nov 2026 11:43:10 +0100
Message-ID: <20261126104311.1514091-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnutls: security bump to version 3.8.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following CVEs:

** libgnutls: Fix crash on certificate list memory allocation failure
   On allocation failure, the certificate list pointer and count could
   get out of sync, causing a NULL deref or double-free during session cleanup.
   Both fields are now zeroized before the allocation.
   Reported by Joshua Rogers of AISLE Research Team.
   [GNUTLS-SA-2026-11-18-1, severity: low] [CVE-2026-127039]

** libgnutls: Fix crash in RSA-PSK username copy memory allocation failure
   A missing return on a failed username copy could crash the handshake
   when memory allocation fails.
   The error is now propagated, aborting the handshake.
   Reported by Joshua Rogers of AISLE Research Team.
   [GNUTLS-SA-2026-11-18-2, severity: low] [CVE-2026-127040]

** libgnutls: Make name constraints deinitialization idempotent
   If reinitializing the name constraints were to fail due to memory pressure,
   the verification context cleanup
   could have freed the same internal lists a second time,
   crashing the application.
   The deinitialization functions now clear the pointers after freeing.
   Reported by Xuqing Yang.
   [GNUTLS-SA-2026-11-18-3, severity: low] [CVE-2026-127231]

Full release Notes:
https://gitlab.com/gnutls/gnutls/-/blob/3.8.14/NEWS#L8

Backport an upstream submitted patch[1] to fix the build with nothreads
toolchains which was introduced in 3.8.14.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/2192

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...hreads-toolchain-after-gnulib-update.patch | 75 +++++++++++++++++++
 package/gnutls/gnutls.hash                    |  4 +-
 package/gnutls/gnutls.mk                      |  2 +-
 3 files changed, 78 insertions(+), 3 deletions(-)
 create mode 100644 package/gnutls/0001-fix-build-with-nothreads-toolchain-after-gnulib-update.patch

diff --git a/package/gnutls/0001-fix-build-with-nothreads-toolchain-after-gnulib-update.patch b/package/gnutls/0001-fix-build-with-nothreads-toolchain-after-gnulib-update.patch
new file mode 100644
index 0000000000..a370cd0bd2
--- /dev/null
+++ b/package/gnutls/0001-fix-build-with-nothreads-toolchain-after-gnulib-update.patch
@@ -0,0 +1,75 @@
+From 1a149254ee82a50dc9633fc60a94df1a480a124f Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <buildroot@bubu1.eu>
+Date: Wed, 25 Nov 2026 19:05:00 +0100
+Subject: [PATCH] fix build with nothreads toolchain after gnulib update
+
+Gnulib made including glthread/once.h from glthread/lock.h conditional
+in [1]. This was synced to gnutls in [2] and first released in
+gnutls 3.8.14, so starting from there the build fails with a
+nothreads toolchain:
+
+    In file included from rnd.c:26:
+    ./../locks.h:77:9: error: unknown type name 'gl_once_t'
+       77 | typedef gl_once_t *gnutls_once_t;
+            |         ^~~~~~~~~
+    record.c:2181:8: error: 'errno' undeclared (first use in this function)
+
+Gnutls directly uses gl_once_t from once.h, so include it from
+lib/locks.h. Additionally two .c files relied on getting errno.h
+through gnulib's lock.h, which the same gnulib commit moved to the
+corresponding .c file, so it's no longer visible to use. Include
+errno.h directly here.
+
+[1] https://gitlab.com/libidn/gnulib-mirror/-/commit/250881c4f839e18737a1d6d807337a76015cc722
+[2] https://gitlab.com/gnutls/gnutls/-/commit/2635e27c1845f656f0a502854065f8b23ec2957f
+
+Upstream: https://gitlab.com/gnutls/gnutls/-/merge_requests/2192
+Reported-by: Bernd Kuhls <bernd@kuhls.net>
+[Drop bootstrap.conf hunk from upstream patch that's not relevant for
+building from release tarball]
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ lib/kx.c     | 1 +
+ lib/locks.h  | 1 +
+ lib/record.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/lib/kx.c b/lib/kx.c
+index 4f417a20a..aa940f3e1 100644
+--- a/lib/kx.c
++++ b/lib/kx.c
+@@ -36,6 +36,7 @@
+ #include "state.h"
+ #include "datum.h"
+ #include "mbuffers.h"
++#include <errno.h>
+ 
+ /* This file contains important thing for the TLS handshake procedure.
+  */
+diff --git a/lib/locks.h b/lib/locks.h
+index 0e6275bb0..160e65598 100644
+--- a/lib/locks.h
++++ b/lib/locks.h
+@@ -27,6 +27,7 @@
+ #include "gnutls_int.h"
+ #include "system.h"
+ #include "glthread/lock.h"
++#include "glthread/once.h"
+ 
+ extern mutex_init_func gnutls_mutex_init;
+ extern mutex_deinit_func gnutls_mutex_deinit;
+diff --git a/lib/record.c b/lib/record.c
+index 67b0f7c55..dd3eec4f4 100644
+--- a/lib/record.c
++++ b/lib/record.c
+@@ -55,6 +55,7 @@
+ #include <xsize.h>
+ #include "locks.h"
+ #include "system/ktls.h"
++#include <errno.h>
+ #include <intprops.h>
+ 
+ struct tls_record_st {
+ 	uint16_t header_size;
+-- 
+2.56.1
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 99a721d208..cd8a1ade12 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.13.tar.xz.sig
-sha256  ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e  gnutls-3.8.13.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.14.tar.xz.sig
+sha256  7e2d258071f5db9620aa7ff34259331d004f7beafa3eb18560cfaf60acfbf02a  gnutls-3.8.14.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ae1caaa221..492e19e65f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
