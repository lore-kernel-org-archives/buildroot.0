Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4817C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969F26FBBC;
	Wed,  5 Jan 2022 21:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls5Ca5gAQBul; Wed,  5 Jan 2022 21:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEED26FBC4;
	Wed,  5 Jan 2022 21:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0221BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 495DF428CD
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmwhAmezOtWE for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:01:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FBD0428CC
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:01:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AF84C78031A;
 Wed,  5 Jan 2022 22:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641416467;
 bh=Rky+cfLNzPSDupmDLpe4w0TZHmVDr9kYPyMs7xQ/ILM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwRDDeB+3HA31BXz5XE0CNybAwdV/UjSTQYUdBke+bpxs+nnZt4/Pud5J+UVReCOg
 cvosbpG9tbyUE0dPqP4G92ZK5yhrQlfQLVVPRV660L3qoY6or3g2THuhXzyvlGkK6z
 AsWjvev0hRQFgiGCCgeTrFswTuNbEmngx+6gvVmJHnOEIW5Hcl0sNU6lQXD5wT44Ti
 U/ng+Qc+XvVf1pIpJRmwEkq91hEfQJeELyK8p/eThtMtVqTe4pZk2Vv4Q4l3tcQ+Lo
 0YUDP4h35udxnH1dFAREQ+Qs3l90VgrII+rnDqa58xx3pkr/ffxBQp6jAkGpr32uLu
 m2lHw1+8rH9Kg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 22:00:59 +0100
Date: Wed, 5 Jan 2022 22:00:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220105210059.GI614810@scaer>
References: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/4] package/libsemanage: add gcc >= 5
 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-05 19:03 +0100, Fabrice Fontaine spake thusly:
> Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
> dependency
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 4 patches applied to master, thanks.

I'll further reply to patch 4...

Regards,
Yann E. MORIN.

> ---
>  package/libsemanage/Config.in     | 6 ++++--
>  package/policycoreutils/Config.in | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
> index 3c7050ee51..5103df3f15 100644
> --- a/package/libsemanage/Config.in
> +++ b/package/libsemanage/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBSEMANAGE
>  	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
>  	select BR2_PACKAGE_AUDIT
>  	select BR2_PACKAGE_LIBSELINUX
>  	select BR2_PACKAGE_BZIP2
> @@ -17,6 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
>  
>  	  http://selinuxproject.org/page/Main_Page
>  
> -comment "libsemanage needs a toolchain w/ threads, dynamic library"
> +comment "libsemanage needs a toolchain w/ threads, dynamic library, gcc >= 5"
>  	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> index 81900b4e41..3201c8fede 100644
> --- a/package/policycoreutils/Config.in
> +++ b/package/policycoreutils/Config.in
> @@ -1,12 +1,14 @@
> -comment "policycoreutils needs a toolchain w/ threads, dynamic library"
> +comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5"
>  	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_PACKAGE_POLICYCOREUTILS
>  	bool "policycoreutils"
>  	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
> -	depends on !BR2_STATIC_LIBS #libsemanage
> +	depends on !BR2_STATIC_LIBS # libsemanage
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
>  	select BR2_PACKAGE_LIBSEMANAGE
>  	select BR2_PACKAGE_LIBCAP_NG
>  	help
> -- 
> 2.34.1
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
