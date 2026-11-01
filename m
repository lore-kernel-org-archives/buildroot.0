Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE7B606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MiUGXEJB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7208D80D7C;
	Sun,  1 Nov 2026 22:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LxhfjwugLIT; Sun,  1 Nov 2026 22:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5333780D7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572018;
	b=Pm0aEjCv2K/Hv5UgCg7b3TXn/S+/0wgRJ5DG9v5IXg8azDsAAUWbWdNXqdWgFU/rU1Sr
	 sgEoItlasPS33Yyv6U1PI0PUa7BFXfb26OzU8B98vXbBSh2zSffVF+u3OnqN0TMbl+CYI
	 h0dsuZL9m5C/cw8eUfoiyBwam1TpW3qTpy84obV4jMNytLXUtpJ4Y665ALyDtb6uC6Z2b
	 i9wsdn94WlSWBbegLHUkfl8HA8/frIVfU2koX9Duj6VhuP2cpx+w2dv5cOwF6npFxbX2l
	 eWm//poG+8W8TYL8wbjzwKZV9jy0fdgzUhxmue8CBoKNrzpzKj2qvXDtE41b1XsceNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572018;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eyk1eiQfYh4t+NwbtQrpGbN8CK+SJhs9zYhN+3PaCQA=;
	b=koDeQ1zMosd6kjpwphPXIAGqUuuVw1glTod/Uo/yo5cPU0tPIUye1t0AC3+03qy5ZyMR
	 JrQKlEg1XAlieBCNg2SviGQWGoSC+bnqqclbdq3OgMsJ3tmkAM+jnquxo7gSgZHYVDll7
	 u/RPLxGIdlaA5HZIcpEySGTQxwbz6V6HW3t646RdLqrAtieiUH+6kv7AlAi/Y2p3EgKG2
	 95LordFu8Z152fZIqOLI7aIuryWuxpnzt9jr56vyAfcpm7Xy/e7/prz7okTNLNJRBbt6z
	 07dy2PENHoEjmmn9WUKHY0/bjmIV2z2K0wsDh/AvWi3KRQ8jpGbwBpB/wLx7lHt9alw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572018;
	bh=eyk1eiQfYh4t+NwbtQrpGbN8CK+SJhs9zYhN+3PaCQA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MiUGXEJBe1bf/v48q2mHq8Yl4vfgn8AQp9hmWa8pnX0ne8TsnZTcIceZLz17mOOsZ
	 28e3IrcqAucRzv347dnkCEV6BBWLvIm1pqtWpIck7EVawTEO3BdU4KxGGWc9fXvc8x
	 Ofvs2WK9yHrmH8RV3AYL8Ltwnu0PjPDLJc0n6HiYGTPUg6YnGctoVOlp5QR6dmqVUs
	 +qcI5aRas5P3WVyLM7ml3yLu71GgJko7Skp/YRC+zabAHa6NHUSD8IiASN/K1MpuGo
	 nnDA7jsz2YICwNimXXYId6m8O4hN8jvq+a/VPwbya13wPKXLRvIXzqM0GeApKt89gw
	 NYZib1CB8tqcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5333780D7D;
	Sun,  1 Nov 2026 22:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36A7F323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E8C40070
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzneVjjLyIEO for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7AA904004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572015;
 b=jT1HtNs+CHzsRkkHZLpOp/uKGGFTeXzvA1iikg5Y5XIFESdRmo/zc7i6oJFlDjXH2tKC
 ucABekKSQF0b7Jqy8LdW0ZxW9HzXmVsyIc3DSeTLo5GgV/VuN19to6gHGSR6s1g1AgMQ4
 k4VzF4lhCEsF488JH0c55i/ZRQJtbE4f2glfG+H+dwkPX5kUkhAuwSYDywXFlFm4Ugj/1
 tcV0JJ5yds2U1HKgwKfixMfvj22XiJHtfBSICVr2jIOlEP8T9TnFqx4oegsZvurac1Kp0
 fBd4ywaqnDDRIqYiaBOhiwk1DXqoUV82ojxMcvdOcc7/j0YgNq4Qi5aYgQEklvdSZsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572015;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=hUoJ23dl/qs9luVuLyC3Xlma73PcVzv45NZZyRUeRCc=;
 b=BJwfOqztU4lpF/ABGmtb/0bFDQBmAhl7eVxVEWVGc0i4kvCqPM74E1/SLSTkd+JcCDVG
 PrYvkO3znLG1X53YEoKIK+RrCQ6TqGThEVR12TSBobnYC2mpUNw/YxJ/fkZZNpstYkztz
 vScf7b0+077f0skAc1vopXwY3jMNUFvhotQpzP5C7BkL8pLES7M0YwfnQmURHPrXmq1NR
 jf9WjT27bodb0NcD7K8gjfCBfWJeY+B51zCzHrnEMnEOE2P/o1NkOaIcXyr4i8oZj1ROd
 Sg7fR7ap9TjdeRX9owucMWsb+Pxm3O2wG0LzKkLWE3k+pgL05uLK2VnSXOMdM0l8jyw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rAjE7w9u; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AA904004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:26:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 019F04E413B0;
 Sun,  1 Nov 2026 22:26:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B526060750;
 Sun,  1 Nov 2026 22:26:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 059E81032855F; Sun,  1 Nov 2026 23:26:47 +0100 (CET)
Date: Sun, 1 Nov 2026 23:26:47 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <aue8NJzGMSYw0iLM@windsurf>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261030152434.3738285-4-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030152434.3738285-4-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/9] package/falcosecurity-libs: bump to
 version 0.21.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Angelo,

On Fri, Oct 30, 2026 at 04:24:29PM +0100, Angelo Compagnucci wrote:
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 038a9734aa..3c96bda73e 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -1,16 +1,15 @@
>  config BR2_PACKAGE_SYSDIG
>  	bool "sysdig"
> -	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
> -	depends on BR2_USE_WCHAR # falcosecurity-libs -> libabseil-cpp
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
> +	depends on BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # falcosecurity-libs, ncurses
>  	depends on BR2_LINUX_KERNEL # falcosecurity-libs
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # falcosecurity-libs -> grpc -> libabseil-cpp
> +	depends on BR2_INSTALL_LIBSTDCPP # falcosecurity-libs
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # falcosecurity-libs
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
>  	depends on !BR2_STATIC_LIBS # falcosecurity-libs
> -	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
> -	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # falcosecurity-libs
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # falcosecurity-libs
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # falcosecurity-libs
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
> +	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # chisels

This line should have been part of the next patch technically, because
it's the version bump of sysdig that requires this Lua 5.1.

I nevertheless wanted to apply, but unfortunately, it fails to build
for me:

ppm_events.c: In function 'ppm_copy_from_user':
ppm_events.c:91:54: error: macro 'access_ok' passed 3 arguments, but takes just 2
   91 |         if(likely(ppm_access_ok(VERIFY_READ, from, n)))
      |                                                      ^
In file included from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/uaccess.h:12,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/sched/task.h:13,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/sched/signal.h:10,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/rcuwait.h:6,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/percpu-rwsem.h:7,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/fs.h:34,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/compat.h:17,
                 from ppm_events.c:13:
/home/thomas/projets/buildroot/output/build/linux-6.18.60/arch/riscv/include/asm/uaccess.h:42:9: note: macro 'access_ok' defined here
   42 | #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
      |         ^~~~~~~~~
In file included from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/asm-generic/div64.h:27,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/arch/riscv/include/generated/asm/div64.h:1,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/math.h:6,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/math64.h:6,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/time.h:6,
                 from /home/thomas/projets/buildroot/output/build/linux-6.18.60/include/linux/compat.h:10:

I initially tried with Linux 7.3, thought it was too new, so tried
with Linux 6.18, which is the latest LTS. Is that also too new?

Defconfig tested:

BR2_riscv=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_LATEST_6_18=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SYSDIG=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_LUA_5_1=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
