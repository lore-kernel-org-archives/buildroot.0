Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95B66103B;
	Thu, 16 Dec 2021 20:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgMkr4T8N2wa; Thu, 16 Dec 2021 20:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC0061057;
	Thu, 16 Dec 2021 20:15:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C69A51BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F0D83E8B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWdxvzs9Y58k for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55E5C82640
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:15:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so90234468eda.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VuHp2mu81FAj7NgYGxyH2SiYtTzwvaH6FCUktYCEAjI=;
 b=LmmYgJnIWW5oOeFE06g3a+cr9CW0M1gWR7lc3s68GiS3yXZim0i8aLAogKo+ItLLYG
 BH+QP4MwYxv1M50i97NaYZ6RYf9jHtwf5at4e8UncKB4JXIJBkIOt/v7dvfZtOVyvmdy
 BAC2xmMyiyqFujn/7JovYLy1Wnjg5wxZcN7fPgwWdHTcGS3wjW3LuOl8BrEuB2zMA51B
 cU5LT9E2FZ+AkTCJmI25fJnadgrLPka0n4bd4wL5wTTA/CLj9YFxjvY+7/uA4SbaM9OF
 dRaQx2mPFuXhv4F5EoB/bT7p0WG+10/2fDszog1z5RuZ9FReYcLmei+uPINLoXfdM29d
 1DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VuHp2mu81FAj7NgYGxyH2SiYtTzwvaH6FCUktYCEAjI=;
 b=AsARudqGrK2LsTWzrgplDuz22OuWcDVBQ9XUgTFGdcLHEQXrJrJffziRAVzCFDE7PB
 NBwlZYoP7effGTmJtDENLs31S2o6RR3HGGYSvzfFtOBpCchGT2JAwoVXJz5VlhTzWJDJ
 /63PblFXksJB1DuzwNxoPWWsaKzA7vjvsqyOv1gum7rnc/lbh4Xc3XHY1hcL3syfq7r5
 KtYHym7QnK9QNXeCO5j1GOXnfwfgPYOoTyn1YtuexlHgna4bM5/37Dji3pSZa6s8NHTi
 /9jlGMqDonM2yANKrOEr1s7BbeUaZ22UW9KELQJDdiVmP66AoFq+s8VWF6qU5BL7U/+0
 yVmg==
X-Gm-Message-State: AOAM530grxZ+XQqrI3eFR/YcmSvuHLelL6NWpuh4MDh3YGCdUGQzQo4+
 nCShX4oBW7uSE3VQFQ6HRazpB8m/zmb+sA==
X-Google-Smtp-Source: ABdhPJzFog3/2nx+k4dDggMOpN4nTyRypGCzm5jGfGNRgcTXEMlu3xiLBmKsTji+1igQ/NvltsRjcg==
X-Received: by 2002:a17:907:9726:: with SMTP id
 jg38mr3986239ejc.149.1639685714537; 
 Thu, 16 Dec 2021 12:15:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qt5sm120347ejb.214.2021.12.16.12.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:15:14 -0800 (PST)
Message-ID: <a9519fd7-dcff-974e-dd98-4c453560c1f3@mind.be>
Date: Thu, 16 Dec 2021 21:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20211216124221.3145277-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216124221.3145277-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.78.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 13:42, Michael Nosthoff via buildroot wrote:
> * drop all upstreamed patches
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> compile tested for arm Cortex A15, sparc64 and nios2
> ---
>   .../boost/0001-added-missing-brackets.patch   |  29 ----
>   ...th_no_atomic_int-on-the-command-line.patch |  52 ------
>   ...oft-failure-in-bernoulli_details_hpp.patch | 150 ------------------
>   package/boost/boost.hash                      |   4 +-
>   package/boost/boost.mk                        |   2 +-
>   5 files changed, 3 insertions(+), 234 deletions(-)
>   delete mode 100644 package/boost/0001-added-missing-brackets.patch
>   delete mode 100644 package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
>   delete mode 100644 package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> 
> diff --git a/package/boost/0001-added-missing-brackets.patch b/package/boost/0001-added-missing-brackets.patch
> deleted file mode 100644
> index 1a2d5e67ec..0000000000
> --- a/package/boost/0001-added-missing-brackets.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 1be0e4a2d8db15a405f64a6f65507b87c1be7e1a Mon Sep 17 00:00:00 2001
> -From: tkoecker <tkoecker@gmx.net>
> -Date: Fri, 21 May 2021 16:31:11 +0200
> -Subject: [PATCH] added missing brackets (#118)
> -
> -[Retrieved from:
> -https://github.com/boostorg/predef/commit/1be0e4a2d8db15a405f64a6f65507b87c1be7e1a]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - include/boost/predef/architecture/sparc.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/boost/predef/architecture/sparc.h b/boost/predef/architecture/sparc.h
> -index d7b94f0..d01605e 100644
> ---- a/boost/predef/architecture/sparc.h
> -+++ b//boost/predef/architecture/sparc.h
> -@@ -34,10 +34,10 @@ Distributed under the Boost Software License, Version 1.0.
> -
> - #if defined(__sparc__) || defined(__sparc)
> - #   undef BOOST_ARCH_SPARC
> --#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
> -+#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__))
> - #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(9,0,0)
> - #   endif
> --#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__)
> -+#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__))
> - #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(8,0,0)
> - #   endif
> - #   if !defined(BOOST_ARCH_SPARC)
> diff --git a/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> deleted file mode 100644
> index 063491de06..0000000000
> --- a/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
> -From: jzmaddock <john@johnmaddock.co.uk>
> -Date: Wed, 1 Sep 2021 18:54:54 +0100
> -Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
> - line. Allows us to test/emulate platforms with no atomic integers.
> -
> -[buildroot@heine.tech:
> -  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
> -  - alter path to match boost release
> -]
> -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ----
> - boost/math/tools/atomic.hpp | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hpp
> -index cc76ed269f..e3cbf5db89 100644
> ---- a/boost/math/tools/atomic.hpp
> -+++ b/boost/math/tools/atomic.hpp
> -@@ -16,27 +16,27 @@
> - namespace boost {
> -    namespace math {
> -       namespace detail {
> --#if ATOMIC_INT_LOCK_FREE == 2
> -+#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> -          typedef std::atomic<int> atomic_counter_type;
> -          typedef std::atomic<unsigned> atomic_unsigned_type;
> -          typedef int atomic_integer_type;
> -          typedef unsigned atomic_unsigned_integer_type;
> --#elif ATOMIC_SHORT_LOCK_FREE == 2
> -+#elif (ATOMIC_SHORT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> -          typedef std::atomic<short> atomic_counter_type;
> -          typedef std::atomic<unsigned short> atomic_unsigned_type;
> -          typedef short atomic_integer_type;
> -          typedef unsigned short atomic_unsigned_type;
> --#elif ATOMIC_LONG_LOCK_FREE == 2
> -+#elif (ATOMIC_LONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> -          typedef std::atomic<long> atomic_unsigned_integer_type;
> -          typedef std::atomic<unsigned long> atomic_unsigned_type;
> -          typedef unsigned long atomic_unsigned_type;
> -          typedef long atomic_integer_type;
> --#elif ATOMIC_LLONG_LOCK_FREE == 2
> -+#elif (ATOMIC_LLONG_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> -          typedef std::atomic<long long> atomic_unsigned_integer_type;
> -          typedef std::atomic<unsigned long long> atomic_unsigned_type;
> -          typedef long long atomic_integer_type;
> -          typedef unsigned long long atomic_unsigned_integer_type;
> --#else
> -+#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
> - #  define BOOST_MATH_NO_ATOMIC_INT
> - #endif
> -       } // Namespace detail
> diff --git a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> deleted file mode 100644
> index 7e324e310c..0000000000
> --- a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
> -From: jzmaddock <john@johnmaddock.co.uk>
> -Date: Wed, 1 Sep 2021 20:31:53 +0100
> -Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
> - Include an "escape macro" so thread safety can be disabled if certain
> - bernoulli features are to be used in a no-atomics environment. Fixes
> - https://github.com/boostorg/math/issues/673.
> -
> -[buildroot@heine.tech:
> -  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
> -  - alter path to match boost release
> -]
> -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ----
> - .../detail/bernoulli_details.hpp                 | 10 +++++++---
> - libs/math/test/Jamfile.v2                        |  3 +++
> - test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
> - test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
> - test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
> - 5 files changed, 55 insertions(+), 3 deletions(-)
> - create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
> - create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
> - create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
> -
> -diff --git a/boost/math/special_functions/detail/bernoulli_details.hpp b/boost/math/special_functions/detail/bernoulli_details.hpp
> -index cf35545264..8519b7c89c 100644
> ---- a/boost/math/special_functions/detail/bernoulli_details.hpp
> -+++ b/boost/math/special_functions/detail/bernoulli_details.hpp
> -@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
> -          return out;
> -       }
> -
> --      #ifndef BOOST_HAS_THREADS
> -+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> -       //
> -       // Single threaded code, very simple:
> -       //
> -@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
> -          *out = (i >= m_overflow_limit) ? policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) : bn[i];
> -          ++out;
> -       }
> -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> -+      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
> -       #else
> -       //
> -       // Double-checked locking pattern, lets us access cached already cached values
> -@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
> -          return out;
> -       }
> -
> --      #ifndef BOOST_HAS_THREADS
> -+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> -       //
> -       // Single threaded code, very simple:
> -       //
> -@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
> -          }
> -          ++out;
> -       }
> -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> -+      static_assert(sizeof(T) == 1, "Unsupported configuration: your platform appears to have no atomic integers.  If you are happy with thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to suppress this error.");
> -       #else
> -       //
> -       // Double-checked locking pattern, lets us access cached already cached values
> -@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
> -    // The value at which we know overflow has already occurred for the Bn:
> -    std::size_t m_overflow_limit;
> -
> --   #ifdef BOOST_HAS_THREADS
> -+   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> -    std::mutex m_mutex;
> -    atomic_counter_type m_counter, m_current_precision;
> -    #else
> -diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
> -index 52fb87f5e5..3ac63f9279 100644
> ---- a/libs/math/test/Jamfile.v2
> -+++ b/libs/math/test/Jamfile.v2
> -@@ -1137,6 +1137,9 @@ test-suite misc :
> -
> - #   [ run __temporary_test.cpp test_instances//test_instances : : : <test-info>always_show_run_output <pch>off ]
> -    [ compile test_no_long_double_policy.cpp ]
> -+   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
> -+   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
> -+   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
> - ;
> -
> - test-suite interpolators :
> -diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compile_test/bernoulli_no_atomic_d.cpp
> -new file mode 100644
> -index 0000000000..61926f7e1f
> ---- /dev/null
> -+++ b/test/compile_test/bernoulli_no_atomic_d.cpp
> -@@ -0,0 +1,14 @@
> -+//  (C) Copyright John Maddock 2021.
> -+//  Use, modification and distribution are subject to the
> -+//  Boost Software License, Version 1.0. (See accompanying file
> -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> -+
> -+#define BOOST_MATH_NO_ATOMIC_INT
> -+
> -+#include <boost/math/special_functions/bernoulli.hpp>
> -+#include "test_compile_result.hpp"
> -+
> -+void compile_and_link_test()
> -+{
> -+   check_result<double>(boost::math::bernoulli_b2n<double>(4));
> -+}
> -diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/compile_test/bernoulli_no_atomic_fail.cpp
> -new file mode 100644
> -index 0000000000..bbd7152412
> ---- /dev/null
> -+++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
> -@@ -0,0 +1,15 @@
> -+//  (C) Copyright John Maddock 2021.
> -+//  Use, modification and distribution are subject to the
> -+//  Boost Software License, Version 1.0. (See accompanying file
> -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> -+
> -+#define BOOST_MATH_NO_ATOMIC_INT
> -+
> -+#include <boost/math/special_functions/bernoulli.hpp>
> -+#include <boost/multiprecision/cpp_bin_float.hpp>
> -+#include "test_compile_result.hpp"
> -+
> -+void compile_and_link_test()
> -+{
> -+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> -+}
> -diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/compile_test/bernoulli_no_atomic_mp.cpp
> -new file mode 100644
> -index 0000000000..8d5a6e78e6
> ---- /dev/null
> -+++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
> -@@ -0,0 +1,16 @@
> -+//  (C) Copyright John Maddock 2021.
> -+//  Use, modification and distribution are subject to the
> -+//  Boost Software License, Version 1.0. (See accompanying file
> -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> -+
> -+#define BOOST_MATH_NO_ATOMIC_INT
> -+#define BOOST_MATH_BERNOULLI_UNTHREADED
> -+
> -+#include <boost/math/special_functions/bernoulli.hpp>
> -+#include <boost/multiprecision/cpp_bin_float.hpp>
> -+#include "test_compile_result.hpp"
> -+
> -+void compile_and_link_test()
> -+{
> -+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> -+}
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index 96419506cd..a174e414ee 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,5 +1,5 @@
> -# From https://www.boost.org/users/history/version_1_77_0.html
> -sha256  fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854  boost_1_77_0.tar.bz2
> +# From https://www.boost.org/users/history/version_1_78_0.html
> +sha256  8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc  boost_1_78_0.tar.bz2
>   
>   # Locally computed
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 3bc8a83875..6e026f4781 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BOOST_VERSION = 1.77.0
> +BOOST_VERSION = 1.78.0
>   BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
>   BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
>   BOOST_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
