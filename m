Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857E0C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F36060FB6;
	Tue,  2 Jan 2024 19:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F36060FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Na02B91QN_i2; Tue,  2 Jan 2024 19:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659A860FB4;
	Tue,  2 Jan 2024 19:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659A860FB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AAC11BF31F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33006813CF
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 19:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33006813CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9UjGDRfONb9 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 19:57:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F57181E5A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 19:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F57181E5A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 92A4DB0053D;
 Tue,  2 Jan 2024 20:57:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Jan 2024 20:57:40 +0100
Date: Tue, 2 Jan 2024 20:57:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZRqtHvbEG1i8Fbk@landeda>
References: <20240102194155.1345165-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102194155.1345165-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704225462;
 bh=CW+LZRtdZrrNokFKUftV6IG8LZ8/CkWe4fg7boiTz2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isQJ8OeH30F6aT8J1d/wi6SsySmIsxItCFgnl+XPAWN7NXJ5HgzLFlY5KzqJ+ebX+
 BMFKKOPogp8Gbi1vHzyyvTEjdoUA5hO7x7qK1rhy7LOzRrXps1nm/6zQ4hNHAQKMsg
 J5rFTikU5gukn7uJQiwqhqD1nFk3p87K5V9EXf0S4P+4bzWz/XzEBNfxNyoKdaFTiI
 yaBFOLK4fha9N2m/oXiauGXLaEGRA9CxxPilDza9uvU39S8Gei4imUqoTueOOxwoCA
 +gUkp+S1ho72i2MmoXjpWIR0jIo5P6eWL8EwNvvRsXnFkcGx0BmZnyiZk5Y528OSOy
 VDqXb7vGP30FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=isQJ8OeH
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/docker: enable selinux
 module"
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

On 2024-01-02 20:41 +0100, Fabrice Fontaine spake thusly:
> This reverts commit 245b13a0778ec6ad061555b0b994e7649ef01006 as docker
> selinux module is for docker-engine, not for "a system tray dock for X"
> 
> Moreover, it raises the following build failure:
> 
> Compiling targeted policy.33
> env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/lib:/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/lib" /home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
> policy.conf:1912:ERROR 'attribute container_engine_domain is not declared' at token ';' on line 1912:
> type dockerd_t, container_engine_domain;
> type dockerd_exec_t;

Does that mean we can't do:

    DOCKER_ENGINE_SELINUX_MODULES = docker

either?

> Fixes:
>  - http://autobuild.buildroot.org/results/87d78b6f15875f0fa3e6fc85e352db14ab0383bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker/docker.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/docker/docker.mk b/package/docker/docker.mk
> index 39f7ee4580..4a8c6fcd8d 100644
> --- a/package/docker/docker.mk
> +++ b/package/docker/docker.mk
> @@ -7,7 +7,7 @@
>  DOCKER_VERSION = 1.5
>  DOCKER_SITE = http://icculus.org/openbox/2/docker
>  DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
> -DOCKER_SELINUX_MODULES = docker
> +
>  DOCKER_LICENSE = GPL-2.0+
>  # The 'or later' is specified at the end of the README, so include that one too.
>  DOCKER_LICENSE_FILES = COPYING README
> -- 
> 2.43.0
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
