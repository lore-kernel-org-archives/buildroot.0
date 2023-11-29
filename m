Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E428C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 06:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C7A401F1;
	Wed, 29 Nov 2023 06:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C7A401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OwjGXNtkmpW; Wed, 29 Nov 2023 06:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B9E4036E;
	Wed, 29 Nov 2023 06:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B9E4036E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA2861BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB8EB81E59
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 06:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8EB81E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvhX1lj53Gyl for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 06:56:33 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDB1281E4A
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 06:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB1281E4A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CDCDC13F8A7;
 Wed, 29 Nov 2023 07:56:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 29 Nov 2023 07:56:28 +0100
Date: Wed, 29 Nov 2023 07:56:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231129065628.GJ3177259@scaer>
References: <20231128194647.12817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128194647.12817-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701240991;
 bh=+EwNtjfhAB6wWktASSliFXEBp8xJZEbuDzfsgAfn9dA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PiGT+LiU6EF+elSpgRNvEFXMq3D/kU82EtWf9U7QaazZrVfVI+tZifZoMAT7Nvni9
 BYbblPDbvdrVUtCOy2AbUpqJMeUSllidNmi1+C6sRUS3KujTwCC+efGus7B9JWg8Zw
 e4xs/7EeOocETzZKD9+e3LO0yrJ3EGp/LhHBoCJfIbbZjIgJXP9SfOsJu9Iu3Sh0Kg
 GX9ZlILrY0WWiH//QyD2IUjEmpq92jSTGFr5TZh4H3zbdRMLnUR5r/FjcIW8Pza9O9
 lKSBK8LcNSgh9vI6XL6yT+x4MeV2BqGawpeuYmuXwTAojDrPMmvp1wrwGRLfN5cdKW
 p4P2rXHdLD/bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PiGT+LiU
Subject: Re: [Buildroot] [PATCH 1/1] system/Config.in: disable openrc with
 uclibc
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

On 2023-11-28 20:46 +0100, Fabrice Fontaine spake thusly:
[--SNIP--]
> So, as advised by Yann E. Morin, openrc is hided away for uClibc, until
> upstream has a proper fix.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  system/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 0b4dc9543e..b90e40e415 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -105,12 +105,13 @@ config BR2_INIT_OPENRC
>  	bool "OpenRC"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC

Err, no; the proper symbol is BR2_TOOLCHAIN_USES_UCLIBC:
    https://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options

Also, the dependency must be on the package itself. Indeed, the issue is
with the package, not with our use of init as an init system. So we need
the dependency on the package itself, and it is inherited in the init
system choice:

    config BR2_PACKAGE_OPENRC
        bool "openrc"
        depends on !BR2_TOOLCHAIN_USES_UCLIBC

and then:

    config BR2_INIT_OPENRC
        bool "openrc"
        depends on !BR2_TOOLCHAIN_USES_UCLIBC  # openrc

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_OPENRC
>  	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
>  
> -comment "openrc needs a toolchain w/ dynamic library"
> +comment "openrc needs a glibc or musl toolchain w/ dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS
> +	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  
>  # In Buildroot, we decided not to support a split-usr when systemd is
>  # used as an init system. This is a design decision, not a systemd
> -- 
> 2.42.0
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
