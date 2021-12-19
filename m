Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 08:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B256340148;
	Sun, 19 Dec 2021 08:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8S4dd6zHpAZ0; Sun, 19 Dec 2021 08:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5E2B4016C;
	Sun, 19 Dec 2021 08:08:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC7D1BF574
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B2F960B3D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfjq1JSrQR_6 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 08:08:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6DA660AB0
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:08:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C80295FFAA;
 Sun, 19 Dec 2021 09:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639901308;
 bh=zyWX6wbLfPAAIby7gi9Y8WdVWH3319ly+64P5l+nxfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Orr24IROz8/eAYlUAq01hTUfMyqcRmGo8NwUcxNfeqwSS4em6FXO+073NvFp2lTuC
 VYmYFd0nbK2FkdyP9FyudxKFxI7KUmi/PfOCcZj8PouU/xMK9uixShB5ciWdYXrbPY
 z3/0kHv9w0Cs1uKMu2KR3jR178UYtKL9FGQ0dn1zOXs9LKealiO8OlI0rm6uZXcClS
 ioDcg8dYRezSh+acvMXaB1NNvVjYfM96q+L7fT7YM6yVsoB1i/yL9igHd0Zgvvdu5C
 NA4tx1pLALMrUF85DMFhA1ViTloF/sCSa6Nve6sTPEZ6tLRwSFNy1A9olmhn6H8UUc
 nnBuiQ2evWh6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Dec 2021 09:08:17 +0100
Date: Sun, 19 Dec 2021 09:08:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211219080817.GA2603@scaer>
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>,
 Will Newton <will.newton@gmail.com>,
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

OK, I think I got the hang of it. But see below...

> Fixes:
> http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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

Don't we want to match EXE_CFLAGS and DRV_CFLAGS, and use DRV_LDFLAGS
and EXE_LDFLAGS instwead of the generic LDFLAGS? This way, LDFLAGS is
left alone, like are CFLAGS and CXXFLAGS, and the internal variables
are used.

EXE_LDFLAGS and DRV_LDFLAGS are already defined, lines 665 and 667.

Regards,
Yann E. MORIN.

> +      {"DRV_CXX_TEMPLATE",
> +       "$CXX -c $CXXFLAGS $DRV_CFLAGS $PORT_IN_FILES -o $PORT_OUT_FILE"},
> +      {"DRV_CC_TEMPLATE",
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 

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
