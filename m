Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F71AC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0D481A4E;
	Sun, 21 Aug 2022 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0D481A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0o9hvCwZnYTn; Sun, 21 Aug 2022 13:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E7B381A58;
	Sun, 21 Aug 2022 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7B381A58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1887E1BF30D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A8D40587
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A8D40587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-Fx0p8YG0fK for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 13:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE21A403A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE21A403A7
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 13:51:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EEB213F8AC;
 Sun, 21 Aug 2022 15:51:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 15:51:11 +0200
Date: Sun, 21 Aug 2022 15:51:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821135111.GW2775145@scaer>
References: <20220815205011.13423-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815205011.13423-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661089873;
 bh=Lh4HAF/KRPSKnk5XSzWnKS3Han00m7irm3a/rZZQMEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVyxuSRHRID389KqAF5T++G3hCg99nIGnEmnJjn/kjsxsjDagPkbs4r+nobnckK3O
 jduvUnCJyAdkAZEecg/9an5IlYu/oEc/vxVdRtKU9ifMIbzwSPp770TcZwBgNyMpeQ
 dDlSmvrG6xl/SxV4QNMQcJMW8pWEHmu6GO/ub/uXrp90O5DYilAKF0lgI11/OzxrnM
 8sKl1CGeEXbKGyhvQsMYNwKpvQz5+IUbhdXFPMakiRdOAntlmGv89apcvB2M40PLzu
 M0YIqWARE7wlQXceXJeOmQ7+lyECiRakmxhPenRw819J+DWmCGAWL+PRgDJDa3e1cp
 MQYbB+T6QBUMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SVyxuSRH
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: check for find
 and xargs
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

On 2022-08-15 22:50 +0200, Fabrice Fontaine spake thusly:
> Commit 7652817c93a02715e0d334d70118a0d8b6917ca6 updated the
> documentation but forgot to update support/dependencies
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/dependencies.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index d69d97afaa..2b678ae8c4 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -163,7 +163,7 @@ fi
>  
>  # Check that a few mandatory programs are installed
>  missing_progs="no"
> -for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
> +for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
>  	if ! which $prog > /dev/null ; then
>  		echo "You must install '$prog' on your build machine";
>  		missing_progs="yes"
> @@ -177,6 +177,10 @@ for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
>  			echo "  bzcat is usually part of the bzip2 package in your distribution"
>  		elif test $prog = "cmp" ; then
>  			echo "  cmp is usually part of the diffutils package in your distribution"
> +		elif test $prog = "find" ; then
> +			echo "  find is usually part of the findutils package in your distribution"
> +		elif test $prog = "xargs" ; then
> +			echo "  xargs is usually part of the findutils package in your distribution"
>  		fi
>  	fi
>  done
> -- 
> 2.35.1
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
