Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FCCC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B8A381315;
	Fri, 31 Jul 2026 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZk4xlNp0why; Fri, 31 Jul 2026 11:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDA281303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499116;
	bh=6FPoS+H0Kgbc0c4F6nRSxuA58Tzbx+/FxOC+TeLaAwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mbD5qB163R9C3smyi5yYh7scNc6oSuP3eNdCI4W7/rPVmq5+mDYpQg3dB4sGeo83g
	 CaBAdlaD6G3y7cqv0KwJofY3Ns1hP2SFcf0gRDNIPq8V3xq/k86AEm4kF7gMSDqCaK
	 M0NSUkaockgKtNAPBFzrsF3P3d+2svjQJo2j4VTNh0o8njU6AMhuBBUgL2wGF8TYpB
	 /glBcDkHOGqdwRR3GlHnNcOf7hHogBv5f4SJutx1ErGhAYEy7JQ1nVagrv2a4fxSTt
	 1Ms6UDfxzDP6i2AmeFmhKT494XAPjpgjJNqNTfDN3R2QnKZ80xPI9xPtzIg0l6OWLm
	 mLtz0xmPeCf1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDA281303;
	Fri, 31 Jul 2026 11:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B1823F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 623D8810A8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAqPyyyd-ZrZ for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33042810B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33042810B1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24F488B742; Fri, 31 Jul 2026 11:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 135fa553df943fd25846e68a8a94acdb20fe638a
X-Git-Newrev: 0552abf7cc3f81524343465b3a44419c2a707941
X-Patchwork-Hint: ignore
Message-Id: <20260731115730.24F488B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/binutils: fix
 license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0552abf7cc3f81524343465b3a44419c2a707941
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

A few headers outside libiberty use LGPL-2.1+, too, and other headers
and some scripts use GPL-2.0+.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 95b77f7a71fdb312421dab8839d6fdfa4964c9eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/binutils/binutils.hash | 1 +
 package/binutils/binutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index ec0a382501..0ad3b19ca4 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,5 +7,6 @@ sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  binutils-gdb-arc-2023.09-release.tar.gz
 
 # locally computed
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2b5064d739..1606e6d0ac 100644
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
