Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C08C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F76F812E9;
	Tue, 25 Jan 2022 18:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rs8vGKlelU1C; Tue, 25 Jan 2022 18:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8046A812EC;
	Tue, 25 Jan 2022 18:43:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91F151BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 813AC40304
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vsO_TQVwdzV for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A522D402F6
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:43:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 196765FF9A;
 Tue, 25 Jan 2022 19:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643136214;
 bh=05ZSQabvEq709wFpWUN9lL6OaZ1Pux1JE8bUopaVrAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNVlAUlGEAoe5X6dcy+0StvYJAxuYgI+L/ewNTENMn0gx5hj8m7RpBuIZizz93Y9B
 O42cgksahNhhyug+BiwWHuo6/Mzo9vOj+qUk3J5PwqGyln0mZijR2NRi2AS6Plo/Pc
 y2aJprAQpNY0ZLNdpBVBk41WZ2cz1zXZ8kTOEYEIamheehYuaOg5Y5F4XW0O2NVYmB
 NEjFs38TahpYOYcg5bod1FDIaUllzf6n87UhsNZxlkD6zQaMHi+wbHjEP8Gjo4rf/t
 pyvH40kCsr1x/9BX5te+3X8bg5pcF0FlH+U9z1CUVi07TbNee/3ZQKIqXSxp+GWwlC
 APy64QFrHEUmg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 19:43:30 +0100
Date: Tue, 25 Jan 2022 19:43:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220125184330.GG457876@scaer>
References: <20220124093610.410365-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124093610.410365-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to
 version 1.3.0
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

On 2022-01-24 02:36 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, along with a bunch of your other python package
updates, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
>  package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
> index fad7079789..15584a8a41 100644
> --- a/package/python-aiorwlock/python-aiorwlock.hash
> +++ b/package/python-aiorwlock/python-aiorwlock.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
> -md5  f0fac247fd884f59d53f6deeb866a52d  aiorwlock-1.2.0.tar.gz
> -sha256  3626ed72f92a57e71c685d7fc0329578e5d2dee2ab80805beec8b5119053146d  aiorwlock-1.2.0.tar.gz
> +md5  28e4812a1d1d67a2be4370209ece5528  aiorwlock-1.3.0.tar.gz
> +sha256  83f12d87df4b9728a0b8fda1756585ab0d652b107bab59c6084e1b1ad692ab45  aiorwlock-1.3.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
> diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
> index 4ba4965eb5..a5e7eeae83 100644
> --- a/package/python-aiorwlock/python-aiorwlock.mk
> +++ b/package/python-aiorwlock/python-aiorwlock.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AIORWLOCK_VERSION = 1.2.0
> +PYTHON_AIORWLOCK_VERSION = 1.3.0
>  PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
> -PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/22/84/98ef7b69764b0ceee7afe2139f45f9cbba21c849b0bd8a6eeecb11ee650d
> +PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/fe/7027595f5e635ac1f597f7160a420e1f642a474576efb697001efea16bdc
>  PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
>  PYTHON_AIORWLOCK_LICENSE = Apache-2.0
>  PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
