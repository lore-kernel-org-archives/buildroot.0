Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F00C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:41:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B0960FED
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95B0960FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 646034039F;
	Sun, 17 Oct 2021 07:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XY4zs43LkKQm; Sun, 17 Oct 2021 07:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEA94024F;
	Sun, 17 Oct 2021 07:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7982B1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D31401B2
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlGVkbr-1XvK for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7A9A40172
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:41:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6052:794b:b800:c2f1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 25938200390;
 Sun, 17 Oct 2021 09:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634456505;
 bh=WTzjS/ClXFJnClStkWPsGaseF55xoXtpAILz0ayjb+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e8bHeEoAz/GyhXVsb+AwUuKMB9VafVP+gYKbtNul5/s0dbqD3Q5aYqJ324aRp5fmp
 D9pNj2Xb6VYVdxo89FE3RSQERdwY3u1wb14UnubRAPvaegDZ52Q878rtThHRXrUNZ7
 nLYLNgJdi1TdU6kIqGpXfgq/u42mFcxNVnfq/beDq/LhZ0w4Gdelr0Show5vE2tXG4
 rVdyOv6If6wYVYrgq6fDFKmba0ALtRAXnSp0EPyrE3/E0H1P7bolnvDeXVo4BYvg/0
 T8Jl0g88UMfUpJc3ct9ONqCUMN8LwrLWn7ecAQJEioSuV8jnGz7uMbzaNNklprkK7g
 F0U6TS7opJ5EQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 09:41:40 +0200
Date: Sun, 17 Oct 2021 09:41:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211017074140.GB2400@scaer>
References: <20211016135539.3140678-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211016135539.3140678-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: fix build without C++
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-16 15:55 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without C++ raised since bump to version
> 0.11.0 in commit c3a907a770b88529ea5a93c77cf001096799c556:
> 
> ../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
> The following exception(s) were encountered:
> Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0003-meson.build-make-C-optional.patch    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/usbredir/0003-meson.build-make-C-optional.patch
> 
> diff --git a/package/usbredir/0003-meson.build-make-C-optional.patch b/package/usbredir/0003-meson.build-make-C-optional.patch
> new file mode 100644
> index 0000000000..fe1ed3f698
> --- /dev/null
> +++ b/package/usbredir/0003-meson.build-make-C-optional.patch
> @@ -0,0 +1,39 @@
> +From 55fc307d23d657b52433d1c8508467d0589754d5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 16 Oct 2021 15:45:57 +0200
> +Subject: [PATCH] meson.build: make C++ optional
> +
> +Remove cpp from meson project statement to make C++ optional and avoid
> +the following build failure when the toolchain does not provide a C++
> +compiler:
> +
> +../output-1/build/usbredir-0.11.0/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++']]
> +The following exception(s) were encountered:
> +Running "/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++ --version" gave "[Errno 2] No such file or directory: '/home/buildroot/autobuild/instance-3/output-1/host/bin/arm-linux-g++'"
> +
> +Indeed C++ is only required for fuzzing which is already handled by
> +meson through add_languages('cpp', required: true)
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/eca1d8a2b73a769354ab1d24c7996be30f152138
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/55]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 49dbce4..ca19f22 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,4 +1,4 @@
> +-project('usbredir', 'c', 'cpp',
> ++project('usbredir', 'c',
> +     version: '0.11.0',
> +     license: 'LGPLv2.1+',
> +     meson_version : '>= 0.53',
> +-- 
> +2.33.0
> +
> -- 
> 2.33.0
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
