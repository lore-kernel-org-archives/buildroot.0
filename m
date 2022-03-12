Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2263C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7989580D5A;
	Sat, 12 Mar 2022 17:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1y72yLKRpA7; Sat, 12 Mar 2022 17:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 971F681314;
	Sat, 12 Mar 2022 17:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 111131BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D789607E3
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpcgtWxtfLKH for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:58:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D93B8605AE
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:58:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D028278036C;
 Sat, 12 Mar 2022 18:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647107904;
 bh=/TJRzCvZF06+5jfMKbvEAY3F8WAmEgAsOB4oNQJRKxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cYa+oPcY3Fb1H+qRJl6/cnROmglO7IKxaP9kGW4SUTIR99cGpI0NIqC/80PnLwDI8
 0e2r0NSj2vUxAeY8koIPvpKYy0siBiyMQNWKcBHSRu1MFNXP4MAcyYPIS8eo1ysHSF
 xZVsug0afjkpOjsvd40OdxfI2QfQvzUNA+M7FnRMBU3T/jakkkkLz2Ps3CYlLXoVFv
 hhSl5R/iJ0SEdBHr4jR/38ZSP7qO67RuRWpXPYwOiebWcAI2yUnM75Cp+pxTD2jFua
 RVzRg5I8pKBaXt6LYE+otGo8K8l5nKmPI6+uHaxThGVz2cqtLKxyR1SqU2apBDgfCT
 zhNDbZHV1SiEQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 18:58:22 +0100
Date: Sat, 12 Mar 2022 18:58:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.knight@collins.com>
Message-ID: <20220312175822.GK283544@scaer>
References: <20220311150943.119252-1-james.knight@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311150943.119252-1-james.knight@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.2
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

James, All,

On 2022-03-11 10:09 -0500, James Knight via buildroot spake thusly:
> https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.2
> 
> Signed-off-by: James Knight <james.knight@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/chrony/chrony.hash | 5 +++--
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
> index f8dd1438bc7d1f08dcbdccb7bff8e03cee3e2da8..7fa67bf040da0c00e23e3e4fb5ddd4a638cb91d0 100644
> --- a/package/chrony/chrony.hash
> +++ b/package/chrony/chrony.hash
> @@ -1,4 +1,5 @@
> -# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
> -sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
> +# Locally calculated after checking pgp signature
> +# https://download.tuxfamily.org/chrony/chrony-4.2-tar-gz-asc.txt
> +sha256  273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a  chrony-4.2.tar.gz
>  # Locally calculated
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index 5a34f70e1e992f179784ad87b240967f5cf0a30f..15b200aeffe9bd70694bb1d490535ae8785dc3fc 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CHRONY_VERSION = 4.1
> +CHRONY_VERSION = 4.2
>  CHRONY_SITE = http://download.tuxfamily.org/chrony
>  CHRONY_LICENSE = GPL-2.0
>  CHRONY_LICENSE_FILES = COPYING
> -- 
> 2.30.0.windows.1
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
