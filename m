Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E034E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C6E61025;
	Sat, 30 Sep 2023 20:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C6E61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwKIDFmRJTR3; Sat, 30 Sep 2023 20:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C2F6100C;
	Sat, 30 Sep 2023 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C2F6100C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8CFE1BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED16408A8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ED16408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPh5TF1EfGHs for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:45:14 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48FDE4031D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48FDE4031D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3BEC2B00576;
 Sat, 30 Sep 2023 22:45:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 22:45:05 +0200
Date: Sat, 30 Sep 2023 22:45:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230930204505.GJ2579@scaer>
References: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
 <20230926091158.3767645-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926091158.3767645-3-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696106711;
 bh=o0TfoIFAC+IwHhiOCctNyN3RYrbrQSdYok1DmDxvWfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYRmy4UnTRiJvBBvte2tVLnGOZm83SHz6JrPsZSS5/OUSiUC0rf7x5icDGrT40Swd
 o/3Kc7yZo+Jyq8DGqJMOF7x1S0lHUcUO/gmx784PztghfrdSNyji+g9s5EZuQH7AgR
 DBJ/O7jYewkLMTK74cu4WtBXwrvKmof0rMIuCYDB7PRUbNa2y8EueViINRZcxTsmAi
 th79/c+13R8NM2L2E1OWHduML3Mc+nK9mgQLC30DoJIToItzaBdZa2jAF0UjrxXhkN
 /mfy5ewopWU+utivUL2ArpHDDe7poEn1JTif5QflnPIC3NLrPFNYcliqo+Ml+GzhMI
 KasRT1bDNf2TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aYRmy4Un
Subject: Re: [Buildroot] [PATCH v2 3/4] package/linux-tools: add rtla
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-09-26 11:11 +0200, Giulio Benetti spake thusly:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> The RealTime Linux Analysis tool includes a set of commands that relies
> on the osnoise and timerlat tracers from the ftrace kernel subsystem,
> allowing to analyze the lantency sources coming from the hardware and
> the kernel itself.
> 
> This tool was introduced in v5.17, and relies on libtracefs and
> libtraceevent, although libtraceevent itself is already a dependency for
> libtracefs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: fix install with recent Linux versions]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 451b0eeff5..63e2796e45 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
>  
>  endif
>  
> +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> +	bool "rtla"
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	select BR2_PACKAGE_LIBTRACEFS
> +	help
> +	  Linux 5.17 and later has 2 new tracers, osnoise and timerlat.
> +	  There tracers allow performing latency analysis, for which
> +	  the rtla tool provides wrapper commands to visualize and
> +	  extrace latency traces and reports.

I was a bit puzzled why you mentionned two tracers here, but [...]

[--SNIP--]
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..a14571bb1c
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,36 @@
[--SNIP--]
> +# make rtla_install build and install by default documentation using rst2man
> +# but it's not available in Buildroot and we don't want manual files in target
> +# folder so let's simply install the resulting rtla binary and create symlinks
> +# like Linux does in its tools/tracing/rtla/Makefile
> +define RTLA_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
> +	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
> +	ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise
> +	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat

[...] here you install three symlinks, with hwnoise not mentioned in the
help text above.

In fact,v5.1 indtroduced osnoise and timerlat. hwnoise only arrived in
6.3, with commit 1f428356c38d (rtla: Add hwnoise tool).

So you cna't install the hwnoise symlink unconditionally.

Can you try to finda solution to that, please?

Maybe grep in Makefile to see what to install?

Regards,
Yann E. MORIN.

> +endef
> -- 
> 2.34.1
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
