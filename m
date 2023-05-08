Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92462C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 422BD409C4;
	Mon,  8 May 2023 19:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 422BD409C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BDwPOtPuONo; Mon,  8 May 2023 19:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F8640B5E;
	Mon,  8 May 2023 19:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F8640B5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 788591BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE2C41D86
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE2C41D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBRJ6mibr9yA for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:21:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4B441D82
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4B441D82
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:21:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C995F2005A4;
 Mon,  8 May 2023 21:21:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:21:49 +0200
Date: Mon, 8 May 2023 21:21:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nasser Afshin <afshin.nasser@gmail.com>
Message-ID: <20230508192149.GE252090@scaer>
References: <20230507225244.959609-1-afshin.nasser@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507225244.959609-1-afshin.nasser@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573712;
 bh=txUkpBjngs5JFSKmAE4Ai/bNsF0PFYyCxw/j0dSxHl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNmjg8YDZtXtd3uJ5kp+si5LtZcw3U3OdjQ8u1Y836S26Evhr+4CDEhCxFXZNQdCR
 dplq00Gpjy88/Txbcj9UrpcxeEzPFh0FLMj5OWCukNpGeUH2i0xuBFGZjqDAo6Oen8
 i6ndxEkQmOG65qKlH+yJmxXdJCdUQtqS78PTurQtlSuJ8huZOsWM/HxjcLETy2KCGY
 riC4dwYtmy+ZYdfn7Ty6sDa/7lIY/2kEBrG1JlKjljsybRp4gNCK/hfWNnM25NoxZU
 DRK52KM8AOV7Gc6M2OKow5SYTzEQkpQ6htbRKeX1JXFXAwtKHtFeUve/delCNcqyjS
 zHiD4oteyKoFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CNmjg8YD
Subject: Re: [Buildroot] [PATCH] package/python-pycrate: bump to version
 0.6.0
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

Nasser, All,

On 2023-05-08 02:22 +0330, Nasser Afshin spake thusly:
> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pycrate/Config.in           | 3 ++-
>  package/python-pycrate/python-pycrate.hash | 6 +++---
>  package/python-pycrate/python-pycrate.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> index 193a973f7e..bbd6873938 100644
> --- a/package/python-pycrate/Config.in
> +++ b/package/python-pycrate/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PYCRATE
>  	bool "python-pycrate"
>  	help
> -	  A software suite to handle various data formats.
> +	  A software suite to handle various data and protocol
> +	  formats.
>  
>  	  https://github.com/P1sec/pycrate/
> diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> index e37fd6743a..fd41274369 100644
> --- a/package/python-pycrate/python-pycrate.hash
> +++ b/package/python-pycrate/python-pycrate.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pycrate/json
> -md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> -sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> -# Locally computed
> +md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
> +sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
> diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> index 6779433556..2f947ab807 100644
> --- a/package/python-pycrate/python-pycrate.mk
> +++ b/package/python-pycrate/python-pycrate.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYCRATE_VERSION = 0.5.5
> +PYTHON_PYCRATE_VERSION = 0.6.0
>  PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> -PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
>  PYTHON_PYCRATE_SETUP_TYPE = setuptools
>  PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
>  PYTHON_PYCRATE_LICENSE = LGPL-2.1+
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
