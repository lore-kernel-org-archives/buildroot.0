Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1995CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA23610F1;
	Sun, 17 Sep 2023 12:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA23610F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3FzZTl89Jyx; Sun, 17 Sep 2023 12:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4C0610F5;
	Sun, 17 Sep 2023 12:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4C0610F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF76E1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 945B8408AF
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 945B8408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5enPFYs7src1 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:40:42 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7010940891
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7010940891
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 477DFB005A9;
 Sun, 17 Sep 2023 14:40:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:40:37 +0200
Date: Sun, 17 Sep 2023 14:40:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230917124037.GQ415981@scaer>
References: <20230916204746.3013338-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916204746.3013338-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954440;
 bh=zhVPHQuF4u6drqMX0BC1ldo0kJ5f1m+p36a12rMOoog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ny02tYuv3eASJIq2R4JKf0vb0OWJtTOx4SudK94N3wK3AYP3+Zb3fN8KX46+s3f27
 IJshIw6/vYaEWzRgYvdfLFsYbDie6+lFgeacHqlWatSXdn3iCerDizRstD+DxiSfG/
 UCrrqlSKzV/MRzsteDiyGHW/JY+kZKYgEUJUgflcEvIjaRumOsh6EJxGMJKZH2hUgV
 bgkskn5ipvXPcqfocJGFDwRmrw/6YCMkhQIA5DWiXav8RZfmLj4QWjdN63hSt6t8q7
 8VUACqMtm44BZfz9/+wcF6llx4265pXSqQ6ra8h5Whk9tMT4K/K6qSWC0ymxStFhDk
 CRHYR6B7HWcbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ny02tYuv
Subject: Re: [Buildroot] [PATCH 1/1] package/tk: bump to version 8.6.13
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-09-16 22:47 +0200, Julien Olivain spake thusly:
> For release note, see:
> https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

(people are still using tcl/tk nowadays? Wow.... ;-] )

Regards,
Yann E. MORIN.

> ---
>  package/tk/tk.hash | 2 +-
>  package/tk/tk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tk/tk.hash b/package/tk/tk.hash
> index acf5e45157..968b351b41 100644
> --- a/package/tk/tk.hash
> +++ b/package/tk/tk.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  12395c1f3fcb6bed2938689f797ea3cdf41ed5cb6c4766eec8ac949560310630  tk8.6.12-src.tar.gz
> +sha256  2e65fa069a23365440a3c56c556b8673b5e32a283800d8d9b257e3f584ce0675  tk8.6.13-src.tar.gz
>  sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
> diff --git a/package/tk/tk.mk b/package/tk/tk.mk
> index 830b241f74..dfa7a7c694 100644
> --- a/package/tk/tk.mk
> +++ b/package/tk/tk.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  TK_VERSION_MAJOR = 8.6
> -TK_VERSION = $(TK_VERSION_MAJOR).12
> +TK_VERSION = $(TK_VERSION_MAJOR).13
>  TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
>  TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
>  TK_LICENSE = TCL
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
