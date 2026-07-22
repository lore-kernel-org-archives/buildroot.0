Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B4BC44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082A680BD6;
	Wed, 22 Jul 2026 20:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWyuMGK5_rWu; Wed, 22 Jul 2026 20:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C368A80F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751862;
	bh=G5sAW1fd8hLrPPeZpeA+NWvWeXzqahsZBBVzbu82/8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=idnvbOjj4qEIsAycc9/z6TleHhkbjCTnSeNh7whFjlqX+8Isfha9rJ7JqGC+z4DuK
	 nSr9Q3HvYndPufqnlqagC2mmAR2SPTefVwuRnJrxybErzUPJELsenO9DIfm9qD5Lf0
	 +pO3Gky8eXlbq+LxZv2f91UYXKXuRvooNhKEyi5nQQO8kueAkErRtQR4bAF6X6pWKm
	 98Y/ZkxPAsglNQxpDaaiqou5XeU4ri6ABx8Z/TRDYUMm93G/1CF1HTXYIbzBYuLMmr
	 AydNUlHehPcxFePCxlooYmpFbsS7AU/joR7tbrflkzbo6jH39V6MwvR7x1rhyxDyd2
	 So+RwD1xF7SNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C368A80F52;
	Wed, 22 Jul 2026 20:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0F8F1B8
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA063400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vydTzitYTPRo for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D888C40289
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D888C40289
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D548A346; Wed, 22 Jul 2026 20:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15e2433e1f3e3d631c47495d1413d4a4ba25d815
X-Git-Newrev: 95b77f7a71fdb312421dab8839d6fdfa4964c9eb
X-Patchwork-Hint: ignore
Message-Id: <20260722202337.10D548A346@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: fix license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95b77f7a71fdb312421dab8839d6fdfa4964c9eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A few headers outside libiberty use LGPL-2.1+, too, and other headers
and some scripts use GPL-2.0+.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/binutils.hash | 1 +
 package/binutils/binutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 14fd65d4a9..9ba6689d46 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,5 +7,6 @@ sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
 
 # locally computed
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..f39d24e986 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -27,8 +27,8 @@ BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTION
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
-BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_LICENSE = GPL-3.0+, GPL-2.0+, LGPL-2.1+
+BINUTILS_LICENSE_FILES = COPYING COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
 # 0003-objdump-memleak.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
