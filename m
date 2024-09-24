Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C260CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 14:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E4D60674;
	Tue, 24 Sep 2024 14:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CMGC9RTplxX; Tue, 24 Sep 2024 14:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449056067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449056067C;
	Tue, 24 Sep 2024 14:53:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6005E1BF861
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 14:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BB84404B3
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 14:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yon5G5CEaYLJ for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 14:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0910403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0910403C9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0910403C9
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 14:53:27 +0000 (UTC)
Received: from L25025.local (unknown [173.242.185.50])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 503E719F73B;
 Tue, 24 Sep 2024 16:53:19 +0200 (CEST)
Date: Tue, 24 Sep 2024 16:53:16 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <o24zxu3iac7zacfdlxdzhpnjuixozkrf35tznhuodxxkbtv737@hxe2jgbd7d37>
References: <ZudgGuhHgwI1VLio@landeda> <20240923172005.39928-1-vjardin@free.fr>
 <20240923172005.39928-2-vjardin@free.fr>
 <4e1a9b3a-5e0f-4dd4-a6b4-da4a1459648d@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e1a9b3a-5e0f-4dd4-a6b4-da4a1459648d@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727189604;
 bh=dHA2b3TG7NOvgfaicL0jTlNYLlMrY4bACt0FoQdN1iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkJ0kRnPYp3JDw2J7pFIOsuCgVfcczkllIrW3s9CVLUIABi2lihANjAfD8xfmUwO+
 p25bASgpjGSQSlwM6OQvvQ6hqqqG+XDCEhx7Qi69XFpOCahxm0rq9IFTrLAC08cieJ
 IQ+NyLheqPHOu5hIKbGBUjdHcwQiIJ/+zxxXtHl8/blC26uJefW6B8DU3GRWz3q8ng
 C2kt8QG2N45azp7PGtxCvqfuMpRj/GiZVrmQusGUREccgJNpUPCeqgP6nsq+vRayY8
 0pXA0B5U9xlH1Fz8/98W7PZK2Fy9GC7+xxWagAXKPj4tqL0gKu3kxHJDaDio+fVxF9
 0/wD3ihyO3QUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rkJ0kRnP
Subject: Re: [Buildroot] [PATCH v7 1/1] package/dpdk: add 24.07
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
Cc: ju.o@free.fr, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks Arnout, see enclosed.

I have included your comments into a v8 that will follow. They help
to optimize the scope of the licenses.

On Mon, Sep 23, 2024 at 09:10:46PM UTC, Arnout Vandecappelle wrote:
> > +--- a/config/meson.build
> > ++++ b/config/meson.build
> > +@@ -105,7 +105,7 @@ platform = get_option('platform')
> > +
> > + # set the cpu_instruction_set and cflags for it
> > + if meson.is_cross_build()
> 
>  Is this patch actually needed? I thought that the fact that we supply a
> cross_compilation.conf file was enough to tell meson that we're
> cross-compiling.

yes, it is until the DPDK's mesons will be fixed. It'll be another
topic. But for the timebeing, there is no b plan. It was already
discussed with Julien on September 14th:

  "it can still be useful here in Buildroot, as it
  fixes the Aarch64 cross compilation."

> > +-    cpu_instruction_set = host_machine.cpu()
> 
>  Oh, hang on, isn't this an upstream bug? If we're cross-compiling we
> shouldn't be using host_machine, right?

yes.

> > diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
> > new file mode 100644
> > index 0000000000..ebb875216b
> > --- /dev/null
> > +++ b/package/dpdk/Config.in
> > @@ -0,0 +1,55 @@
> > +config BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> > +	bool
> > +	# DPDK can be used for the following little endian architecture
> > +	default y if BR2_aarch64
> > +	# DPDK requires SSE4.2 for x86_64 since v17.08
> > +	default y if BR2_x86_64 && BR2_X86_CPU_HAS_SSE42
> > +
> > +config BR2_PACKAGE_DPDK
> > +	bool "dpdk"
> > +	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # DPDK design
> > +	depends on BR2_USE_MMU # pthread() memory mappings
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
> > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> 
>  Just above it depends on glibc, so this select seems redundant?

Right, it can be dropped. Non glibc setup will be another thread for
DPDK.

> > +	select BR2_PACKAGE_HOST_PYTHON3 # Ensure a Python3 installation on the host
> 
>  Comment is redundant. It would be useful to say # host-python-pyelftools

thanks for this comment, included for the v8

> > +DPDK_LICENSE = \
> > +	BSD-2-Clause, \
> > +	BSD-3-Clause, \
> > +	BSD=-3-Clause OR GPL-2.0, \
> > +	BSD=-3-Clause OR LGPL-2.1, \
> > +	ISC, \
> > +	MIT
> 
>  According to the commit message, the BSD-2-Clause, ISC, and MIT licenses
> are only in code that is not actually used. Up to now, we've always dropped
> such licenses in Buildroot's _LICENSE tag (and also from the hash file).

OK, I get the point.

So BSD-2-Claude, ISC is for Windows / getopt -> removed

MIT: it is required for the google's Virtual NIC (gve).

> > +# All the userland files of DPDK have dual licences BSD or GPL/LGPL
> > +# Since the Linux kernel modules had been removed from the DPDK, there
> > +# is no GPL only code into the DPDK anymore.
> > +# The usage of DPDK with Buildroot is for userland only, it means
> > +# that for the dual licenced files, BSD clause is used but not the
> > +# following ones:
> 
>  That is not true (unless there's a specific text that says that GPL only
> applies to the kernel module build). It's normally up to the consumer to
> decide if they choose the BSD or GPL license. If this is not the case, the
> OR specifier in _LICENSE is incorrect.

Following your former comments, since Buildroot is not used to build the
kernel modules of DPDK, let's drop the GPL references. Done into v8

See the comments from the contribute guidelines of the DPDK:

  The DPDK uses the Open Source BSD-3-Clause license for the core libraries and
  drivers. The kernel components are GPL-2.0 licensed.

>  The hash file contains additional license files - please only contain in
> the hash file what we also have in _LICENSE_FILES.

done

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
