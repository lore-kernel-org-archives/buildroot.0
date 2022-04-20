Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BB8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5715D832A9;
	Wed, 20 Apr 2022 20:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdLSLhPC9uGf; Wed, 20 Apr 2022 20:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FC18329D;
	Wed, 20 Apr 2022 20:44:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A99931BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58B4417CF
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ptw0pAwNVWCE for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0C724019A
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C77945FFA9;
 Wed, 20 Apr 2022 22:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650487363;
 bh=WdS7DpIWhKPdMdudu6PdlQXeKf0Le3X7DJpxveETBt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcLgcTh29s4VDysgInulWL99xIcxBxYM1tslDwxU3I/ors65unAe+Dy1e+8sLjMaM
 jr52SJiom5H2zdLvFzksmXsXrnmqSk9uYIy21LsPWYLhHf2wOwgSaLAm724HJo8ECq
 6GUg24sUJZVD+SKgfaDOtbdYf7/bmdNdNiCJBYUFaorYiMxTYqxoW0tk/SBqYmpWXm
 e2yVNbpWmVMOO8xJpeCQdBS9sigS+Ye9KYExM87/tc8I835kz3CpIkZ8n+qtJ2Al5F
 JDhOPOgOQLIJJQU5YF9ma1V9qj1eEJqiy8h5rZOkCE8FL9MjYT7B9xUsiBCVJTkmRy
 quNj77TobIE8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 22:42:39 +0200
Date: Wed, 20 Apr 2022 22:42:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220420204239.GG2730@scaer>
References: <20220420181625.762383-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420181625.762383-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bidict: bump to version
 0.22.0
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

On 2022-04-20 12:16 -0600, James Hilliard spake thusly:
> License hash changed due to adding dates/author name:
> https://github.com/jab/bidict/commit/b5c9f346ce0e3450a9df41c8740c32ed8b62f7f3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks, along with the next 10 bumps.

Regards,
Yann E. MORIN.

> ---
>  package/python-bidict/python-bidict.hash | 6 +++---
>  package/python-bidict/python-bidict.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
> index 59229f96d9..fe9a94af53 100644
> --- a/package/python-bidict/python-bidict.hash
> +++ b/package/python-bidict/python-bidict.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/bidict/json
> -md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
> -sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
> +md5  da3d37ae93c740c191b5666918c3164f  bidict-0.22.0.tar.gz
> +sha256  5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8  bidict-0.22.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
> +sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
> diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
> index c6b7b862ea..7ba15db605 100644
> --- a/package/python-bidict/python-bidict.mk
> +++ b/package/python-bidict/python-bidict.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_BIDICT_VERSION = 0.21.3
> +PYTHON_BIDICT_VERSION = 0.22.0
>  PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
> -PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
> +PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/2b/84/159749556b9c49ea4489dadeb94d44f05d6033d1db3af4c83120ecac5b15
>  PYTHON_BIDICT_SETUP_TYPE = setuptools
>  PYTHON_BIDICT_LICENSE = MPL-2.0
>  PYTHON_BIDICT_LICENSE_FILES = LICENSE
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
