Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73829C77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 15:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB9560AF1;
	Sat, 15 Apr 2023 15:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB9560AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIo9ashYzaPZ; Sat, 15 Apr 2023 15:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF256112C;
	Sat, 15 Apr 2023 15:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF256112C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61EEA1C4059
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4763E40B91
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4763E40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zV9iexXnq2CC for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 15:04:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00E5040B8E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00E5040B8E
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 15:04:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D16D25FFA9;
 Sat, 15 Apr 2023 17:04:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 17:04:04 +0200
Date: Sat, 15 Apr 2023 17:04:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230415150404.GL2819@scaer>
References: <20230411183145.6751-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411183145.6751-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681571047;
 bh=0jrb9dRX+9kBR9+meniEFfwuVul5EG1FWKRPO1NxmyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=olTDa3511yK3Ajjjb60mnTaYP6Pd7tlI4qjieGr8JLpCWhLkoscGbfyBsbg3+xvEy
 Cz3ne7VwoJoDBsEAtIylos/E3NKua4tSqLzjuVha5tnYM6rOm7n76GlYhcXWwg95p1
 7Yoc+gwZvXW5oLO2ycGlsl2MOEcNwp3l8HYNu65CM80yB7j5a9wzBenha8Dl+tbOTl
 SHYezrE8xDUWSrcSXHMO0Y/Zm0Yi4qcjRuFIlFkPRvakvGeK4qtqit2DD442zbXC1q
 bTQ+Q1X8AL6Oz4lvEgwWIxb0NBtUh3Rnjp7zDz6YgqCCRNI9Qywz2yidKasV0/PsDu
 D9LZ7awdYRS1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=olTDa351
Subject: Re: [Buildroot] [PATCH v4,1/1] package/zeek: bump to version 5.2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-04-11 20:31 +0200, Fabrice Fontaine spake thusly:
> - Handle build and install of gen-zam
> - Disable new spicy option (work is still needed to cross-compile it)
> - Disable unit tests (as they are now enabled by default)
> - Update hash of COPYING (year updated with
>   https://github.com/zeek/zeek/commit/273126a87b8f7134b81439ae31343c7b45d2a421)
> - Update hash of COPYING.3rdparty (path updated, filessystem added and
>   file renamed with
>   https://github.com/zeek/zeek/commit/72cbc7cd13b7c1bda98658104431c3b530ff68d6
>   https://github.com/zeek/zeek/commit/b77f5fa14cc1b64572b70f80366e1ba56f87503c
>   https://github.com/zeek/zeek/commit/4f6f46a4043b092b40c01d91a57c5ff273ab433a)
> - This bump will fix the following build failure with python >= 3.11:
> 
> In file included from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/attr.h:13,
>                  from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/pybind11.h:45,
>                  from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/functional.h:12,
>                  from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/_broker.cpp:13:
> /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h: In function 'std::string pybind11::detail::error_string()':
> /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h:446:36: error: invalid use of incomplete type 'PyFrameObject' {aka 'struct _frame'}
>   446 |                 "  " + handle(frame->f_code->co_filename).cast<std::string>() +
>       |                                    ^~
> 
> https://github.com/zeek/zeek/blob/v5.2.0/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/43ca5fcc5b8618e6a7a65e77061f673a3c30bfc6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v3 -> v4:
>  - Use upstream patch
> Changes v2 -> v3:
>  - Add a patch to fix install
> Changes v1 -> v2:
>  - Update commit message with information about python build failure
> 
>  ...ce-static-builds-for-the-bundled-CAF.patch | 55 +++++++++++++++++++
>  package/zeek/zeek.hash                        |  6 +-
>  package/zeek/zeek.mk                          | 13 +++--
>  3 files changed, 67 insertions(+), 7 deletions(-)
>  create mode 100644 package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch
> 
> diff --git a/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch b/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch
> new file mode 100644
> index 0000000000..5bca0d6ebe
> --- /dev/null
> +++ b/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch
> @@ -0,0 +1,55 @@
> +From 8c56244338b7f23b016f9980680b000d61a91521 Mon Sep 17 00:00:00 2001
> +From: Dominik Charousset <dominik.charousset@corelight.com>
> +Date: Fri, 7 Apr 2023 10:40:32 +0200
> +Subject: [PATCH] Force static builds for the bundled CAF
> +
> +[Retrieved from:
> +https://github.com/zeek/broker/commit/8c56244338b7f23b016f9980680b000d61a91521]

You forgot to add your SoB line in this back-ported patch.

Also, but this is not yet documented, patches are pending, we are moving
toward referencing upstream status with an Upstream: tag, like so;

    Upstream: https://github.com/zeek/broker/commit/8c56244338b7f23b016f9980680b000d61a91521
    Signed-off-by: You etc...

I could have changed the upstream status, but I can't add your SoB...

Regards,
Yann E. MORIN.

> +---
> + CMakeLists.txt | 20 +++++++++++---------
> + 1 file changed, 11 insertions(+), 9 deletions(-)
> +
> +diff --git a/auxil/broker/CMakeLists.txt b/auxil/broker/CMakeLists.txt
> +index cb99d290..f7df1417 100644
> +--- a/auxil/broker/CMakeLists.txt
> ++++ b/auxil/broker/CMakeLists.txt
> +@@ -195,6 +195,14 @@ if (NOT OPENSSL_LIBRARIES)
> + endif()
> + set(LINK_LIBS ${LINK_LIBS} OpenSSL::SSL OpenSSL::Crypto)
> + 
> ++function(add_bundled_caf)
> ++  # Disable unnecessary features and make sure CAF builds static libraries.
> ++  set(CAF_ENABLE_EXAMPLES OFF)
> ++  set(CAF_ENABLE_TESTING OFF)
> ++  set(CAF_ENABLE_TOOLS OFF)
> ++  set(BUILD_SHARED_LIBS OFF)
> ++  add_subdirectory(caf EXCLUDE_FROM_ALL)
> ++endfunction()
> + 
> + # NOTE: building and linking against an external CAF version is NOT supported!
> + #       This variable is FOR DEVELOPMENT ONLY. The only officially supported CAF
> +@@ -209,21 +217,15 @@ if (CAF_ROOT)
> +   else()
> +     find_package(CAF REQUIRED COMPONENTS openssl test io core net)
> +   endif()
> +-  list(APPEND LINK_LIBS CAF::core CAF::io CAF::net)
> +   set(BROKER_USE_EXTERNAL_CAF ON)
> + else ()
> +   message(STATUS "Using bundled CAF")
> +-  set(CAF_ENABLE_EXAMPLES OFF CACHE INTERNAL "")
> +-  set(CAF_ENABLE_TESTING OFF CACHE INTERNAL "")
> +-  set(CAF_ENABLE_TOOLS OFF CACHE INTERNAL "")
> +-  set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
> +-  add_subdirectory(caf EXCLUDE_FROM_ALL)
> +-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_core_obj>)
> +-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_io_obj>)
> +-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_net_obj>)
> ++  add_bundled_caf()
> +   set(BROKER_USE_EXTERNAL_CAF OFF)
> + endif ()
> + 
> ++list(APPEND LINK_LIBS CAF::core CAF::io CAF::net)
> ++
> + # -- libroker -----------------------------------------------------------------
> + 
> + file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION" BROKER_VERSION LIMIT_COUNT 1)
> diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
> index 05e57b5024..872ef8e14f 100644
> --- a/package/zeek/zeek.hash
> +++ b/package/zeek/zeek.hash
> @@ -1,6 +1,6 @@
>  # Locally computed:
> -sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
> +sha256  511047400dd4539177542c84a5e80d7e97ad73d2a9986ffcd6cd85b4cc711fbf  zeek-5.2.0.tar.gz
>  
>  # Hash for license files:
> -sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
> -sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
> +sha256  14c5057bb1f83c50db29323a9d5bb0f33db9c4d8b9806c070f5b0ca84f52694a  COPYING
> +sha256  5be6b90c7a563e6ee8238354f3487206e19d8f299689ff2adce7bdd1a6919ab1  COPYING-3rdparty
> diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
> index 584bfb0778..9c599fc22d 100644
> --- a/package/zeek/zeek.mk
> +++ b/package/zeek/zeek.mk
> @@ -4,19 +4,19 @@
>  #
>  ################################################################################
>  
> -ZEEK_VERSION = 4.1.1
> +ZEEK_VERSION = 5.2.0
>  ZEEK_SITE = https://download.zeek.org
>  ZEEK_LICENSE = \
>  	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
>  	Public Domain (sqlite), \
> -	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
> +	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
>  	LGPL-3.0+ (Multifast Project), \
>  	BSD-2-Clause (event.h), \
>  	BSD-3-Clause (in_cksum.cc) \
>  	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
>  	Apache-2.0 (highwayhash, folly), \
>  	MPL-2.0 (mozilla-ca-list.zeek)
> -ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
> +ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
>  ZEEK_CPE_ID_VENDOR = zeek
>  ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
>  ZEEK_DEPENDENCIES = \
> @@ -45,6 +45,9 @@ ZEEK_CONF_OPTS = \
>  	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
>  	-DBROKER_DISABLE_DOCS=ON \
>  	-DBROKER_DISABLE_TESTS=ON \
> +	-DDISABLE_SPICY=ON \
> +	-DENABLE_ZEEK_UNIT_TESTS=OFF \
> +	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
>  	-DINSTALL_AUX_TOOLS=ON \
>  	-DZEEK_ETC_INSTALL_DIR=/etc
>  
> @@ -79,13 +82,15 @@ ZEEK_DEPENDENCIES += musl-fts
>  ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
>  endif
>  
> -HOST_ZEEK_MAKE_OPTS = binpac bifcl
> +HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam
>  
>  define HOST_ZEEK_INSTALL_CMDS
>  	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
>  		$(HOST_DIR)/bin/bifcl
>  	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
>  		$(HOST_DIR)/bin/binpac
> +	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
> +		$(HOST_DIR)/bin/gen-zam
>  endef
>  
>  $(eval $(cmake-package))
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
