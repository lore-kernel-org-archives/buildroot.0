Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6D5CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AFD640AF5;
	Sat, 16 Sep 2023 12:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AFD640AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVEVZj3QRla9; Sat, 16 Sep 2023 12:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CA540B5D;
	Sat, 16 Sep 2023 12:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CA540B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33E421BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9674190D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B9674190D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuS0Hl31CKwo for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:10:59 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B91E241735
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91E241735
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0161D20041C;
 Sat, 16 Sep 2023 14:10:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:10:53 +0200
Date: Sat, 16 Sep 2023 14:10:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916121053.GY2571@scaer>
References: <20230916070300.2984031-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916070300.2984031-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694866258;
 bh=Bj78tEMsRVQ8fbuWOKis7ZkkpdJS0EUV6LtcrISY130=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XSCCUWCgl/m9653bqBQHbTPvwPkFElfsyvjWZmq5DTmA5Dj/yjY41XX4oRCBT/D/u
 LCnIkDMW/TvpA0nC6202rpqH4+7StFZ5EJWQQBQNE45yf+9YD20kLiU4mqX8M0zeK9
 F806n4m3X27FCmhZj6mmYvildATyHylQ3O51savMYx1p4p57fDtS/tqA8m55qk2GwO
 gqiJt2U3pi/WgkqDPCd0dzIj5acrFXn8E/JVsmZL5y1gPD0keJoAQ1SvZ8QhPdSe6a
 F68ibz1a08jbjZ1AQZ2mMgqLg+LupluqT6dGHrduUEJ0ZyjqZs/ZJLjhY65ZRp0AIq
 Unr2WdpPf1oKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XSCCUWCg
Subject: Re: [Buildroot] [PATCH] package/python-pluggy: bump to version 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2023-09-16 09:02 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pluggy/python-pluggy.hash | 4 ++--
>  package/python-pluggy/python-pluggy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
> index 39f172a82b..74790a51a0 100644
> --- a/package/python-pluggy/python-pluggy.hash
> +++ b/package/python-pluggy/python-pluggy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pluggy/json
> -md5  daa6fddfb6cd364f3c82e52098911e4b  pluggy-1.0.0.tar.gz
> -sha256  4224373bacce55f955a878bf9cfa763c1e360858e330072059e10bad68531159  pluggy-1.0.0.tar.gz
> +md5  f31aad77be2f5af8ed3864159b7fd743  pluggy-1.3.0.tar.gz
> +sha256  cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12  pluggy-1.3.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
> diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
> index 6dc6f970ea..2b7ac04f02 100644
> --- a/package/python-pluggy/python-pluggy.mk
> +++ b/package/python-pluggy/python-pluggy.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLUGGY_VERSION = 1.0.0
> +PYTHON_PLUGGY_VERSION = 1.3.0
>  PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
> -PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/a1/16/db2d7de3474b6e37cbb9c008965ee63835bba517e22cdb8c35b5116b5ce1
> +PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/36/51/04defc761583568cae5fd533abda3d40164cbdcf22dee5b7126ffef68a40
>  PYTHON_PLUGGY_SETUP_TYPE = setuptools
>  PYTHON_PLUGGY_LICENSE = MIT
>  PYTHON_PLUGGY_LICENSE_FILES = LICENSE
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
