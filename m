Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C77C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B68E40600;
	Sat,  1 Jan 2022 09:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjt4vw_8Oa5Q; Sat,  1 Jan 2022 09:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BF5740583;
	Sat,  1 Jan 2022 09:56:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA831BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1865B82B2F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rgBvXGNkw3o for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17DD1813DF
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:55:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9C15C5FF33;
 Sat,  1 Jan 2022 10:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641030914;
 bh=kqSr9nZ66kcBL8C+KQLXWm22GLfzBrnbIaAjUAFOa5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cI3S7FnD/Fx8rnv2VUWUbLquecc8oI7F3HjOcenP1OY9FtTPBrpa+eqXVoCpPpTUR
 JKTegnW0GZwFH4nO8TqD8FTo0Nrc3I96r9ko4//gvuSSNLjbySPo+NyuDmmc3TQD4T
 DIt+7AE/Tqb4/7/E16dfJMl+SDo9E4ZiLZae0dVG6RrV6jS3Nkhnr0buYBN1K9f+Re
 5/0l2nfdFJLU1BHNPFZrabjLHJrGQurXNLuyFzya0FlPOG0NqfPwYAhg7UU87oi71v
 XhwFZ7NWmy5jwoWaGk4EXqKcLdpwtkXQe88CAtYqwLr0f0fzgX8+/DbLcDvzX/dmy1
 DS66M6+itrDlA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 10:55:08 +0100
Date: Sat, 1 Jan 2022 10:55:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220101095508.GS3390456@scaer>
References: <20220101003125.1957739-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220101003125.1957739-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse: bump to
 version 2.1.0
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

On 2021-12-31 17:31 -0700, James Hilliard spake thusly:
> License hash change due to full text removal:
> https://github.com/aio-libs/aiohttp-sse/commit/307fd35a84a66b7fb5adfd70cd5b7d709fa8508c
> 
> Fixes(python 3.10 compatibility):
>   File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 107, in wait
>   File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 144, in _ping
> TypeError: sleep() got an unexpected keyword argument 'loop'
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This, and your 8 following python-related patches, applied to master,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-aiohttp-sse/python-aiohttp-sse.hash | 6 +++---
>  package/python-aiohttp-sse/python-aiohttp-sse.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
> index 2f21da462e..224601450c 100644
> --- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
> +++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
> -md5	d2f394fb75f591045b2c94fc17c8533d  aiohttp-sse-2.0.0.tar.gz
> -sha256	547e1eaa129749f090d02b31956215edbcde74ce99721f5f0ac902a9ccb1202e  aiohttp-sse-2.0.0.tar.gz
> +md5  822cd0c30325e8a711101c1a1ede4058  aiohttp-sse-2.1.0.tar.gz
> +sha256  dfe8f7271ab4470891fa1bfa1913d6889b3d19015dd3d3a4cab949e66971bbca  aiohttp-sse-2.1.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256	cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> +sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
> diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
> index 7a7a0d0a70..2aef1579f5 100644
> --- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
> +++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AIOHTTP_SSE_VERSION = 2.0.0
> +PYTHON_AIOHTTP_SSE_VERSION = 2.1.0
>  PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
> -PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2b/50/e127729f7df53c32c96b5c71932a7262cad40c83f1e19c218b068c816d51
> +PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2f/3f/cc4f5a3fe6cb50ad5b9d26bb7738c5da1f61645b517d4230df2fc32d89f0
>  PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
>  PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
>  PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
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
