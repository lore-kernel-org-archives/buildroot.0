Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F6AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC4761215
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCC4761215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80DE40572;
	Sun,  3 Oct 2021 20:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hzwtwF0TKUe; Sun,  3 Oct 2021 20:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D712840580;
	Sun,  3 Oct 2021 20:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1B231BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C131E415D9
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNmx1Le93dUi for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:01:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE91A415AA
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:01:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 456F313F838;
 Sun,  3 Oct 2021 22:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633291311;
 bh=RBumPiEhIddXRuZ7G2tHvZRBf12ojUvIZVx71VvCsoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HcURD5NJb1gLAunnbb+QtX5glj6m2yzUtr/WzPa39DrOhiu2o5O0+pc5Q1DSriA3v
 X+LsvWarjK0u467eKjYB/jl6RSHv4mgI9NknH9W4Y4vk6Xetth23xuFSO1EI27VRIT
 QKoYakg2FQSeYgD7+/8ltlzMneFFr0lAFB/SKSHgK0LnwQlKMlIMlpwTvuU8d9sRsG
 uxWt+Q/xNfu23U5LZtjbkKmmtXUA2U76IUNthNGJ0LuVQjj24xMgeEYqHYKzJpB0pz
 cTV0D1rPL1C9ndo4g97N+u4RODQZ/a8CNlKC+CArwnN6ja9Kgt/47Oq5ME0Vzw8DiY
 rgdr0r5H3ZozA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:01:45 +0200
Date: Sun, 3 Oct 2021 22:01:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003200144.GU1504958@scaer>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-incremental: bump to
 versioni 21.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Asaf, All,

On 2021-09-28 09:43 +0300, Asaf Kahlon spake thusly:
> * Update URL on Config.in
> * Indent with two spaces in the hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-incremental/Config.in               | 2 +-
>  package/python-incremental/python-incremental.hash | 8 ++++----
>  package/python-incremental/python-incremental.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-incremental/Config.in b/package/python-incremental/Config.in
> index 64f8623354..c895e820c5 100644
> --- a/package/python-incremental/Config.in
> +++ b/package/python-incremental/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INCREMENTAL
>  	help
>  	  A library for versioning your Python projects.
>  
> -	  https://github.com/hawkowl/incremental
> +	  https://github.com/twisted/incremental
> diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
> index c897f6e495..47af832f39 100644
> --- a/package/python-incremental/python-incremental.hash
> +++ b/package/python-incremental/python-incremental.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/incremental/json
> -md5	602746e0d438e075a5a9e0678140bba2  incremental-17.5.0.tar.gz
> -sha256	7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3  incremental-17.5.0.tar.gz
> -# Locally computed sha256
> -sha256	d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
> +md5  9f7ad12e0c05a12cee52a7350976c4e3  incremental-21.3.0.tar.gz
> +sha256  02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57  incremental-21.3.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
> diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
> index 9c9d3a4405..7c6b2a547c 100644
> --- a/package/python-incremental/python-incremental.mk
> +++ b/package/python-incremental/python-incremental.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_INCREMENTAL_VERSION = 17.5.0
> +PYTHON_INCREMENTAL_VERSION = 21.3.0
>  PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
> -PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097
> +PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/4f/c5/430765c697afc217c8491785de321a21fa4d983dda14bcd82feb965b0593
>  PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
>  PYTHON_INCREMENTAL_LICENSE = MIT
>  PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
> -- 
> 2.33.0
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
