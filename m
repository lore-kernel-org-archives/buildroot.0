Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A0CC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 09:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 165C860F39;
	Sat,  6 Aug 2022 09:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 165C860F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZKIeExksb0E; Sat,  6 Aug 2022 09:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3F060A9B;
	Sat,  6 Aug 2022 09:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3F060A9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0ED1BF852
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 09:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FBE0408AD
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 09:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FBE0408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKC6CaubiOZG for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 09:08:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509034088D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 509034088D
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 09:08:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cd3:e89a:3ed2:2a65])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C33E8200594;
 Sat,  6 Aug 2022 11:08:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Aug 2022 11:08:21 +0200
Date: Sat, 6 Aug 2022 11:08:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220806090821.GA3774782@scaer>
References: <c225549c7b76f63429e7fddcb13e38de3c8d30c9.1659683491.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c225549c7b76f63429e7fddcb13e38de3c8d30c9.1659683491.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659776905;
 bh=5NOmRlOfDNKJbbrw0y1qxIlcCmaFoBvEfVVdBjZEN1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FSPhd88bP15bzzUlh8cL4SxBahVK2dp+MyJ1dgCtjhEDTr9amwcCwiOAHzdUh/rmz
 aIBo8KfcpqEvagCZllycaXCr/0WI6mc5Y71zBIFKX6TfT/Sj4Wz1MO3Xs18bQuGtOF
 qpdDq+poRd8RYSK9zX3QARldiwCUhl74F2niiNQQIEQ3GE+NFSHhOgUEVre51pW5yb
 Ol2YqT/XQu9fwyCXcaRYMhwOzpQC4aPhhdoxsEx1SaXeKc64Ly7PrnfNKEEaANE4FT
 dJ0n1hC8WaRsS7jSws2GR0l3lUyb5QqOasDM5M/MOUvPt6VYLjcFxIY7YoXT0vFu1G
 G4jGAU06BfUFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FSPhd88b
Subject: Re: [Buildroot] [PATCH v2] boot/grub2: fix build race condition
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-08-05 09:12 +0200, Stefan Agner spake thusly:
> Sometimes buildroot fails with:
> ../grub-core/kern/emu/hostfs.c:20:10: fatal error: config-util.h: No such file or directory
>    20 | #include <config-util.h>
>       |          ^~~~~~~~~~~~~~~
> 
> Add a patch which fixes the Makefile to correctly generate config-util.h
> first.
> 
> Note: This readds a work around to avoid re-running autoconf. This has
> previously been used to avoid having to run the rather complex build
> file generation machinery of GRUB2. See 7e64a050fb ("boot/grub2: Fix
> GRUB i386-pc build with Ubuntu gcc").

7e64a050fb also touched Makefile.util.am, so I had to check that this
was no onger needed, so I extended the commit log that touching
Makefile.in is indeed sufficient.

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
[--SNIP--]
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 57593330dd..6c9c80dc15 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -13,6 +13,12 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
>  HOST_GRUB2_DEPENDENCIES = host-bison host-flex
>  GRUB2_INSTALL_IMAGES = YES
>  
> +define GRUB2_AVOID_AUTORECONF

We usually add a comment to refer to the patch that requires such a
hook, so I added one.

> +       $(Q)touch $(@D)/Makefile.in

    $ make check-package
    boot/grub2/grub2.mk:18: expected indent with tabs

I fixed that too, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +endef
> +GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
> +HOST_GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
> +
>  # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
>  # doesn't exist upstream, but is added by the Redhat/Fedora
>  # packaging. Not applicable to Buildroot.
> -- 
> 2.37.1
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
