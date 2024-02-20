Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C5C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15565606EB;
	Tue, 20 Feb 2024 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yB7NCVzmtDq; Tue, 20 Feb 2024 21:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2085E606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2085E606F5;
	Tue, 20 Feb 2024 21:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D872A1BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BA981F6F
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWsfXMwKbBPg for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:35:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8D2981ED0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D2981ED0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D2981ED0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:35:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 56B8213F838;
 Tue, 20 Feb 2024 22:35:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:35:33 +0100
Date: Tue, 20 Feb 2024 22:35:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdUbJf_FE4FfMaLa@landeda>
References: <20240219215458.187716-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219215458.187716-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708464936;
 bh=9tZsFwJA6x7I+N9qoKPfhKv+WdCp+1h4rCGPsHvzjaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EaVicahPTbAv+bRbLPInFpV41KeubSSluWoyq+DsN8Xvy2wMkLRiFl+ZHjUAp8GJj
 JLyaCpcww3tuFg1A8RHD0bD0nE7T9+QTQYuuo8buuf1AuSBA/GXlejMpwZlKkctcn1
 3M7e1Zium2dstJH1zT69RrRWm6HHMwtRszuJcvlZrlga8v5T7iv/UcTwt4/JXZAuGx
 /40G8fJgKNP1ZXgmducxZI1KZFI6q24yAfo4n0r6GXqBX3Ut0iqYxY2U56tT4dmzoJ
 25N7GG4AEPAF9pBmp7yqV/oIrWFORVL/ERof0Prm+GKuGxM15qorvW0uKlFthI0VqH
 qMr1wbTpu84Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EaVicahP
Subject: Re: [Buildroot] [PATCH 1/1] package dhcpdump: bump to version 1.9
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

Kadambini, All,

On 2024-02-19 13:54 -0800, Kadambini Nema spake thusly:
> - Change the site to a well maintained fork - https://github.com/bbonev/dhcpdump

You could also add a blurb that Fedora 39, at least, also uses that as
an upstream.

> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[--SNIP--]
>  delete mode 100644 package/dhcpdump/0001-use-non-bsd-structures.patch

    $ ./utils/docker-run make check-package
    .checkpackageignore:290: ignored file package/dhcpdump/0001-use-non-bsd-structures.patch is missing

Since the file is no longer present, there is no longer any need to
exclude it from being checked.

> diff --git a/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
> new file mode 100644
> index 0000000000..c48d28c23d
> --- /dev/null
> +++ b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
> @@ -0,0 +1,12 @@
> +Upstream: None

Why? Ideally, we want patches to be submitted upstream, so that they get
applied there, and so we can drop them in the future when we bump to a
future version that carries that patch.

Also, as I explained in my previous review: patches should be
git-formatted (at least when the upstream is git-hosted), with a proper
commit log. Having such a commit log will help make an argument for
upstream to accept the patch, or to sucggest an alternative.

Regards,
Yann E. MORIN.

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
