Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD55C54798
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 16:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F152407FC;
	Sat,  9 Mar 2024 16:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djgkf7m4KpJf; Sat,  9 Mar 2024 16:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A5940605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A5940605;
	Sat,  9 Mar 2024 16:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2A41BF484
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 16:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C13401FE
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 16:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6CE1X0WVVEO for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 16:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D95DB4010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95DB4010C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D95DB4010C
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 16:52:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7846BB00539;
 Sat,  9 Mar 2024 17:52:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  9 Mar 2024 17:52:37 +0100
Message-ID: <20240309165237.16125-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710003171;
 bh=PZyIxWFIc/5xxz5yQ1iq2q9vLwnHIQ7ldStv5SAbVss=;
 h=From:To:Cc:Subject:Date:From;
 b=IHazHyjTwLt5yyjGgMQdVeSQC7GuwgNWPYepZ6vQ23ufLusTymnytEqY8pY8iLlas
 4bgSekdgxTDb9gYny/VL5Xch56y2H4HKdcYGnnqkaTCm775wGIGGvsVE5ymB15xWhf
 tbZ4uuql3slXILkLQ7qhmJlnHiL9fsDzCAFvML9EpTwcGzW3WCY98Yu8jZunhUEXsg
 4TTMHoYz23v+440nFR7TRNK0y2Q9xnutxRKZcJkCbUWb82EEYj8mLvjEOxNEjugBtQ
 472iemVoRcNTXoZiNuLFLUDznQoTns78lzjJKnskzzqEn1WtybZschxZfKTKsJegYM
 Gd29sDvTexDUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IHazHyjT
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: security bump to version
 26.0
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For all release notes since 0.21.2, see [1].

This commit also:
- removes the package patches, all included in this release,
- removes the patch entry in ".checkpackageignore",
- adds a comment about pgp signature check in the hash file,
- updates the license hash, due to year update,
- adds the requirement on gcc >= 9, see [2],
- removes the dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which
  is no longer needed, due to the gcc version requirement.

Fixes:
- [3]

Note: this CVE-2023-33297 is not explicitly mentioned in the Bitcoin
core release notes. It is not either appearing in CVE list at [4].
The change corresponding to this vulnerability is "#27610 Improve
performance of p2p inv to send queues" in the version 24.1 release
note. See [5] and [6].

[1] https://github.com/bitcoin/bitcoin/tree/v26.0/doc/release-notes
[2] https://github.com/bitcoin/bitcoin/blob/v26.0/doc/dependencies.md
[3] https://nvd.nist.gov/vuln/detail/CVE-2023-33297
[4] https://en.bitcoin.it/wiki/Common_Vulnerabilities_and_Exposures
[5] https://github.com/bitcoin/bitcoin/blob/v26.0/doc/release-notes/release-notes-24.1.md?plain=1#L45
[6] https://github.com/bitcoin/bitcoin/pull/27610

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                           |  1 -
 ...rc-randomenv.cpp-fix-build-on-uclibc.patch | 48 -------------------
 ...includes-to-fix-gcc-13-compile-error.patch | 48 -------------------
 ...efactor-add-most-of-src-util-to-iwyu.patch | 34 -------------
 .../0004-src-util-string-h-fix-gcc13.patch    | 23 ---------
 package/bitcoin/Config.in                     | 11 ++---
 package/bitcoin/bitcoin.hash                  |  8 ++--
 package/bitcoin/bitcoin.mk                    |  2 +-
 8 files changed, 10 insertions(+), 165 deletions(-)
 delete mode 100644 package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
 delete mode 100644 package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
 delete mode 100644 package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
 delete mode 100644 package/bitcoin/0004-src-util-string-h-fix-gcc13.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 5f4928b6487..f413e5a4971 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -194,7 +194,6 @@ package/berkeleydb/0002-atomic_compare_exchange.patch Upstream
 package/bind/0001-cross.patch Upstream
 package/bind/S81named Indent Shellcheck Variables
 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch Upstream
-package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch Upstream
 package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstream
 package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
diff --git a/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch b/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
deleted file mode 100644
index 8038a311d36..00000000000
--- a/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 330cb33985d0ce97c20f4a0f0bbda0fbffe098d4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 9 Nov 2020 21:18:40 +0100
-Subject: [PATCH] src/randomenv.cpp: fix build on uclibc
-
-Check for HAVE_STRONG_GETAUXVAL or HAVE_WEAK_GETAUXVAL before using
-getauxval to avoid a build failure on uclibc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/bitcoin/bitcoin/pull/20358]
----
- src/randomenv.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/randomenv.cpp b/src/randomenv.cpp
-index 07122b7f6..5e07c3db4 100644
---- a/src/randomenv.cpp
-+++ b/src/randomenv.cpp
-@@ -53,7 +53,7 @@
- #include <sys/vmmeter.h>
- #endif
- #endif
--#ifdef __linux__
-+#if defined(HAVE_STRONG_GETAUXVAL) || defined(HAVE_WEAK_GETAUXVAL)
- #include <sys/auxv.h>
- #endif
- 
-@@ -326,7 +326,7 @@ void RandAddStaticEnv(CSHA512& hasher)
-     // Bitcoin client version
-     hasher << CLIENT_VERSION;
- 
--#ifdef __linux__
-+#if defined(HAVE_STRONG_GETAUXVAL) || defined(HAVE_WEAK_GETAUXVAL)
-     // Information available through getauxval()
- #  ifdef AT_HWCAP
-     hasher << getauxval(AT_HWCAP);
-@@ -346,7 +346,7 @@ void RandAddStaticEnv(CSHA512& hasher)
-     const char* exec_str = (const char*)getauxval(AT_EXECFN);
-     if (exec_str) hasher.Write((const unsigned char*)exec_str, strlen(exec_str) + 1);
- #  endif
--#endif // __linux__
-+#endif // HAVE_STRONG_GETAUXVAL || HAVE_WEAK_GETAUXVAL
- 
- #ifdef HAVE_GETCPUID
-     AddAllCPUID(hasher);
--- 
-2.28.0
-
diff --git a/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch b/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
deleted file mode 100644
index 22c0ca2adf6..00000000000
--- a/package/bitcoin/0002-Add-missing-includes-to-fix-gcc-13-compile-error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 339a95b7537b47e5d6b732c0633a00afd96e3ca0 Mon Sep 17 00:00:00 2001
-From: MarcoFalke <*~=`'#}+{/-|&$^_@721217.xyz>
-Date: Thu, 19 Jan 2023 19:35:43 +0100
-Subject: [PATCH] Add missing includes to fix gcc-13 compile error
-
-Upstream: https://github.com/bitcoin/bitcoin/commit/fadeb6b103cb441e0e91ef506ef29febabb10715
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/support/lockedpool.cpp | 3 +++
- src/support/lockedpool.h   | 4 ++--
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/support/lockedpool.cpp b/src/support/lockedpool.cpp
-index 26de780f2..11131d551 100644
---- a/src/support/lockedpool.cpp
-+++ b/src/support/lockedpool.cpp
-@@ -22,6 +22,9 @@
- #endif
- 
- #include <algorithm>
-+#include <limits>
-+#include <stdexcept>
-+#include <utility>
- #ifdef ARENA_DEBUG
- #include <iomanip>
- #include <iostream>
-diff --git a/src/support/lockedpool.h b/src/support/lockedpool.h
-index b9e2e99d1..25b4c0f36 100644
---- a/src/support/lockedpool.h
-+++ b/src/support/lockedpool.h
-@@ -5,11 +5,11 @@
- #ifndef BITCOIN_SUPPORT_LOCKEDPOOL_H
- #define BITCOIN_SUPPORT_LOCKEDPOOL_H
- 
--#include <stdint.h>
-+#include <cstddef>
- #include <list>
- #include <map>
--#include <mutex>
- #include <memory>
-+#include <mutex>
- #include <unordered_map>
- 
- /**
--- 
-2.39.2
-
diff --git a/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch b/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
deleted file mode 100644
index 095fa648dd3..00000000000
--- a/package/bitcoin/0003-refactor-add-most-of-src-util-to-iwyu.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c187efa907fd64ea2c7b7d699c5c97f9d5b79960 Mon Sep 17 00:00:00 2001
-From: fanquake <fanquake@gmail.com>
-Date: Thu, 9 Jun 2022 16:26:55 +0100
-Subject: [PATCH] refactor: add most of src/util to iwyu
-
-These files change infrequently, and not much header shuffling is required.
-
-We don't add everything in src/util/ yet, because IWYU makes some
-dubious suggestions, which I'm going to follow up with upstream.
-
-Upstream: https://github.com/bitcoin/bitcoin/commit/07f2c25d04c39a0074e1d9ee1b24b3e359c8153f
-
-[Bernd: backported relevant part from upstream commit to version 0.21.2
-        to fix build error with gcc 13.x]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/util/bip32.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/util/bip32.h b/src/util/bip32.h
-index 347e83db9..6ef051c48 100644
---- a/src/util/bip32.h
-+++ b/src/util/bip32.h
-@@ -6,6 +6,7 @@
- #define BITCOIN_UTIL_BIP32_H
- 
- #include <attributes.h>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
--- 
-2.39.2
-
diff --git a/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch b/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch
deleted file mode 100644
index 00a9ef2b971..00000000000
--- a/package/bitcoin/0004-src-util-string-h-fix-gcc13.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From fa2deae2a86417d7e0d4cd33fb933b1000d20313 Mon Sep 17 00:00:00 2001
-From: MacroFake <falke.marco@gmail.com>
-Date: Thu, 5 May 2022 08:28:29 +0200
-Subject: [PATCH] Wrap boost::replace_all
-
-Upstream: https://github.com/bitcoin/bitcoin/commit/fa2deae2a86417d7e0d4cd33fb933b1000d20313
-
-[Bernd: backported relevant part from upstream commit to version 0.21.2
-        to fix build error with gcc 13.x]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-diff --git a/src/util/string.h b/src/util/string.h
-index 2e91347b27a10..df20e34ae9aaa 100644
---- a/src/util/string.h
-+++ b/src/util/string.h
-@@ -9,6 +9,7 @@
- 
- #include <algorithm>
- #include <array>
-+#include <cstdint>
- #include <cstring>
- #include <locale>
- #include <sstream>
diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index a344811d6b4..c4a2447fc95 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-filesystem
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
@@ -36,12 +36,9 @@ config BR2_PACKAGE_BITCOIN
 
 	  https://bitcoincore.org
 
-comment "bitcoin needs a toolchain w/ C++, threads, wchar"
+comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 9"
 	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-comment "bitcoin needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 643fcbc1419..6b3008af863 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,5 +1,7 @@
-# From https://bitcoincore.org/bin/bitcoin-core-0.21.2/SHA256SUMS.asc
-sha256  4146f751fc5691bdcf911cbdb8d32d8d25c297d29d58173227ae1ae6438edb9e  bitcoin-0.21.2.tar.gz
+# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS
+# After checking pgp signature from:
+# https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS.asc
+sha256  ab1d99276e28db62d1d9f3901e85ac358d7f1ebcb942d348a9c4e46f0fcdc0a1  bitcoin-26.0.tar.gz
 
 # Hash for license file
-sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
+sha256  a6331cd1f889397adfc0c3b0535682a20950c6cf8e5c712e9997a15ce98324e1  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 10ae32202cf..493c569336a 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.21.2
+BITCOIN_VERSION = 26.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
