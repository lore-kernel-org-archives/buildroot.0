Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8EBC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B8782179;
	Sun, 21 May 2023 15:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B8782179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pePXi8YpLaxl; Sun, 21 May 2023 15:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D56082183;
	Sun, 21 May 2023 15:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D56082183
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9B841BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC38B405F5
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC38B405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2-9bZfdYQUH for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:44:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A5024011B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A5024011B
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:44:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0B4AB0053D;
 Sun, 21 May 2023 17:44:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:44:48 +0200
Date: Sun, 21 May 2023 17:44:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230521154448.GG171618@scaer>
References: <20230503024211.588536-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503024211.588536-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684683893;
 bh=XkDI1Qq9GXbu2ewYzF6YcIfafYI/vKdjSkTulyFTnDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8nRIh5tBd46mNDgkGG5sKVp+Pbj2KDq4tjCvM6n4KHu7IpoiZTuZoSWpYyx59/XV
 UUFFM2/GlBgxKVo3l43SrofKVgfTKuQIyprsuFpwUHqmaAeopRDu90TjQuhMrhDm5c
 TJOJV28IEzHjA2ccoPSBQOyauEz+E/gmeM0z7xDtNbfU4vBKGg5E/7ZCwre2bFaCBr
 IHXkQElSjbb0rT8ohfKaT3xa/GWO7sWvlWAZlfby8ZfMyw3XMbuIwttfEoXNm2I5w1
 Fl13bMWQHsapZw5eJ3IJkhbHhHQhTd4RkgTlSle8sdDJmCBgnwYGQcRIPLqd2LD+gR
 NuSc6lfnGLeGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h8nRIh5t
Subject: Re: [Buildroot] [PATCH] package/libspdm: Initial commit
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair, All,

On 2023-05-03 12:42 +1000, Alistair Francis spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/Config.in                             |    1 +
>  ...CMakeLists.txt-Don-t-build-unit_test.patch |  114 ++
>  ...Lists.txt-Don-t-hard-code-toolchains.patch |  604 ++++++++++
>  ...ists.txt-Look-for-libcmocka-static.a.patch | 1009 +++++++++++++++++
>  .../0004-os_stub-openssllib-Enable-PIC.patch  |   41 +
>  ...penssllib-Support-more-archetectures.patch |   74 ++

Those are quite intrusive patches, and we'll have to maintain them
ad-libitum, as they do not look like they are upstreamable.

For example, the patch disabling the tests probably has zero chance of
being accepted upstream as-is. Instead, a patch that adds an option
-DENABLE_TESTS=[YES,NO]  (with YES the default), has much more chances
to get accepted upstream.

And so on for the other patches.

So, in short: please try to work with upstream to resolve the issues
first, and when upstream has solved the issues (or the patches are
converging to an upstream acceptble situation), please respin.

In the meantime, I've marked this patch as changes-requested (amd the
cmocka one as rejected).

Regards,
Yann E. MORIN.

>  package/libspdm/Config.in                     |    9 +
>  package/libspdm/libspdm.hash                  |    3 +
>  package/libspdm/libspdm.mk                    |   72 ++
>  9 files changed, 1927 insertions(+)
>  create mode 100644 package/libspdm/0001-CMakeLists.txt-Don-t-build-unit_test.patch
>  create mode 100644 package/libspdm/0002-CMakeLists.txt-Don-t-hard-code-toolchains.patch
>  create mode 100644 package/libspdm/0003-unit_test-CMakeLists.txt-Look-for-libcmocka-static.a.patch
>  create mode 100644 package/libspdm/0004-os_stub-openssllib-Enable-PIC.patch
>  create mode 100644 package/libspdm/0005-os_stub-openssllib-Support-more-archetectures.patch
>  create mode 100644 package/libspdm/Config.in
>  create mode 100644 package/libspdm/libspdm.hash
>  create mode 100644 package/libspdm/libspdm.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index eaac32a01a..cf5d78f0ae 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -193,6 +193,7 @@ menu "Development tools"
>  	source "package/jo/Config.in"
>  	source "package/jq/Config.in"
>  	source "package/libtool/Config.in"
> +	source "package/libspdm/Config.in"
>  	source "package/make/Config.in"
>  	source "package/mawk/Config.in"
>  	source "package/patch/Config.in"
> diff --git a/package/libspdm/0001-CMakeLists.txt-Don-t-build-unit_test.patch b/package/libspdm/0001-CMakeLists.txt-Don-t-build-unit_test.patch
> new file mode 100644
> index 0000000000..3ebefcfaf7
> --- /dev/null
> +++ b/package/libspdm/0001-CMakeLists.txt-Don-t-build-unit_test.patch
> @@ -0,0 +1,114 @@
> +From 6945daf8368b7ece24f2a0e2e796e4e3ec9dbc33 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jan 2023 15:29:29 +1000
> +Subject: [PATCH 1/5] CMakeLists.txt: Don't build unit_test
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + CMakeLists.txt | 92 --------------------------------------------------
> + 1 file changed, 92 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 3132f61d8..51d618ed7 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -846,96 +846,4 @@ else()
> +         ADD_SUBDIRECTORY(os_stub/malloclib)
> +         ADD_SUBDIRECTORY(os_stub/spdm_device_secret_lib_sample)
> +         ADD_SUBDIRECTORY(os_stub/spdm_device_secret_lib_null)
> +-        ADD_SUBDIRECTORY(unit_test/spdm_transport_test_lib)
> +-        ADD_SUBDIRECTORY(unit_test/cmockalib)
> +-
> +-        if(TOOLCHAIN STREQUAL "ARM_DS2022" OR TOOLCHAIN STREQUAL "ARM_GNU" OR TOOLCHAIN STREQUAL "ARM_GNU_BARE_METAL")
> +-        ADD_SUBDIRECTORY(os_stub/armbuild_lib)
> +-        endif()
> +-
> +-        if(NOT TOOLCHAIN STREQUAL "LIBFUZZER")
> +-        ADD_SUBDIRECTORY(unit_test/test_spdm_requester)
> +-        ADD_SUBDIRECTORY(unit_test/test_spdm_responder)
> +-        ADD_SUBDIRECTORY(unit_test/test_crypt)
> +-        ADD_SUBDIRECTORY(unit_test/test_spdm_crypt)
> +-        endif()
> +-
> +-        if((NOT TOOLCHAIN STREQUAL "ARM_DS2022") AND (NOT TOOLCHAIN STREQUAL "RISCV_XPACK"))
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_version)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_version)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_capabilities)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_capabilities)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_negotiate_algorithms)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_algorithms)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_digests)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_digests)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_measurements)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_measurements)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_key_exchange)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_key_exchange)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_finish)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_finish_rsp)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_psk_exchange)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_psk_exchange_rsp)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_heartbeat)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_heartbeat_ack)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_key_update)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_key_update)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_end_session)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_end_session)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_psk_finish_rsp)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_psk_finish)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_challenge)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_challenge_auth)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_encap_challenge_auth)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_encap_challenge)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_encap_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_encap_digests)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_digests)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_encap_key_update)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_encap_key_update)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_encap_request)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_encap_response)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_if_ready)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_transport/test_spdm_transport_mctp_encode_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_transport/test_spdm_transport_mctp_decode_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_transport/test_spdm_transport_pci_doe_encode_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_transport/test_spdm_transport_pci_doe_decode_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_secured_message/test_spdm_decode_secured_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_secured_message/test_spdm_encode_secured_message)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_spdm_crypt/test_x509_certificate_check)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_set_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_set_certificate)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_csr)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_get_csr)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_chunk_get)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_chunk_get)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_spdm_common/test_process_opaque_data)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_responder/test_spdm_responder_chunk_send_ack)
> +-        ADD_SUBDIRECTORY(unit_test/fuzzing/test_requester/test_spdm_requester_chunk_send)
> +-        endif()
> +-
> +-        ADD_SUBDIRECTORY(os_stub/cryptlib_null)
> +-        ADD_SUBDIRECTORY(unit_test/test_size/cryptstublib_dummy)
> +-        ADD_SUBDIRECTORY(unit_test/test_size/intrinsiclib)
> +-        ADD_SUBDIRECTORY(unit_test/test_size/malloclib_null)
> +-        ADD_SUBDIRECTORY(unit_test/test_size/malloclib_simple)
> +-        ADD_SUBDIRECTORY(unit_test/test_size/rnglib_null)
> +-
> +-        if(NOT TOOLCHAIN STREQUAL "LIBFUZZER")
> +-        ADD_SUBDIRECTORY(unit_test/test_spdm_common)
> +-        endif()
> +-
> +-    if(GCOV STREQUAL "OFF")
> +-        if((CMAKE_SYSTEM_NAME MATCHES "Windows" AND ARCH STREQUAL "x64" AND TOOLCHAIN STREQUAL "VS2019") OR
> +-        (CMAKE_SYSTEM_NAME MATCHES "Linux" AND ARCH STREQUAL "x64" AND (TOOLCHAIN STREQUAL "GCC" OR TOOLCHAIN STREQUAL "CLANG")) OR
> +-        (CMAKE_SYSTEM_NAME MATCHES "Linux"  AND TOOLCHAIN STREQUAL "RISCV_XPACK") OR
> +-        (CMAKE_SYSTEM_NAME MATCHES "Linux" AND ARCH STREQUAL "aarch64"))
> +-            ADD_SUBDIRECTORY(unit_test/test_size/test_size_of_spdm_requester)
> +-            ADD_SUBDIRECTORY(unit_test/test_size/test_size_of_spdm_responder)
> +-        endif()
> +-    endif()
> + endif()
> +-- 
> +2.39.1
> +
> diff --git a/package/libspdm/0002-CMakeLists.txt-Don-t-hard-code-toolchains.patch b/package/libspdm/0002-CMakeLists.txt-Don-t-hard-code-toolchains.patch
> new file mode 100644
> index 0000000000..2482f11381
> --- /dev/null
> +++ b/package/libspdm/0002-CMakeLists.txt-Don-t-hard-code-toolchains.patch
> @@ -0,0 +1,604 @@
> +From 9dd494dbd5f1c6a3a78a985fa236ad889a40726c Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jan 2023 15:31:53 +1000
> +Subject: [PATCH 2/5] CMakeLists.txt: Don't hard code toolchains
> +
> +libspdm hardcodes the toolchains that it supports. This falls apart when
> +we use one that isn't listed (like the buildroot) toolchain. Just remove
> +the entire switch case and use what was provided by the user.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + CMakeLists.txt | 576 -------------------------------------------------
> + 1 file changed, 576 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 51d618ed7..41e99e557 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -165,582 +165,6 @@ if(ENABLE_CODEQL STREQUAL "ON")
> +     MESSAGE("Enable CodeQL scan.")
> + endif()
> + 
> +-if(CMAKE_SYSTEM_NAME MATCHES "Linux")
> +-    SET(CMAKE_EXE_EXPORTS_C_FLAG "")
> +-
> +-    if(TOOLCHAIN STREQUAL "GCC")
> +-        SET(CMAKE_C_COMPILER gcc)
> +-        ADD_COMPILE_OPTIONS(-std=c99 -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration -Wcast-qual)
> +-        if (ARCH STREQUAL "x64")
> +-            ADD_COMPILE_OPTIONS(-mno-red-zone)
> +-        endif()
> +-        if (ARCH STREQUAL "x64" OR "ia32")
> +-            ADD_COMPILE_OPTIONS(-maccumulate-outgoing-args)
> +-        endif()
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-            ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            ADD_COMPILE_OPTIONS(-fstack-usage)
> +-        else()
> +-            ADD_COMPILE_OPTIONS(-flto)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            SET(OPENSSL_FLAGS ${OPENSSL_FLAGS} -fstack-usage)
> +-        endif()
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            SET(CMOCKA_FLAGS ${CMOCKA_FLAGS} -fstack-usage)
> +-        endif()
> +-
> +-        SET(CMAKE_AR gcc-ar)
> +-
> +-        if(NOT CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 9.3)
> +-                SET(CMAKE_C_ARCHIVE_FINISH true)
> +-        endif()
> +-
> +-        SET(CMAKE_LINKER gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARM_DS2022")
> +-        if(ARCH STREQUAL "aarch64")
> +-            SET(CMAKE_SYSTEM_NAME   Linux)
> +-            SET(CMAKE_C_COMPILER    armclang)
> +-            SET(CMAKE_AR            armar)
> +-            SET(CMAKE_LINKER        armlink)
> +-            SET(CMAKE_OBJCOPY       fromelf)
> +-
> +-            SET(CMAKE_EXECUTABLE_SUFFIX ".elf")
> +-            SET(CMAKE_LIBRARY_PATH_FLAG "--userlibpath=")
> +-            ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing  -ffunction-sections -fdata-sections -fno-common -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO)
> +-            SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic )
> +-            SET(OPENSSL_FLAGS -include base.h)
> +-            SET(CMAKE_C_CREATE_STATIC_LIBRARY "armar -r -s --create <TARGET> <LINK_FLAGS> <OBJECTS>")
> +-            SET(CMAKE_SYSTEM_PROCESSOR aarch64v)
> +-            ADD_COMPILE_OPTIONS(--target=aarch64-arm-none-eabi)
> +-            SET(CMAKE_EXE_LINKER_FLAGS "--target=aarch64-arm-none-eabi -flto -Wl,--undefined=__udivti3")
> +-        elseif(ARCH STREQUAL "arm")
> +-            SET(CMAKE_SYSTEM_NAME   Linux)
> +-            SET(CMAKE_C_COMPILER    armclang)
> +-            SET(CMAKE_LINKER        armlink)
> +-            SET(CMAKE_SYSTEM_PROCESSOR arm)
> +-
> +-            SET(CMAKE_EXECUTABLE_SUFFIX ".elf")
> +-            ADD_COMPILE_OPTIONS(--target=arm-arm-none-eabi -march=armv9-a)
> +-            SET(CMAKE_EXE_LINKER_FLAGS "--target=arm-arm-none-eabi -march=armv9-a -Wl,--undefined=__udivti3")
> +-            SET(OPENSSL_FLAGS -include base.h)
> +-            SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
> +-        endif()
> +-
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARM_GNU")
> +-        if(ARCH STREQUAL "aarch64")
> +-            SET(CMAKE_C_COMPILER aarch64-none-linux-gnu-gcc)
> +-            SET(CMAKE_AR aarch64-none-linux-gnu-gcc-ar)
> +-            SET(CMAKE_LINKER aarch64-none-linux-gnu-gcc)
> +-        elseif(ARCH STREQUAL "arm")
> +-            SET(CMAKE_C_COMPILER arm-none-linux-gnueabihf-gcc)
> +-            SET(CMAKE_AR arm-none-linux-gnueabihf-gcc-ar)
> +-            SET(CMAKE_LINKER arm-none-linux-gnueabihf-gcc)
> +-        endif()
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARM_GNU_BARE_METAL")
> +-        if(ARCH STREQUAL "aarch64")
> +-            SET(CMAKE_C_COMPILER aarch64-none-elf-gcc)
> +-            SET(CMAKE_AR aarch64-none-elf-gcc-ar)
> +-            SET(CMAKE_LINKER aarch64-none-elf-gcc)
> +-        elseif(ARCH STREQUAL "arm")
> +-            SET(CMAKE_C_COMPILER arm-none-eabi-gcc)
> +-            SET(CMAKE_AR arm-none-eabi-gcc-ar)
> +-            SET(CMAKE_LINKER arm-none-eabi-gcc)
> +-        endif()
> +-        SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar --specs=nosys.specs -fno-strict-aliasing -Wall -Wno-error=format -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-            ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wno-error=format -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "--specs=nosys.specs -flto -Wno-error -no-pie" )
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARM_GCC")
> +-        SET(CMAKE_C_COMPILER arm-linux-gnueabi-gcc)
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-            ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR arm-linux-gnueabi-gcc-ar)
> +-
> +-        SET(CMAKE_LINKER arm-linux-gnueabi-gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "AARCH64_GCC")
> +-        SET(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR aarch64-linux-gnu-gcc-ar)
> +-
> +-        SET(CMAKE_LINKER aarch64-linux-gnu-gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "RISCV_GNU")
> +-        if(ARCH STREQUAL "riscv32")
> +-            SET(CMAKE_C_COMPILER riscv32-unknown-linux-gnu-gcc)
> +-            SET(CMAKE_AR riscv32-unknown-linux-gnu-gcc-ar)
> +-            SET(CMAKE_LINKER riscv32-unknown-linux-gnu-gcc)
> +-        elseif(ARCH STREQUAL "riscv64")
> +-            SET(CMAKE_C_COMPILER riscv64-unknown-linux-gnu-gcc)
> +-            SET(CMAKE_AR riscv64-unknown-linux-gnu-gcc-ar)
> +-            SET(CMAKE_LINKER riscv64-unknown-linux-gnu-gcc)
> +-        endif()
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "RISCV64_GCC")
> +-        SET(CMAKE_C_COMPILER riscv64-linux-gnu-gcc)
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR riscv64-linux-gnu-gcc-ar)
> +-
> +-        SET(CMAKE_LINKER riscv64-linux-gnu-gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "RISCV_XPACK")
> +-        SET(CMAKE_C_COMPILER riscv-none-elf-gcc)
> +-        SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
> +-
> +-        if(ARCH STREQUAL "riscv32")
> +-            ADD_COMPILE_OPTIONS(-march=rv32imafdc_zicsr -mabi=ilp32d)
> +-        elseif(ARCH STREQUAL "riscv64")
> +-            ADD_COMPILE_OPTIONS(-march=rv64imafdc_zicsr -mabi=lp64d)
> +-        else()
> +-            ADD_COMPILE_OPTIONS(-march=error -mabi=error)
> +-        endif()
> +-
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds   -Wno-error=format -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow  -Wno-error=format -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR riscv-none-elf-ar)
> +-
> +-        SET(CMAKE_LINKER riscv-none-elf-gcc)
> +-
> +-        if(ARCH STREQUAL "riscv32")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "-march=rv32imafdc_zicsr -mabi=ilp32d -flto -Wno-error -no-pie" )
> +-        elseif(ARCH STREQUAL "riscv64")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "-march=rv64imafdc_zicsr -mabi=lp64d -flto -Wno-error -no-pie" )
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARC_GCC")
> +-        SET(CMAKE_C_COMPILER arc-linux-gcc)
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR arc-linux-gcc-ar)
> +-
> +-        SET(CMAKE_LINKER arc-linux-gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-
> +-    elseif(TOOLCHAIN STREQUAL "CLANG")
> +-        SET(CMAKE_C_COMPILER clang)
> +-        ADD_COMPILE_OPTIONS(-std=c99 -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if (ARCH STREQUAL "x64")
> +-            ADD_COMPILE_OPTIONS(-mno-red-zone)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -std=c11 -include base.h -Wno-error=format -Wno-format -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR llvm-ar)
> +-        SET(CMAKE_RANLIB llvm-ranlib)
> +-
> +-        SET(CMAKE_LINKER clang)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "CBMC")
> +-        SET(CMAKE_C_COMPILER goto-cc)
> +-        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -maccumulate-outgoing-args -mno-red-zone -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -DCBMC -DDEBUG_ASSERT_CHOICE=0 -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_LINKER goto-cc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error")
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS> -o <TARGET>")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "AFL")
> +-        SET(CMAKE_C_COMPILER afl-gcc)
> +-        ADD_COMPILE_OPTIONS(-std=c99 -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -maccumulate-outgoing-args -mno-red-zone -Wno-address -fpie -fno-asynchronous-unwind-tables -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR gcc-ar)
> +-
> +-        SET(CMAKE_LINKER gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-Wno-error -no-pie" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "KLEE")
> +-        SET(CMAKE_C_COMPILER clang)
> +-        ADD_COMPILE_OPTIONS(-fno-strict-aliasing -Wall  -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common  -mno-red-zone -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -emit-llvm -DTEST_WITH_KLEE=TRUE -DDEBUG_ASSERT_CHOICE=0 -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_C_CREATE_STATIC_LIBRARY "")
> +-
> +-        SET(CMAKE_LINKER llvm-link)
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS> -o <TARGET>")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "LIBFUZZER")
> +-        SET(CMAKE_C_COMPILER clang)
> +-        # -O1 may cause fuzzing test buffer overflow, use -O0 as workaround
> +-        ADD_COMPILE_OPTIONS(-std=c99 -fshort-wchar -fno-strict-aliasing -Wall  -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common  -mno-red-zone -Wno-address -fpie -fno-asynchronous-unwind-tables -DUSING_LTO  -DTEST_WITH_LIBFUZZER=TRUE -O0 -fsanitize=fuzzer,address -Werror-implicit-function-declaration)
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-           ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(-fprofile-instr-generate -fcoverage-mapping)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR llvm-ar)
> +-
> +-        SET(CMAKE_LINKER clang)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-Wno-error -no-pie -fsanitize=fuzzer,address" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-instr-generate")
> +-        endif()
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "NIOS2_GCC")
> +-        SET(CMAKE_C_COMPILER nios2-elf-gcc)
> +-        ADD_COMPILE_OPTIONS(-xc -MP -MMD -pipe -O3  -Wall -Wno-maybe-uninitialized -Wno-unused-but-set-variable -Wno-nonnull-compare -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast  -Wno-builtin-declaration-mismatch  -mno-hw-div -mhw-mul -mno-hw-mulx -mgpopt=global -Werror-implicit-function-declaration)
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-
> +-        SET(CMAKE_AR nios2-elf-ar)
> +-
> +-        SET(CMAKE_LINKER nios2-elf-gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "")
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "")
> +-
> +-    endif()
> +-
> +-    if(NOT TOOLCHAIN STREQUAL "NIOS2_GCC")
> +-        SET(CMAKE_C_FLAGS_RELEASE     "-Os")
> +-        SET(CMAKE_C_FLAGS_DEBUG       "-O0")
> +-    endif()
> +-
> +-    if(ARCH STREQUAL "x64")
> +-        ADD_COMPILE_OPTIONS(-m64 -mcmodel=small)
> +-    elseif(ARCH STREQUAL "ia32")
> +-        ADD_COMPILE_OPTIONS(-m32)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32" )
> +-    endif()
> +-
> +-elseif(CMAKE_SYSTEM_NAME MATCHES "Windows")
> +-    if(TOOLCHAIN STREQUAL "GCC")
> +-        SET(CMAKE_C_COMPILER gcc)
> +-        ADD_COMPILE_OPTIONS(-std=c99 -fshort-wchar -fno-strict-aliasing -Wall -Wno-error=incompatible-pointer-types -Wno-error=format-extra-args -Wno-error=format= -Wno-error=unknown-pragmas -Wno-error=attributes -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration -Wcast-qual)
> +-        if (ARCH STREQUAL "x64")
> +-            ADD_COMPILE_OPTIONS(-mno-red-zone)
> +-        endif()
> +-        if (ARCH STREQUAL "x64" OR "ia32")
> +-            ADD_COMPILE_OPTIONS(-maccumulate-outgoing-args)
> +-        endif()
> +-        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
> +-            ADD_COMPILE_OPTIONS(-g)
> +-        endif()
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            ADD_COMPILE_OPTIONS(-fstack-usage)
> +-        else()
> +-            ADD_COMPILE_OPTIONS(-fno-lto)
> +-        endif()
> +-        if(GCOV STREQUAL "ON")
> +-        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
> +-        endif()
> +-        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual)
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            SET(OPENSSL_FLAGS ${OPENSSL_FLAGS} -fstack-usage)
> +-        endif()
> +-        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
> +-        if(STACK_USAGE STREQUAL "ON")
> +-            SET(CMOCKA_FLAGS ${CMOCKA_FLAGS} -fstack-usage)
> +-        endif()
> +-
> +-        SET(CMAKE_AR gcc-ar)
> +-
> +-        if(NOT CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 9.3)
> +-                SET(CMAKE_C_ARCHIVE_FINISH true)
> +-        endif()
> +-
> +-        SET(CMAKE_LINKER gcc)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "-Wno-error -no-pie -fstack-protector" )
> +-        if(GCOV STREQUAL "ON")
> +-        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
> +-        endif()
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group /mingw64/lib/libbcrypt.a <LINK_LIBRARIES> -Wl,--end-group")
> +-    elseif(TOOLCHAIN STREQUAL "CLANG")
> +-        SET(CMAKE_C_COMPILER clang-cl.exe)
> +-        ADD_COMPILE_OPTIONS(-fno-strict-aliasing -Wall  -Wno-array-bounds -Wno-address  -flto -DUSING_LTO  -D_CRT_SECURE_NO_WARNINGS /w)
> +-        SET(OPENSSL_FLAGS /FIbase.h -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -Wformat -Wno-cast-qual)
> +-
> +-        SET(CMAKE_STATIC_LINKER_FLAGS "")
> +-
> +-        SET(CMAKE_LINKER lld-link.exe)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "/NOLOGO /SUBSYSTEM:CONSOLE /NODEFAULTLIB:libcmt.lib /IGNORE:4086 /MLLVM:-exception-model=wineh /lldmap /OPT:REF")
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:AMD64 /LIBPATH:'%VCToolsInstallDir%lib/x64' /LIBPATH:'%UniversalCRTSdkDir%lib/%UCRTVersion%/ucrt/x64' /LIBPATH:'%WindowsSdkDir%lib/%WindowsSDKLibVersion%/um/x64'")
> +-        elseif(ARCH STREQUAL "ia32")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:I386 /LIBPATH:'%VCToolsInstallDir%lib/x86' /LIBPATH:'%UniversalCRTSdkDir%lib/%UCRTVersion%/ucrt/x86' /LIBPATH:'%WindowsSdkDir%lib/%WindowsSDKLibVersion%/um/x86'")
> +-        endif()
> +-
> +-        SET(CMAKE_C_FLAGS_RELEASE     "-Oz")
> +-        SET(CMAKE_C_FLAGS_DEBUG       "-O0 -gcodeview")
> +-
> +-        SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG:GHASH")
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            ADD_COMPILE_OPTIONS(-m64)
> +-        elseif(ARCH STREQUAL "ia32")
> +-            ADD_COMPILE_OPTIONS(-m32 -march=i586)
> +-        endif()
> +-
> +-        SET(CMAKE_C_STANDARD_LIBRARIES "Kernel32.lib MSVCRTD.lib vcruntimed.lib ucrtd.lib Gdi32.lib User32.lib Winmm.lib Advapi32.lib ws2_32.lib")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "ARM_DS2022")
> +-        SET(CMAKE_C_COMPILER    "armclang.exe")
> +-        SET(CMAKE_AR            "armar.exe")
> +-        SET(CMAKE_LINKER        "armlink.exe")
> +-        SET(CMAKE_OBJCOPY       "fromelf.exe")
> +-        SET(CMAKE_SYSTEM_ARCH   "armv8.2-a")
> +-        SET(CMAKE_${lang}_COMPILER_FRONTEND_VARIANT "GNU")
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
> +-        SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
> +-        SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PATH})
> +-        SET(CMAKE_EXECUTABLE_SUFFIX ".elf")
> +-
> +-        SET(OPENSSL_FLAGS  -include base.h)
> +-
> +-        if (ARCH STREQUAL "arm")
> +-        SET(CMAKE_SYSTEM_PROCESSOR ARM)
> +-        ADD_COMPILE_OPTIONS(-marm)
> +-        ADD_COMPILE_OPTIONS(--target=arm-arm-none-eabi)
> +-        elseif (ARCH STREQUAL "aarch64")
> +-        SET(CMAKE_SYSTEM_PROCESSOR aarch64v)
> +-        ADD_COMPILE_OPTIONS(--target=aarch64-arm-none-eabi -Wl,--undefined=__udivti3)
> +-        endif()
> +-
> +-        SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
> +-        SET(CMAKE_SYSTEM_NAME Linux )
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> -o <TARGET> <LINK_LIBRARIES> <OBJECTS>")
> +-
> +-    elseif(TOOLCHAIN STREQUAL "LIBFUZZER")
> +-        SET(CMAKE_C_COMPILER clang-cl.exe)
> +-        ADD_COMPILE_OPTIONS(-fno-strict-aliasing -Wall  -Wno-array-bounds -Wno-address  -flto -DUSING_LTO  -D_CRT_SECURE_NO_WARNINGS /w -DTEST_WITH_LIBFUZZER=TRUE)
> +-        SET(OPENSSL_FLAGS /FIbase.h -Wno-cast-qual)
> +-        SET(CMOCKA_FLAGS -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -Wformat -Wno-cast-qual)
> +-
> +-        SET(CMAKE_STATIC_LINKER_FLAGS "")
> +-
> +-        SET(CMAKE_LINKER lld-link.exe)
> +-        SET(CMAKE_EXE_LINKER_FLAGS "/NOLOGO /SUBSYSTEM:CONSOLE /NODEFAULTLIB:libcmt.lib /IGNORE:4086 /MLLVM:-exception-model=wineh /lldmap /OPT:REF")
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:AMD64 /LIBPATH:'%VCToolsInstallDir%lib/x64' /LIBPATH:'%UniversalCRTSdkDir%lib/%UCRTVersion%/ucrt/x64' /LIBPATH:'%WindowsSdkDir%lib/%WindowsSDKLibVersion%/um/x64'")
> +-        elseif(ARCH STREQUAL "ia32")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:I386 /LIBPATH:'%VCToolsInstallDir%lib/x86' /LIBPATH:'%UniversalCRTSdkDir%lib/%UCRTVersion%/ucrt/x86' /LIBPATH:'%WindowsSdkDir%lib/%WindowsSDKLibVersion%/um/x86'")
> +-        endif()
> +-
> +-        SET(CMAKE_C_FLAGS_RELEASE     "-Oz")
> +-        SET(CMAKE_C_FLAGS_DEBUG       "-O0 -gcodeview")
> +-
> +-        SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG:GHASH")
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            ADD_COMPILE_OPTIONS(-m64)
> +-        elseif(ARCH STREQUAL "ia32")
> +-            ADD_COMPILE_OPTIONS(-m32 -march=i586)
> +-        endif()
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            SET(CMAKE_C_STANDARD_LIBRARIES "Kernel32.lib MSVCRTD.lib vcruntimed.lib ucrtd.lib Gdi32.lib User32.lib Winmm.lib Advapi32.lib ws2_32.lib")
> +-            SET(CMAKE_C_STANDARD_LIBRARIES "${CMAKE_C_STANDARD_LIBRARIES} C:/LLVM/lib/clang/13.0.0/lib/windows/clang_rt.asan_dynamic-x86_64.lib C:/LLVM/lib/clang/13.0.0/lib/windows/clang_rt.asan_dynamic_runtime_thunk-x86_64.lib C:/LLVM/lib/clang/13.0.0/lib/windows/clang_rt.fuzzer-x86_64.lib")
> +-        elseif(ARCH STREQUAL "ia32")
> +-            SET(CMAKE_C_STANDARD_LIBRARIES "Kernel32.lib MSVCRTD.lib vcruntimed.lib ucrtd.lib Gdi32.lib User32.lib Winmm.lib Advapi32.lib ws2_32.lib clang_rt.asan_dynamic-i386.lib clang_rt.asan_dynamic_runtime_thunk-i386.lib clang_rt.fuzzer-i386.lib")
> +-        endif()
> +-
> +-    elseif(TOOLCHAIN STREQUAL "CBMC")
> +-        SET(CMAKE_C_COMPILER goto-cl.exe)
> +-        # See https://gitlab.kitware.com/cmake/cmake/-/issues/18317 for following workaround
> +-        STRING(REGEX REPLACE "/W3" "" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
> +-        ADD_COMPILE_OPTIONS(/nologo /WX /W4 /Gs32768 /D UNICODE /Gy /EHs-c- /GR- /GF /Z7 /Oy- /D_CRT_SECURE_NO_WARNINGS /DCBMC_CC)
> +-        SET(OPENSSL_FLAGS /FIbase.h /wd4090 /wd4132 /wd4244 /wd4245 /wd4267 /wd4306 /wd4310 /wd4700 /wd4389 /wd4702 /wd4706 /wd4819 /wd4013)
> +-        SET(CMOCKA_FLAGS /wd4090 /wd4204 /wd4133 /wd4267 /wd4701 /wd4702 /wd4703 /D _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=1 /D _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT=1 /D _CRT_NONSTDC_NO_WARNINGS=1)
> +-
> +-        SET(CMAKE_C_CREATE_STATIC_LIBRARY "")
> +-
> +-        SET(CMAKE_LINKER goto-cl.exe)
> +-
> +-        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS>")
> +-
> +-        SET(CMAKE_C_FLAGS_RELEASE     "/GL /O1b2s")
> +-        SET(CMAKE_C_FLAGS_DEBUG       "/Od")
> +-    else()
> +-        # See https://gitlab.kitware.com/cmake/cmake/-/issues/18317 for following workaround
> +-        STRING(REGEX REPLACE "/W3" "" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
> +-        ADD_COMPILE_OPTIONS(/nologo /WX /W4 /Gs32768 /D UNICODE /Gy /EHs-c- /GR- /GF /Z7 /Gw /Oy- /D_CRT_SECURE_NO_WARNINGS /wd4063 /wd4100 /wd4127 /wd4701 /wd4703 /wd4057)
> +-        SET(OPENSSL_FLAGS /FIbase.h /wd4090 /wd4132 /wd4244 /wd4245 /wd4267 /wd4306 /wd4310 /wd4700 /wd4389 /wd4702 /wd4706 /wd4819 /wd4013)
> +-        SET(CMOCKA_FLAGS /wd4090 /wd4204 /wd4133 /wd4267 /wd4701 /wd4702 /wd4703 /D_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=1 /D_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT=1 /D_CRT_NONSTDC_NO_WARNINGS=1)
> +-
> +-        SET(CMAKE_STATIC_LINKER_FLAGS "/NOLOGO /LTCG")
> +-
> +-        SET(CMAKE_EXE_LINKER_FLAGS "/NOLOGO /SUBSYSTEM:CONSOLE /NODEFAULTLIB:libcmt.lib /IGNORE:4086 /MAP /OPT:REF")
> +-
> +-        SET(CMAKE_C_FLAGS_RELEASE     "/GL /O1b2s")
> +-        SET(CMAKE_C_FLAGS_DEBUG       "/Od")
> +-        SET(CMAKE_EXE_LINKER_FLAGS_RELEASE "/LTCG")
> +-        SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG")
> +-
> +-        if(ARCH STREQUAL "x64")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:AMD64")
> +-        elseif(ARCH STREQUAL "ia32")
> +-            SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /MACHINE:I386")
> +-        endif()
> +-        SET(CMAKE_C_STANDARD_LIBRARIES "Kernel32.lib MSVCRTD.lib vcruntimed.lib ucrtd.lib Gdi32.lib User32.lib Winmm.lib Advapi32.lib ws2_32.lib")
> +-
> +-    endif()
> +-endif()
> +-
> + if(TOOLCHAIN STREQUAL "VS2015")
> +     if(ARCH STREQUAL "x64")
> +         SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /LIBPATH:'%VCINSTALLDIR%Lib/AMD64' /LIBPATH:'%UniversalCRTSdkDir%lib/%UCRTVersion%/ucrt/x64' /LIBPATH:'%WindowsSdkDir%lib/%WindowsSDKLibVersion%/um/x64'")
> +-- 
> +2.39.1
> +
> diff --git a/package/libspdm/0003-unit_test-CMakeLists.txt-Look-for-libcmocka-static.a.patch b/package/libspdm/0003-unit_test-CMakeLists.txt-Look-for-libcmocka-static.a.patch
> new file mode 100644
> index 0000000000..0dd59c73c3
> --- /dev/null
> +++ b/package/libspdm/0003-unit_test-CMakeLists.txt-Look-for-libcmocka-static.a.patch
> @@ -0,0 +1,1009 @@
> +From 150753a83b5bdd62a4601490bd252fd6275d6bc7 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jan 2023 15:38:14 +1000
> +Subject: [PATCH 3/5] unit_test: CMakeLists.txt: Look for libcmocka-static.a
> +
> +cmocka calls it's static library libcmocka-static.a, so let's look for
> +that instead of libcmockalib.a.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + .../test_spdm_requester_challenge/CMakeLists.txt              | 4 ++--
> + .../test_spdm_requester_chunk_get/CMakeLists.txt              | 4 ++--
> + .../test_spdm_requester_chunk_send/CMakeLists.txt             | 4 ++--
> + .../test_spdm_requester_encap_certificate/CMakeLists.txt      | 4 ++--
> + .../test_spdm_requester_encap_challenge_auth/CMakeLists.txt   | 4 ++--
> + .../test_spdm_requester_encap_digests/CMakeLists.txt          | 4 ++--
> + .../test_spdm_requester_encap_key_update/CMakeLists.txt       | 4 ++--
> + .../test_spdm_requester_encap_request/CMakeLists.txt          | 4 ++--
> + .../test_spdm_requester_end_session/CMakeLists.txt            | 4 ++--
> + .../test_requester/test_spdm_requester_finish/CMakeLists.txt  | 4 ++--
> + .../test_spdm_requester_get_certificate/CMakeLists.txt        | 4 ++--
> + .../test_requester/test_spdm_requester_get_csr/CMakeLists.txt | 4 ++--
> + .../test_spdm_requester_get_digests/CMakeLists.txt            | 4 ++--
> + .../test_spdm_requester_get_measurements/CMakeLists.txt       | 4 ++--
> + .../test_spdm_requester_heartbeat/CMakeLists.txt              | 4 ++--
> + .../test_spdm_requester_key_exchange/CMakeLists.txt           | 4 ++--
> + .../test_spdm_requester_key_update/CMakeLists.txt             | 4 ++--
> + .../test_spdm_requester_psk_exchange/CMakeLists.txt           | 4 ++--
> + .../test_spdm_requester_psk_finish/CMakeLists.txt             | 4 ++--
> + .../test_spdm_requester_set_certificate/CMakeLists.txt        | 4 ++--
> + .../test_spdm_responder_certificate/CMakeLists.txt            | 4 ++--
> + .../test_spdm_responder_challenge_auth/CMakeLists.txt         | 4 ++--
> + .../test_spdm_responder_chunk_get/CMakeLists.txt              | 4 ++--
> + .../test_spdm_responder_chunk_send_ack/CMakeLists.txt         | 4 ++--
> + .../test_responder/test_spdm_responder_csr/CMakeLists.txt     | 4 ++--
> + .../test_spdm_responder_encap_challenge/CMakeLists.txt        | 4 ++--
> + .../test_spdm_responder_encap_get_certificate/CMakeLists.txt  | 4 ++--
> + .../test_spdm_responder_encap_get_digests/CMakeLists.txt      | 4 ++--
> + .../test_spdm_responder_encap_key_update/CMakeLists.txt       | 4 ++--
> + .../test_spdm_responder_encap_response/CMakeLists.txt         | 4 ++--
> + .../test_spdm_responder_end_session/CMakeLists.txt            | 4 ++--
> + .../test_spdm_responder_finish_rsp/CMakeLists.txt             | 4 ++--
> + .../test_spdm_responder_heartbeat_ack/CMakeLists.txt          | 4 ++--
> + .../test_spdm_responder_if_ready/CMakeLists.txt               | 4 ++--
> + .../test_spdm_responder_key_exchange/CMakeLists.txt           | 4 ++--
> + .../test_spdm_responder_key_update/CMakeLists.txt             | 4 ++--
> + .../test_spdm_responder_measurements/CMakeLists.txt           | 4 ++--
> + .../test_spdm_responder_psk_exchange_rsp/CMakeLists.txt       | 4 ++--
> + .../test_spdm_responder_psk_finish_rsp/CMakeLists.txt         | 4 ++--
> + .../test_spdm_responder_set_certificate/CMakeLists.txt        | 4 ++--
> + unit_test/test_spdm_common/CMakeLists.txt                     | 2 +-
> + unit_test/test_spdm_crypt/CMakeLists.txt                      | 2 +-
> + unit_test/test_spdm_requester/CMakeLists.txt                  | 4 ++--
> + unit_test/test_spdm_responder/CMakeLists.txt                  | 4 ++--
> + 44 files changed, 86 insertions(+), 86 deletions(-)
> +
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_challenge/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_challenge/CMakeLists.txt
> +index 157b44e34..91d2812fc 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_challenge/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_challenge/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_challenge_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_challenge ${src_test_spdm_requester_challenge})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_get/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_get/CMakeLists.txt
> +index c01abc3a2..333b241c3 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_get/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_get/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_chunk_get_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_chunk_get ${src_test_spdm_requester_chunk_get})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_send/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_send/CMakeLists.txt
> +index d547b0c9d..cc6998be1 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_send/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_chunk_send/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_chunk_send_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_chunk_send ${src_test_spdm_requester_chunk_send})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_certificate/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_certificate/CMakeLists.txt
> +index b76a4077b..fe267994c 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_certificate/CMakeLists.txt
> +@@ -35,7 +35,7 @@ SET(test_spdm_requester_encap_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_encap_certificate ${src_test_spdm_requester_encap_certificate})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_challenge_auth/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_challenge_auth/CMakeLists.txt
> +index 97858cef1..bb0a9f11e 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_challenge_auth/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_challenge_auth/CMakeLists.txt
> +@@ -35,7 +35,7 @@ SET(test_spdm_requester_encap_challenge_auth_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_encap_challenge_auth ${src_test_spdm_requester_encap_challenge_auth})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_digests/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_digests/CMakeLists.txt
> +index d3f9af760..e47bd4d39 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_digests/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_digests/CMakeLists.txt
> +@@ -35,7 +35,7 @@ SET(test_spdm_requester_encap_digests_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_encap_digests ${src_test_spdm_requester_encap_digests})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_key_update/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_key_update/CMakeLists.txt
> +index 566dbdc5b..018bb77c8 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_key_update/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_key_update/CMakeLists.txt
> +@@ -35,7 +35,7 @@ SET(test_spdm_requester_encap_key_update_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_encap_key_update ${src_test_spdm_requester_encap_key_update})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_request/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_request/CMakeLists.txt
> +index 27af38be4..6c3d8912e 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_encap_request/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_encap_request/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_encap_request_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -54,7 +54,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_encap_request ${src_test_spdm_requester_encap_request})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_end_session/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_end_session/CMakeLists.txt
> +index 51ba783f7..9be55f342 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_end_session/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_end_session/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_end_session_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_end_session ${src_test_spdm_requester_end_session})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_finish/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_finish/CMakeLists.txt
> +index 0962b76dc..cdc74bce0 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_finish/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_finish/CMakeLists.txt
> +@@ -34,7 +34,7 @@ SET(test_spdm_requester_finish_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_finish ${src_test_spdm_requester_finish})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_get_certificate/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_get_certificate/CMakeLists.txt
> +index 7f8fef365..477b4df02 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_get_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_get_certificate/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_get_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_get_certificate ${src_test_spdm_requester_get_certificate})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_get_csr/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_get_csr/CMakeLists.txt
> +index e98867ba9..80db99b87 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_get_csr/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_get_csr/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_get_csr_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_get_csr ${src_test_spdm_requester_get_csr})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_get_digests/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_get_digests/CMakeLists.txt
> +index 828318b90..3e9435ed8 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_get_digests/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_get_digests/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_get_digests_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_get_digests ${src_test_spdm_requester_get_digests})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_get_measurements/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_get_measurements/CMakeLists.txt
> +index e3f9f83fd..f52ea93f8 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_get_measurements/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_get_measurements/CMakeLists.txt
> +@@ -34,7 +34,7 @@ SET(test_spdm_requester_get_measurements_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_get_measurements ${src_test_spdm_requester_get_measurements})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_heartbeat/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_heartbeat/CMakeLists.txt
> +index 8d39a040a..cc1144365 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_heartbeat/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_heartbeat/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_heartbeat_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_heartbeat ${src_test_spdm_requester_heartbeat})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_key_exchange/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_key_exchange/CMakeLists.txt
> +index c83b35653..5444491fc 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_key_exchange/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_key_exchange/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_requester_key_exchange_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_key_exchange ${src_test_spdm_requester_key_exchange})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_key_update/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_key_update/CMakeLists.txt
> +index fbfe3d3e6..17b830a3f 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_key_update/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_key_update/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_key_update_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_key_update ${src_test_spdm_requester_key_update})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_psk_exchange/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_psk_exchange/CMakeLists.txt
> +index a5e69b6fc..fa0f5ecbe 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_psk_exchange/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_psk_exchange/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_requester_psk_exchange_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -57,7 +57,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_psk_exchange ${src_test_spdm_requester_psk_exchange})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_psk_finish/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_psk_finish/CMakeLists.txt
> +index 09305d46f..fae6fe318 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_psk_finish/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_psk_finish/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_requester_psk_finish_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_psk_finish ${src_test_spdm_requester_psk_finish})
> +diff --git a/unit_test/fuzzing/test_requester/test_spdm_requester_set_certificate/CMakeLists.txt b/unit_test/fuzzing/test_requester/test_spdm_requester_set_certificate/CMakeLists.txt
> +index 51ead2842..3d8595029 100644
> +--- a/unit_test/fuzzing/test_requester/test_spdm_requester_set_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_requester/test_spdm_requester_set_certificate/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_requester_set_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +@@ -57,7 +57,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> + 
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +     )
> + else()
> +     ADD_EXECUTABLE(test_spdm_requester_set_certificate ${src_test_spdm_requester_set_certificate})
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_certificate/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_certificate/CMakeLists.txt
> +index 8f0a25f28..668906830 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_certificate/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_challenge_auth/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_challenge_auth/CMakeLists.txt
> +index aa28863f7..e7fbc75c5 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_challenge_auth/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_challenge_auth/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_responder_challenge_auth_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_get/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_get/CMakeLists.txt
> +index 982f19615..674c0792e 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_get/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_get/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_chunk_get_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_send_ack/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_send_ack/CMakeLists.txt
> +index bd434acd8..03271dcf5 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_send_ack/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_chunk_send_ack/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_csr_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_csr/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_csr/CMakeLists.txt
> +index 0383c1c46..05da0fc77 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_csr/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_csr/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_csr_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_challenge/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_challenge/CMakeLists.txt
> +index d17538ee5..9bdaf0803 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_challenge/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_challenge/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_encap_challenge_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_certificate/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_certificate/CMakeLists.txt
> +index 80bb4b8ed..b251cb207 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_certificate/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_encap_get_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_digests/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_digests/CMakeLists.txt
> +index a6c560ced..543413266 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_digests/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_get_digests/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_encap_get_digests_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_key_update/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_key_update/CMakeLists.txt
> +index 72af7c5b2..c2efc6146 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_key_update/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_key_update/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_encap_key_update_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_response/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_response/CMakeLists.txt
> +index 4491ef8d0..f0350469c 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_encap_response/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_encap_response/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_encap_response_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_end_session/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_end_session/CMakeLists.txt
> +index e6a4fc70f..b0938c6d7 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_end_session/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_end_session/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_end_session_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_finish_rsp/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_finish_rsp/CMakeLists.txt
> +index b4be57b47..f1a1714b2 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_finish_rsp/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_finish_rsp/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_finish_rsp_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_heartbeat_ack/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_heartbeat_ack/CMakeLists.txt
> +index 2ccb0f68c..ec4633fb9 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_heartbeat_ack/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_heartbeat_ack/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_heartbeat_ack_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_if_ready/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_if_ready/CMakeLists.txt
> +index 383f07382..b9fe2889c 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_if_ready/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_if_ready/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_if_ready_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_key_exchange/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_key_exchange/CMakeLists.txt
> +index 9e1827a71..e95ff73d9 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_key_exchange/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_key_exchange/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_responder_key_exchange_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_key_update/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_key_update/CMakeLists.txt
> +index 025aae0f6..9b18a54d7 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_key_update/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_key_update/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_key_update_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_measurements/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_measurements/CMakeLists.txt
> +index da3a82f03..bb576bd55 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_measurements/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_measurements/CMakeLists.txt
> +@@ -34,7 +34,7 @@ SET(test_spdm_responder_measurements_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -53,7 +53,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_psk_exchange_rsp/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_psk_exchange_rsp/CMakeLists.txt
> +index c9b8e4229..b55d9b394 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_psk_exchange_rsp/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_psk_exchange_rsp/CMakeLists.txt
> +@@ -37,7 +37,7 @@ SET(test_spdm_responder_psk_exchange_rsp_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -56,7 +56,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_psk_finish_rsp/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_psk_finish_rsp/CMakeLists.txt
> +index eb73b582b..5c317b7b7 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_psk_finish_rsp/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_psk_finish_rsp/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_psk_finish_rsp_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/fuzzing/test_responder/test_spdm_responder_set_certificate/CMakeLists.txt b/unit_test/fuzzing/test_responder/test_spdm_responder_set_certificate/CMakeLists.txt
> +index 718e3a903..fc7ce77ea 100644
> +--- a/unit_test/fuzzing/test_responder/test_spdm_responder_set_certificate/CMakeLists.txt
> ++++ b/unit_test/fuzzing/test_responder/test_spdm_responder_set_certificate/CMakeLists.txt
> +@@ -36,7 +36,7 @@ SET(test_spdm_responder_set_certificate_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_transport_test_lib
> +     spdm_device_secret_lib_sample
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib_null
> + )
> + 
> +@@ -55,7 +55,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib_null>
> +     )
> + else()
> +diff --git a/unit_test/test_spdm_common/CMakeLists.txt b/unit_test/test_spdm_common/CMakeLists.txt
> +index d4e5c256f..d3a8a9de8 100644
> +--- a/unit_test/test_spdm_common/CMakeLists.txt
> ++++ b/unit_test/test_spdm_common/CMakeLists.txt
> +@@ -39,7 +39,7 @@ SET(test_spdm_common_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_device_secret_lib_sample
> +     spdm_transport_test_lib
> +-    cmockalib
> ++    cmocka-static
> + )
> + 
> + if(TOOLCHAIN STREQUAL "ARM_DS2022")
> +diff --git a/unit_test/test_spdm_crypt/CMakeLists.txt b/unit_test/test_spdm_crypt/CMakeLists.txt
> +index 4da310bc5..7505a6cd7 100644
> +--- a/unit_test/test_spdm_crypt/CMakeLists.txt
> ++++ b/unit_test/test_spdm_crypt/CMakeLists.txt
> +@@ -29,7 +29,7 @@ SET(test_spdm_crypt_LIBRARY
> +     cryptlib_${CRYPTO}
> +     rnglib
> +     malloclib
> +-    cmockalib
> ++    cmocka-static
> +     spdm_device_secret_lib_sample
> + )
> + 
> +diff --git a/unit_test/test_spdm_requester/CMakeLists.txt b/unit_test/test_spdm_requester/CMakeLists.txt
> +index fd3e92ae6..9abf7d645 100644
> +--- a/unit_test/test_spdm_requester/CMakeLists.txt
> ++++ b/unit_test/test_spdm_requester/CMakeLists.txt
> +@@ -67,7 +67,7 @@ SET(test_spdm_requester_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_device_secret_lib_sample
> +     spdm_transport_test_lib
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib
> + )
> + 
> +@@ -90,7 +90,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib>
> +     )
> + else()
> +diff --git a/unit_test/test_spdm_responder/CMakeLists.txt b/unit_test/test_spdm_responder/CMakeLists.txt
> +index 5eb2e7976..b5d095f43 100644
> +--- a/unit_test/test_spdm_responder/CMakeLists.txt
> ++++ b/unit_test/test_spdm_responder/CMakeLists.txt
> +@@ -63,7 +63,7 @@ SET(test_spdm_responder_LIBRARY
> +     spdm_secured_message_lib
> +     spdm_device_secret_lib_sample
> +     spdm_transport_test_lib
> +-    cmockalib
> ++    cmocka-static
> +     platform_lib
> + )
> + 
> +@@ -86,7 +86,7 @@ if((TOOLCHAIN STREQUAL "KLEE") OR (TOOLCHAIN STREQUAL "CBMC"))
> +                    $<TARGET_OBJECTS:spdm_secured_message_lib>
> +                    $<TARGET_OBJECTS:spdm_device_secret_lib_sample>
> +                    $<TARGET_OBJECTS:spdm_transport_test_lib>
> +-                   $<TARGET_OBJECTS:cmockalib>
> ++                   $<TARGET_OBJECTS:cmocka-static>
> +                    $<TARGET_OBJECTS:platform_lib>
> +     )
> + else()
> +-- 
> +2.39.1
> +
> diff --git a/package/libspdm/0004-os_stub-openssllib-Enable-PIC.patch b/package/libspdm/0004-os_stub-openssllib-Enable-PIC.patch
> new file mode 100644
> index 0000000000..706fc40297
> --- /dev/null
> +++ b/package/libspdm/0004-os_stub-openssllib-Enable-PIC.patch
> @@ -0,0 +1,41 @@
> +From bf8b62366df77c2180f3e00a471b49accaeb4333 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jan 2023 15:40:33 +1000
> +Subject: [PATCH 4/5] os_stub/openssllib: Enable PIC
> +
> +Enable PIC to avoid errors like this when linking:
> +
> +    unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `X509_free@@OPENSSL_1_1_0'
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + os_stub/cryptlib_openssl/CMakeLists.txt | 2 +-
> + os_stub/openssllib/process_files.pl     | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/os_stub/cryptlib_openssl/CMakeLists.txt b/os_stub/cryptlib_openssl/CMakeLists.txt
> +index b444f27bc..dffa8b1bc 100644
> +--- a/os_stub/cryptlib_openssl/CMakeLists.txt
> ++++ b/os_stub/cryptlib_openssl/CMakeLists.txt
> +@@ -42,4 +42,4 @@ SET(src_cryptlib_openssl
> + )
> + 
> + ADD_LIBRARY(cryptlib_openssl STATIC ${src_cryptlib_openssl})
> +-TARGET_COMPILE_OPTIONS(cryptlib_openssl PRIVATE ${OPENSSL_FLAGS})
> ++TARGET_COMPILE_OPTIONS(cryptlib_openssl PRIVATE ${OPENSSL_FLAGS} -fpic)
> +diff --git a/os_stub/openssllib/process_files.pl b/os_stub/openssllib/process_files.pl
> +index 579d4e65a..7ee5c8774 100644
> +--- a/os_stub/openssllib/process_files.pl
> ++++ b/os_stub/openssllib/process_files.pl
> +@@ -61,7 +61,7 @@ BEGIN {
> +         "no-hw",
> +         "no-idea",
> +         "no-mdc2",
> +-        "no-pic",
> ++        "pic",
> +         "no-ocb",
> +         "no-poly1305",
> +         "no-posix-io",
> +-- 
> +2.39.1
> +
> diff --git a/package/libspdm/0005-os_stub-openssllib-Support-more-archetectures.patch b/package/libspdm/0005-os_stub-openssllib-Support-more-archetectures.patch
> new file mode 100644
> index 0000000000..cbea5879e5
> --- /dev/null
> +++ b/package/libspdm/0005-os_stub-openssllib-Support-more-archetectures.patch
> @@ -0,0 +1,74 @@
> +From 684bdf7aa7b2d13fdfba7222a4ccf2a8c0166eb0 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 23 Jan 2023 15:58:56 +1000
> +Subject: [PATCH 5/5] os_stub/openssllib: Support more archetectures
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + os_stub/cryptlib_openssl/CMakeLists.txt | 18 +++++++++++++++---
> + os_stub/openssllib/CMakeLists.txt       | 18 +++++++++++++++---
> + 2 files changed, 30 insertions(+), 6 deletions(-)
> +
> +diff --git a/os_stub/cryptlib_openssl/CMakeLists.txt b/os_stub/cryptlib_openssl/CMakeLists.txt
> +index dffa8b1bc..bce0d457e 100644
> +--- a/os_stub/cryptlib_openssl/CMakeLists.txt
> ++++ b/os_stub/cryptlib_openssl/CMakeLists.txt
> +@@ -10,10 +10,22 @@ INCLUDE_DIRECTORIES(${LIBSPDM_DIR}/include
> +                     ${LIBSPDM_DIR}/os_stub/openssllib/openssl
> + )
> + 
> +-if (ARCH STREQUAL "ia32")
> +-    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_IA32)
> +-elseif (ARCH STREQUAL "x64")
> ++if(ARCH STREQUAL "x64")
> +     ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_X64)
> ++elseif(ARCH STREQUAL "ia32")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_IA32)
> ++elseif(ARCH STREQUAL "arm")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_ARM)
> ++elseif(ARCH STREQUAL "aarch64")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_AARCH64)
> ++elseif(ARCH STREQUAL "riscv32")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_RISCV32)
> ++elseif(ARCH STREQUAL "riscv64")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_RISCV64)
> ++elseif(ARCH STREQUAL "arc")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_ARC)
> ++else()
> ++    MESSAGE(FATAL_ERROR "Unkown ARCH")
> + endif()
> + 
> + SET(src_cryptlib_openssl
> +diff --git a/os_stub/openssllib/CMakeLists.txt b/os_stub/openssllib/CMakeLists.txt
> +index a722e5b13..407826144 100644
> +--- a/os_stub/openssllib/CMakeLists.txt
> ++++ b/os_stub/openssllib/CMakeLists.txt
> +@@ -12,10 +12,22 @@ if (TOOLCHAIN STREQUAL "CLANG")
> +     ADD_COMPILE_OPTIONS(-Wno-everything)
> + endif()
> + 
> +-if (ARCH STREQUAL "ia32")
> +-    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_IA32)
> +-elseif (ARCH STREQUAL "x64")
> ++if(ARCH STREQUAL "x64")
> +     ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_X64)
> ++elseif(ARCH STREQUAL "ia32")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_IA32)
> ++elseif(ARCH STREQUAL "arm")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_ARM)
> ++elseif(ARCH STREQUAL "aarch64")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_AARCH64)
> ++elseif(ARCH STREQUAL "riscv32")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_RISCV32)
> ++elseif(ARCH STREQUAL "riscv64")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_RISCV64)
> ++elseif(ARCH STREQUAL "arc")
> ++    ADD_COMPILE_OPTIONS(-DLIBSPDM_CPU_ARC)
> ++else()
> ++    MESSAGE(FATAL_ERROR "Unkown ARCH")
> + endif()
> + 
> + INCLUDE_DIRECTORIES(${LIBSPDM_DIR}/include
> +-- 
> +2.39.1
> +
> diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
> new file mode 100644
> index 0000000000..da1f332484
> --- /dev/null
> +++ b/package/libspdm/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBSPDM
> +	bool "libspdm"
> +	depends on BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_CMOCKA
> +	help
> +	  libspdm is a sample implementation that follows
> +	  the DMTF SPDM specifications
> +
> +	  https://github.com/DMTF/libspdm
> diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
> new file mode 100644
> index 0000000000..b30c1c3eca
> --- /dev/null
> +++ b/package/libspdm/libspdm.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  a0e92c3e21cd8529fa85c2609912b4bf715ce409fcea33670eb8904693341e13  libspdm-2.3.1.tar.gz
> +sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  LICENSE.md
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> new file mode 100644
> index 0000000000..0a06996193
> --- /dev/null
> +++ b/package/libspdm/libspdm.mk
> @@ -0,0 +1,72 @@
> +################################################################################
> +#
> +# libspdm
> +#
> +################################################################################
> +
> +LIBSPDM_VERSION = 2.3.1
> +LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
> +LIBSPDM_LICENSE = BSD-3-Clause
> +LIBSPDM_LICENSE_FILES = LICENSE.md
> +
> +LIBSPDM_INSTALL_STAGING = YES
> +LIBSPDM_INSTALL_TARGET = YES
> +
> +LIBSPDM_DEPENDENCIES += openssl cmocka
> +
> +ifeq ($(BR2_arcle)$(BR2_arceb),y)
> +LIBSPDM_TARGET_CPU_FAMILY = arc
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +LIBSPDM_TARGET_CPU_FAMILY = arm
> +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> +LIBSPDM_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_i386),y)
> +LIBSPDM_TARGET_CPU_FAMILY = ia32
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
> +LIBSPDM_TARGET_CPU_FAMILY = riscv32
> +else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
> +LIBSPDM_TARGET_CPU_FAMILY = riscv64
> +else ifeq ($(BR2_x86_64),y)
> +LIBSPDM_TARGET_CPU_FAMILY = x64
> +else
> +LIBSPDM_TARGET_CPU_FAMILY = $(ARCH)
> +endif
> +
> +# Don't build libraries as LIBSPDM is header-only
> +LIBSPDM_CONF_OPTS = \
> +	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
> +	-DTOOLCHAIN=GCC \
> +	-DTARGET=Release \
> +	-DCRYPTO=openssl \
> +	-DENABLE_BINARY_BUILD=1 \
> +	-DCOMPILED_LIBCRYPTO_PATH=/usr/lib/ \
> +	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
> +	-DTOOLCHAIN=GCC \
> +	-DLINK_FLAGS=$(STAGING_DIR)
> +
> +define LIBSPDM_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/* $(STAGING_DIR)/usr/lib/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/library
> +	$(INSTALL) -D -m 0755 $(@D)/include/library/* $(STAGING_DIR)/usr/include/library
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/internal
> +	$(INSTALL) -D -m 0755 $(@D)/include/internal/*.h $(STAGING_DIR)/usr/include/internal/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/hal/library/cryptlib
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/*.h $(STAGING_DIR)/usr/include/hal/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/*.h $(STAGING_DIR)/usr/include/hal/library/
> +	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/cryptlib/* $(STAGING_DIR)/usr/include/hal/library/cryptlib/
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/industry_standard
> +	$(INSTALL) -D -m 0755 $(@D)/include/industry_standard/* $(STAGING_DIR)/usr/include/industry_standard
> +
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/os_stub/spdm_crypt_ext_lib
> +	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/os_stub/spdm_crypt_ext_lib
> +endef
> +
> +define LIBSPDM_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +$(eval $(cmake-package))
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
