Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189F8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E5A40546;
	Mon,  6 Jun 2022 13:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkHTHTbjmgeE; Mon,  6 Jun 2022 13:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955BF401AE;
	Mon,  6 Jun 2022 13:02:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92BF31BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA2060BE0
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq9K3uTgFOLX for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DF5360BDC
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:02:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w27so18699770edl.7
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r/gRO+pLWeqs+7GZEDbKWxPndC1lRxyYiceFNbWMV2I=;
 b=R2uPsybPTpPT5dneCvPfMl2WiqIcnCHM5Q35j2lX9Avf1sV1l0UsL7+/eIWBYzEdNl
 yTsqyiGIAydWurxmdqd3fqK0ysygoWuOyz01ONpAaL2f9kW2EbbQc6IKztyf3tKbC/oD
 b48UOEPsSn2WH7vhPD16r/GPtoF2D/qjBvPyrCVzvBcPV/+WzE6L193cfv2qapT3j6tc
 T8EIKXhqLxSozAOrqyob3ptbmIUAQ7eitiN8KtHXNvyHsgnXBqxTDL6IYMj9ClzRDkq9
 iJYpjvd5MmSa/xDYMGD+DWhCGDgoCT497WWI61iq1kE0TnuIzJNdfmJ9y4mLzjh9WrXn
 8T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r/gRO+pLWeqs+7GZEDbKWxPndC1lRxyYiceFNbWMV2I=;
 b=EUTJPWAeK+ifW1HvIB4tqd8qRSN/hO3sgDqKYxySjzCdvIzfG9zlUJF43lCySckE5n
 BBnzEI6uR2J3hdb6QAW1czPPltLiSsAvWf8HuUOfnguhkiFmQAuMGf+QkKq5cs1Y3juU
 1GudyyW/3TqJeLa8NcOSPs08ScPp70TLpkSjnwo7CC58/R0zr3tLIEI6lDYEdaNawJr5
 qLQBe29r8mm+iybbwEpN+y4Nfh66EpeNik0zYSlsnVrm/Mag8aH+TUk71HjMOuFmXZZ/
 r5sOIJzjzqF4/3wy/Hmt3ghe5ckP05DsltMO1BxzGErS+ehgBKh7012BXDy8ve45MyQ4
 Khmw==
X-Gm-Message-State: AOAM530tA+4bFwedE7la62MUyJbBkBvfM523nc601OtDN6KQ21PrYOTt
 0DPjvchtK03CEyUh/PWuu+KYP6OZiPX9mg==
X-Google-Smtp-Source: ABdhPJz17r6WvnXoAqdLUy+tyzybMBtH92yI+Ig7hsFwngJ1dbnf0hEJS/mYJ7t5C/H+W/0FztcM2A==
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr26610203edb.118.1654520529816; 
 Mon, 06 Jun 2022 06:02:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a056402000f00b0042e1cbc4471sm6542444edu.3.2022.06.06.06.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:02:09 -0700 (PDT)
Message-ID: <7733ab98-d1f8-d335-067b-9e0d823acfcf@mind.be>
Date: Mon, 6 Jun 2022 15:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606100023.365608-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606100023.365608-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/eigen: fix build without Fortran
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 12:00, Fabrice Fontaine wrote:
> Fix the following build failure without a working Fortran compiler:
> 
> CMake Error at /nvmedata/autobuild/instance-17/output-1/host/share/cmake-3.18/Modules/CMakeTestFortranCompiler.cmake:51 (message):
>    The Fortran compiler
> 
>      "/usr/bin/f95"
> 
>    is not able to compile a simple test program.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/37f3f40ee39739b5e557d634b71a448762107a4b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ons-for-controlling-build-components.patch | 85 +++++++++++++++++++
>   package/eigen/eigen.mk                        |  9 +-
>   2 files changed, 93 insertions(+), 1 deletion(-)
>   create mode 100644 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
> 
> diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
> new file mode 100644
> index 0000000000..693e610d0a
> --- /dev/null
> +++ b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
> @@ -0,0 +1,85 @@
> +From cf82186416d04ea5df2a397d8fe09dc78d40ca65 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
> +Date: Sat, 5 Mar 2022 05:49:45 +0000
> +Subject: [PATCH] Adds new CMake Options for controlling build components.
> +
> +[Retrieved from:
> +https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + CMakeLists.txt        | 6 ++++++
> + blas/CMakeLists.txt   | 3 ++-
> + lapack/CMakeLists.txt | 5 +++++
> + 3 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index de1c23e91..0af36a53a 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -477,6 +477,9 @@ if(EIGEN_BUILD_TESTING)
> +   add_subdirectory(failtest)
> + endif()
> +
> ++include(CMakeDetermineFortranCompiler)
> ++option(EIGEN_BUILD_BLAS "Toggles the building of the Eigen Blas library" ${CMAKE_Fortran_COMPILER})
> ++option(EIGEN_BUILD_LAPACK "Toggles the building of the included Eigen LAPACK library" ${CMAKE_Fortran_COMPILER})
> + if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
> +   add_subdirectory(blas)
> +   add_subdirectory(lapack)
> +@@ -611,6 +614,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
> +
> + install (TARGETS eigen EXPORT Eigen3Targets)
> +
> ++option(EIGEN_BUILD_CMAKE_PACKAGE "Enables the creation of EigenConfig.cmake and related files" ON)
> ++if(EIGEN_BUILD_CMAKE_PACKAGE)
> + configure_package_config_file (
> +   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
> +   ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
> +@@ -655,6 +660,7 @@ install (FILES ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
> + # Add uninstall target
> + add_custom_target ( uninstall
> +     COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
> ++endif()
> +
> + if (EIGEN_SPLIT_TESTSUITE)
> +   ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
> +diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
> +index 8d3cb86dc..c530957fb 100644
> +--- a/blas/CMakeLists.txt
> ++++ b/blas/CMakeLists.txt
> +@@ -1,6 +1,7 @@
> +
> + project(EigenBlas CXX)
> +
> ++if(EIGEN_BUILD_BLAS)
> + include(CheckLanguage)
> + check_language(Fortran)
> + if(CMAKE_Fortran_COMPILER)
> +@@ -59,4 +60,4 @@ if(EIGEN_BUILD_TESTING)
> + endif()
> +
> + endif()
> +-
> ++endif()
> +diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
> +index c8ca64001..8d6d75401 100644
> +--- a/lapack/CMakeLists.txt
> ++++ b/lapack/CMakeLists.txt
> +@@ -1,5 +1,7 @@
> + project(EigenLapack CXX)
> +
> ++if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
> ++
> + include(CheckLanguage)
> + check_language(Fortran)
> + if(CMAKE_Fortran_COMPILER)
> +@@ -457,3 +459,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
> +
> + endif()
> +
> ++elseif(EIGEN_BUILD_LAPACK AND NOT EIGEN_BUILD_BLAS)
> ++ message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
> ++endif() #EIGEN_BUILD_LAPACK
> +--
> +GitLab
> +
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> index 9df286e11f..7fe3fbdac6 100644
> --- a/package/eigen/eigen.mk
> +++ b/package/eigen/eigen.mk
> @@ -18,7 +18,14 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
>   EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> -EIGEN_CONF_OPTS += -DCMAKE_Fortran_COMPILER=$(TARGET_FC)
> +EIGEN_CONF_OPTS += \
> +	-DCMAKE_Fortran_COMPILER=$(TARGET_FC) \
> +	-DEIGEN_BUILD_BLAS=ON \
> +	-DEIGEN_BUILD_LAPACK=ON
> +else
> +EIGEN_CONF_OPTS += \
> +	-DEIGEN_BUILD_BLAS=OFF \
> +	-DEIGEN_BUILD_LAPACK=OFF
>   endif
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
