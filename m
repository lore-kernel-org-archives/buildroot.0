Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F9AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 22:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4F84634B;
	Sat, 28 Oct 2023 22:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4F84634B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0uQVXpCi99S; Sat, 28 Oct 2023 22:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2083245F30;
	Sat, 28 Oct 2023 22:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2083245F30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC781BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 860A96F66A
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860A96F66A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOWniblqLcTd for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 22:13:14 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B31360F85
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 22:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B31360F85
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C0AD82003C1;
 Sun, 29 Oct 2023 00:13:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 00:13:10 +0200
Date: Sun, 29 Oct 2023 00:13:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maciej Grela <enki@fsck.pl>
Message-ID: <20231028221310.GE687180@scaer>
References: <20231027091526.2224829-1-enki@fsck.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027091526.2224829-1-enki@fsck.pl>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698531192;
 bh=E2NmZ4XsnLknDG31FnAp2HQQ6XwkKRZcWo1vvIWsgR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jQlcJMilkyGuoQOobkaT7BbBDlO96OGEo9CEquCKXdgThARkGXT585G+Pkic9h6MB
 BIU3iHyqSOCEJNCSjzflYw2oDgcKHYBg7s1EBBh6Ys2sQEU19P7yw5RAkxSnZEctz+
 8GZjlj6zarXIDEP6H6AwwJm0sLDkrGw3idBXLEvDXXX1b/XZ9aWdpZgQojnoGZfWql
 dYNKxw+UWicSrvZJa8/ek9WleIBdHd3FSh7gPkbwyYvZwaVXrNoV7J5zHulvQaFzKF
 dvwzUS8iqdW2infPnemoDD/GZ0kMXZguufFvaSvdCF56DzLT2QCmUbVbckcbC/wLfx
 DpWZY5LkhzG+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jQlcJMil
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spirv-tools: fix build issue
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

Maciej, All,

On 2023-10-27 11:15 +0200, Maciej Grela spake thusly:
> spirv-tools requires a C++ toolchain with shared libs, add flag dependency and comment.

Fabrice had already sent a patch adding C++ requirement, and since it
also was more strict in requiring C++17, I applied his patch.

> Fixes: http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff
> Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
> Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f
> Fixes: http://autobuild.buildroot.net/results/40e8f50eb7e82ca42f84fa5f4336cefb51204a28
> Fixes: http://autobuild.buildroot.net/results/3c3be2c454863709d0db896bafbe11cd9df092a3
> Fixes: http://autobuild.buildroot.net/results/8df8de1aeaf1317f6ba43f6752502da2eedcdea1
> Fixes: http://autobuild.buildroot.net/results/ea2c1f97e82efcd867c79f05ab02f5f099140379
> Fixes: http://autobuild.buildroot.net/results/fa4e39d1e78e885d20851201ed8a6fcf9d48d7d6
> Fixes: http://autobuild.buildroot.net/results/4ed3f13b3ce178f8fe87de7aee86acb9642e3434
> Fixes: http://autobuild.buildroot.net/results/e1b4853a7e8714fd2af8f8677681c9895034b3e8

AFAICS, none of those relate to shared libraries, but only to C++.

Can you point to a build failure that is explicitly about shared libs?

> Signed-off-by: Maciej Grela <enki@fsck.pl>
> ---
>  package/spirv-tools/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
> index e2f46253a9..f1ae11bd09 100644
> --- a/package/spirv-tools/Config.in
> +++ b/package/spirv-tools/Config.in
> @@ -1,6 +1,11 @@
> +comment "spirv-tools needs a toolchain w/ C++, dynamic library"
> +	depends on !BR2_INSTALL_LIBSTDCPP || ( !BR2_SHARED_LIBS && !BR2_SHARED_STATIC_LIBS )
> +
>  config BR2_PACKAGE_SPIRV_TOOLS
>  	bool "spirv-tools"
>  	select BR2_PACKAGE_SPIRV_HEADERS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_SHARED_LIBS || BR2_SHARED_STATIC_LIBS

Also this is technically correct (and I would thinkg semantically the
best), we usally use the shorter dependnecy on !static:

    depends on !BR2_STATIC_LIBS

You also forgot to add a comment for when the condition is not met.

So, if sahred libs is really required, can you respin a patch with the
above fixed, please?

Regards,
Yann E. MORIN.

>  	help
>  	  The SPIR-V Tools project provides an API and commands for
>  	  processing SPIR-V modules.
> -- 
> 2.39.2
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
