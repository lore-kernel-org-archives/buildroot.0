Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D607ED0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD174084A;
	Sat, 26 Oct 2024 16:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KdVT3-BsTiv; Sat, 26 Oct 2024 16:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A63C408A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A63C408A9;
	Sat, 26 Oct 2024 16:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78B175C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 669968408A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egHGeS9OITnf for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9D581EA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9D581EA7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76C1683EB2; Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:21:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35593203802acc18687cdcaf36fff3bb62347015
X-Git-Newrev: 29a5475c9b6d1ffe36ab0d988ad7fef7a622f2f9
X-Patchwork-Hint: ignore
Message-Id: <20241026162217.76C1683EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: bump to version 28.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29a5475c9b6d1ffe36ab0d988ad7fef7a622f2f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
