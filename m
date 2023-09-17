Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD10CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CEC610FD;
	Sun, 17 Sep 2023 12:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25CEC610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnhaERXLsyQB; Sun, 17 Sep 2023 12:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664B0610F6;
	Sun, 17 Sep 2023 12:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664B0610F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8D81BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0607381E78
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0607381E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMnszM5U7OMz for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:39:25 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0484081E30
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0484081E30
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 400C9B0056A;
 Sun, 17 Sep 2023 14:39:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:39:20 +0200
Date: Sun, 17 Sep 2023 14:39:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230917123920.GP415981@scaer>
References: <20230916174838.3537042-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916174838.3537042-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954363;
 bh=Qv5jKPtdkhZkR/rfhLEYFTjIm0luLR97vpZexwAp6gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QzLyJ1dJ8nf/a9O5CS1JmHPxi2jzs4fXJj5o7g4j4Jl9Ay26R8qBJ8pPnf6yjP0eH
 5S2HJJwhY+3ZuYZVTioMbWLec64JXUAWrZWWLrJi4m8EGUwzpKGFAnDr5r0flsZOUr
 59I4ET08LazZqCOJw2UxBOWIKjuEH0k5GzhcXYemgEnm8It6fqYmcPgRg+pWh24B94
 SjS8lw63WYv7OPSTX34+NwaxUlw7DW6hbWK+N6HgHRbEHzyZyHRxtFffXF2TBpsMdz
 jI5jusdnQl+Lz7tX+JpPTogWeH5ViCG7xzGjQwdqmdHUU7vM2HttZhoHaYZLENlW9n
 V48aV6aSAPh2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QzLyJ1dJ
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: bump to version 8.6.13
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

Julien, All,

On 2023-09-16 19:48 +0200, Julien Olivain spake thusly:
> For release note, see:
> https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 9584c80 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -a -p tcl
>     ...
>     45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/tcl/tcl.hash | 2 +-
>  package/tcl/tcl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
> index 2b82a1938b..109ea3d79c 100644
> --- a/package/tcl/tcl.hash
> +++ b/package/tcl/tcl.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
> +sha256  43a1fae7412f61ff11de2cfd05d28cfc3a73762f354a417c62370a54e2caf066  tcl8.6.13-src.tar.gz
>  sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
> diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
> index 97754b63d0..843d58a4ae 100644
> --- a/package/tcl/tcl.mk
> +++ b/package/tcl/tcl.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  TCL_VERSION_MAJOR = 8.6
> -TCL_VERSION = $(TCL_VERSION_MAJOR).12
> +TCL_VERSION = $(TCL_VERSION_MAJOR).13
>  TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
>  TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
>  TCL_LICENSE = TCL
> -- 
> 2.41.0
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
