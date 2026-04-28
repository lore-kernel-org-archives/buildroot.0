Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B1FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524EB83CE2;
	Tue, 28 Apr 2026 19:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18OBZ-_D051k; Tue, 28 Apr 2026 19:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6654083D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403465;
	bh=J7IwokMPLHJJYDvisnw+cNKLNRUaQXYxhndR5fLcm8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T7M/j/t3MEwO3612JSCMIxw5lQuIasfkuAvyHo+UupapnYM64Z/pFwslKQ8KJKxWt
	 J1xEUVsX/PxFIMWIGCa3wkt7P87YuJGBQ2PgBmgsY1Du6vOLz8MqtAyJiyh3EY5Q3t
	 rCNel9qf9eDuuCMbXiUBdLz5DEPzm8K/Ccb0dweyP5ai4KfDTRJV7Q2EfUM22w2aYW
	 M6uptE0hGtObfnfpZt6NXgEQD/rfULOvX+iQLYIiBPvGcHJPrHjdLZQEyrLziUt3aS
	 z6FxSVCVcxBb7l703IWTjdHSshsJbct51noAiprqe+BjSVTnkGzXzV9fi3qDXcSn+C
	 sSkB98E3qU+xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6654083D17;
	Tue, 28 Apr 2026 19:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C81231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7D8983D17
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igNf7ot4EjEm for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA7983CE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA7983CE2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:11:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8996383986; Tue, 28 Apr 2026 19:11:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:57:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09ce45ded6b1190dfcf675ff4f15420495194c18
X-Git-Newrev: 12b88015a25c73ad40cf29805be6f826a6dc5bb1
X-Patchwork-Hint: ignore
Message-Id: <20260428191103.8996383986@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump version to 31.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12b88015a25c73ad40cf29805be6f826a6dc5bb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://bitcoincore.org/en/releases/31.0/
"The minimum supported GCC compiler version has been raised to 12.1"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitcoin/Config.in    | 6 +++---
 package/bitcoin/bitcoin.hash | 6 +++---
 package/bitcoin/bitcoin.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 66c8ebbfda..835961718c 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_HOST_CMAKE_AT_LEAST_3_22
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BITCOIN_WALLET
 
 endif
 
-comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 11"
+comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 12"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_11
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_12
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 89fe6ce280..b1576d5e8a 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS.asc
-sha256  6fd00b8c42883d5c963901ad4109a35be1e5ec5c2dc763018c166c21a06c84cb  bitcoin-30.2.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-31.0/SHA256SUMS.asc
+sha256  0ba0ef5eea3aefd96cc1774be274c3d594812cfac0988809d706738bb067b3e3  bitcoin-31.0.tar.gz
 
 # Hash for license file
 sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 89dacaf9c7..d7019f2aa9 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 30.2
+BITCOIN_VERSION = 31.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
