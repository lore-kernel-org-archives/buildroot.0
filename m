Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44074C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CB760E2E;
	Sun, 27 Mar 2022 15:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32OSU9QtDe7d; Sun, 27 Mar 2022 15:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8EF60A8A;
	Sun, 27 Mar 2022 15:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA4481BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9941981C6F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPONsGjKTN1U for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AE3081678
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:57:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j15so24010088eje.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I8ymeu/aUf7xKU5AOeFfZpkRebbyBMZPmCN4XsmSmNM=;
 b=fL6LKg4M374r1bDFlNrr7GaPsVR5X2URsCPwPuSvBSE7N0wK5XXaJjJhMy8pZk46Rd
 R6gDXWwxe/EwvghojWyKiI1t9TTgYltfRCwzXXXRq4M46ud66Oj6tZLtzeL4ha+qHudp
 ST0ZeNym1WgVzLCSQo4UPAnN50wGc3I67aZEmqF9IdgydZnN0nugQJgoIynVyz90Skdf
 hQpQd6qFSR1jGgyjX5HEhpJ2QDdg+Qf3dECsCvsWq+WJT8tc0xh/a4pOKbPKUAo7hDz+
 f9UQwR8jknpCrCMtifFyi3fSNAu+bw+9vabNHNc0TQG81KBpir9bB4uAQ3XZrATNKY3H
 pURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I8ymeu/aUf7xKU5AOeFfZpkRebbyBMZPmCN4XsmSmNM=;
 b=jFY4BOcQ7Rbn8QYqrJqHFdL2OM7LG5JOoQL96XqJbaZm8d72ZQ7cSqJhDzby7JbA5d
 eUTzRHDWtvsoFDr426fCu3cPdfU1j/gPK09GFvcRuhOSn9UwJOUBRAccP/N0aLEpsN0b
 KpuzOexGfgwPLmwTJTz5mp3GG9+5e+5EY4TRHt1hYuiTtddp5roe5LFpPdHu+6TooDd2
 gPUXYqp5BY6eTGv+vtQdbDIZ+QS+0tdVaKDc11s6GFH50SEWAWpcMpJMiciiQZ2oMisd
 JpHZHebFfrMzLp/DABLA75zI6hzZYKe0OMFXxQUiyweNM7MBmNFdgu16N3Xu03ivBcLk
 O72w==
X-Gm-Message-State: AOAM5303MehUFYqrPzzbvsy61iRDX3dsyqD2IuFzQ6jepZ1Z8RLDF0uV
 H44ZtTWbMmsfKRmnZ8eD2QHB3g==
X-Google-Smtp-Source: ABdhPJzDt9HwpoXIge+STjFx/rDCxrG0Cmw6BcGiTvn18g48P+6WFgk6OwsCTAby7uP4svx8Ff4FCQ==
X-Received: by 2002:a17:907:6d19:b0:6db:89c8:52e3 with SMTP id
 sa25-20020a1709076d1900b006db89c852e3mr23239579ejc.754.1648396631296; 
 Sun, 27 Mar 2022 08:57:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c594000000b004194b07bbfasm1374642edq.10.2022.03.27.08.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:57:10 -0700 (PDT)
Message-ID: <d1c557ad-f077-abef-157b-85b161b221eb@mind.be>
Date: Sun, 27 Mar 2022 17:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211227074056.13882-1-br015@umbiko.net>
 <20220320114138.433796-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320114138.433796-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/zziplib: fix static build
 failure with mpd
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/03/2022 12:41, Andreas Ziegler wrote:
> The current released version of zziplib copies static libraries with appended
> major version, but omits creating the necessary links to the base file names.
> This prevents the linker to find the libraries via the search path.
> 
> The issue (https://github.com/gdraheim/zziplib/issues/117) has been
> fixed upstream; this patch extracts the necessary part of commit 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of symlinks.
> 
> This resolves the following autobuild issues:
> 
> http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1
> http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38
> http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
> Changes v1 -> v2:
>   - extract link creation from commit 0e8d35f
> Changes v2 -> v3:
>   - update failure list
> 
>   ...-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 78 +++++++++++++++++++
>   1 file changed, 78 insertions(+)
>   create mode 100644 package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> 
> diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> new file mode 100644
> index 0000000000..50380861bc
> --- /dev/null
> +++ b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
> @@ -0,0 +1,78 @@
> +Extract link creation for versioned libraries from commit
> +0e8d35f92efb680c81f6ec1fca9f11d173dce389.
> +
> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> +
> +---
> +From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
> +From: Guido Draheim <guidod@gmx.de>
> +Date: Sat, 22 May 2021 15:13:28 +0200
> +Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib

  I've moved the part that you added down here, so it stays as a git-formatted 
patch.

[Andreas: Extract link creation for versioned libraries from commit
0e8d35f92efb680c81f6ec1fca9f11d173dce389.]
Signed-off-by: Andreas Ziegler <br015@umbiko.net>


  Applied to master, thanks.

  Regards,
  Arnout


> +
> +---
> + zzip/CMakeLists.txt | 57 +++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 45 insertions(+), 12 deletions(-)
> +
> +diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
> +index a966d5f..ccd08b6 100644
> +--- a/zzip/CMakeLists.txt
> ++++ b/zzip/CMakeLists.txt
> +@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
> + option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
> + endif()
> +
> ++if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
> ++else()
> ++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
> ++endif()
> ++
> + # used in zzip/_config.h
> + set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
> + set(ZZIP_VERSION "${PROJECT_VERSION}")
> +@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
> +   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
> + endif(ZZIP_LIBTOOL)
> +
> ++if(ZZIP_LIBLATEST)
> ++  if(BUILD_SHARED_LIBS)
> ++    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
> ++    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
> ++  else()
> ++    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
> ++    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
> ++  endif()
> ++    get_target_property(libname libzzip OUTPUT_NAME)
> ++    get_target_property(librelease libzzip RELEASE_POSTFIX)
> ++    add_custom_target(libzzip_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    if(ZZIPFSEEKO)
> ++    get_target_property(libname libzzipfseeko OUTPUT_NAME)
> ++    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
> ++    add_custom_target(libzzipfseeko_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    endif(ZZIPFSEEKO)
> ++    if(ZZIPMMAPPED)
> ++    get_target_property(libname libzzipmmapped OUTPUT_NAME)
> ++    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
> ++    add_custom_target(libzzipmmaped_latest ALL
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
> ++        )
> ++    install(FILES
> ++        ${outdir}/${lib}${libname}${dll}
> ++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
> ++    endif(ZZIPMMAPPED)
> ++endif(ZZIP_LIBLATEST)
> ++
> ++
> + ## messages ##############################################
> +
> + message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
