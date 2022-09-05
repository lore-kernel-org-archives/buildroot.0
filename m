Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B15ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 20:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1104091E;
	Mon,  5 Sep 2022 20:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1104091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxRSMB7Uk2kp; Mon,  5 Sep 2022 20:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63255403ED;
	Mon,  5 Sep 2022 20:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63255403ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EC341BF337
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A4B361005
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4B361005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMoYVtCsdl2F for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 20:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1128F60BDF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1128F60BDF
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 20:17:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F3B6DB005A4;
 Mon,  5 Sep 2022 22:17:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 22:17:27 +0200
Date: Mon, 5 Sep 2022 22:17:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20220905201727.GJ1490660@scaer>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904205702.1488199-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662409051;
 bh=NtDNXjbUeQF2YkTeYZWddThI1Cbhh7bGfPfMJ9gbwTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llcQN+v2P0ZueXxuVWD8wpab81TgCANYevlbJigslfXWRqCQhaBRKB/3mw4mppHPg
 7/uk7xj9rmV4Id1PD+nsOCb/ViD7HC6I8NkqPqn6VWjsLrBRwkLWG+35UI+HHRLppy
 3Tn438FN+OeTf2d6VQC+r2jmHZs0o2gfTLK2J7fO5nBIQHKfBzQcAHh07fN+m5Ng+z
 3Y0lqDch4hK8jlBibXW0MX6AptxmGtwcHuFaNWC/zdMUdhKzbIGwqgDoN2Ju3vA/d1
 FcI/Kpl5HbY746HAzlhCJQvw/8Rh+TwV8Rs9Y1JfYivhedQGNgsH/Sfl+ZJzxcUIvw
 +RP4XknMvGffQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=llcQN+v2
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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

Sergey, All,

On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
> Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
> jevents.py")

00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
bleeding edge technology, there is no issue. So, paying the price of a
host-pytohn3 build just for release-candidate kernels is a bit too much
in my opinion.

So, I added a config knob to drive this, like we have for host-openssl
and a few other host programs for building the kernel.

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

> switched to auto-generation of arch-specific PMU events
> using python script. Now custom PMU events for different platforms of
> the selected target architecture are not embedded into perf binary if
> an appropriate host python interpreter is not present. In practice it
> means that perf is successfully built, but 'perf list pmu' will show
> no custom events on a target platform even if those events are supported
> and properly defined in tools/perf/pmu-events/arch/<target arch>
> directory in the kernel source tree.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 057c6f80e7..44c1bbdf83 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -6,7 +6,7 @@
>  
>  LINUX_TOOLS += perf
>  
> -PERF_DEPENDENCIES = host-flex host-bison
> +PERF_DEPENDENCIES = host-flex host-bison host-python3
>  
>  ifeq ($(NORMALIZED_ARCH),x86_64)
>  PERF_ARCH=x86
> -- 
> 2.37.1
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
