Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50285C61CE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2A960E0E;
	Sat,  7 Jun 2025 11:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjOzF8_Lljqn; Sat,  7 Jun 2025 11:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D1F660E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1F660E11;
	Sat,  7 Jun 2025 11:47:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB631A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90B3E60E11
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWHq6haoIbct for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 11:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4766F60E0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4766F60E0E
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4766F60E0E
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:46:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so515833066b.1
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 04:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749296818; x=1749901618;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIeb1FlmmhMPhu8JKPJ4ciimHEADcy9o1J+JjZIk/Y8=;
 b=oFW5cu4soBO0kUMX/BC1D1P2/yuF6ugcVXwAZs1OUN0dmNps2hfTZ2HtWfabGIo+4+
 wkyboy5gkonqe82RidxikoPfgwZz37AcGHLeduScJwpdnqip3LmH0UDCPEkkVRsA7a4q
 3PYAyQMYBDEyXWrKhwKyezGSrad24rrVFUbcEygx7ov8ygOENqXdaU2eZZERq0GwOsdn
 97Rtyk3ROWfJSrUmXjcxkhy2NifQa1CZJ4OJwFc2y4eyojzc/QfGy3r5v6mTwhJJQ3Vx
 EgqP3B4uxXzP36LUFkYv+06DP2aI9AFM8X6UPQ7txVMSLxDGXqX4Mi1PIDJ9EkXIwUV2
 Sv0g==
X-Gm-Message-State: AOJu0YzmCb2lL/D9+2RZd7ke5ZPT4NZPUa6qSyEHp1vrbfyu6DnpG1uT
 FO1SRlsv5hx+umCIZz8jcKCsC1mwoSkAPYLMU3lmrBeX8L9fYDDL4Bo1OJbm92ibF4GPciO1twZ
 H/HbT
X-Gm-Gg: ASbGncshepURUHdSncqWYaz4elHnP91IaHPwCQRgqHIwaRDIbPP7cpADZ8vApkd3DJ5
 1ihaf6dstnNMgS/XMMsAJcP3Ls86Gc0lHUfNpsOBHFRQ5eV/I3zrJ65CEmkCT2PWgxKCVtvN+59
 xTdkqepskvO8AB8I09lmxRFbVntwrQwrFaxYgN5scUvLfvKZuI49adet+IkYmcObK4R4AffKX+N
 3kwAA1caZWUOra6UQmyaQyUPvuz7jPo8ii3DlWQ+PzZUFJbDKRcbMr0BNiJa5zSxUmaCrZuJgL7
 7EjoEM70iShzik5TLAtZqwRguqb2sLR0yHoHZZNbVOA/vA+GHTHzuuGToWy3MJphpDc=
X-Google-Smtp-Source: AGHT+IFDnAq2dq6sv63rcuoBbBH5ntPsjGC3eh0c6mW31mnWnLnjrTqQqMPYEEWJXkdc/Lt6jCVu/w==
X-Received: by 2002:a17:906:dc8d:b0:adb:2a66:85bc with SMTP id
 a640c23a62f3a-ade1aab9e47mr574415866b.34.1749296817550; 
 Sat, 07 Jun 2025 04:46:57 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade3c427cafsm119163266b.75.2025.06.07.04.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jun 2025 04:46:57 -0700 (PDT)
Message-ID: <378bb6eb-a1d1-4757-b79b-5f6d52f6b0ad@mind.be>
Date: Sat, 7 Jun 2025 13:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
References: <20250607114425.774736-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20250607114425.774736-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749296818; x=1749901618; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pIeb1FlmmhMPhu8JKPJ4ciimHEADcy9o1J+JjZIk/Y8=;
 b=CKZRnss630lgE8RTRiL/27/cNGHDRNI9yO1H6llaMYS01QHsZ/pztvttxjLkiPItBO
 B+azaUbwL8gGWAk32SSACWIl2oRImi6aby2D4PI0HG4T/2Da+00+e3q4OQAJ8QLYM5N3
 FbmjpLUYTYJBxV0QCrRg9ledK5lrKbY6JbEqpIgpJdoPvbuiey+qo2ugOFMv+Yi7FS5t
 pDnEmEJ2fRb/KsQU26zOpxb2ISzt3nL8yx4JjaGxouaxjOa252AIlheo1YbIYNeBOJHn
 yTaDatVvV4Bh0oYWBHJrExlTLkm055uLSM0rKMPf64barT+E8/kEarbmdprbQ0e2XChe
 MpGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CKZRnss6
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/fluent-bit: build fix for
 toolchains w/o CXX
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas Devoogdt,

I didn't manage to reproduce the build error for the lib miniz. Can you 
confirm it occurs on the v3.2.10 as well.

Thanks.
PERALE Thomas

On 6/7/25 1:44 PM, Thomas Perale wrote:
> Since the package bump [1] the fluent-bit package started to fail
> because of an update introduced in fluent-bit v3.2.7 (see [2]).
>
> The following error appeared on the autobuilder in the LTS branch.
>
> ```
> CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/CMakeTestCXXCompiler.cmake:73 (message):
>    The C++ compiler
>
>      "/bin/false"
>
>    is not able to compile a simple test program.
>
>    It fails with the following output:
>
>      Change Dir: '/home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc'
>
>      Run Build Command(s): /home/buildroot/instance-0/output-1/host/bin/ninja -v cmTC_71bbf
>      [1/2] /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
>      FAILED: CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o
>      /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
>      ninja: build stopped: subcommand failed.
>
>    CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>    lib/zstd-1.5.7/build/cmake/CMakeLists.txt:36 (project)
> ```
>
> The commit [3] included two patches to fix the build error
> for configs using toolchains without CXX.
>
> Since the build error was already present on v3.2.10,
> those patches actually fix the error for LTS version as well.
> This patch pick them from the series to apply them on the LTS
> branch.
>
> [1] 8bc18fad29 package/fluent-bit: bump to 3.2.10
> [2] https://github.com/fluent/fluent-bit/commit/0ce59cecdc3c3f8053bebe9d5d9ef7b30fc6c4e6
> [3] 8181727e23 package/fluent-bit: bump to 4.0.0
>
> Fixes: https://autobuild.buildroot.org/results/4b0/4b0646e8fcc3f023ab0173ea8725f381e5055152/
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   ...able-CXX-support-if-tests-are-requir.patch | 34 +++++++++++++++++++
>   ...-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
>   create mode 100644 package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
>
> diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> new file mode 100644
> index 0000000000..f7b282165c
> --- /dev/null
> +++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
> @@ -0,0 +1,34 @@
> +From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Tue, 1 Apr 2025 22:43:30 +0200
> +Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
> +
> +Upstream: https://github.com/facebook/zstd/pull/4357/files
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> +index 347d41c0f..70e233df3 100644
> +--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> ++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
> +@@ -37,7 +37,6 @@ project(zstd
> +   VERSION "${ZSTD_FULL_VERSION}"
> +   LANGUAGES C   # Main library is in C
> +             ASM # And ASM
> +-            CXX # Testing contributed code also utilizes CXX
> +   )
> +
> + message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
> +@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
> + endif ()
> +
> + if (ZSTD_BUILD_TESTS)
> ++    enable_language(CXX)
> +     enable_testing()
> +     if (NOT ZSTD_BUILD_STATIC)
> +         message(SEND_ERROR "You need to build static library to build tests")
> +--
> +2.43.0
> +
> diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> new file mode 100644
> index 0000000000..bfd32d6b68
> --- /dev/null
> +++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
> @@ -0,0 +1,27 @@
> +From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
> +From: Thomas Devoogdt <thomas@devoogdt.com>
> +Date: Tue, 1 Apr 2025 23:01:13 +0200
> +Subject: [PATCH] lib: miniz: only require a C compiler
> +
> +Upstream: https://github.com/richgel999/miniz/pull/338
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + lib/miniz/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
> +index ce6ade1c0..91012b36a 100644
> +--- a/lib/miniz/CMakeLists.txt
> ++++ b/lib/miniz/CMakeLists.txt
> +@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
> + endif()
> +
> + if(CMAKE_MINOR_VERSION LESS 12)
> +-  project(miniz)
> ++  project(miniz C)
> +   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
> + else()
> +   project(miniz C)
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
