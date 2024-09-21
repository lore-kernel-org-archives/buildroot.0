Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2274CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C2D608A1;
	Sat, 21 Sep 2024 21:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oi-1hBa53Qxi; Sat, 21 Sep 2024 21:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960586089A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960586089A;
	Sat, 21 Sep 2024 21:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2843F1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2561381583
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IitIotNOAq2f for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:11:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7283C81586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7283C81586
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7283C81586
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:11:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 78E905FF3F;
 Sat, 21 Sep 2024 23:11:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 23:11:04 +0200
Date: Sat, 21 Sep 2024 23:11:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <Zu82aDpOulwxkkfe@landeda>
References: <01e6af64-ac5b-464d-aa50-7e950f75b6f0@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01e6af64-ac5b-464d-aa50-7e950f75b6f0@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726953067;
 bh=d6fXGanp5ASvbyMVxqVcw6hCVpNZiw9cwr/FeH5UgHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYb8VHWT953uo9mm+6656Gl5XpGREfPC3dwiMdkugIHCk7KBD3qWl3ILEEutn5IgQ
 9S+C/fPtUmMxOjUBTqD+oAE9UJJR0sTws921WgAOXoHnWFlNas3cpjIJojWMbXaaaj
 7BonCI6LM9LJXmNA251zsGykEorf5+GwlLB0FjGBQRIx9KWnOocf7hrejpZszYlLDv
 ylWJEQI3OLttlFp6CDxrTaDRPi9fBuV7Yy54Luh+xI5A6TWt4sA6gvCsJNSsqtmBEY
 h/xs2TooI8P5iPttZLfr0iTU3R4AzhMkeHKqFldKuEOkPggdBLE/OY/E+3El1KJm7d
 XKe9k5PSwrbew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NYb8VHWT
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/configure.adoc: fix
 location of Busybox inittab
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

Edgar, All,

On 2024-09-20 19:39 +0200, Edgar Bonet spake thusly:
> Commit 89d39fc7a392 "initscripts: new package" moved the inittab
> packaged for Busybox init from system/skeleton/etc to package/busybox.

Quite the archeology you did there! :-)

> The manual, however, still points to the old location, so let's fix it.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/configure.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/configure.adoc b/docs/manual/configure.adoc
> index d27cdf3eb9..e0358aa0f9 100644
> --- a/docs/manual/configure.adoc
> +++ b/docs/manual/configure.adoc
> @@ -399,7 +399,7 @@ can be chosen from +System configuration+, +Init system+:
>     BusyBox +inittab+ syntax is special: do not use a random +inittab+
>     documentation from the Internet to learn about BusyBox
>     +inittab+). The default +inittab+ in Buildroot is stored in
> -   +system/skeleton/etc/inittab+. Apart from mounting a few important
> +   +package/busybox/inittab+. Apart from mounting a few important
>     filesystems, the main job the default inittab does is to start the
>     +/etc/init.d/rcS+ shell script, and start a +getty+ program (which
>     provides a login prompt).
> -- 
> 2.34.1
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
