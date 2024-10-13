Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A832ACF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 16:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70CA8109E;
	Sun, 13 Oct 2024 16:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyuHAgJLHajF; Sun, 13 Oct 2024 16:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90A080FFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E90A080FFB;
	Sun, 13 Oct 2024 16:48:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7CD71BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CEA40177
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 16:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6trOl_odb_ZA for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 16:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49A71400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A71400A6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49A71400A6
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 16:48:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CB305B0051B;
 Sun, 13 Oct 2024 18:48:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 18:47:58 +0200
Message-ID: <20241013164759.3729983-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728838093;
 bh=O9C8Ofn0Zne1grrNTsmu5slsxfZiT3eK4nUJzAnZKis=;
 h=From:To:Cc:Subject:Date:From;
 b=DbKrwxXWUO2dNfFeJx1KSDnqfmI01XhgmSe1OtGLUSace9nKn73GW8/tHIeYE/jxy
 yS1slGAOuGvMjCkgltKq+I8j60v8+jHq0BIvp/aW/8P6YsC7YLQuDOVBRB/S+XuZ7S
 G+1XOLkpb44b15SvwZbhLwhlHpjR8zdTVqisQW0fkF47KXPI9hVihp6OJDy3lUVEyH
 LbV9HsvNz9rgoRoGgni0iH1b9UJ77hHKt4Kvj3mLTCMPr2UdB8V8MUgCH48NPc5PHL
 SgUuPeQvOiMPts0iH4PCDPjpFjgwyEk9rgcDB8UpZQSPuNccmT5wDi+TKGh3OCI/eg
 aK6HXWZIIGrfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DbKrwxXW
Subject: [Buildroot] [PATCH 1/2] package/bitcoin: bump to version 28.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabio Urquiza <fabiorush@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 26.2, see:
https://bitcoincore.org/en/releases/27.0/
https://bitcoincore.org/en/releases/27.1/
https://bitcoincore.org/en/releases/28.0/

A notable change in version 28.0 is that bitcoin code now needs
gcc >= 11.1. This change is reflected in the package Kconfig
Config.in file.

License file hash changed, due to year update in upstream commit:
https://github.com/bitcoin/bitcoin/commit/1f8450f066724dfbb5c5bc4060843e2f3340ed88

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8072857206
---
 package/bitcoin/Config.in    | 6 +++---
 package/bitcoin/bitcoin.hash | 8 ++++----
 package/bitcoin/bitcoin.mk   | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 060cae24f5..425e99ce8b 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
@@ -46,9 +46,9 @@ config BR2_PACKAGE_BITCOIN_WALLET
 
 endif
 
-comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 9"
+comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 11"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 9bd0843085..c7dad34d0a 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,7 +1,7 @@
-# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS
 # After checking pgp signature from:
-# https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS.asc
-sha256  78d59418741f45cbdaa9bf20ebc49a5e95ff9f7172f72fc78d14307eaf341b3c  bitcoin-26.2.tar.gz
+# https://bitcoincore.org/bin/bitcoin-core-28.0/SHA256SUMS.asc
+sha256  700ae2d1e204602eb07f2779a6e6669893bc96c0dca290593f80ff8e102ff37f  bitcoin-28.0.tar.gz
 
 # Hash for license file
-sha256  a6331cd1f889397adfc0c3b0535682a20950c6cf8e5c712e9997a15ce98324e1  COPYING
+sha256  779d9beab4eef2340bb1e86e91f8f55dea9b0985a2d03fbcbb52bd713e091e1b  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 9ca29092ad..9a5f4d6494 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 26.2
+BITCOIN_VERSION = 28.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
