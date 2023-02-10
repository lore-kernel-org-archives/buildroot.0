Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550E2C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBEC28109C;
	Fri, 10 Feb 2023 13:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBEC28109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkvBAZnze8n5; Fri, 10 Feb 2023 13:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA4F812B9;
	Fri, 10 Feb 2023 13:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA4F812B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FCBB1BF370
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CB560E41
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CB560E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgfneaptKizW for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 13:02:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A7360D60
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8A7360D60
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 13:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 414471814B9; Fri, 10 Feb 2023 14:02:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 14:01:45 +0100
Message-Id: <20230210130145.4063383-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676034136; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=suepFhetPCSxjDi6zVfAhIsx9mvhqPddTK/AIPV043Q=;
 b=Sw7gFIlavkWr0SHNk/NBK0c3TnlwQWVRxP5pOvsNobCAHx3nmZFs9KMTQRLND3C60Y+Cbp
 8Cd7EMKi7zfzpiIgWl2Cl73YzfJwB5Vp7SS1X03pMCkW4obqfHWDHXH4gjiy1KSmrdjuCr
 2TSJrfa1NO0TYoQpLUH+UipEFWK8Lzw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Sw7gFIla
Subject: [Buildroot] [PATCH v2] package/boost: bump to version 1.81.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add option for new library "url"
- drop upstreamed patch

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

V2: use correct flag for boost-url

compile tested defconfigs:

BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_CC_TOOL=y
BR2_PACKAGE_LIBUBOOTENV=y
BR2_PACKAGE_BOTAN=y
BR2_PACKAGE_UHD=y
BR2_PACKAGE_LOG4CXX=y
BR2_PACKAGE_LIBCPPRESTSDK=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FIBER=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y
BR2_PACKAGE_BITCOIN=y
BR2_PACKAGE_I2PD=y

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_PULSEVIEW=y
BR2_PACKAGE_GNURADIO=y

BR2_sh=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTRACT=y
BR2_PACKAGE_BOOST_COROUTINE=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_FIBER=y
BR2_PACKAGE_BOOST_GRAPH=y
BR2_PACKAGE_BOOST_GRAPH_PARALLEL=y
BR2_PACKAGE_BOOST_IOSTREAMS=y
BR2_PACKAGE_BOOST_JSON=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_MATH=y
BR2_PACKAGE_BOOST_MPI=y
BR2_PACKAGE_BOOST_NOWIDE=y
BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
BR2_PACKAGE_BOOST_RANDOM=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_BOOST_STACKTRACE=y
BR2_PACKAGE_BOOST_TEST=y
BR2_PACKAGE_BOOST_TYPE_ERASURE=y
BR2_PACKAGE_BOOST_URL=y
BR2_PACKAGE_BOOST_WAVE=y
---
 .../0001-Improve-modfunc-performance.patch    | 551 ------------------
 package/boost/Config.in                       |  13 +
 package/boost/boost.hash                      |   4 +-
 package/boost/boost.mk                        |   5 +-
 4 files changed, 18 insertions(+), 555 deletions(-)
 delete mode 100644 package/boost/0001-Improve-modfunc-performance.patch

diff --git a/package/boost/0001-Improve-modfunc-performance.patch b/package/boost/0001-Improve-modfunc-performance.patch
deleted file mode 100644
index a34d6bb4d5..0000000000
--- a/package/boost/0001-Improve-modfunc-performance.patch
+++ /dev/null
@@ -1,551 +0,0 @@
-From 825aedad557b7e3bb27614335b6ced16887103de Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ion=20Gazta=C3=B1aga?= <igaztanaga@gmail.com>
-Date: Mon, 7 Nov 2022 00:16:44 +0100
-Subject: [PATCH] Improve "modfunc" performance Fixes #79
- ("boost/intrusive/hashtable.hpp: build failure (undeclared indentifier)")
-
-Backport from Boost development branch to fix issues with some architectures
-(64-bit with 128-bit processing, where size_t != unsigned long). In this case,
-code is enabled that causes a build failure.
-
-Upstream: https://github.com/boostorg/intrusive/commit/825aedad557b7e3bb27614335b6ced16887103de
-Issue: https://github.com/boostorg/intrusive/issues/79
-Fixes: http://autobuild.buildroot.net/results/6cb/6cbc0672f3c5046405793d8cdc8f961d2ffb1d3e
-
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
----
- include/boost/intrusive/hashtable.hpp | 235 ++++++++++++++++----------
- 1 file changed, 145 insertions(+), 90 deletions(-)
-
-diff --git a/include/boost/intrusive/hashtable.hpp b/include/boost/intrusive/hashtable.hpp
-index b8bc877..688fb9b 100644
---- a/boost/intrusive/hashtable.hpp
-+++ b/boost/intrusive/hashtable.hpp
-@@ -2,6 +2,7 @@
- //
- // (C) Copyright Ion Gaztanaga  2006-2022
- // (C) Copyright 2022 Joaquin M Lopez Munoz.
-+// (C) Copyright 2022 Christian Mazakas
- //
- // Distributed under the Boost Software License, Version 1.0.
- //    (See accompanying file LICENSE_1_0.txt or copy at
-@@ -84,11 +85,6 @@ namespace intrusive {
- 
- /// @cond
- 
--#if !defined(BOOST_NO_INT64_T)&&\
--    (defined(BOOST_HAS_INT128) || (defined(_MSC_VER) && defined(_WIN64)))
--#define BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT
--#endif
--
- //We only support LLP64(Win64) or LP64(most Unix) data models
- #ifdef _WIN64  //In 64 bit windows sizeof(size_t) == sizeof(unsigned long long)
- #  define BOOST_INTRUSIVE_SIZE_C(NUMBER) NUMBER##ULL
-@@ -98,7 +94,6 @@ namespace intrusive {
- #  define BOOST_INTRUSIVE_64_BIT_SIZE_T (((((ULONG_MAX>>16)>>16)>>16)>>15) != 0)
- #endif
- 
--
- template<int Dummy = 0>
- struct prime_list_holder
- {
-@@ -167,11 +162,11 @@ struct prime_list_holder
-    {  return prime_list[std::ptrdiff_t(n)]; }
- 
-    template<std::size_t SizeIndex>
--   BOOST_INTRUSIVE_FORCEINLINE static std::size_t modfunc(std::size_t hash) { return hash % prime_list[SizeIndex]; }
-+   BOOST_INTRUSIVE_FORCEINLINE static std::size_t modfunc(std::size_t hash) { return hash % SizeIndex; }
- 
-    static std::size_t(*const positions[])(std::size_t);
- 
--   #if defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+   #if BOOST_INTRUSIVE_64_BIT_SIZE_T
-    static const uint64_t inv_sizes32[];
-    static const std::size_t inv_sizes32_size;
-    #endif
-@@ -185,17 +180,20 @@ struct prime_list_holder
-    BOOST_INTRUSIVE_FORCEINLINE static std::size_t size(std::size_t size_index)
-    {   return prime_list_holder<>::size_from_index(size_index);  }
- 
--   #if defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+   #if BOOST_INTRUSIVE_64_BIT_SIZE_T
-    // https://github.com/lemire/fastmod
- 
--
-    BOOST_INTRUSIVE_FORCEINLINE static uint64_t mul128_u32(uint64_t lowbits, uint32_t d)
-    {
-       #if defined(_MSC_VER)
--      return __umulh(lowbits, d);
-+         return __umulh(lowbits, d);
-+      #elif defined(BOOST_HAS_INT128)
-+         return static_cast<uint64_t>((uint128_type(lowbits) * d) >> 64);
-       #else
--      __extension__ typedef unsigned __int128 ext_uint128_t;
--      return (ext_uint128_t(lowbits) * d) >> 64;
-+         uint64_t r1 = (lowbits & UINT32_MAX) * d;
-+         uint64_t r2 = (lowbits >> 32) * d;
-+         r2 += r1 >> 32;
-+         return r2 >> 32;
-       #endif
-    }
- 
-@@ -204,51 +202,67 @@ struct prime_list_holder
-       uint64_t lowbits = M * a;
-       return (uint32_t)(mul128_u32(lowbits, d));
-    }
--   #endif // defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+   #endif // BOOST_INTRUSIVE_64_BIT_SIZE_T
- 
-    BOOST_INTRUSIVE_FORCEINLINE static std::size_t position(std::size_t hash,std::size_t size_index)
-    {
--      #if defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT) && BOOST_INTRUSIVE_64_BIT_SIZE_T
--         const std::size_t sizes_under_32bit = sizeof(inv_sizes32)/sizeof(inv_sizes32[0]);
-+      #if BOOST_INTRUSIVE_64_BIT_SIZE_T
-+         BOOST_CONSTEXPR_OR_CONST std::size_t sizes_under_32bit = sizeof(inv_sizes32)/sizeof(inv_sizes32[0]);
-          if(BOOST_LIKELY(size_index < sizes_under_32bit)){
-             return fastmod_u32( uint32_t(hash)+uint32_t(hash>>32)
-                               , inv_sizes32[size_index]
-                               , uint32_t(prime_list[size_index])  );
-          }
-          else{
--            return positions[size_index-sizes_under_32bit](hash);
-+            return positions[size_index](hash);
-          }
--      #elif defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
--         return fastmod_u32(hash, inv_sizes32[size_index], uint32_t(sizes[size_index]));
-       #else
-          return positions[size_index](hash);
--      #endif // defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+      #endif // BOOST_INTRUSIVE_64_BIT_SIZE_T
-   }
- };
- 
- template<int Dummy>
- std::size_t(* const prime_list_holder<Dummy>::positions[])(std::size_t) =
- {
--   #if !defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
--   modfunc< 0>,modfunc< 1>,modfunc< 2>,modfunc< 3>,modfunc< 4>,
--   modfunc< 5>,modfunc< 6>,modfunc< 7>,modfunc< 8>,modfunc< 9>,
--   modfunc<10>,modfunc<11>,modfunc<12>,modfunc<13>,modfunc<14>,
--   modfunc<15>,modfunc<16>,modfunc<17>,modfunc<18>,modfunc<19>,
--   modfunc<20>,modfunc<21>,modfunc<22>,modfunc<23>,modfunc<24>,
--   modfunc<25>,modfunc<26>,modfunc<27>,modfunc<28>,modfunc<29>,
--   modfunc<30>,
--   #endif
--   # if BOOST_INTRUSIVE_64_BIT_SIZE_T
--               modfunc<31>,modfunc<32>,modfunc<33>,modfunc<34>,
--   modfunc<35>,modfunc<36>,modfunc<37>,modfunc<38>,modfunc<39>,
--   modfunc<40>,modfunc<41>,modfunc<42>,modfunc<43>,modfunc<44>,
--   modfunc<45>,modfunc<46>,modfunc<47>,modfunc<48>,modfunc<49>,
--   modfunc<50>,modfunc<51>,modfunc<52>,modfunc<53>,modfunc<54>,
--   modfunc<55>,modfunc<56>,modfunc<57>,modfunc<58>,modfunc<59>,
--   modfunc<60>,modfunc<61>,modfunc<62>,modfunc<63>
--   # else
--   modfunc<31>
--   # endif
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(3)>,                     modfunc<BOOST_INTRUSIVE_SIZE_C(7)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(11)>,                    modfunc<BOOST_INTRUSIVE_SIZE_C(17)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(29)>,                    modfunc<BOOST_INTRUSIVE_SIZE_C(53)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(97)>,                    modfunc<BOOST_INTRUSIVE_SIZE_C(193)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(389)>,                   modfunc<BOOST_INTRUSIVE_SIZE_C(769)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1543)>,                  modfunc<BOOST_INTRUSIVE_SIZE_C(3079)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6151)>,                  modfunc<BOOST_INTRUSIVE_SIZE_C(12289)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(24593)>,                 modfunc<BOOST_INTRUSIVE_SIZE_C(49157)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(98317)>,                 modfunc<BOOST_INTRUSIVE_SIZE_C(196613)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(393241)>,                modfunc<BOOST_INTRUSIVE_SIZE_C(786433)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1572869)>,               modfunc<BOOST_INTRUSIVE_SIZE_C(3145739)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6291469)>,               modfunc<BOOST_INTRUSIVE_SIZE_C(12582917)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(25165843)>,              modfunc<BOOST_INTRUSIVE_SIZE_C(50331653)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(100663319)>,             modfunc<BOOST_INTRUSIVE_SIZE_C(201326611)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(402653189)>,             modfunc<BOOST_INTRUSIVE_SIZE_C(805306457)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1610612741)>,            //0-30 indexes
-+#if BOOST_INTRUSIVE_64_BIT_SIZE_T
-+   //Taken from Boost.MultiIndex code, thanks to Joaquin M. Lopez Munoz.
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(3221225473)>,            //<- 32 bit values stop here (index 31)
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6442450939)>,            modfunc<BOOST_INTRUSIVE_SIZE_C(12884901893)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(25769803751)>,           modfunc<BOOST_INTRUSIVE_SIZE_C(51539607551)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(103079215111)>,          modfunc<BOOST_INTRUSIVE_SIZE_C(206158430209)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(412316860441)>,          modfunc<BOOST_INTRUSIVE_SIZE_C(824633720831)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1649267441651)>,         modfunc<BOOST_INTRUSIVE_SIZE_C(3298534883309)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6597069766657)>,         modfunc<BOOST_INTRUSIVE_SIZE_C(13194139533299)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(26388279066623)>,        modfunc<BOOST_INTRUSIVE_SIZE_C(52776558133303)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(105553116266489)>,       modfunc<BOOST_INTRUSIVE_SIZE_C(211106232532969)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(422212465066001)>,       modfunc<BOOST_INTRUSIVE_SIZE_C(844424930131963)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1688849860263953)>,      modfunc<BOOST_INTRUSIVE_SIZE_C(3377699720527861)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6755399441055731)>,      modfunc<BOOST_INTRUSIVE_SIZE_C(13510798882111483)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(27021597764222939)>,     modfunc<BOOST_INTRUSIVE_SIZE_C(54043195528445957)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(108086391056891903)>,    modfunc<BOOST_INTRUSIVE_SIZE_C(216172782113783843)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(432345564227567621)>,    modfunc<BOOST_INTRUSIVE_SIZE_C(864691128455135207)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(1729382256910270481)>,   modfunc<BOOST_INTRUSIVE_SIZE_C(3458764513820540933)>,
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(6917529027641081903)>,   modfunc<BOOST_INTRUSIVE_SIZE_C(9223372036854775783)> //(index 63)
-+#else
-+   modfunc<BOOST_INTRUSIVE_SIZE_C(2147483647)>             //<- 32 bit stops here (index 31) as ptrdiff_t is signed
-+#endif
-  };
- 
- template<int Dummy>
-@@ -298,7 +312,7 @@ const std::size_t prime_list_holder<Dummy>::prime_list_size
-    = sizeof(prime_list) / sizeof(std::size_t);
- 
- 
--#if defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+#if BOOST_INTRUSIVE_64_BIT_SIZE_T
- 
- template<int Dummy>
- const uint64_t prime_list_holder<Dummy>::inv_sizes32[] = {
-@@ -340,7 +354,7 @@ template<int Dummy>
- const std::size_t prime_list_holder<Dummy>::inv_sizes32_size
-    = sizeof(inv_sizes32) / sizeof(uint64_t);
- 
--#endif // defined(BOOST_INTRUSIVE_FCA_FASTMOD_SUPPORT)
-+#endif // BOOST_INTRUSIVE_64_BIT_SIZE_T
- 
- struct prime_fmod_size : prime_list_holder<>
- {
-@@ -785,9 +799,9 @@ BOOST_INTRUSIVE_FORCEINLINE std::size_t hash_to_bucket_split(std::size_t hash_va
- }
- 
- template<bool Power2Buckets, bool Incremental>  //fastmod_buckets
--BOOST_INTRUSIVE_FORCEINLINE std::size_t hash_to_bucket_split(std::size_t hash_value, std::size_t bucket_cnt, std::size_t split, detail::true_)
-+BOOST_INTRUSIVE_FORCEINLINE std::size_t hash_to_bucket_split(std::size_t hash_value, std::size_t , std::size_t split, detail::true_)
- {
--   return prime_fmod_size::position(hash_value, split); (void)bucket_cnt;
-+   return prime_fmod_size::position(hash_value, split);
- }
- 
- //!This metafunction will obtain the type of a bucket
-@@ -1473,6 +1487,10 @@ struct bucket_hash_t
-       , bucket_plus_vtraits_t(BOOST_MOVE_BASE(bucket_plus_vtraits_t, other))
-    {}
- 
-+   template<class K>
-+   BOOST_INTRUSIVE_FORCEINLINE std::size_t priv_hash(const K &k) const
-+   {  return this->base_t::operator()(k);  }
-+
-    BOOST_INTRUSIVE_FORCEINLINE const hasher &priv_hasher() const
-    {  return this->base_t::get();  }
- 
-@@ -1747,8 +1765,17 @@ struct hashtable_size_wrapper
-    typedef const size_traits & size_traits_const_t;
-    typedef       size_traits & size_traits_t;
- 
--   BOOST_INTRUSIVE_FORCEINLINE size_traits_const_t priv_size_traits() const
--   {  return size_traits_; }
-+   BOOST_INTRUSIVE_FORCEINLINE SizeType get_hashtable_size_wrapper_size() const
-+   {  return size_traits_.get_size(); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void set_hashtable_size_wrapper_size(SizeType s)
-+   {  size_traits_.set_size(s); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void inc_hashtable_size_wrapper_size()
-+   {  size_traits_.increment(); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void dec_hashtable_size_wrapper_size()
-+   {  size_traits_.decrement(); }
- 
-    BOOST_INTRUSIVE_FORCEINLINE size_traits_t priv_size_traits()
-    {  return size_traits_; }
-@@ -1780,7 +1807,19 @@ struct hashtable_size_wrapper<DeriveFrom, SizeType, false>
-    typedef size_traits size_traits_const_t;
-    typedef size_traits size_traits_t;
- 
--   BOOST_INTRUSIVE_FORCEINLINE size_traits priv_size_traits() const
-+   BOOST_INTRUSIVE_FORCEINLINE SizeType get_hashtable_size_wrapper_size() const
-+   {  return 0u; }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void set_hashtable_size_wrapper_size(SizeType)
-+   {}
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void inc_hashtable_size_wrapper_size()
-+   {}
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void dec_hashtable_size_wrapper_size()
-+   {}
-+
-+   BOOST_INTRUSIVE_FORCEINLINE size_traits priv_size_traits()
-    {  return size_traits(); }
- };
- 
-@@ -1815,14 +1854,14 @@ struct hashdata_internal
-    public:
-    static const bool linear_buckets = 0 != (BoolFlags & hash_bool_flags::linear_buckets_pos);
-    typedef typename get_hashtable_size_wrapper_bucket
--      <ValueTraits, VoidOrKeyOfValue, VoidOrKeyHash, VoidOrKeyEqual, BucketTraits, SizeType, BoolFlags>::type internal_type;
--
--   typedef typename internal_type::key_equal                key_equal;
--   typedef typename internal_type::hasher                   hasher;
-+      <ValueTraits, VoidOrKeyOfValue, VoidOrKeyHash, VoidOrKeyEqual, BucketTraits, SizeType, BoolFlags>::type split_bucket_hash_equal_t;
-+   
-+   typedef typename split_bucket_hash_equal_t::key_equal                key_equal;
-+   typedef typename split_bucket_hash_equal_t::hasher                   hasher;
-    typedef bucket_plus_vtraits
-       <ValueTraits, BucketTraits, linear_buckets>           bucket_plus_vtraits_t;
-    typedef SizeType                                         size_type;
--   typedef typename internal_type::size_traits              split_traits;
-+   typedef typename split_bucket_hash_equal_t::size_traits              split_traits;
-    typedef typename bucket_plus_vtraits_t::bucket_ptr       bucket_ptr;
-    typedef typename bucket_plus_vtraits_t::const_value_traits_ptr   const_value_traits_ptr;
-    typedef typename bucket_plus_vtraits_t::siterator        siterator;
-@@ -1866,23 +1905,20 @@ struct hashdata_internal
- 
-    hashdata_internal( const ValueTraits &val_traits, const bucket_traits &b_traits
-                     , const hasher & h, const key_equal &e)
--      :  internal_type(val_traits, b_traits, h, e)
-+      : split_bucket_hash_equal_t(val_traits, b_traits, h, e)
-    {}
- 
-    BOOST_INTRUSIVE_FORCEINLINE hashdata_internal(BOOST_RV_REF(hashdata_internal) other)
--      : internal_type(BOOST_MOVE_BASE(internal_type, other))
-+      : split_bucket_hash_equal_t(BOOST_MOVE_BASE(split_bucket_hash_equal_t, other))
-    {}
- 
--   BOOST_INTRUSIVE_FORCEINLINE typename internal_type::size_traits_t priv_split_traits()
--   {  return this->priv_size_traits();  }
--
--   BOOST_INTRUSIVE_FORCEINLINE typename internal_type::size_traits_const_t priv_split_traits() const
-+   BOOST_INTRUSIVE_FORCEINLINE typename split_bucket_hash_equal_t::size_traits_t priv_split_traits()
-    {  return this->priv_size_traits();  }
- 
-    ~hashdata_internal()
-    {  this->priv_clear_buckets();  }
- 
--   using internal_type::priv_clear_buckets;
-+   using split_bucket_hash_equal_t::priv_clear_buckets;
- 
-    void priv_clear_buckets()
-    {
-@@ -1907,7 +1943,17 @@ struct hashdata_internal
- 
-    //public functions
-    BOOST_INTRUSIVE_FORCEINLINE SizeType split_count() const BOOST_NOEXCEPT
--   {  return this->priv_split_traits().get_size();  }
-+   {  return this->split_bucket_hash_equal_t::get_hashtable_size_wrapper_size();  }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void split_count(SizeType s) BOOST_NOEXCEPT
-+   {  this->split_bucket_hash_equal_t::set_hashtable_size_wrapper_size(s);  }
-+
-+   //public functions
-+   BOOST_INTRUSIVE_FORCEINLINE void inc_split_count() BOOST_NOEXCEPT
-+   {  this->split_bucket_hash_equal_t::inc_hashtable_size_wrapper_size();  }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void dec_split_count() BOOST_NOEXCEPT
-+   {  this->split_bucket_hash_equal_t::dec_hashtable_size_wrapper_size();  }
- 
-    BOOST_INTRUSIVE_FORCEINLINE static SizeType initial_split_from_bucket_count(SizeType bc) BOOST_NOEXCEPT
-    {
-@@ -1983,10 +2029,7 @@ struct hashdata_internal
-    {  return (priv_hash_to_nbucket)(hash_value, fastmod_buckets_t());  }
- 
-    BOOST_INTRUSIVE_FORCEINLINE size_type priv_hash_to_nbucket(std::size_t hash_value, detail::true_) const  //fastmod_buckets_t
--   {
--      return static_cast<size_type>(hash_to_bucket_split<power_2_buckets, incremental>
--         (hash_value, this->priv_usable_bucket_count(), this->split_count(), detail::true_()));
--   }
-+   {  return static_cast<size_type>(prime_fmod_size::position(hash_value, this->split_count()));  }
- 
-    BOOST_INTRUSIVE_FORCEINLINE size_type priv_hash_to_nbucket(std::size_t hash_value, detail::false_) const //!fastmod_buckets_t
-    {
-@@ -1994,7 +2037,6 @@ struct hashdata_internal
-          (hash_value, this->priv_usable_bucket_count(), this->split_count(), detail::false_()));
-    }
- 
--
-    BOOST_INTRUSIVE_FORCEINLINE iterator iterator_to(reference value, detail::false_) BOOST_NOEXCEPT
-    {
-       return iterator( siterator(this->priv_value_to_node_ptr(value))
-@@ -2083,8 +2125,8 @@ struct hashdata_internal
-          , this->priv_value_traits_ptr());
-    }
- 
--   using internal_type::end;
--   using internal_type::cend;
-+   using split_bucket_hash_equal_t::end;
-+   using split_bucket_hash_equal_t::cend;
- 
-    local_iterator end(size_type n) BOOST_NOEXCEPT
-    {  return local_iterator(this->priv_bucket_lend(n), this->priv_value_traits_ptr());  }
-@@ -2322,19 +2364,32 @@ class hashtable_impl
-    public:
-    typedef insert_commit_data_impl<store_hash> insert_commit_data;
- 
-+   private:
-    void default_init_actions()
-    {
-       this->priv_set_sentinel_bucket();
-       this->priv_init_buckets_and_cache();
--      this->priv_size_traits().set_size(size_type(0));
-+      this->priv_size_count(size_type(0));
-       size_type bucket_sz = this->bucket_count();
-       BOOST_INTRUSIVE_INVARIANT_ASSERT(bucket_sz != 0);
-       //Check power of two bucket array if the option is activated
-       BOOST_INTRUSIVE_INVARIANT_ASSERT
-          (!power_2_buckets || (0 == (bucket_sz & (bucket_sz - 1))));
--      this->priv_split_traits().set_size(this->initial_split_from_bucket_count(bucket_sz));
-+      this->split_count(this->initial_split_from_bucket_count(bucket_sz));
-    }
- 
-+   BOOST_INTRUSIVE_FORCEINLINE SizeType priv_size_count() const BOOST_NOEXCEPT
-+   {  return this->internal_type::get_hashtable_size_wrapper_size(); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void priv_size_count(SizeType s) BOOST_NOEXCEPT
-+   {  this->internal_type::set_hashtable_size_wrapper_size(s); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void priv_size_inc() BOOST_NOEXCEPT
-+   {  this->internal_type::inc_hashtable_size_wrapper_size(); }
-+
-+   BOOST_INTRUSIVE_FORCEINLINE void priv_size_dec() BOOST_NOEXCEPT
-+   {  this->internal_type::dec_hashtable_size_wrapper_size(); }
-+
-    public:
- 
-    //! <b>Requires</b>: buckets must not be being used by any other resource.
-@@ -2403,10 +2458,10 @@ class hashtable_impl
-    {
-       this->priv_swap_cache(x);
-       x.priv_init_cache();
--      this->priv_size_traits().set_size(x.priv_size_traits().get_size());
--      x.priv_size_traits().set_size(size_type(0));
--      this->priv_split_traits().set_size(x.split_count());
--      x.priv_split_traits().set_size(size_type(0));
-+      this->priv_size_count(x.priv_size_count());
-+      x.priv_size_count(size_type(0));
-+      this->split_count(x.split_count());
-+      x.split_count(size_type(0));
-    }
- 
-    //! <b>Effects</b>: Equivalent to swap.
-@@ -2524,7 +2579,7 @@ class hashtable_impl
-    size_type size() const BOOST_NOEXCEPT
-    {
-       BOOST_IF_CONSTEXPR(constant_time_size)
--         return this->priv_size_traits().get_size();
-+         return this->priv_size_count();
-       else{
-          std::size_t len = 0;
-          std::size_t bucket_cnt = this->bucket_count();
-@@ -2798,7 +2853,7 @@ class hashtable_impl
-    //!   After a successful rehashing insert_commit_data remains valid.
-    iterator insert_unique_commit(reference value, const insert_commit_data &commit_data) BOOST_NOEXCEPT
-    {
--      this->priv_size_traits().increment();
-+      this->priv_size_inc();
-       node_ptr const n = this->priv_value_to_node_ptr(value);
-       BOOST_INTRUSIVE_SAFE_HOOK_DEFAULT_ASSERT(!safemode_or_autounlink || slist_node_algorithms::unique(n));
-       node_functions_t::store_hash(n, commit_data.get_hash(), store_hash_t());
-@@ -2890,7 +2945,7 @@ class hashtable_impl
-       //Get the bucket number and local iterator for both iterators
-       const bucket_ptr bp = this->priv_get_bucket_ptr(i);
-       this->priv_erase_node(*bp, i.slist_it(), this->make_node_disposer(disposer), optimize_multikey_t());
--      this->priv_size_traits().decrement();
-+      this->priv_size_dec();
-       this->priv_erasure_update_cache(bp);
-    }
- 
-@@ -2931,7 +2986,7 @@ class hashtable_impl
-          size_type const num_erased = (size_type)this->priv_erase_node_range
-             ( before_first_local_it, first_bucket_num, last_local_it, last_bucket_num
-             , this->make_node_disposer(disposer), optimize_multikey_t());
--         this->priv_size_traits().set_size(size_type(this->priv_size_traits().get_size()-num_erased));
-+         this->priv_size_count(size_type(this->priv_size_count()-num_erased));
-          this->priv_erasure_update_cache_range(first_bucket_num, last_bucket_num);
-       }
-    }
-@@ -3001,7 +3056,7 @@ class hashtable_impl
-                   (this->priv_value_from_siterator(it), h, key, equal_func, compare_hash_t()));
-             slist_node_algorithms::unlink_after_and_dispose(prev.pointed_node(), it.pointed_node(), this->make_node_disposer(disposer));
-          }
--         this->priv_size_traits().set_size(size_type(this->priv_size_traits().get_size()-cnt));
-+         this->priv_size_count(size_type(this->priv_size_count()-cnt));
-          this->priv_erasure_update_cache();
-       }
- 
-@@ -3020,7 +3075,7 @@ class hashtable_impl
-    void clear() BOOST_NOEXCEPT
-    {
-       this->priv_clear_buckets_and_cache();
--      this->priv_size_traits().set_size(size_type(0));
-+      this->priv_size_count(size_type(0));
-    }
- 
-    //! <b>Requires</b>: Disposer::operator()(pointer) shouldn't throw.
-@@ -3045,7 +3100,7 @@ class hashtable_impl
-             --num_buckets;
-             slist_node_algorithms::detach_and_dispose(b->get_node_ptr(), d);
-          }
--         this->priv_size_traits().set_size(size_type(0));
-+         this->priv_size_count(size_type(0));
-       }
-       this->priv_init_cache();
-    }
-@@ -3339,7 +3394,7 @@ class hashtable_impl
-    //!
-    //! <b>Note</b>: the return value is in the range [0, this->bucket_count()).
-    BOOST_INTRUSIVE_FORCEINLINE size_type bucket(const key_type& k) const
--   {  return this->bucket(k, this->priv_hasher());   }
-+   {  return this->priv_hash_to_nbucket(this->priv_hash(k));   }
- 
-    //! <b>Requires</b>: "hash_func" must be a hash function that induces
-    //!   the same hash values as the stored hasher. The difference is that
-@@ -3520,7 +3575,7 @@ class hashtable_impl
-          if((ret = split_idx < bucket_cnt)){
-             const std::size_t bucket_to_rehash = split_idx - bucket_cnt/2u;
-             bucket_type &old_bucket = this->priv_bucket(bucket_to_rehash);
--            this->priv_split_traits().increment();
-+            this->inc_split_count();
- 
-             //Anti-exception stuff: if an exception is thrown while
-             //moving elements from old_bucket to the target bucket, all moved
-@@ -3553,7 +3608,7 @@ class hashtable_impl
-          bucket_type &target_bucket = this->priv_bucket(target_bucket_num);
-          bucket_type &source_bucket = this->priv_bucket(split_idx-1u);
-          slist_node_algorithms::transfer_after(target_bucket.get_node_ptr(), source_bucket.get_node_ptr());
--         this->priv_split_traits().decrement();
-+         this->dec_split_count();
-          this->priv_insertion_update_cache(target_bucket_num);
-       }
-       return ret;
-@@ -3763,8 +3818,8 @@ class hashtable_impl
-       ArrayDisposer rollback2(old_buckets[0], nd, old_bucket_count);
- 
-       //Put size in a safe value for rollback exception
--      size_type const size_backup = this->priv_size_traits().get_size();
--      this->priv_size_traits().set_size(0);
-+      size_type const size_backup = this->priv_size_count();
-+      this->priv_size_count(0);
-       //Put cache to safe position
-       this->priv_init_cache();
-       this->priv_unset_sentinel_bucket();
-@@ -3826,8 +3881,8 @@ class hashtable_impl
-          }
-       }
- 
--      this->priv_size_traits().set_size(size_backup);
--      this->priv_split_traits().set_size(split);
-+      this->priv_size_count(size_backup);
-+      this->split_count(split);
-       if(&new_bucket_traits != &this->priv_bucket_traits())
-          this->priv_bucket_traits() = new_bucket_traits;
-       this->priv_set_sentinel_bucket();
-@@ -3927,8 +3982,8 @@ class hashtable_impl
-       this->priv_hasher() = src.priv_hasher();
-       this->priv_equal()  = src.priv_equal();
-       rollback.release();
--      this->priv_size_traits().set_size(src.priv_size_traits().get_size());
--      this->priv_split_traits().set_size(dst_bucket_count);
-+      this->priv_size_count(src.priv_size_count());
-+      this->split_count(dst_bucket_count);
-       this->priv_set_cache_bucket_num(0u);
-       this->priv_erasure_update_cache();
-    }
-@@ -3946,7 +4001,7 @@ class hashtable_impl
-          , n, optimize_multikey_t());
-       //Update cache and increment size if needed
-       this->priv_insertion_update_cache(bucket_num);
--      this->priv_size_traits().increment();
-+      this->priv_size_inc();
-       slist_node_algorithms::link_after(prev.pointed_node(), n);
-       return this->build_iterator(siterator(n), this->priv_bucket_ptr(bucket_num));
-    }
--- 
-2.34.1
-
diff --git a/package/boost/Config.in b/package/boost/Config.in
index b99b01f22e..614a71abb0 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -341,6 +341,19 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
 comment "boost-type_erasure needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+config BR2_PACKAGE_BOOST_URL
+	bool "boost-url"
+	help
+		Boost.URL is a portable C++ library which provides containers
+		and algorithms which model a "URL," more formally described
+		using the Uniform Resource Identifier (URI) specification.
+
+		This library understands the grammars related to URLs and
+		provides functionality to validate, parse, examine, and
+		modify urls, and apply normalization or resolution algorithms.
+
+		To use the library "header-only" this option is not needed.
+
 config BR2_PACKAGE_BOOST_WAVE
 	bool "boost-wave"
 	# limitation of assembler for coldfire
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index ab54a4b2fc..ebecc7ddc4 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_80_0.html
-sha256  1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0  boost_1_80_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_81_0.html
+sha256  71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa  boost_1_81_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index bd1d329982..ddc9283a19 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.80.0
+BOOST_VERSION = 1.81.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
@@ -18,7 +18,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	contract container coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
 	python random serialization stacktrace test thread timer \
-	type_erasure wave)
+	type_erasure url wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
@@ -50,6 +50,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
 
 BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
