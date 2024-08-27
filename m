Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A7EC5472D
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 01:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE92F401CE;
	Tue, 27 Aug 2024 01:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crE9LLCSMYzv; Tue, 27 Aug 2024 01:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E44C401FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E44C401FB;
	Tue, 27 Aug 2024 01:12:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 860C91BF2EA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 01:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 737FF81083
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 01:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZmIK3QoWSvm for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 01:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C4108107D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4108107D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C4108107D
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 01:12:12 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:f4e4:88b0:5ddb:7195])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 75B135FFAF;
 Tue, 27 Aug 2024 03:12:09 +0200 (CEST)
Date: Tue, 27 Aug 2024 03:12:09 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <zrtwksdm75ckawhdnq3say7vrkewo32jfucapzsoltuegjxjaj@litc5inbmvuv>
References: <20240817102923.18f56e24@windsurf>
 <20240819221146.9678-4-vjardin@free.fr>
 <16140bfec25b4f4dc569b9fb1b6c1162@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16140bfec25b4f4dc569b9fb1b6c1162@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724721131;
 bh=TiqwPo9pemxOqU//riF/idSLY1p4j4qHvf0MpFh5v2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bt20F9cLm3G9f+Ay/AKyemoiNkVsaPEkW9LxBv2vE4VrPDW5o+sPapJT8QcBxrhW/
 B2a5dIOXAwQ9ZaO4QiHIHjU9h8vPZ7SmCO2EBLDbAZDZHyiy1fJ9FZfXK8Z55d8DX2
 LxnpKAAcJIvObsYjhCsUqu15H1nuhWfEPPq2niNDbsN9sDyhmKpjLBfLY58cBhOPaB
 B9XKy/fRgRxPz6qxOlAIqGGrMUH4Ys9tNyh+GUxJSM8B8ZPdxTZJBRH3QOpKsYMNJ3
 S8RbVgU6tyJSTM5tcIZHO+pIiuMbKDGoNa1DBqA3NBbof4AalZByjY/Mb1aqMKYHDk
 pqewO/Cs5Ei2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Bt20F9cL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dpdk: add 24.03
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sun, Aug 25, 2024 at 11:00:49PM UTC, Julien Olivain wrote:
> Thank you for your patch. I am personally interested to see DPDK entering
> in Buildroot! Please see my comments below.

You welcome and thanks for the thorough review. It has been very
valuable.

> > +Upstream-Status: Inappropriate [ yocto specific to set
> > cpu_instruction_set ]
> 
> This "Upstream-Status:" tag seems to come from Yocto. Could you add
> another "Upstream: fetched from https://..." tag including the URL
> where you picked this patch? This will make tracking easier in future
> package updates.

Done: I have added the Buildroot's `Upstream` tag too. I do not want to
drop the Yocto's one in order to link it from Yocto too.

Down the road, this patch shall be upstreamed on DPDK.org

> I would have expected a definition of BR2_PACKAGE_DPDK_ARCH_SUPPORTS
> here. I know DPDK has some requirements/restrictions on supported
> architectures. For example, version 17.08 raised the minimal x86
> requirement to have SSE4.2. See:
> https://doc.dpdk.org/guides-17.08/rel_notes/release_17_08.html

done v3

> https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/linux_gsg/sys_reqs.rst
>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14

I hope I have captured it properly, I am still into my learning phases
of Buildroot.

> > +	  http://dpdk.org/
> 
> This URL redirects to https://www.dpdk.org/ which seems to be the
> canonical package homepage address. Could you update it?

done v3

> > +DPDK_SITE = http://fast.dpdk.org/rel
> 
> This URL redirects to https. Could you update it to
> https://fast.dpdk.org/rel ?

done v3

> > +DPDK_LICENSE = \
> > +	BSD-3-Clause, \
> > +	BSD-2-Clause,\
> > +	GPL-2.0, \
> > +	ISC, \
> > +	LGPL-2.1, \
> > +	MIT
> 
> This is maybe too many licenses listed here. The DPDK core libraries
> are now mostly BSD-3-Clause. The code base has some specific parts
> under other licenses. Maybe we should identify which license apply to
> which part. For example:
> 
> DPDK_LICENSE = \
>     BSD-3-Clause (core libraries), \
>     MIT (drivers/net/gve/base/*)
> 
> Also, the ISC and BSD-2-Clause is used in a Windows-only abstraction
> layer. See:
> https://github.com/DPDK/dpdk/blob/v24.07/lib/eal/windows/getopt.c
> 
> There is also some Freescale/NXP drivers (dpaa) which are dual
> licensed under (BSD-3-Clause or GPL-2.0), that could be identified.
> 
> Maybe this is a question to Buildroot maintainers: should we list here
> licenses of code which are known to be unused, such as this Windows
> abstraction layer?
> 
> The DPDK components and licenses can be checked in its git repository,
> with the command:
> 
>    git grep -F SPDX-License-Identifier:
> 
> Since DPDK has a somewhat "complex" licensing and history, an
> explanation could be added in the commit log. For example:
> 
>     Notes about license:
> 
>     DPDK is now mainly under the BSD-3-Clause license.
> 
>     One network driver, the Google Virtual Ethernet (GVE) include files
>     under the MIT license. See [2] and [3].
> 
>     DPDK used to include a Kernel NIC Interface (KNI) kernel module in
>     GPL-2.0 license. This module was removed in commit [4]. This commit
>     was first included in version v23.11.
> 
>     There is also few files in "lib/eal/windows" under other licenses
>     (namely BSD-2-Clause, ISC and MIT) but are parts of the Environment
>     Abstraction Library (EAL) for Microsoft Windows OS, not used when
>     compiling for Linux in Buildroot.
> 
>     The list of dpdk license exceptions is maintained at [3].
> 
>     [1] https://www.dpdk.org/
>     [2] https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/nics/gve.rst
>     [3] https://github.com/DPDK/dpdk/blob/v24.07/license/exceptions.txt
>     [4] https://github.com/DPDK/dpdk/commit/f78c100bc87119c6a94130a6689d773afdaa9d98

Thanks for your suggestions, I have adpated them into the commit log and
some additionnal comments included too.

> > +DPDK_LICENSE_FILES = \
> > +	license/README \
> > +	license/bsd-3-clause.txt \
> > +	license/bsd-2-clause.txt \
> > +	license/exceptions.txt \
> > +	license/gpl-2.0.txt \
> > +	license/isc.txt \
> > +	license/lgpl-2.1.txt \
> > +	license/mit.txt \
> 
> Then the license file list should include only the mentioned license
> before. The README and exceptions.txt can be kept.

done v3, Windows related topics are removed, same for the kernel module
ones, they are removed.

> > +DPDK_DEPENDENCIES = \
> > +	host-pkgconf \
> > +	host-python-pyelftools \
> > +	libbsd \
> > +	jansson \
> > +	libpcap \
> > +	zlib \
> 
> libbsd is an optional dependency, see:
> https://github.com/DPDK/dpdk/blob/v24.07/config/meson.build#L266
> other dependencies seems to be optional too. I believe only
> host-python-pyelftools is really a mandatory dependency and all other
> are optional.

done v3, it is per your suggestion.

> While optional dependencies can be added with something like:
> 
> ifeq ($(BR2_PACKAGE_OPTIONAL_DEPENDENCY),y)
> DPDK_CONF_OPTS += -DOPTIONAL_DEPENDENCY=true
> DPDK_DEPENDENCIES += optional-dependency
> else
> DPDK_CONF_OPTS += -DOPTIONAL_DEPENDENCY=false
> endif

Why DPDK_CONF_OPTS ? host-pkgconf is doing it automatically when it gets
called by meson.

> Looking at the Meson file, I think the optional Buildroot package
> dependencies are:
> dtc jansson libarchive libbpf libpcap numactl openssl rdma-core zlib

done v3 except the crypto part (openssl) since I need to include more
crypto cases. Those crypto cases will be for another drop, but not this
serie.

> DPDK_MESON_EXTRA_PROPERTIES = platform='generic'
> 
> Could you check if this platform definition is needed?

Currently, DPDK's meson need a bit of clean up, I keep it for the time
being.

> Finally, DPDK core has a strong requirement on Kernel having
> CONFIG_HUGETLBFS enabled. See:
> https://github.com/DPDK/dpdk/blob/v24.07/doc/guides/linux_gsg/sys_reqs.rst
> 
> So this package could define a Kernel config fixup, to make sure we'll
> end up in a working system image:
> 
> define DPDK_LINUX_CONFIG_FIXUPS
>        $(call KCONFIG_ENABLE_OPT,CONFIG_HUGETLBFS)
> endef

No, I disagree to enforce those kernel options ; they are not mandatory.
Some targets will not required them.

I hope that I did capture all your comments into the v3.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
