Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D38FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8897861032;
	Sun,  3 May 2026 16:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S14EYXXFPBI2; Sun,  3 May 2026 16:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36BA561009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777824111;
	bh=GZwlkVqOkuIGfHiyWDWIL+c2l6GUQZDhJgZpb9lYk6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pIibkzQmf+syipOhM6mwhIKt17wQhmhWZG3rIvEk2EcHsTgeg115iSd/BdjAYx1gK
	 fn+RERb+UnKbLXAIZXGLvEmSSK4aE8xN8UC6JcX7bUwEKyPiB2+rRV2FSl1L9DGxcC
	 l5E3Nv6Ea6mCgLl/dq5sz26r228t+JwcOt9URGrgGI7Dqkyrbr/ZGXAO5+35qASLS4
	 JV1403aTgOhU6fXTmboqJJDf9x5ulXetZR+AsTSBWTxJxb2s1QuLHpzsCTJPzRKoWf
	 pdwMoqW2PPRqm90Aq+D/9NoB7PvIkA52nNyra7Lp8PJXI6EKPuzNLInGYfdoB23fnA
	 5DY1nfB3YLPJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36BA561009;
	Sun,  3 May 2026 16:01:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7CA425D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB274046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOE5V-3q897l for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0FAF403D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0FAF403D7
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:01:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 849AA8403A; Sun,  3 May 2026 16:01:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 17:37:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b136c89ffed35c30dff1802924a4dcf9bdab798
X-Git-Newrev: d4d46b275ce6ac61558e8c3fcb1e2191b16c2454
X-Patchwork-Hint: ignore
Message-Id: <20260503160148.849AA8403A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsodium: security bump version
 to 1.0.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4d46b275ce6ac61558e8c3fcb1e2191b16c2454
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jedisct1/libsodium/releases/tag/1.0.22-RELEASE
https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE

Updated license hash due to copyright year bump:
https://github.com/jedisct1/libsodium/commit/80c6bab4518aecd197d830c145b5d23e9b932ea3

Switched to bz2 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
