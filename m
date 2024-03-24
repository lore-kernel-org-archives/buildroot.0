Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C68C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26B3E4034A;
	Sun, 24 Mar 2024 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liYReI-sG7kJ; Sun, 24 Mar 2024 15:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63792409E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63792409E9;
	Sun, 24 Mar 2024 15:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A20061BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF24405BE
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1UQ51UjxJn9 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E7E405BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E7E405BD
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF39283B96; Sun, 24 Mar 2024 15:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:33:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 748fc4be21ed46e2c562735bffed1ea67dbbc7b9
X-Git-Newrev: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
X-Patchwork-Hint: ignore
Message-Id: <20240324155537.EF39283B96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.3.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e50460f9f12a8c5f82f2166733afe9cca3c8cd19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0006 which is included in this release.
Rebased patch 0005.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://www.php.net/releases/8_3_4.php
Release notes: https://www.php.net/releases/8_3_3.php
Release notes: https://www.php.net/releases/8_3_2.php
Release notes: https://www.php.net/releases/8_3_1.php
Release notes: https://www.php.net/releases/8_3_0.php

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../php/0005-allow-opcache-cross-compiling.patch   |  4 +-
 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch      | 94 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 4 files changed, 4 insertions(+), 98 deletions(-)

diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
index f9bc8b3ef5..468864b0a4 100644
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ b/package/php/0005-allow-opcache-cross-compiling.patch
@@ -14,7 +14,7 @@ CFLAGS when opcache is enabled:
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 8.1.7]
+[Bernd: rebased for 8.1.7 & 8.3.3]
 ---
  ext/opcache/config.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -23,7 +23,7 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index 5492fd92..10c150ff 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -331,10 +331,6 @@ int main() {
+@@ -315,10 +315,6 @@ int main() {
  
    PHP_ADD_EXTENSION_DEP(opcache, pcre)
  
diff --git a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
deleted file mode 100644
index 9b5b9966cd..0000000000
--- a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From adcb38b1ffa8e401293e5028ee5af586fd304e00 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 12 Apr 2023 13:33:07 +0800
-Subject: [PATCH] xxhash.h: Fix GCC 12 -Og
-
-Change whether to inline XXH3_hashLong_withSecret to a config option
-
-Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
-Closes GH-11062.
-
-Upstream: https://github.com/php/php-src/commit/adcb38b1ffa8e401293e5028ee5af586fd304e00
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
-index b5bd286496c7..8e816c0584eb 100644
---- a/ext/hash/xxhash/xxhash.h
-+++ b/ext/hash/xxhash/xxhash.h
-@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
-  */
- #  define XXH_NO_INLINE_HINTS 0
- 
-+/*!
-+ * @def XXH3_INLINE_SECRET
-+ * @brief Determines whether to inline the XXH3 withSecret code.
-+ *
-+ * When the secret size is known, the compiler can improve the performance
-+ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
-+ *
-+ * However, if the secret size is not known, it doesn't have any benefit. This
-+ * happens when xxHash is compiled into a global symbol. Therefore, if
-+ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
-+ *
-+ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
-+ * that are *sometimes* force inline on -Og, and it is impossible to automatically
-+ * detect this optimization level.
-+ */
-+#  define XXH3_INLINE_SECRET 0
-+
- /*!
-  * @def XXH32_ENDJMP
-  * @brief Whether to use a jump for `XXH32_finalize`.
-@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
- #  endif
- #endif
- 
-+#ifndef XXH3_INLINE_SECRET
-+#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
-+     || !defined(XXH_INLINE_ALL)
-+#    define XXH3_INLINE_SECRET 0
-+#  else
-+#    define XXH3_INLINE_SECRET 1
-+#  endif
-+#endif
-+
- #ifndef XXH32_ENDJMP
- /* generally preferable for performance */
- #  define XXH32_ENDJMP 0
-@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- #  define XXH_NO_INLINE static
- #endif
- 
-+#if XXH3_INLINE_SECRET
-+#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
-+#else
-+#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
-+#endif
- 
- 
- /* *************************************
-@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
-  * so that the compiler can properly optimize the vectorized loop.
-  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
-  */
--XXH_FORCE_INLINE XXH64_hash_t
-+XXH3_WITH_SECRET_INLINE XXH64_hash_t
- XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
- {
-@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
-  * It's important for performance to pass @secretLen (when it's static)
-  * to the compiler, so that it can properly optimize the vectorized loop.
-  */
--XXH_FORCE_INLINE XXH128_hash_t
-+XXH3_WITH_SECRET_INLINE XXH128_hash_t
- XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                               XXH64_hash_t seed64,
-                               const void* XXH_RESTRICT secret, size_t secretLen)
diff --git a/package/php/php.hash b/package/php/php.hash
index 4ce3616de3..96f16ff2a7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
+sha256  39a337036a546e5c28aea76cf424ac172db5156bd8a8fd85252e389409a5ba63  php-8.3.4.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 28893be4c6..99dbec9de7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.16
+PHP_VERSION = 8.3.4
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
