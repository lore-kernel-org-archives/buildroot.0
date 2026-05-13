Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5694CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E231615F9;
	Fri, 15 May 2026 13:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psOgWvgoNqQi; Fri, 15 May 2026 13:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC9D615D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851820;
	bh=O1YHhGvA3QgAHhgROqG0A4BsIE0ViTYcnQOi2VUUGk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K7dq4mbXL8fkx5R4zf+PMH4HTBC6YxsNWVZ3BvWoFY7+n4pA2WcAVmd0Bz4ofd7ob
	 pPm/FejYQvg5yG+YeHGCIY4NbQdIYzOWutVV6dX9VYnMVZH7liTpC55ODpPGWVaNIu
	 xfN7yYaaPQVgtUD6Kark1C9jQ999l+4S12Ge/hkQVh6DPQIjY4GjXWL7UERX3nQhN3
	 1pAbIH7l9OZ3rnlHPPxhDYOFx4BWfTuEupvileYkdiOpn6keoXmX5cNWQmO9nSqobJ
	 bJ/kxT/vRBzeoCC4pHXfq2DxvTbSUsplrEkIg5wbyeD1mPR02MV701czG5qTr4WqEK
	 mH2pG2vzyg+oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC9D615D8;
	Fri, 15 May 2026 13:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 115D942B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCE441A74
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKaW6_w_-HGm for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECC441B05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CECC441B05
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EBB786352; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:50:48 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3db14ab765265ba6f821b8a843c3fe058f74f792
X-Git-Newrev: 9dbdc05a97660768375bf11d7d96f53260ac78f7
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.2EBB786352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libsodium:
 security bump version to 1.0.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dbdc05a97660768375bf11d7d96f53260ac78f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/jedisct1/libsodium/releases/tag/1.0.22-RELEASE
https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE

Updated license hash due to copyright year bump:
https://github.com/jedisct1/libsodium/commit/80c6bab4518aecd197d830c145b5d23e9b932ea3

Switched to bz2 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4d46b275ce6ac61558e8c3fcb1e2191b16c2454)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index ae4765a2ab..ef982ea759 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking Minisign signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
-sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
-sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.22.tar.bz2.minisig
+sha256  51b93737bf62e8549b0e94dce0fba92169e31c8ecc160883460a9bdaa6d2c298  libsodium-1.0.22.tar.bz2
+sha256  508a76d186356c0dd807a670ef510964f8724557024796a2c426c6c0e19ab683  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 7dd763e145..5f62a66246 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.20
+LIBSODIUM_VERSION = 1.0.22
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
+LIBSODIUM_SOURCE = libsodium-$(LIBSODIUM_VERSION).tar.bz2
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
