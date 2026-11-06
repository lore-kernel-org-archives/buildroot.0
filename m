Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F80606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kEnCUKCf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5448360A59;
	Fri,  6 Nov 2026 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5WoYb9bdwQJ; Fri,  6 Nov 2026 16:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 41FBF608F3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981402;
	b=bBvkIww1rslBFlgMUY9D51+ItoJGP3fe47ljYfZ33Mu31LtjF+re1+TyU0D38T/k0rdr
	 70pT6x9gRtm6Mlpnw4cs1a/bN59yvFDZXADGB6Ysf3ppN4+ui/T9qugJLR2MRlGCF/q4/
	 RWU524h7VMbcpzDVialVcmukC8A/2jFvcHl3PMXx3fvpk2QdhZZZFFcLHTqyvhICPENcs
	 fcKucDNqYDUTHa35NF/JPSxikszdNEbXgYEPpnTcgcRYos2VoqpdvRuuY7safJBN5RTII
	 PI49j+JFZrEAt6+mZJS97oPmzVJW1xNj7EWaARKTT/fPwrG+HlryCHp9pzum2KaugJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=93e0Wzbi5XBmj5rw+znd8JHnC9JX4FH7IwC430slF64=;
	b=SHu4Xem3hKlH4Wuem7wqVLTsiTPcbk8FCpnxo45zaZ9N5zFdcOSDLq6F/aXQfm3Uk4Bd
	 8u1HzZSMTPIIWAqRHbmFIU+Y3axgCDQ8GVMZPepdInnB30abTLKtpdgUPgNF0l9T82S/X
	 6LPT3mmP+FJHLA+f0BJ2MkAfMr6LLzQXYzlfiyPeiGY95TEWDAXlp06OTtTgzwFXfijZn
	 2fp8aeONRxC2QClVWhyRtz83bW6aqDjNf50kY+5yxoVyCDLoaP0D/f04/vCyOsJ7mQGta
	 r68w/Exs34rtRTvaLgXLOQ0yXQZZ0Sd8b+mggNAl4ImQAytBvhqoFWDxyia9eCdWf7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981402;
	bh=93e0Wzbi5XBmj5rw+znd8JHnC9JX4FH7IwC430slF64=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kEnCUKCfWyGx9HLkiePT3UKniZUx6XPCFX7E1NLxFsoaUWTeL/1AwmpfqliJRTZZ4
	 QeshGnwpmoznEBGJMrIO2+lHwvkkeovK+aq29M+Nu8X5e6suQHIuhYuHYG9jgbMfK/
	 grotzQOPeGFSlSRrn07dC7rFtudzdlRIngrTjho3mTqTqlalfJk57k2pVMLpmekibu
	 JD8CDbX0X14GutmNnLqwbOXWrnpIr9pCqfQKlZ4kcQjbvVIcD9j70RUYKk+GOCAaSo
	 UXUiLv4/IlDSCnEt2IlX5hk3VGFY/ZDxSzvCSTpROM+On+T+3wNHuIkd7EympzLB7N
	 ggKqNcs2/M4SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FBF608F3;
	Fri,  6 Nov 2026 16:10:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F952E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16127403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bd4GhiRoOVE for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D8F99400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8F99400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so6396655e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981386; x=1794586186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z1ie/9flNtBh/sdrGs6y1JSk9Te/qAwbq6J8zRSG6ss=;
 b=KKrRn+7zSot5wBPeOE/kPFdDLijfVMyJARgwGBIyWNZ1RuncxTIFykq5pge45qf5Cz
 rnmkygL2oySGAFRbcz9uU3PsskKMlGTYSlV5ptCT/KGnCbHBbQoFSr0XaJHYafqd5GXq
 xFmicDtsVjswTFV4XBZ8g6CqNSolK8lrz4J1ADCpXcFswjVPCnD2qSGDXe/4B5TmLffO
 9VV4snDtGfyH173Z4tXo1Qb0MTV+caoP7dwEr8JyNnaq2tOljOkvsyDrSQujldRISxYo
 Pm13umokD3gowwvn0TQFwGCOh0GM77Mi/7s+LoM2IZBbCUjI9j//YRleLjxlyq/0pXrA
 DkhA==
X-Gm-Message-State: APuU4Z/RGfv39u+n/qd4l9BpoCqPvst15asGwHjEUcBiLmKBc6HZvljp
 uZBTYgg0CCbkCGoltsLv9C7UrI9axHrA8Ogqv3e8NmA11vcfpCpPHOj+KDRub/JCYs7yr9L9lMN
 e1Af0qF0=
X-Gm-Gg: AYBFou0ZD1l23beMDXkrYEX6Ppb9qHl9aNJ53TKAjjTxfo5VaIcMZrR0hoQU2ppMzqH
 f3+A7YA7YaOFArMO8yoWutvfYO1NVGotdrd2/D/qFDSlF4LAtp7z3AaYqzCgLeyt4LtzDBmrNuN
 2ySVFbY5i/hMsYx99dCEWkapsMI0vi7R7QiFZIenAjMvDg2+X4zrsgHuoJ8OCckUsGAjVV0gCDq
 RFt1xia2ZzK4nHNysl7OUfwXrDvYP5ZOw5D6ohlgb8/Lm6zgOBc5NuKPrrMPZDKuPRN0noXQLZE
 zaUVCFYfv1s7hbx9NHoNGgOyCQuiKuooK90X3Wn+1kJuiS6fE04kIkuWJwwlxXoCaIORjRQfJXX
 fvtFMuajmNViFIlUAWZMXWo4SOdHamfPIIA65/B3EaxePO/y6Bn1djN1/6noU60mtWNMx3nDKlF
 5M2BjfPVMt2vg5uWVg2Vw0XD9pKfjjiIrPnZ1W2rPz/JQdkXSqEcMFOduWGz+xtvf71A/lnLmNT
 ybEaK+clpLlTm6mh0stZRUoZx618gK1DsoW+beB+KVNDsLHNm3ugBs6x7uvYA9P5Q8OBEjfKAyf
 s4aoJaEtmb07AqbdHdXoyPLySq2ypho=
X-Received: by 2002:a05:600c:4e8f:b0:4b6:540d:6317 with SMTP id
 5b1f17b1804b1-4b6df3fd1cfmr53010435e9.12.1793981385782; 
 Fri, 06 Nov 2026 08:09:45 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b571f46538sm142069695e9.5.2026.11.06.08.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:45 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:42 +0100
Message-ID: <20261106160944.607316-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027081659.3905442-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: fix OpenSSL
 detection without libatomic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since version 4.5.3, libwebsockets adds -latomic to the libraries used
> by its OpenSSL API probes whenever 64-bit atomics don't work out of the
> box, without checking that libatomic is available. Buildroot toolchains
> without thread support don't provide libatomic, so on a CPU without
> native 64-bit atomics (e.g. ARMv5) all probes fail to link:
> 
>   ld: cannot find -latomic: No such file or directory
> 
> libwebsockets then assumes a pre-1.1 OpenSSL and fails to build:
> 
> -- Performing Test HAVE_WORKING_ATOMIC_64 - Failed
> [...]
> -- Looking for HMAC_CTX_new - not found
> [...]
> include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
>    93 |         HMAC_CTX ctx;
>       |                  ^~~
> 
> Add a patch, sent upstream, to only use libatomic if linking against it
> makes the 64-bit atomics test pass.
> 
> This issue has been present since commit 20c3eb6eb684
> ("package/libwebsockets: bump version to 4.5.7"), which bumped
> libwebsockets from 4.4.1 to 4.5.7, the atomic check having been added
> in 4.5.3. It therefore affects 2026.05 and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/863c30265623973e15a25c2d38c0e1631a39b7e8
> 
> Fixes: 20c3eb6eb68432c37d5db69963be266b7f2d23f7 ("package/libwebsockets: bump version to 4.5.7")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...ly-link-libatomic-if-it-is-available.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
> 
> diff --git a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
> new file mode 100644
> index 0000000000..84724f9c50
> --- /dev/null
> +++ b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
> @@ -0,0 +1,61 @@
> +From e0480a47e95a0d74c826926ae6bfef14fc8d988f Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 27 Oct 2026 08:47:29 +0100
> +Subject: [PATCH] cmake: openssl: only link libatomic if it is available
> +
> +Commit 09aade8c9 ("cmake: openssl: Added check for atomic library")
> +adds -latomic to CMAKE_REQUIRED_LIBRARIES whenever 64-bit atomics
> +don't work out of the box, without checking that libatomic exists.
> +
> +Some toolchains don't provide libatomic at all, e.g. GCC toolchains
> +built without thread support, as libatomic relies on pthreads. On such
> +a toolchain for a CPU without native 64-bit atomics (e.g. ARMv5), every
> +OpenSSL API probe then fails to link:
> +
> +  ld: cannot find -latomic: No such file or directory
> +
> +so lws believes it deals with a pre-1.1 OpenSSL and the build fails:
> +
> +  include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
> +     93 |         HMAC_CTX ctx;
> +        |                  ^~~
> +
> +Only use libatomic if linking against it makes the 64-bit atomics
> +test pass.
> +
> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: sent to Andy Green <andy@warmcat.com> on 2026-10-27
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + lib/tls/CMakeLists.txt | 15 +++++++++++----
> + 1 file changed, 11 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
> +index d91c3dab6..9060d32fe 100644
> +--- a/lib/tls/CMakeLists.txt
> ++++ b/lib/tls/CMakeLists.txt
> +@@ -564,10 +564,17 @@ if (DEFINED LIB_LIST)
> + endif()
> + if(UNIX AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang"))
> +   check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64)
> +-  if(HAVE_WORKING_ATOMIC_64)
> +-    set(LWS_ATOMIC_LIB "")
> +-  else()
> +-    set(LWS_ATOMIC_LIB atomic)
> ++  set(LWS_ATOMIC_LIB "")
> ++  if(NOT HAVE_WORKING_ATOMIC_64)
> ++    # libatomic is not always available (eg, toolchains without threads),
> ++    # only use it if it actually provides the 64-bit atomics
> ++    set(CMAKE_REQUIRED_LIBRARIES_SAVE ${CMAKE_REQUIRED_LIBRARIES})
> ++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} atomic)
> ++    check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
> ++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES_SAVE})
> ++    if(HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
> ++      set(LWS_ATOMIC_LIB atomic)
> ++    endif()
> +   endif()
> + endif()
> + if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
