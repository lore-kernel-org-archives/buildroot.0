Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABC7C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 18:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D1AB409B1;
	Sat,  9 Dec 2023 18:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D1AB409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qm_ZoMRdcteT; Sat,  9 Dec 2023 18:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63CCA40298;
	Sat,  9 Dec 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63CCA40298
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 838471BF397
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 18:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6740640138
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 18:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6740640138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nz4VAtYf1mQm for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 18:48:00 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD66840253
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 18:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD66840253
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A6A313F89C;
 Sat,  9 Dec 2023 19:47:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 19:47:52 +0100
Date: Sat, 9 Dec 2023 19:47:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZXS2WPiQ2xRVnpKz@landeda>
References: <20231209101043.1839458-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231209101043.1839458-1-michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702147676;
 bh=BtkkAzWkNkD00BEqZidiggoz5khA8BqrHnr0Mx8VP0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dnBt3Y+x2bSy0a1p2nuYJWLlJP0SR7FwMsbazOPUd1WFI4fuSXULyNz2f3nIhKoIn
 w3MTzxkPQi/nwKbix0R87F3f6de3W1xhkud3POFdweWKsMc3EOeq8gIDfCTlGLmUKR
 lj35V9ChX51TzCqNpBeMDaoHBps40WZGVp0fDX423HchKRIkaX9MciC+r4QuQIio4g
 PPuhB+zpWu0ZpQ6EP+3KfulEUdMz0gy7PRFhXn7AyvhwzguHCglubDSmxXPmcFUgZ7
 tQmCvauaeoVUUV9Qx/ZDxBGifOgYV+7HD1D1DRbEvHBuzmspXjbl+ruRdEenvx/hyy
 ad3gw4Opjpv/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dnBt3Y+x
Subject: Re: [Buildroot] [PATCH] linux: Add helping kernel gdb functions
 compilation
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2023-12-09 11:10 +0100, Michael Trimarchi spake thusly:
> In order to use all the features of KGDB it's nice to have
> the possibility to source the vmlinux-gdb.py file. The
> generation of this file it's a target of linux kernel.

It is automatically generated when the kernel is configured with
CONFIG_GDB_SCRIPTS, so I think the best approach would be something
along the lines of:

    package/gdb/gdb.mk:

    define HOST_GDB_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_GDB_SCRIPTS)
    endef

See:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile#n1748
and:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile#n1752

Regards,
Yann E. MORIN.

> Add it
> in order to use gdb of vmlinux in output directory including
> tx-* linux script
> 
> gdb-multiarch --tui output/build/<linux dir>/vmlinux
> add-auto-load-safe-path output/build/<linux dir>
> source output/build/<linux dir>/vmlinux-gdb.py
> 
> Linux needs to be compiled with DEBUG_INFO (without restrict
> DEBUG_INFO) and kernel cmdline should be modified to wait
> of kgdb if needed. As example
> 
> kgdboc_earlycon=ns16550a kgdboc=/dev/ttyS2 kgdbwait nokaslr
> 
> The test was done on am62x board over serial line. In order
> to have it running properly we need to compile the agent-proxy
> 
> ./output/host/bin/agent-proxy 4440 4441 0 /dev/ttyUSB0 115200
> 
> gdb can now having the debugging uart available using:
> 
> target remote localhost:4441
> 
> the 4440 is used by the console and 4441 is used to debug
> 
> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  linux/Config.in | 7 +++++++
>  linux/linux.mk  | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ae734c49a0..71ab27bbcb 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -486,6 +486,13 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
>  	  such as "BTF: .tmp_vmlinux.btf: pahole (pahole) is not
>  	  available".
>  
> +config BR2_LINUX_KERNEL_ADD_HOST_GDB_SCRIPTS
> +	bool "Need tools for debugging with kgdb"
> +	help
> +	  Add helping script to be used with gdb and kgdb in order to
> +	  debug linux kernel. Those convinients scripts add some feature
> +	  command to gdb with specific python script
> +
>  # Linux extensions
>  source "linux/Config.ext.in"
>  
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1db5c6046d..e8cdb26793 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -488,6 +488,12 @@ LINUX_APPEND_DTB += ; \
>  endif
>  endif
>  
> +ifeq ($(BR2_LINUX_KERNEL_ADD_HOST_GDB_SCRIPTS),y)
> +define LINUX_BUILD_GDB_SCRIPTS
> +	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) scripts_gdb
> +endef
> +endif
> +
>  # Compilation. We make sure the kernel gets rebuilt when the
>  # configuration has changed. We call the 'all' and
>  # '$(LINUX_TARGET_NAME)' targets separately because calling them in
> @@ -503,6 +509,7 @@ define LINUX_BUILD_CMDS
>  	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
>  	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	$(LINUX_BUILD_DTB)
> +	$(LINUX_BUILD_GDB_SCRIPTS)
>  	$(LINUX_APPEND_DTB)
>  endef
>  
> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
