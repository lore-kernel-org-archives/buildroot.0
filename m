Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5630CCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 07:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6C361115;
	Fri, 29 May 2026 07:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEUVUdQTX4WQ; Fri, 29 May 2026 07:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9EB61117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780038066;
	bh=kShhHIvQdg6q0ynAI+HBNm+AGo0AHVdaf2VcO1083KQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NetkvpLimd8zAcvx5CYoDj57rajDrG2E/j0r31FNevPXROToKqp1nZ63MoTEQgxbu
	 0BCne4oqe/JyCggpoM/WPyYsyFcNx5TNAIAr4LwPu4fLl4xWi/RxwShtNe8+wGeakc
	 V8fCZ+QMnMXWN03ClAv+VMcS445opguI0QOcGAEYEFKq4sqnzu2FsptmHkGYD79hhq
	 csmGHdRXU4E2uZKXKfawc2G/Y23vnpOanGlhbT+KChSaSRPpDzlkkwEmgtLd1W9j16
	 Jr0/X7OpbtTx8iWHRP9hnD9eqX4eVdeV+llcYVc7Ei85YBD5XJo/BM3bdU6WTqrbIy
	 tp+GCtyulOTJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9EB61117;
	Fri, 29 May 2026 07:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CFBF28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0AA940606
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3Bj0hO6f02Y for <buildroot@buildroot.org>;
 Fri, 29 May 2026 07:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16564400C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16564400C6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:01:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C411873A1; Fri, 29 May 2026 07:00:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 09:00:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5a723f35d57d25a084a9e907e07d281cb17d3c0
X-Git-Newrev: b057c91e4e8eb758b034b6b9f0587104ea52ac0d
X-Patchwork-Hint: ignore
Message-Id: <20260529070051.9C411873A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpcbind: bump version to 1.2.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b057c91e4e8eb758b034b6b9f0587104ea52ac0d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/1.2.9-ChangeLog/download

Fixes some memory leaks.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/rpcbind/rpcbind.hash | 6 +++---
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index e268a0733a..3059751050 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.8/
-sha1  2f733aba26075ca91fda3787890232da3d07c06e  rpcbind-1.2.8.tar.bz2
+# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
+sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
 
 # Locally computed:
-sha256  964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5  rpcbind-1.2.8.tar.bz2
+sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 3b496ee2c6..96025624ff 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.8
+RPCBIND_VERSION = 1.2.9
 RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
