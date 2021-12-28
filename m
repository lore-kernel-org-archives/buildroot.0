Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC144088A;
	Tue, 28 Dec 2021 21:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_nxMbILB6YG; Tue, 28 Dec 2021 21:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0402340881;
	Tue, 28 Dec 2021 21:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAB101BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B992A8198A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NF2S6CS0V3uh for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:49:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B53818CA
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:49:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:25ef:2aa8:94fa:832d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 480A313F854;
 Tue, 28 Dec 2021 22:49:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640728186;
 bh=reSXNTZIkjvKAvPAyWyoZoG9cIL5bIRAna0WXYuMR+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kT5ZlnWqjzj06LZXalZ+cjDHimvfm+5u4AhfjsIhmwB4VbZ+MzneUc3MoEVXuBVgh
 Uab0WjZDl9Z+BlsC4lrYus6XKMtyo6yboUYLPYk8RPtTJgrcV2ZUqpamO93eXvmaKN
 UnMDw93ZjcTl8k0YgkPQ3tofS03d6FCqqAhpGnbMrDTMzFQ63wBxm73GSSnQFNpv6e
 JIH2oinYbaVP2Sy2eDrLTYxN9YPBSp1nO8al1lHPX4HLdYTxGqKLkfcLqImYBk44wG
 ReXKRTwolPxsQl1yEbk5HXjSyIqysq6529T+LM/GWnLXY8c/wCtEn9u6oj+JHe0txh
 alKsRDo+6QBFw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Dec 2021 22:49:35 +0100
Date: Tue, 28 Dec 2021 22:49:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211228214935.GC3390456@scaer>
References: <20211219070332.2642029-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211219070332.2642029-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/erlang-rebar: fix linking failure
 on shared library
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2021-12-19 08:03 +0100, Giulio Benetti spake thusly:
> Add patch to fix linking failure while creating shared library. As
> explained in the patch itself, there is no specific variable for when we
> link a shared library and rebar itself rely on the default LDFLAGS. Since
> by default every CFLAGS is filled with -fPIC we need to make sure that
> every LDFLAGS is the same, so not having any other *_LDFLAGS variable to
> fille with -fPIC let's add it to the main LDFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Even though I was not very happy with that solution, there is really no
better way, so: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ompiler-add-fPIC-to-LDFLAGS-by-defau.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
> 
> diff --git a/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
> new file mode 100644
> index 0000000000..a9c1670a1f
> --- /dev/null
> +++ b/package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch
> @@ -0,0 +1,35 @@
> +From 7f54d48ee5db037778ead310e0b8278f3fe70b41 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 19 Dec 2021 07:52:55 +0100
> +Subject: [PATCH] src/rebar_port_compiler: add -fPIC to LDFLAGS by default
> +
> +Since both DRV_CFLAGS and EXE_CFLAGS list -fPIC we need also the LDFLAGS
> +to follow them. Unfortunately adding -fPIC only to DRV_LDFLAGS and
> +EXE_LDFLAGS is not sufficient, since when linking as a library(.so) it
> +doesn't take into account those variables. Since -fPIC is needed by default
> +by any kind of linking, let's add it to the general -fPIC. Rebar seems to
> +link libraries without taking into account any variable listed in:
> +src/rebar_port_compiler.erl
> +this after testing and tracing for every variable.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + src/rebar_port_compiler.erl | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/rebar_port_compiler.erl b/src/rebar_port_compiler.erl
> +index 9679c80..bd08b21 100644
> +--- a/src/rebar_port_compiler.erl
> ++++ b/src/rebar_port_compiler.erl
> +@@ -645,6 +645,8 @@ default_env() ->
> +      {"OBJCOPY", get_tool(Arch, "objcopy", "objcopy")},
> +      {"OBJDUMP", get_tool(Arch, "objdump", "objdump")},
> + 
> ++     {"LDFLAGS", "-fPIC $LDFLAGS"},
> ++
> +      {"DRV_CXX_TEMPLATE",
> +       "$CXX -c $CXXFLAGS $DRV_CFLAGS $PORT_IN_FILES -o $PORT_OUT_FILE"},
> +      {"DRV_CC_TEMPLATE",
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
