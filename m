Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF18BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99693404F7;
	Sat, 30 Apr 2022 18:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dy6AKo5Hiobf; Sat, 30 Apr 2022 18:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 659E0404D3;
	Sat, 30 Apr 2022 18:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBD721BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F5A60B5E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvY-yU12PEW0 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AFCA60B58
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:51:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i19so21012377eja.11
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XW93uIaoyD/tgif5hFB8bLwz3hU3kUYjQ+KGYaDXJyY=;
 b=ZVjiPW8pDoKqk3pTCCFgpdEa6CJ3/m0DXgmUYNMUUAazL/+fy1aRuXjJ7NwDx7t1yn
 eTujxvwV0K03bbZRrp/VKKRSrzskrk/xoy9cwy9UYhBuPuFM2U7vuQxuFH5xwpPbEQSP
 0e6+AFKMomWkJCZrfrUPpoBfHT3fRSQnI0VwnVpsw9NSLIr7jppXKXxrgOSAXjBEzHwC
 vQQbNx6H4MlLg8gIaMXoL+1Po+6GCd8UtGtOQrlXEbfBlGUc5Zhi2Mxaz1MSBUR/SOzn
 m/7X6XuPvATJhu8sbxC9H+Dci76tzJpOv4cYFUslE3lN4ma7iuKgoTVtgYWjObsi9Pf/
 Ol+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XW93uIaoyD/tgif5hFB8bLwz3hU3kUYjQ+KGYaDXJyY=;
 b=MRfyC/QBFtEtQHorNKkpL4k2hpSPCWMaBf94WP4RdHihtX5fRGx7TmWP2vU0JgoBVl
 Smky9DggtUJTmDUz8EI6JHtn/YEEA2ZYgviYsjnGh4Lxyv5TjaEOPwikPoXtwWrEq93a
 pCShFTUYgCU0wfX33icSrU5LUFB42IjIZzxrH0LDafGAlbyzY5vkKkkZ98o6wBg8v9AJ
 IRZKt/4hSwf0U4xXx+BR+nwC7TIQ7Q/ASYXk7Bey//+bElqLaE/IHWc5vqiWItc9AxOp
 APVobDTanXFnSQoLozInw6esiBflXYCjghwoThimSsWlC7iQhAcqYROwSUaMH6f9yP6R
 Bj1g==
X-Gm-Message-State: AOAM530lz06gO9Cy7oF0ByefSm3/GBTYVXLuknBJF5WviGz88WWHehWQ
 xvjd7WFhFxG+96PJ/dK+f3FJzQ==
X-Google-Smtp-Source: ABdhPJznSPo4WbsRjqo7P04FHmdqHqv8Z34TVbaQpkdoU5BB0W3Ikou4Hu2A6Vm96Q+WsWmeWTiZpQ==
X-Received: by 2002:a17:907:6092:b0:6f3:9d63:3b45 with SMTP id
 ht18-20020a170907609200b006f39d633b45mr5008065ejc.703.1651344679875; 
 Sat, 30 Apr 2022 11:51:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 eb8-20020a170907280800b006f3ef214decsm1829156ejc.82.2022.04.30.11.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:51:19 -0700 (PDT)
Message-ID: <a978fc11-b30e-73b3-feb5-3dbe3834abb0@mind.be>
Date: Sat, 30 Apr 2022 20:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220429183708.3819668-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220429183708.3819668-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/tor: add -lz to fix static
 builds
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



On 29/04/2022 20:37, Bernd Kuhls wrote:
> In order to remove a patch which needs frequent updates on major version
> bumps and to get rid of autoreconf we just add -lz when creating a static
> build. This make sure that static linking occurs in the right order.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
> Tested using this defconfig
> 
> BR2_PACKAGE_XZ=y
> BR2_PACKAGE_ZSTD=y
> BR2_PACKAGE_TOR=y
> 
>                               andes-nds32 [ 1/45]: OK
>                               arm-aarch64 [ 2/45]: OK
>                     bootlin-aarch64-glibc [ 3/45]: OK
>                 bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                      bootlin-armv5-uclibc [ 5/45]: OK
>                       bootlin-armv7-glibc [ 6/45]: OK
>                     bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                        bootlin-armv7-musl [ 8/45]: OK
>                  bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
>                 bootlin-m68k-68040-uclibc [10/45]: OK
>               bootlin-microblazeel-uclibc [11/45]: OK
>                  bootlin-mipsel32r6-glibc [12/45]: OK
>                     bootlin-mipsel-uclibc [13/45]: OK
>                       bootlin-nios2-glibc [14/45]: OK
>                   bootlin-openrisc-uclibc [15/45]: OK
>          bootlin-powerpc64le-power8-glibc [16/45]: OK
>             bootlin-powerpc-e500mc-uclibc [17/45]: OK
>                     bootlin-riscv32-glibc [18/45]: OK
>                     bootlin-riscv64-glibc [19/45]: OK
>                      bootlin-riscv64-musl [20/45]: OK
>                        bootlin-sh4-uclibc [21/45]: OK
>                     bootlin-sparc64-glibc [22/45]: OK
>                      bootlin-sparc-uclibc [23/45]: OK
>                      bootlin-x86-64-glibc [24/45]: OK
>                       bootlin-x86-64-musl [25/45]: OK
>                     bootlin-x86-64-uclibc [26/45]: OK
>                     bootlin-xtensa-uclibc [27/45]: OK
>                              br-arm-basic [28/45]: OK
>                      br-arm-full-nothread [29/45]: SKIPPED
>                        br-arm-full-static [30/45]: OK
>                     br-i386-pentium4-full [31/45]: OK
>                  br-i386-pentium-mmx-musl [32/45]: OK
>                        br-mips64-n64-full [33/45]: OK
>                   br-mips64r6-el-hf-glibc [34/45]: OK
>                 br-powerpc-603e-basic-cpp [35/45]: OK
>                 br-powerpc64-power7-glibc [36/45]: OK
>                         linaro-aarch64-be [37/45]: OK
>                            linaro-aarch64 [38/45]: OK
>                                linaro-arm [39/45]: OK
>                       sourcery-arm-armv4t [40/45]: OK
>                              sourcery-arm [41/45]: OK
>                       sourcery-arm-thumb2 [42/45]: OK
>                           sourcery-mips64 [43/45]: OK
>                             sourcery-mips [44/45]: OK
>                            sourcery-nios2 [45/45]: OK
> 45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>   ...0001-Fix-static-linking-with-OpenSSL.patch | 94 -------------------
>   package/tor/tor.mk                            |  7 +-
>   2 files changed, 5 insertions(+), 96 deletions(-)
>   delete mode 100644 package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> 
> diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> deleted file mode 100644
> index 26ed6fe819..0000000000
> --- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -From ba6b8ee5b6dee19493a150c3715b0e202440d206 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Thu, 24 Jan 2019 18:19:51 +0100
> -Subject: [PATCH] Fix static linking with OpenSSL
> -
> -Adjust link order of libz to solve bug with static linking
> -and remove host paths when looking for openssl.
> -
> -[Vincent:
> - - Adapt the patch to make it apply on the new version.]
> -[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
> -        0.3.4.8, 0.3.5.7, 0.4.4.5, 0.4.5.6 & 0.4.6.7]
> -[Fabrice: fix detection of openssl functions in 0.3.5.8]
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac         | 4 ++--
> - src/test/include.am  | 8 ++++----
> - src/tools/include.am | 4 ++--
> - 4 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 05e1392cf..580befa6b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1074,7 +1074,7 @@ AC_ARG_WITH(ssl-dir,
> -   ])
> -
> - AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
> --TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
> -+TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
> -     [#include <openssl/ssl.h>
> -      char *getenv(const char *);],
> -     [struct ssl_cipher_st;
> -@@ -1104,7 +1104,7 @@ dnl Now check for particular openssl functions.
> - save_LIBS="$LIBS"
> - save_LDFLAGS="$LDFLAGS"
> - save_CPPFLAGS="$CPPFLAGS"
> --LIBS="$TOR_OPENSSL_LIBS $LIBS"
> -+LIBS="$TOR_OPENSSL_LIBS -lz $LIBS"
> - LDFLAGS="$TOR_LDFLAGS_openssl $LDFLAGS"
> - CPPFLAGS="$TOR_CPPFLAGS_openssl $CPPFLAGS"
> -
> -diff --git a/src/test/include.am b/src/test/include.am
> -index ecb768957..39a622e88 100644
> ---- a/src/test/include.am
> -+++ b/src/test/include.am
> -@@ -399,8 +399,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
> - src_test_test_ntor_cl_LDADD = \
> - 	libtor.a \
> - 	$(rust_ldadd) \
> --	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
> --	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
> -+	@TOR_LIB_MATH@ \
> -+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
> - 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@ @TOR_TRACE_LIBS@
> - src_test_test_ntor_cl_AM_CPPFLAGS =	       \
> - 	$(AM_CPPFLAGS)
> -@@ -409,8 +409,8 @@
> - src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
> - src_test_test_hs_ntor_cl_LDADD = \
> - 	libtor.a \
> --	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
> --	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
> -+	@TOR_LIB_MATH@ \
> -+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
> -         @CURVE25519_LIBS@ @TOR_TRACE_LIBS@
> - src_test_test_hs_ntor_cl_AM_CPPFLAGS =	       \
> - 	$(AM_CPPFLAGS)
> -diff --git a/src/tools/include.am b/src/tools/include.am
> -index f7aa7e0d1..4c4e8aa7a 100644
> ---- a/src/tools/include.am
> -+++ b/src/tools/include.am
> -@@ -35,7 +35,7 @@ src_tools_tor_gencert_LDADD = \
> - 	$(TOR_CRYPTO_LIBS) \
> - 	$(TOR_UTIL_LIBS) \
> - 	$(rust_ldadd) \
> --	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ $(TOR_LIBS_CRYPTLIB) \
> -+	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
> - 	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
> - endif
> -
> -@@ -45,7 +45,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
> - 	src/trunnel/libor-trunnel.a \
> -         $(TOR_CRYPTO_LIBS) \
> -         $(TOR_UTIL_LIBS) \
> --	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) \
> -+	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
> - 	@TOR_LIB_WS32@ @TOR_LIB_USERENV@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@
> -
> - if USE_NSS
> ---
> -2.20.1
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index d16b3541eb..78a6de66dc 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -11,7 +11,6 @@ TOR_LICENSE_FILES = LICENSE
>   TOR_CPE_ID_VENDOR = torproject
>   TOR_SELINUX_MODULES = tor
>   TOR_DEPENDENCIES = libevent openssl zlib
> -TOR_AUTORECONF = YES
>   
>   TOR_CONF_OPTS = \
>   	--disable-gcc-hardening \
> @@ -64,8 +63,12 @@ endif
>   TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -TOR_CONF_ENV += LIBS=-latomic
> +TOR_LIBS += -latomic
>   endif
> +ifeq ($(BR2_STATIC_LIBS),y)
> +TOR_LIBS += -lz
> +endif
> +TOR_CONF_ENV += LIBS="$(TOR_LIBS)"
>   
>   define TOR_INSTALL_CONF
>   	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
