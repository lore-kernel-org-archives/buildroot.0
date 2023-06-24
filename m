Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E43EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 396646112D;
	Sat, 24 Jun 2023 15:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 396646112D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kc4XtkBxOSwm; Sat, 24 Jun 2023 15:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F63C61175;
	Sat, 24 Jun 2023 15:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F63C61175
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC0E1BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E82B405D3
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E82B405D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Da7nremojxo3 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:06:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1815405D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1815405D0
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:06:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 75359B004FF;
 Sat, 24 Jun 2023 17:05:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 17:05:58 +0200
Date: Sat, 24 Jun 2023 17:05:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230624150558.GV24952@scaer>
References: <20230623071136.126003-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623071136.126003-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687619161;
 bh=TeVc9Xrl4Am90qMi0QhVWRXDFla6Uz+enhdxukuvakI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGQeo4wuboEcdI8o/3NUTQw/3/OmOJTnJ7EK2EgVBDtWMvXIltXzJNKiRjeHJs2Ud
 ZhAR8Idh8AJ/28lN0cJuxl9SpTXsNkjOFsWyv+5JLrGKXBX555OpxSF4pRYpjABv9C
 g1y5rCgHAgE3lCIE9UkSojMutVy4HZ+Li6w5t5rxqRG/seo+O0m/V09O97ibzdheNs
 Eqli6enttamcw4Hu5yGB9GMhiRyImxSooedCH3W6OarcChX7uv8oRfjkZcjfJTzDk0
 1S2YXA34Vzv0wEaqXduu8/vSZApw7lnI3+vma24hOSrM2Q3ZhNBj+8iXNnXuexHfed
 dDOtd78ZP7Cbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RGQeo4wu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 39.0.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-06-23 01:11 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-cryptography/python-cryptography.hash | 2 +-
>  package/python-cryptography/python-cryptography.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index a23944a06f..e083014750 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  531348679f144d118156be5b17ddac750974cdcd9f44bb0a7cfd7ddcfee79c80  cryptography-39.0.1.tar.gz
> +sha256  405c9a6271e1a088ea0b432bc2094e2e8baadb2241e192ce9c73a7cc9793b127  cryptography-39.0.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
>  sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index a130b2d10d..67aa20742d 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CRYPTOGRAPHY_VERSION = 39.0.1
> +PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
>  PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6a/f5/a729774d087e50fffd1438b3877a91e9281294f985bda0fd15bf99016c78
> +PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
>  PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
>  PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
>  PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
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
