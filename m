Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BCEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25EDD4156F;
	Wed, 12 Jan 2022 19:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o50Hj99K4qY6; Wed, 12 Jan 2022 19:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64A641570;
	Wed, 12 Jan 2022 19:01:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BFD71BF370
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49AF94011D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccWP7JFXhIq5 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:01:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A20A400E5
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:01:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w16so13730126edc.11
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZwRlZKb3YtoWuYS9wxHyzpC1n4+R9M5nFOzqT2EBCKc=;
 b=KYg/uBBQz41lx5MUuRhD6klYcAeDhw7eFEr2yaUo3RX04OSCWhBKGl3w3ikkrPg6by
 BQAvLzz1QTY0kSR9oM84U9jlMESYue+AESqHlHZeJMykoE53OuunopBKN5euNMJLsukP
 MUVM5IMLpJfZ4hq+czwc+BYxEQs+2N+OF98P1gETuzVXSq4/Pt7ehaUcD3oT0/EpAwef
 jFzFc92CI/DiubayX03Dmc6aHbNrInpYNh/X8Xaj9CoJEPrwZVxQ+JOlJtPvh4PA96a8
 b4XunyxGr70Mb9E0PyKDG5vNnA1UXTBxui8Z6ebaEiXs5pFQ794LRvojRN8SONGQAW5o
 o8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZwRlZKb3YtoWuYS9wxHyzpC1n4+R9M5nFOzqT2EBCKc=;
 b=skk3XiOXsQy9+lICYTEXeAZUJtz7gfRKSYtqVUKqH+BgIivdyrSe9moqdXYbf85qUt
 yJKKL/7/y+MDGNoD+UrmaxH2gf3rTdujMWB92uFxjh9X9vVWx2z2euMgQNkPI1A0Lmdq
 Bkl39vEUlKd8OYmK8gnQjAucnrY6OZcW9n3tc8lRPUiXLQUvpwqdLCjItUaX04gBSXR5
 WuZy0AiLD0TnZ3wFfodZrKAArPY+dBuwJ73iJoi/cqB3L6H3RFY2stTce9TUxKvRKnGx
 xBD2lkdvu37lPPFbFmjPiBM8x7B9ydnpQqk4aoI/cCuZB6G8+sNLpVewQ0uDM+S05lJR
 3e+A==
X-Gm-Message-State: AOAM532q5oiV1wlNwTpFYgl7KUn6xulOL5H8kVBUB72wmtoiOf6DiNPy
 IFAJ2J4HhDou740gO+TBuEbjsA==
X-Google-Smtp-Source: ABdhPJyOhSg/8+SDsOYl79H2c/vFR/uJUT/kV/y0vZDAkz1UzD5oL/ZzMeC4ha3MgPbDWVPt4hk+uA==
X-Received: by 2002:a05:6402:f0e:: with SMTP id
 i14mr945895eda.154.1642014089608; 
 Wed, 12 Jan 2022 11:01:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a10sm171152ejx.108.2022.01.12.11.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:01:29 -0800 (PST)
Message-ID: <1a7148cd-c9fd-c444-8a78-83984f67af4c@mind.be>
Date: Wed, 12 Jan 2022 20:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210525182044.13785-1-patrickdepinguin@gmail.com>
 <20220112115100.4bab9b25@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112115100.4bab9b25@windsurf>
Subject: Re: [Buildroot] [PATCHv2] package/grpc: restrict host-grpc to the
 absolute minimum
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
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2022 11:51, Thomas Petazzoni wrote:
> Hello Thomas,
> 
> +Yann, Arnout, Peter, to raise their attention on this patch.
> 
> On Tue, 25 May 2021 20:20:44 +0200
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> 
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> Currently, grpc depends on the full host-grpc, which in turn depends on host
>> versions of many other libraries. One of these, host-libabseil-cpp, also
>> requires a host gcc 4.9 or larger, a dependency which is not met on CentOS
>> 7.
>> But in fact, the target grpc only needs the 'grpc_cpp_plugin' binary from
>> host-grpc. And that binary does not depend on host-libabseil-cpp or other
>> libraries, only on host-protobuf.
>>
>> Given the above, simplify the grpc/host-grpc situation.
>> - Add a patch to the (host-)grpc CMakeLists.txt file to add an option to
>>    only build grpc_cpp_plugin.
>> - Update grpc.mk and Config.in to remove the unnecessary dependencies, and
>>    change the host-grpc configure options to make cmake happy.
>>
>> The advantages of these changes are:
>> - making grpc available to older hosts with gcc < 4.8, like CentOS 7
>> - significantly reducing the build time of host-grpc and its dependencies
>>
>> The patch was proposed upstream but not accepted with below rationale.
>> Perhaps input from others can help in persuading upstream in a future
>> attempt.
>>
>>      'What you're doing sounds like quite a narrow use case. But we simply
>>      cannot provide a cmake option for every possible scenario in the world.
>>      Introducing a new cmake option isn't for free and requires careful
>>      design and maintenance.'
>>
>> Nevertheless, given the benefits in terms of build time and dependency
>> reduction, it makes sense to apply this patch in spite of the disadvantage
>> of a local non-upstreamed patch.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> So I had a look at this, and indeed, upstream has not been very
> supportive. The patch on CMakeLists.txt that you have is not too crazy,
> but it would certainly be a bit annoying to maintain forever (even
> though for some packages, like python3, we do have many more patches
> than that).
> 
> I have thought of enabling the download of the git submodules for just
> the host variant, and use the make target that builds just the native
> tool that is needed. However, using the git submodules just for the
> host variant doesn't work: the tarball has to be the same between host
> and target. An option would be to have a separate package, for just the
> host variant. A bit meh.
> 
> Perhaps we should just take your patch in fact? :-)

  Yes, I'd go for accepting the patch. Sometimes we just have to live with it.

  Regards,
  Arnout

> 
> Yann, Peter, Arnout, any opinion on this?
> 
> Best regards,
> 
> Thomas
> 
>> ---
>>
>> v2: fix typo in Config.in comment (Baruch Siach)
>>
>>
>>   .../grpc/0004-host-grpc-only-cpp-plugin.patch | 223 ++++++++++++++++++
>>   package/grpc/Config.in                        |   6 +-
>>   package/grpc/grpc.mk                          |  27 ++-
>>   3 files changed, 244 insertions(+), 12 deletions(-)
>>   create mode 100644 package/grpc/0004-host-grpc-only-cpp-plugin.patch
>>
>> diff --git a/package/grpc/0004-host-grpc-only-cpp-plugin.patch b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
>> new file mode 100644
>> index 0000000000..43fad7e3d6
>> --- /dev/null
>> +++ b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
>> @@ -0,0 +1,223 @@
>> +From a1922eadfc87da3dd221ff631f94ddd4a8ee7049 Mon Sep 17 00:00:00 2001
>> +From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> +Date: Tue, 25 May 2021 14:55:23 +0200
>> +Subject: [PATCH] Add option to restrict building of (host-)grpc to
>> + grpc_cpp_plugin only.
>> +
>> +This avoids unnecessary dependencies on big packages like libabseil-cpp and
>> +others.
>> +
>> +Upstream-status: not accepted (see https://github.com/grpc/grpc/issues/25322)
>> +
>> +Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> +---
>> + CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
>> + 1 file changed, 35 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index e8934a3e03..c2df332cc6 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -48,12 +48,16 @@ option(gRPC_BUILD_TESTS "Build tests" OFF)
>> + option(gRPC_BUILD_CODEGEN "Build codegen" ON)
>> + option(gRPC_BUILD_CSHARP_EXT "Build C# extensions" ON)
>> + option(gRPC_BACKWARDS_COMPATIBILITY_MODE "Build libraries that are binary compatible across a larger number of OS and libc versions" OFF)
>> ++option(gRPC_BUILD_PLUGIN_SUPPORT_ONLY "Build plugin support only" OFF)
>> +
>> + set(gRPC_INSTALL_default ON)
>> + if(NOT CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
>> +   # Disable gRPC_INSTALL by default if building as a submodule
>> +   set(gRPC_INSTALL_default OFF)
>> + endif()
>> ++if(gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++  set(gRPC_INSTALL_default OFF)
>> ++endif()
>> + set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
>> +     "Generate installation target")
>> +
>> +@@ -367,6 +371,8 @@ add_custom_target(plugins
>> +   DEPENDS ${_gRPC_PLUGIN_LIST}
>> + )
>> +
>> ++if (NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_custom_target(tools_c
>> +   DEPENDS
>> +   check_epollexclusive
>> +@@ -382,6 +388,8 @@ add_custom_target(tools_cxx
>> + add_custom_target(tools
>> +   DEPENDS tools_c tools_cxx)
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> ++
>> + protobuf_generate_grpc_cpp(
>> +   src/proto/grpc/channelz/channelz.proto
>> + )
>> +@@ -1000,6 +1008,7 @@ if(gRPC_BUILD_TESTS)
>> +     DEPENDS buildtests_c buildtests_cxx)
>> + endif()
>> +
>> ++if (NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> +
>> + add_library(address_sorting
>> +   third_party/address_sorting/address_sorting.c
>> +@@ -1051,6 +1060,8 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> ++
>> + if(gRPC_BUILD_TESTS)
>> +
>> + add_library(end2end_nosec_tests
>> +@@ -1313,6 +1324,8 @@ target_link_libraries(end2end_tests
>> +
>> + endif()
>> +
>> ++if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_library(gpr
>> +   src/core/lib/gpr/alloc.cc
>> +   src/core/lib/gpr/atm.cc
>> +@@ -2106,6 +2119,8 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> ++
>> + if(gRPC_BUILD_CSHARP_EXT)
>> +
>> + add_library(grpc_csharp_ext SHARED
>> +@@ -2288,6 +2303,8 @@ endif()
>> +
>> + endif()
>> +
>> ++if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_library(grpc_unsecure
>> +   src/core/ext/filters/census/grpc_context.cc
>> +   src/core/ext/filters/client_channel/backend_metric.cc
>> +@@ -2650,6 +2667,8 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> ++
>> + if(gRPC_BUILD_TESTS)
>> +
>> + if(gRPC_BUILD_CODEGEN)
>> +@@ -2717,6 +2736,8 @@ endif()
>> +
>> + endif()
>> +
>> ++if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_library(grpc++
>> +   src/cpp/client/channel_cc.cc
>> +   src/cpp/client/client_callback.cc
>> +@@ -3134,6 +3155,7 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> +
>> + if(gRPC_BUILD_CODEGEN)
>> + add_library(grpc++_reflection
>> +@@ -3374,6 +3396,8 @@ target_link_libraries(grpc++_test_util
>> +
>> + endif()
>> +
>> ++if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_library(grpc++_unsecure
>> +   src/cpp/client/channel_cc.cc
>> +   src/cpp/client/client_callback.cc
>> +@@ -3656,6 +3680,7 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> +
>> + add_library(grpc_plugin_support
>> +   src/compiler/cpp_generator.cc
>> +@@ -3715,7 +3740,7 @@ foreach(_hdr
>> + endforeach()
>> +
>> +
>> +-if(gRPC_INSTALL)
>> ++if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> +   install(TARGETS grpc_plugin_support EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -3795,6 +3820,8 @@ endif()
>> +
>> + endif()
>> +
>> ++if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> ++
>> + add_library(upb
>> +   third_party/upb/upb/decode_fast.c
>> +   third_party/upb/upb/decode.c
>> +@@ -3852,8 +3879,6 @@ if(gRPC_INSTALL)
>> +   )
>> + endif()
>> +
>> +-
>> +-
>> + add_executable(check_epollexclusive
>> +   test/build/check_epollexclusive.c
>> + )
>> +@@ -3906,8 +3931,6 @@ target_link_libraries(gen_hpack_tables
>> +   gpr
>> + )
>> +
>> +-
>> +-
>> + add_executable(gen_legal_metadata_characters
>> +   tools/codegen/core/gen_legal_metadata_characters.cc
>> + )
>> +@@ -3958,6 +3981,8 @@ target_link_libraries(gen_percent_encoding_tables
>> +   ${_gRPC_ALLTARGETS_LIBRARIES}
>> + )
>> +
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> ++
>> +
>> + if(gRPC_BUILD_TESTS)
>> +
>> +@@ -10722,7 +10747,7 @@ target_link_libraries(grpc_cli
>> +
>> +
>> + endif()
>> +-if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CPP_PLUGIN)
>> ++if(gRPC_BUILD_GRPC_CPP_PLUGIN)
>> +
>> + add_executable(grpc_cpp_plugin
>> +   src/compiler/cpp_plugin.cc
>> +@@ -10752,7 +10777,7 @@ target_link_libraries(grpc_cpp_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL)
>> ++if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> +   install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -15420,7 +15445,7 @@ endif()
>> +
>> +
>> +
>> +-
>> ++if (NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>> +
>> + if(gRPC_INSTALL)
>> +   install(EXPORT gRPCTargets
>> +@@ -15517,3 +15542,5 @@ generate_pkgconfig(
>> +   "-lgrpc++_unsecure -labsl_statusor -labsl_status -labsl_raw_hash_set -labsl_hashtablez_sampler -labsl_synchronization -labsl_time -labsl_time_zone -labsl_civil_time -labsl_graphcycles_internal -labsl_symbolize -labsl_demangle_internal -labsl_malloc_internal -labsl_stacktrace -labsl_debugging_internal -labsl_exponential_biased -labsl_cord -labsl_str_format_internal -labsl_hash -labsl_bad_variant_access -labsl_bad_optional_access -labsl_strings -labsl_strings_internal -labsl_base -labsl_spinlock_wait -labsl_int128 -labsl_city -labsl_throw_delegate -labsl_raw_logging_internal -labsl_log_severity"
>> +   ""
>> +   "grpc++_unsecure.pc")
>> ++
>> ++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>> +--
>> +2.26.3
>> +
>> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
>> index d1bf0d078d..ad3ddbcf19 100644
>> --- a/package/grpc/Config.in
>> +++ b/package/grpc/Config.in
>> @@ -4,7 +4,6 @@ config BR2_PACKAGE_GRPC
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
>>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # protobuf, re2, libabseil-cpp
>> -	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libabseil-cpp
>>   	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>>   	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>> @@ -20,10 +19,9 @@ config BR2_PACKAGE_GRPC
>>   
>>   	  http://github.com/grpc/grpc
>>   
>> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
>> +comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
>>   	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
>> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>> -		|| !BR2_HOST_GCC_AT_LEAST_4_9
>> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
>> index ee8dc38e70..8718b0e956 100644
>> --- a/package/grpc/grpc.mk
>> +++ b/package/grpc/grpc.mk
>> @@ -14,8 +14,7 @@ GRPC_INSTALL_STAGING = YES
>>   
>>   # Need to use host grpc_cpp_plugin during cross compilation.
>>   GRPC_DEPENDENCIES = c-ares host-grpc libabseil-cpp openssl protobuf re2 zlib
>> -HOST_GRPC_DEPENDENCIES = host-c-ares host-libabseil-cpp host-openssl host-protobuf \
>> -	host-re2 host-zlib
>> +HOST_GRPC_DEPENDENCIES = host-protobuf
>>   
>>   # gRPC_CARES_PROVIDER=package won't work because it requires c-ares to have
>>   # installed a cmake config file, but buildroot uses c-ares' autotools build,
>> @@ -70,14 +69,26 @@ GRPC_CONF_OPTS += \
>>   	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
>>   	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
>>   
>> +# For host-grpc, we only need the 'grpc_cpp_plugin' binary, which is needed for
>> +# target grpc compilation. To avoid unnecessary build steps and host
>> +# dependencies, supply enough options to pass the configure checks without
>> +# requiring other host packages, unless those needed by grpc_cpp_plugin.
>>   HOST_GRPC_CONF_OPTS = \
>> -	-DgRPC_ABSL_PROVIDER=package \
>> -	-D_gRPC_CARES_LIBRARIES=cares \
>> -	-DgRPC_CARES_PROVIDER=none \
>>   	-DgRPC_PROTOBUF_PROVIDER=package \
>> -	-DgRPC_RE2_PROVIDER=package \
>> -	-DgRPC_SSL_PROVIDER=package \
>> -	-DgRPC_ZLIB_PROVIDER=package
>> +	-DgRPC_ABSL_PROVIDER=none \
>> +	-DgRPC_CARES_PROVIDER=none \
>> +	-DgRPC_RE2_PROVIDER=none \
>> +	-DgRPC_SSL_PROVIDER=none \
>> +	-DgRPC_ZLIB_PROVIDER=none \
>> +	-DgRPC_BUILD_CODEGEN=OFF \
>> +	-DgRPC_BUILD_CSHARP_EXT=OFF \
>> +	-DgRPC_BUILD_PLUGIN_SUPPORT_ONLY=ON \
>> +	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
>> +	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
>> +	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
>> +	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
>> +	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
>> +	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
>>   
>>   $(eval $(cmake-package))
>>   $(eval $(host-cmake-package))
> 
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
