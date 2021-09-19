Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7275C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338786126A
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 338786126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03FA282B61;
	Sun, 19 Sep 2021 12:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bq0Zgaq859BE; Sun, 19 Sep 2021 12:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4115B80F5D;
	Sun, 19 Sep 2021 12:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDC61BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59EEF40351
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUZ54_ShT9lU for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83D6A402FE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0EBA18B7A9; Sun, 19 Sep 2021 12:21:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:05:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 984a748b1626d565b94d936298d4573a081bb074
X-Git-Newrev: e611718da1bbb8721e56fd59f7583208e58314fa
X-Patchwork-Hint: ignore
Message-Id: <20210919122148.0EBA18B7A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump to version 3.70
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e611718da1bbb8721e56fd59f7583208e58314fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch that has been upstream(even if with another authorship).

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.70_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...sha512.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 ----------------------
 package/libnss/libnss.hash                         |  4 +-
 package/libnss/libnss.mk                           |  2 +-
 3 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
deleted file mode 100644
index f925f20051..0000000000
--- a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 434d79c52db5b680accc531572319bd7094fa470 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Aug 2021 23:19:01 +0200
-Subject: [PATCH] lib/freebl/sha512.c: fix SHA256 redefinition on ARM big
- endian
-
-For an unknown reason, SHA256_{Compress,Update}_Native are defined in
-lib/freebl/sha512.c if IS_LITTLE_ENDIAN is undefined since version 3.68
-and
-https://github.com/nss-dev/nss/commit/e1e00f21f2d73e0d5d27651ad5606efa5714abe4
-
-This raises the following build failure on ARM big endian:
-
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
-sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
-sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
-
-Revert this change as it seems completely unrelated to the commit title
-"Bug 1655493 - Support SHA2 HW acceleration using Intel SHA Extension"
-
-Fixes:
- - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nss/lib/freebl/sha512.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/sha512.c b/nss/lib/freebl/sha512.c
-index 946ab9f7f..3ec414b52 100644
---- a/nss/lib/freebl/sha512.c
-+++ b/nss/lib/freebl/sha512.c
-@@ -164,7 +164,7 @@ static void SHA256_Compress_Generic(SHA256Context *ctx);
- static void SHA256_Update_Generic(SHA256Context *ctx, const unsigned char *input,
-                                   unsigned int inputLen);
- 
--#if !defined(USE_HW_SHA2) || !defined(IS_LITTLE_ENDIAN)
-+#if !defined(USE_HW_SHA2)
- void
- SHA256_Compress_Native(SHA256Context *ctx)
- {
--- 
-2.30.2
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8073913e7c..afb6d5602e 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_1_RTM/src/SHA256SUMS
-sha256  bbdbd248c25e2faf498edbdd2ffd5896b54cfa35bd2e450813b491f805c754e0  nss-3.69.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_70_RTM/src/SHA256SUMS
+sha256  2b89abb8601ee405be8ac5b5703d71f1fb38a51c3a64a3d834387f78b325511b  nss-3.70.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 83954cc124..3f8f0e1789 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.69.1
+LIBNSS_VERSION = 3.70
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
