Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D30F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22318816EE;
	Fri, 17 Apr 2026 15:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zk104dCVrBDV; Fri, 17 Apr 2026 15:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F54816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439220;
	bh=OKS6M0lBmCaREQIcw4598WD0M3x04dxR8NzTXOFnSEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FbIsnMdjqvtviOAQei7ShmCfkAzRkPajA8vrcatqKu5y2Na2+wlIwgN+CvF5oary3
	 xQA/3+94sn/m6g0WLCSf6aoHy64snMzyGx4/ZYJY+7h4Xfd1Ki/q0OAWbm+Q4Dn6kX
	 VGOU4uHvhIFqmw4/J4zWu9ssxmuCt8f6/hFRd7b7qwxAqEdx/ms5Q8TvjKQjQZkar5
	 UQtbsHY2LI2WrQ4ne8zh1wx+2Qp+3pHuXAm8jkuZRF1pnP5dAlKcrl6f3l/AC/k7zR
	 WWqTdyHj5xF4DC6+kCtEn5+YNj+i9XhaJK33fyzQC/PPxlZHhuanN5foqJ4zVFxa7s
	 IPU2/k/rD7HaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F54816E5;
	Fri, 17 Apr 2026 15:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B27259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D52340606
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj--bt5KfrwY for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7480540607
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7480540607
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266A1819B9; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 16:00:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d2e7e6cb654dbd489ece1351d06308c0dc3347ee
X-Git-Newrev: 89b88d0c6c43c65b0a9144013885970070821739
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.266A1819B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/quickjs: bump to
 version 2025-04-26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89b88d0c6c43c65b0a9144013885970070821739
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

diff LICENSE: removed trailing space

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c5c7c44fa5fd7653a9746748ef573e74e49239f6)
[thomas: remove backport]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...verflow-in-bjson-string-and-bigint-reader.patch | 29 ----------------------
 package/quickjs/quickjs.hash                       |  4 +--
 package/quickjs/quickjs.mk                         |  5 +---
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
deleted file mode 100644
index ae4d8cf43e..0000000000
--- a/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a Mon Sep 17 00:00:00 2001
-From: Fabrice Bellard <fabrice@bellard.org>
-Date: Mon, 7 Apr 2025 18:40:49 +0200
-Subject: [PATCH] fixed buffer overflow in BJSON String and BigInt reader
- (#399)
-
-Upstream: https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a
-CVE: CVE-2025-46688
-[thomas: backport JS_ReadBigInt function not present in 2024-01-13]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- quickjs.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/quickjs.c b/quickjs.c
-index 9be262e50..b2470ba64 100644
---- a/quickjs.c
-+++ b/quickjs.c
-@@ -35652,6 +35652,10 @@ static JSString *JS_ReadString(BCReaderState *s)
-         return NULL;
-     is_wide_char = len & 1;
-     len >>= 1;
-+    if (len > JS_STRING_LEN_MAX) {
-+        JS_ThrowInternalError(s->ctx, "string too long");
-+        return NULL;
-+    }
-     p = js_alloc_string(s->ctx, len, is_wide_char);
-     if (!p) {
-         s->error_state = -1;
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 30613b982a..798c857a10 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c4bf8f895bfa54beb486c8d1218112771ecfc5ac3be1036851ef41568212e03  quickjs-2024-01-13.tar.xz
-sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
+sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
+sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 215deb8137..e2170b2978 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2024-01-13
+QUICKJS_VERSION = 2025-04-26
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
@@ -12,9 +12,6 @@ QUICKJS_LICENSE_FILES = LICENSE
 QUICKJS_CPE_ID_VALID = YES
 QUICKJS_INSTALL_STAGING = YES
 
-# 0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
-QUICKJS_IGNORE_CVES += CVE-2025-46688
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QUICKJS_EXTRA_LIBS += -latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
