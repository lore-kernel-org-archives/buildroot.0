Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23920C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB11420E3;
	Mon,  6 Nov 2023 21:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB11420E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnqNunOSQEHF; Mon,  6 Nov 2023 21:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DBF41805;
	Mon,  6 Nov 2023 21:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4DBF41805
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB8FC1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB4241805
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB4241805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0_AYmst_aXa for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:43:42 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34EA341803
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EA341803
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6CB6F19F5BA;
 Mon,  6 Nov 2023 22:43:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 22:43:37 +0100
Date: Mon, 6 Nov 2023 22:43:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: enki <enki@fsck.pl>
Message-ID: <20231106214337.GA229059@scaer>
References: <20231106130835.116844-1-enki@fsck.pl>
 <20231106133012.GB2625@scaer>
 <18ba66f6ef4.c5fba63142993.3459614153541394630@fsck.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18ba66f6ef4.c5fba63142993.3459614153541394630@fsck.pl>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699307019;
 bh=J4rYn/mrVjSi7dH5O+oFn9ovy2IbsW00KUA8dClY6rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZEuHYq7goU9HgEWDXoMUdOFcd5ah9MogZmld8cmN9Kkbq7jS6CzBN++X5lM3DMaQ
 hW2QpQ2epz1ivy7kcCpiCimL9SPSQFQM98c4U/tPugXolpRKYot5nQGF3HlwCPW/QJ
 owC61qb2Vs0CGJwLpljSrMOV8tVPVOfxC/4ZOBP2zkKOsZIWKDGb1WajN4g62kCZzW
 GjJUaH+sMCI3K4AleGp90YcwnLTVEmj7uUEeK74w6jUOOHQjaA2JyIcpF70T2IgO56
 Ae4baSHsKk3sclYRWHhkQUqMhn0SUqKdtdWs2d4Q4EUUQuLMt8wlNbO6QhQiO5vN04
 A+ec5bLZBlpWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RZEuHYq7
Subject: Re: [Buildroot] [PATCH v4 1/1] package/spirv-tools: fix build issue
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maciej, All,

On 2023-11-06 22:00 +0100, enki spake thusly:
> ---- On Mon, 06 Nov 2023 14:30:12 +0100  Yann E. MORIN  wrote --- 
>  > On 2023-11-06 14:08 +0100, Maciej Grela spake thusly:
>  > > spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.
>  > > Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
>  > > Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f
>  > Sorry, but I still don't understansd how those two build failures relate
>  > to static builds.
> If you take (as an example) the config from a1f615d2410bffb6fdacc8586761c9def05aafa9, enable the C++ support and try to build you get the 
> failure caused by ld trying to do a dynamic link with a static library:
[--SNIP--]
> Enabling the shared libs and rebuilding the toolchain fixes this. In
> other words those two builds fail *both* because of missing C++ support
> as well as a static-only toolchain. It's just that the missing C++
> makes it fail early.

Here is a minimalist defconfig with static-libs:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE=y
    BR2_STATIC_LIBS=y
    BR2_PACKAGE_SPIRV_TOOLS=y

And with this, spirv-tools does build successfully;

    $ make spirv-tools-configure
    [...]
    -- The C compiler identification is GNU 13.2.0
    -- The CXX compiler identification is GNU 13.2.0
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - done
    -- Check for working C compiler: /home/ymorin/dev/buildroot/O/master/host/bin/arm-linux-gcc - skipped
    -- Detecting C compile features
    -- Detecting C compile features - done
    -- Detecting CXX compiler ABI info
    -- Detecting CXX compiler ABI info - done
    -- Check for working CXX compiler: /home/ymorin/dev/buildroot/O/master/host/bin/arm-linux-g++ - skipped
    -- Detecting CXX compile features
    -- Detecting CXX compile features - done
    -- Found Python3: /usr/bin/python3.8 (found version "3.8.10") found components: Interpreter
    -- Configuring done (0.4s)
    -- Generating done (0.1s)
    CMake Warning:
      Manually-specified variables were not used by the project:

        BUILD_DOC
        BUILD_DOCS
        BUILD_EXAMPLE
        BUILD_EXAMPLES
        BUILD_TEST
        BUILD_TESTING
        BUILD_TESTS

    -- Build files have been written to: /home/ymorin/dev/buildroot/O/master/build/spirv-tools-1.3.261.1

    $ make spirv-tools-build
    [...]
    [ 99%] Linking CXX static library libSPIRV-Tools-reduce.a
    [ 99%] Built target SPIRV-Tools-reduce
    [100%] Building CXX object tools/CMakeFiles/spirv-reduce.dir/util/flags.cpp.o
    [100%] Building CXX object tools/CMakeFiles/spirv-reduce.dir/reduce/reduce.cpp.o
    [100%] Building CXX object tools/CMakeFiles/spirv-reduce.dir/util/cli_consumer.cpp.o
    [100%] Linking CXX executable spirv-reduce
    [100%] Built target spirv-reduce

    $ make spirv-tools-install
    [...]
    $ file target/usr/bin/spirv-*
    target/usr/bin/spirv-as:          ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-cfg:         ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-dis:         ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-lesspipe.sh: a /usr/bin/env sh script, ASCII text executable
    target/usr/bin/spirv-link:        ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-lint:        ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-objdump:     ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-opt:         ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-reduce:      ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped
    target/usr/bin/spirv-val:         ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, with debug_info, not stripped

So, strictly speaking, spirv-tools do not require shared libs, and do
build OK with static-only.

So, if there is an issue with static-only, there is a hidden condition
as well. Can you investigate a bit further, please?

Regards,
Yann E. MORIN.

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
