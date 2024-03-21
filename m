Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81189C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351F18231F;
	Thu, 21 Mar 2024 21:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zech3aIGwsvw; Thu, 21 Mar 2024 21:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25FC482BE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FC482BE5;
	Thu, 21 Mar 2024 21:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7241BF980
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B985C608C9
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwH5RF1mIJqh for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790BE6081D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 790BE6081D
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61D26837AB; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:16:51 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ee5d27d199b51043ef3e76d892c92a7b682753d4
X-Git-Newrev: a7affb39bcc3cd0196db9dcc4244673e5d0b411a
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.61D26837AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/bitcoin: security
 bump to version 26.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7affb39bcc3cd0196db9dcc4244673e5d0b411a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a3a88ff1c85ba0067af1028bc232f8f61b628979)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-randomenv.cpp-fix-build-on-uclibc.patch | 48 ----------------------
 ...sing-includes-to-fix-gcc-13-compile-error.patch | 48 ----------------------
 ...003-refactor-add-most-of-src-util-to-iwyu.patch | 34 ---------------
 .../bitcoin/0004-src-util-string-h-fix-gcc13.patch | 23 -----------
 package/bitcoin/Config.in                          | 11 ++---
 package/bitcoin/bitcoin.hash                       |  8 ++--
 package/bitcoin/bitcoin.mk                         |  2 +-
 7 files changed, 10 insertions(+), 164 deletions(-)

diff --git a/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch b/package/bitcoin/0001-src-randomenv.cpp-fix-build-on-uclibc.patch
deleted file mode 100644
index 8038a311d3..0000000000
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
index 22c0ca2adf..0000000000
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
index 095fa648dd..0000000000
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
index 00a9ef2b97..0000000000
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
index a344811d6b..c4a2447fc9 100644
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
index 643fcbc141..6b3008af86 100644
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
index 10ae32202c..493c569336 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
