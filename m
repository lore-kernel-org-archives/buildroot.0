Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EB1C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 17:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A5DA409A5;
	Wed,  7 Jun 2023 17:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A5DA409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8oGqJXLOcED; Wed,  7 Jun 2023 17:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EFDC40912;
	Wed,  7 Jun 2023 17:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EFDC40912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3B5A1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 17:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D385605BA
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 17:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D385605BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EcWJsboZkhnM for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 17:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7938560595
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7938560595
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 17:35:18 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout02.t-online.de (Postfix) with SMTP id 0A68B7F3
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 19:35:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q6x3y-3Z7nNJ0; Wed, 7 Jun 2023 19:35:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43858)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q6x3y-0001aV-0z
 for buildroot@buildroot.org; Wed, 07 Jun 2023 19:35:14 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  7 Jun 2023 19:35:14 +0200
Message-Id: <20230607173514.1070338-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686159314-FB7F84D3-D547D6A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 2506fed4-43bd-44e4-a1da-f65a82d5eba3
Subject: [Buildroot] [PATCH 1/1] package/php: Fix GCC 12 -Og
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/316451459139e250ba2d0c7b554606fd97eebd9a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 package/php/0006-xxhash-h-Fix-GCC-12-Og.patch

diff --git a/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
new file mode 100644
index 0000000000..9b5b9966cd
--- /dev/null
+++ b/package/php/0006-xxhash-h-Fix-GCC-12-Og.patch
@@ -0,0 +1,94 @@
+From adcb38b1ffa8e401293e5028ee5af586fd304e00 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 12 Apr 2023 13:33:07 +0800
+Subject: [PATCH] xxhash.h: Fix GCC 12 -Og
+
+Change whether to inline XXH3_hashLong_withSecret to a config option
+
+Ref: https://github.com/Cyan4973/xxHash/commit/ace22bddc7a366a5dd8a71e8b8247694530684ec
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+Closes GH-11062.
+
+Upstream: https://github.com/php/php-src/commit/adcb38b1ffa8e401293e5028ee5af586fd304e00
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
+index b5bd286496c7..8e816c0584eb 100644
+--- a/ext/hash/xxhash/xxhash.h
++++ b/ext/hash/xxhash/xxhash.h
+@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+  */
+ #  define XXH_NO_INLINE_HINTS 0
+ 
++/*!
++ * @def XXH3_INLINE_SECRET
++ * @brief Determines whether to inline the XXH3 withSecret code.
++ *
++ * When the secret size is known, the compiler can improve the performance
++ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
++ *
++ * However, if the secret size is not known, it doesn't have any benefit. This
++ * happens when xxHash is compiled into a global symbol. Therefore, if
++ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
++ *
++ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
++ * that are *sometimes* force inline on -Og, and it is impossible to automatically
++ * detect this optimization level.
++ */
++#  define XXH3_INLINE_SECRET 0
++
+ /*!
+  * @def XXH32_ENDJMP
+  * @brief Whether to use a jump for `XXH32_finalize`.
+@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
+ #  endif
+ #endif
+ 
++#ifndef XXH3_INLINE_SECRET
++#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
++     || !defined(XXH_INLINE_ALL)
++#    define XXH3_INLINE_SECRET 0
++#  else
++#    define XXH3_INLINE_SECRET 1
++#  endif
++#endif
++
+ #ifndef XXH32_ENDJMP
+ /* generally preferable for performance */
+ #  define XXH32_ENDJMP 0
+@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ #  define XXH_NO_INLINE static
+ #endif
+ 
++#if XXH3_INLINE_SECRET
++#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
++#else
++#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
++#endif
+ 
+ 
+ /* *************************************
+@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
+  * so that the compiler can properly optimize the vectorized loop.
+  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
+  */
+-XXH_FORCE_INLINE XXH64_hash_t
++XXH3_WITH_SECRET_INLINE XXH64_hash_t
+ XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
+ {
+@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
+  * It's important for performance to pass @secretLen (when it's static)
+  * to the compiler, so that it can properly optimize the vectorized loop.
+  */
+-XXH_FORCE_INLINE XXH128_hash_t
++XXH3_WITH_SECRET_INLINE XXH128_hash_t
+ XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
+                               XXH64_hash_t seed64,
+                               const void* XXH_RESTRICT secret, size_t secretLen)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
