Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB56C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5021980D1D;
	Sun,  9 Jan 2022 22:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qc7pNMDtSG7L; Sun,  9 Jan 2022 22:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C4A080D37;
	Sun,  9 Jan 2022 22:36:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16781BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AB6D4045E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pqT_CXZ0qqF for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A3D2400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:36:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C74AE5FF20;
 Sun,  9 Jan 2022 23:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641767788;
 bh=J5MR0HsG/bqj8prjOJ+5aL0dau74iCyphzs6n/tX3PU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VKPExCz0dV3ZIK9ZXNv3k/UD1Ni+wKM5ZI4hhPN/xpjgjRwgTo8Di6SqUFoNjAmLk
 FSKx2advc6xljj/nhfzOBWCiRZHS5NmXTfrCvUdCQbO3GxGrjdpg7bCPzrEd8Xq01m
 Gu9jOpTfEhGzz23DyXV73ybnCf8mkpsX3f55isr0YXXQUy3QKc85GA+UhElNa8wYwd
 tnU+e+YsnCNVvfNjoMb3/G5ZFpQFRv2YEpFhADVH03+Z59g68C5wDlLHuXR/42gWR5
 GKrnKmoraILT+hvXupZIdiFMxqW0r3vrKnqv9leLsOYQJjAxiZkBuf+61T3FjXJvul
 WKuUNtzISkU5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 23:36:25 +0100
Date: Sun, 9 Jan 2022 23:36:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220109223625.GM1477939@scaer>
References: <20220109222203.1397934-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109222203.1397934-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: fix version
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-09 23:22 +0100, Fabrice Fontaine spake thusly:
> Fix AVRDUDE_VERSION so that it matches what is returned by
> release-monitoring.org

Thanks for spotting that, I totally missed it...

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/avrdude/avrdude.hash | 2 +-
>  package/avrdude/avrdude.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
> index 1c7758afcd..d53d4dd60d 100644
> --- a/package/avrdude/avrdude.hash
> +++ b/package/avrdude/avrdude.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-v6.4.tar.gz
> +sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-6.4.tar.gz
>  sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 5bbbc4e8c2..6a8e9074b7 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -AVRDUDE_VERSION = v6.4
> -AVRDUDE_SITE = $(call github,avrdudes,avrdude,$(AVRDUDE_VERSION))
> +AVRDUDE_VERSION = 6.4
> +AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
>  AVRDUDE_LICENSE = GPL-2.0+
>  AVRDUDE_LICENSE_FILES = COPYING
>  
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
