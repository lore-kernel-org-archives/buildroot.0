Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B6C624A4
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 04:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C6760834;
	Thu,  3 Sep 2026 04:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzBh4jNtA3uX; Thu,  3 Sep 2026 04:03:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A22B160840
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788408186;
	b=E5SuFZ58F6HP7PH/Lj9OCYPy0E7X+zatdBYHUsla94lYCTfYK9ajSUMxBwH7xodfvjs7
	 94STp3yyjjusDm9hc3PpobqVLC8i/o/YN06i6sy0CFuXwWpfiyMDk/pZD+XZdjwd3tSLI
	 qVMsCeYAhwyx8uyYxhb8/r8r1g9W//kwWLbFu43qKoKZoxPYLV3rnO1EFbqSopQIIkDVE
	 2PpWtHrfkMOG5bE56JuNsfeGQ4O2beBFW514u7jwC1m33UNUCvSUi/YC4RViuK0XG+ZUq
	 ypbYKVw39j4snPIBZrfO7dPHnHnFuwM8VwrAWHcsbHfg+0A4DcX7YcS1ifS4D3R87Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788408186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wtl7n74kZeT+q29dMyJ7G6VwSjgaoGZNfEGNR7c2Bfo=;
	b=ZvxjHFaCMqbEnF8KoXZbEcVMwin8A+8sJis5sjOpgo8+RSn26Nr/MzesM9NR3/cFGznB
	 6tpQbfcwlv1Gg1iMY8JDWMs1Bx2BnQYO+zxekJvShA78wppRvbz2gWfzXtF9rEiDHkGn/
	 vMB54LyEUeKfdZohLllL31J4wkYFxLDbgG2Wnd6QOcsEJ9X84Gvfocwf4cGDwl4aZ+yeE
	 8pEmJKWW3Mmtel4NHYS/Fvjino7Y2aXnh7Xv9l4IDyqwg8widGmN3DRc5Wn92M9NoArkP
	 qE11Sp4pZnrOLcDWaw/1RDQucceDXFN1A62uO/Vb8denl4YWDT3ubJY0Nsa8ZS/b07w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788408186;
	bh=wtl7n74kZeT+q29dMyJ7G6VwSjgaoGZNfEGNR7c2Bfo=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AG9QoKrzhVjRylrf+N4PqXSMNl8Y5V2A1x9T4SIkcxWbSKGFDsme5xhjAg6lukrR0
	 Gp0tms3vPapUSRkHoQ4bkajOsklVDTihFR7mhiFOZIbYvJ1YaNwzXLFnIeTQnUR/qy
	 +BH+JYAi2YDr6mg4bvE2CjXkjwwBP5cmP0wp7A1ja5bMNsX7Ik5lSHZz6xscoDb4vb
	 40TLG6O0d7qsfaeOHOf1hNvbv3AlKMH10amUjlWAmnTETeyOHl9BmQsB5MyMgef6qT
	 5Ofd4sNn29SNsT5nEl5eEWGmvo+FYUfq+3BD5JJiG0JiFKSgsvjEjFZwPvUbEdhIy0
	 NgZUxVPqHZS1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22B160840;
	Thu,  3 Sep 2026 04:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80EF5498
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 04:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6692340063
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 04:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vh0qxbN4W-uX for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 04:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0C16D4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788408183;
 b=PdEv1oDm403RTNgSa1uD99WBRRuN2VKuhacPavKPuw1UgUU0deh2/QaFBceg36Iq8Zuo
 k+Hg9R0nxMTEIQeb21Duc1SjDS0F7MVko74FNnUEtZWp/jBahrv2WOwlET5qOTu/M4CiG
 Tgm4EVn9pncmVcgVFvp6zE2WHnk2/hrD+VhRL496bK/QrufHC9sgKoBCcn0dH3E1EamSj
 TEEoh8Xv+nnCy41q0eazxxKqF1pb05p8KN6z1xBTaLdLWEdvagGCjwejwB3uqPTcPpBg+
 y8edHUv/7CeozgTxkzbGTziRDRqFVsBQsj8h7PbYaC7L4S9SnDQnSbTejCSFfLUv8og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788408183;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=FcJ4FQAyX3CBsAConu/VrkIe8cCl3d6cag6iQjkFTOE=;
 b=Zq9tXAtxQTTEDUV2CPOHQz9N0ycMKjfZXGZjKBU/spqjseE06Pi1NAFg6JcrN7/mp7my
 9ySpPhAlaghtvN+t6U0qQzXWxWMDUtXlstWs8Hhqfypy5Wtr//Lbm7inwi2mROof0fuvG
 12sg3kuesGzxJ0Lztos3/F3magOcmdcQYJTBKMDsQSO0Ye1epIaSb+LKU7Emas6W7+wB1
 5nzybP87jSeNzoQoNljmmFp0mTzFW5BibY5fMqRwy8TZdTJY59hbazqXFlMCtNeTS88Z9
 6RYmXse+l/AqKM5OCfHdPlmWgEVkltAaJrVsIx39rxZ9Y5Wgbbl1X2nZxr0lT3N4fLA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=D0MrBerE; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C16D4002B
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 04:03:02 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 33405440852;
 Thu,  3 Sep 2026 07:02:44 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260902203317.2400170-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 2 Sep 2026 22:33:15 +0200")
References: <20260902203317.2400170-1-bernd@kuhls.net>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Thu, 03 Sep 2026 07:02:58 +0300
Message-ID: <874ig7nfrh.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: disable atomic
 operations for m68k Coldfire
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Wed, Sep 02 2026, Bernd Kuhls wrote:
> This patch fixes a build error with OpenSSL-enabled libcurl which was
> detected by the Gitlab pipelines:
>
> checking for openssl options with pkg-config... found
> configure: pkg-config: SSL_LIBS: "-lssl -lcrypto -pthread"
> configure: pkg-config: SSL_LDFLAGS:
> "-L/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib"
> configure: pkg-config: SSL_CPPFLAGS: ""
> checking for HMAC_Update in -lcrypto... no
> checking for HMAC_Init_ex in -lcrypto... no
> checking OpenSSL linking with -ldl... no
> checking OpenSSL linking with -ldl and -lpthread... no
> checking for SSL_set_quic_use_legacy_codepoint... no
> checking for SSL_set_quic_tls_cbs... no
> configure: OpenSSL version does not speak any known QUIC API
> configure: OPT_OPENSSL:
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/m68k-buildroot-uclinux-uclibc/sysroot/usr
> configure: OPENSSL_ENABLED:
> configure: error: --with-openssl was given but OpenSSL could not be detected
> make[1]: *** [package/pkg-generic.mk:263:
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/build/libcurl-8.21.0/.stamp_configured]
> Error 1
>
> Although OpenSSL was found using pkg-config the build tests fail.
>
> A local build shows the concrete error in config.log, for example:
>
> configure:27577: checking for HMAC_Update in -lcrypto
> configure:27599: /home/bernd/buildroot/output/host/bin/m68k-linux-gcc
>  -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>  -D_FILE_OFFSET_BITS=64 -O2 -g0 -fno-dwarf2-cfi-asm -Wl,-elf2flt=-r
>  -static -Werror-implicit-function-declaration -Wno-system-headers
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>  -D_GNU_SOURCE     -Wl,-elf2flt=-r -static
>  -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
>  -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
>  conftest.c -lcrypto  -lssl -lcrypto -lz -pthread -lz  >&5
> /home/bernd/buildroot/output/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
>  /home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-threads_pthread.o):
>  in function `ossl_rcu_read_lock':
> threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
>
> This error occurs many times for various atomic operations:
>
> $ grep "undefined reference to \`__atomic" output/build/libcurl-8.20.0/config.log | sort -u | grep -v real
> threads_pthread.c:(.text+0x28a): undefined reference to `__atomic_fetch_sub_8'
> threads_pthread.c:(.text+0x3b4): undefined reference to `__atomic_fetch_add_8'
> threads_pthread.c:(.text+0x9c8): undefined reference to `__atomic_is_lock_free'
> threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
> threads_pthread.c:(.text+0xa9c): undefined reference to `__atomic_is_lock_free'
> threads_pthread.c:(.text+0xb66): undefined reference to `__atomic_is_lock_free'
> threads_pthread.c:(.text+0xc30): undefined reference to `__atomic_is_lock_free'
> threads_pthread.c:(.text+0xcdc): undefined reference to `__atomic_is_lock_free'
>
> The build error can be reproduced with the current buildroot tree using
> this defconfig:
>
> BR2_m68k=y
> BR2_m68k_cf5208=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE=y
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBCURL=y
>
> Although the toolchain lacks atomics support
>
> $ grep ATOMIC .config
> $
>
> it emits atomic-related defines, for example:
>
> $ echo | output/host/bin/m68k-linux-gcc -dM -E - | grep __ATOMIC_ACQ_REL
> $

git-commit strips lines starting with '#' from commit message. Try
committing with --cleanup=whitespace.

Thanks for the patch,
baruch

>
> This specific define __ATOMIC_ACQ_REL is used in OpenSSL to enable
> atomic support at various places:
> https://github.com/openssl/openssl/blob/openssl-3.6.3/crypto/threads_pthread.c
>
> causing the build errors we see with the mentioned defconfig.
>
> To fix the problem we use an OpenSSL-provided define to forcefully
> disable the usage of atomic intrinsics.
>
> The misdetection of atomic intrinsics for m68k coldfire is not a new
> problem:
> https://lists.buildroot.org/pipermail/buildroot/2017-May/180841.html
> https://lists.buildroot.org/pipermail/buildroot/2026-May/803110.html
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libopenssl/libopenssl.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 9ddc85c197..9b3eec4baa 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -23,6 +23,10 @@ ifeq ($(BR2_m68k_cf),y)
>  LIBOPENSSL_CFLAGS += -mxgot
>  # resolves an assembler "out of range error" with blake2 and sha512 algorithms
>  LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
> +# disable atomic operations
> +ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),)
> +LIBOPENSSL_CFLAGS += -DBROKEN_CLANG_ATOMICS
> +endif
>  endif
>  
>  ifeq ($(BR2_USE_MMU),)

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
