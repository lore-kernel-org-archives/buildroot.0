Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5A460B17;
	Thu, 21 Apr 2022 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K503uSmJQssA; Thu, 21 Apr 2022 19:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF03611A1;
	Thu, 21 Apr 2022 19:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D58F81BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D26F3824B4
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlCoxP4lSzDQ for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:09:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F4C28247F
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:09:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t25so7713325edt.9
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PvIuopNA7ZKGJTA6YheXnc25g+lv+BStCqmot1Zvrq0=;
 b=VMvO1qmgkuqqiUPcfHZlZGd/zdyvBsqEXsMBPqLY1ZkiOe8qdVCrW+lUj7a/Bw9hFN
 2h4q9R97BJkafgiprrmyd1CLTzAzwAgGui+5TmSFLehz86FdAoEkp7wYirohkEIEODl1
 /RXr5V+kYVs9n9QAzoOZW+ic2MHTLb6n+s3leCGZX7R0r7YSfLnusczC6EuEK+0p9hsV
 R/IVX2u2O5Ft8nffkX01Xw9LcT83Y1SNUkHqXqQK8q7/2uBtDk+gpUYEU2Pq8P4qDb41
 6bp/cM4UOC8l2+I2OUuK1fcwDct+PMoBus5PtdVDEYWxbU6ZzBrUKMmcNgqU8+oMv9n4
 azYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PvIuopNA7ZKGJTA6YheXnc25g+lv+BStCqmot1Zvrq0=;
 b=ihJa8fkrYjdfWCTyr8CZbZ9yYzrUdOTjQ3t/ORNfnifLuUml/ct4WJBgVogzobahLM
 D3FFJQchiRyOJkjc3fLar0NKgERwxxLsr5oS3NVuU9v+7U0hvDc7z4ZlKhkpIEL9eLgD
 YLpYAwftAxq7YHfwGPdzgCRdbyB69ArQBSiWJbqqXSsptsySrlqNS41ZSe+8UgLt/lSO
 2x3M4f7UhI/wapwDlryi0VQZRBhxof/UeeMb+qkW8gb9M1YRc0i3XTPv+Rb0gM/CPNIL
 V0HCvXp5wQnC8r2V8WtIThrFYYy2T0OVR/tYmtFM9brkkBclzHmpICHPVMB+9YYlQTlY
 oSKA==
X-Gm-Message-State: AOAM531zIlPKnL3LHQ3zrvOFePyT4Vsf+r3YUbQF+wjbItOw3oPyH4E7
 JewHBnbdqOk1xGd5ySbL2zeGX0akS0WNug==
X-Google-Smtp-Source: ABdhPJyniP1R3RJp+VDS6ptf1FtzLABNu/p76voQum3IMA6Dx7nqLPxsNI2vwqdvu0Vy9D0kLkN2jQ==
X-Received: by 2002:aa7:d8d5:0:b0:41d:836d:858 with SMTP id
 k21-20020aa7d8d5000000b0041d836d0858mr1084762eds.214.1650568178796; 
 Thu, 21 Apr 2022 12:09:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a50a456000000b00422a4841c61sm10290460edb.58.2022.04.21.12.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:09:37 -0700 (PDT)
Message-ID: <a58c2640-9d95-61a3-9a32-261a7e1e4fbc@mind.be>
Date: Thu, 21 Apr 2022 21:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220413190815.888854-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220413190815.888854-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: fix build
 without C++
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



On 13/04/2022 21:08, Fabrice Fontaine wrote:
> Fix the following build failure without C++ raised since bump to version
> 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
> https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
> 
> CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>    The C++ compiler
> 
>      "/usr/bin/clang++"
> 
>    is not able to compile a simple test program.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...1-CMakeLists.txt-fix-build-without-C.patch | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
> 
> diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
> new file mode 100644
> index 0000000000..c6d6d07dcc
> --- /dev/null
> +++ b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
> @@ -0,0 +1,44 @@
> +From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 13 Apr 2022 21:03:26 +0200
> +Subject: [PATCH] CMakeLists.txt: fix build without C++
> +
> +Fix the following build failure without C++ raised since version 4.2.0
> +and
> +https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
> +
> +CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
> +  The C++ compiler
> +
> +    "/usr/bin/clang++"
> +
> +  is not able to compile a simple test program.
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
> +---
> + CMakeLists.txt | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 08aaf8c6..96e3ad18 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
> + endif()
> +
> + # it's at this point any toolchain file is brought in
> +-project(libwebsockets C CXX)
> ++project(libwebsockets C)
> ++if (LWS_WITH_SECURE_STREAMS_CPP)
> ++	enable_language(CXX)
> ++endif()
> + include(CTest)
> +
> + if (PICO_SDK_PATH)
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
