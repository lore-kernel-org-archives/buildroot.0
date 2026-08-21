Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FB3C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 21:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7608130E;
	Fri, 21 Aug 2026 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81iQQ995ksH5; Fri, 21 Aug 2026 21:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787348311;
	bh=wIhvmGQsxlrmb2Ni2fqVPngtMzhf//B/IM2NPIr85vk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZtNpNVsvt1WyHdpmp8u9wANJj/Gglm4R2Sv+kdICshxkMxLLxKek4LcaVaSlPEAr0
	 LRdMets1Q5gRhiVBqstAgxXiixInG6YY+eD6kI7xGrZ77BMQBfDQWpy6+bpilfFQwI
	 wXLBUsp2+MfOc3AC0Yz5pyen/5NNdSRwKnhMsgpZhMM1rel2Na/1nY3D6RkxZjNiT8
	 +oaybb3xUclILnzgRBlKP/cvWLKvXgyzkf7K8vsmvGD9V5mfi3Z4OYRLd28AFGktVI
	 w5AISsPF1IRJQkDScu4YWqS66Z2y5QA0EwrzNb7Pa967dJZ1gLgxmi4vM0XxxI7h+5
	 VJGMEcqiaaQQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D7D98124A;
	Fri, 21 Aug 2026 21:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7E093F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B88D60AB2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lcrd_8U-z8v6 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 21:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DECB60A8A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:38:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 29A5D5FFAA;
 Fri, 21 Aug 2026 23:38:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 23:38:22 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 23:38:22 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260821-heaptrack-v4-1-01f232abcdcd@bootlin.com>
References: <20260821-heaptrack-v4-1-01f232abcdcd@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <41a346904f1a83a6e8d99ecb5f6bc20c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v4] package/heaptrack: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Thanks for the update.

On 21/08/2026 21:51, Luca Ceresoli via buildroot wrote:
> Add heaptrack, a memory allocation tracer toolkit.
> 
> This implementation builds all the command line components, not the
> heaptrack_gui graphical visualization program.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
[...]
> diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
> new file mode 100644
> index 000000000000..808193a73f68
> --- /dev/null
> +++ b/package/heaptrack/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_HEAPTRACK
> +	bool "heaptrack"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
> +	depends on BR2_USE_WCHAR # boost, elfutils
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # 
> boost-filesystem
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind

There is one last build failure with test-pkg:
https://gitlab.com/jolivain/buildroot/-/jobs/16041509274

It seems that heaptrack is using std::filesystem:
https://invent.kde.org/sdk/heaptrack/-/blob/master/src/interpret/heaptrack_interpret.cpp?ref_type=heads#L15

which is a C++17 feature which was fully implemented in gcc 8.1:
https://gcc.gnu.org/gcc-8/changes.html#libstdcxx

So I believe this gcc version should be raised at gcc >= 8.

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem

The comment should also be updated below.

> +	depends on !BR2_STATIC_LIBS # libunwind, elfutils
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no dlmopen() support
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_IOSTREAMS
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	# For heaptrack_print
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_LIBUNWIND
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Heaptrack traces all memory allocations and annotates these
> +	  events with stack traces. Dedicated analysis tools then allow
> +	  you to interpret the heap memory profile to find hotspots,
> +	  memory leaks, allocation hotspots and temporary allocations.
> +
> +	  Zstandard offers better (de)compression performance compared
> +	  with gzip/zlib, making heaptrack faster and datafiles smaller,
> +	  so enabling BR2_PACKAGE_ZSTD is recommended.
> +
> +	  https://apps.kde.org/heaptrack/
> +
> +comment "heaptrack needs a glibc or musl toolchain w/ C++, threads, 
> wchar, gcc >= 4.9, dynamic library"

"needs gcc >= 8"

> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_USE_WCHAR \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \

		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \

> +		|| BR2_STATIC_LIBS \
> +		|| BR2_TOOLCHAIN_USES_UCLIBC
[...]

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
