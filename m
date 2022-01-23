Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20E1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930578197D;
	Sun, 23 Jan 2022 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNLw9rCM8opJ; Sun, 23 Jan 2022 19:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9426814B6;
	Sun, 23 Jan 2022 19:54:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 579061BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C523405FA
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_nF6iquj6Ec for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:54:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BBE140253
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:54:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4B1DD5FFA1;
 Sun, 23 Jan 2022 20:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642967643;
 bh=huQJKyGn1TXsjx9fSbnXzMvua0oK2tL7BxX6rIwOAYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2hbMkZ6eZGd8s2c/3IxWek+HC4+QOtldUI6uXwM5arZf1zmYXE3ApHpHBuBvAZYI
 DGsIk6Rbv+cXAc99tO1WFbmW1rhZ1pbB2iwEjtQFK6y/extgcv04tuwhz7/Wj/GMRd
 WNf9U4dZrxbdEo9rOvoQI+uhKEdAaMJVBpSUeH99nFG6eaUrnzkAnaxTfC4gNfjWjZ
 fc6UmceJaVQXNWLnHmKZw04MrsNHkK8sFKeamHs0SuAG6NJSsN/qcVDuTi8/ajCdtr
 Srbipuoj0JkYtluI5BXwYlRejl+YBZSquWJ/kR2iZlgJz/D1aTwfDR4hgZUTRrYPLn
 SLJiHDHB23fLg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 20:54:01 +0100
Date: Sun, 23 Jan 2022 20:54:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123195400.GD2502@scaer>
References: <20220123110155.570748-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123110155.570748-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/collectl: bump to version 4.3.2
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

On 2022-01-23 12:01 +0100, Fabrice Fontaine spake thusly:
> 4.3.2	 Oct 7, 2021
>  - very minor bug. the last command in perfquery is not in a loop and
>    prevents the collectl daemon from starting via the service.
> 
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/collectl/collectl.hash | 8 ++++----
>  package/collectl/collectl.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
> index d866e0becc..1785d25d87 100644
> --- a/package/collectl/collectl.hash
> +++ b/package/collectl/collectl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256 2187264d974b36a653c8a4b028ac6eeab23e1885f8b2563a33f06358f39889f1  collectl-4.3.1.src.tar.gz
> -sha256 b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
> -sha256 264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
> +sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
> +sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
> +sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
> diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
> index c9fb59293c..c6cb2e1494 100644
> --- a/package/collectl/collectl.mk
> +++ b/package/collectl/collectl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -COLLECTL_VERSION = 4.3.1
> +COLLECTL_VERSION = 4.3.2
>  COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
>  COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
>  COLLECTL_LICENSE = Artistic or GPL-2.0
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
