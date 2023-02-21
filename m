Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFB8C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD9E682861;
	Tue, 21 Feb 2023 08:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9E682861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuVLeWBXgBcA; Tue, 21 Feb 2023 08:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF04827DE;
	Tue, 21 Feb 2023 08:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF04827DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36C201BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FFE742CE6
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFE742CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CaMv0QK2528 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:37:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E3142CE1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E3142CE1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:37:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8138C1BF203;
 Tue, 21 Feb 2023 08:37:20 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:37:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221093719.5215ef5d@windsurf>
In-Reply-To: <20230220231902.340496-1-fontaine.fabrice@gmail.com>
References: <20230220231902.340496-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qAsODZsC75P9aS6+8LySXIpznNgjsWc/gu5+dBhpS4=;
 b=cnUO6SLN2Kh2xviYyvJDj3SLyprI8UOlHv9Ho4NmUBcWYawvS2fYKIexN6MBC37KxGouRT
 wUPz94puwC58WYKKip8xHm5rZ7syrWHRVLaAQFK62dr01vqG1trDoEl2l2UdQ3qBqI18uY
 83pUyeXrrnxWR0OBzuFz7kywF8Lc9i6yYf0/KhGuCnfurZ4CBNcsCwJrKl+EZmCPLZOWzn
 wR/iD4yPkZixkO93tFk2TVlnFlMu9v1ImlsKlWQQEuKDLHHvAxZfdreUX3mPPyDfz69Wz5
 wclkChLIP/42Kn/M4ED7sQQ4DJ0cgue6Ysz0aujSWjokY4RimI3ynBMOYVvkWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cnUO6SLN
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without
 C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 00:19:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit dedbc69022ba0beaf259463ac8082c86776f7e88 was incomplete resuling
> in the following build failure since the addition of the package in
> commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:
> 
> -- Check for working CXX compiler: /usr/bin/c++ - broken
> CMake Error at /home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
>   The C++ compiler
> 
>     "/usr/bin/c++"
> 
>   is not able to compile a simple test program.
> 
>   It fails with the following output:
> 
>     Change Dir: /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp
> 
>     Run Build Command(s):/home/autobuild/make/make -f Makefile cmTC_bfb29/fast && make[1]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
>     /home/autobuild/make/make  -f CMakeFiles/cmTC_bfb29.dir/build.make CMakeFiles/cmTC_bfb29.dir/build
>     make[2]: Entering directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
>     Building CXX object CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o
>     /usr/bin/c++ --sysroot=/home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/host/xtensa-buildroot-linux-uclibc/sysroot   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0  -fcommon -U_FILE_OFFSET_BITS  -g -fPIE -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o -c /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp/testCXXCompiler.cxx
>     c++: error: unrecognized command-line option '-mlongcalls'
>     c++: error: unrecognized command-line option '-mauto-litpools'
>     make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:78: CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1
>     make[2]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
>     make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error 2
>     make[1]: Leaving directory '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp'
> 
>   CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>   lib/msgpack-c/CMakeLists.txt:2 (project)
> 
> While at it, add missing comment about C++ dependency for wasm
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../fluent-bit/0003-fix-build-without-C.patch | 131 ++++++++++++++++++
>  package/fluent-bit/Config.in                  |   4 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 package/fluent-bit/0003-fix-build-without-C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
