Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE799C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6917141583;
	Sun, 29 Jan 2023 16:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6917141583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anSBHZD7zZT8; Sun, 29 Jan 2023 16:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E51A41591;
	Sun, 29 Jan 2023 16:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E51A41591
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAAA41BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C272340108
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C272340108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AM68NJ-NkGnd for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A2D400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5A2D400D9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:40:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B14275FFAF;
 Sun, 29 Jan 2023 17:40:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:40:33 +0100
Date: Sun, 29 Jan 2023 17:40:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129164033.GM2632@scaer>
References: <20230129064841.2831082-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129064841.2831082-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675010436;
 bh=s1ZapSUYFtg+42b4vYKYFWnSTeuSaAJJH9m7GPkb5Ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XePDpyzHP8tTsoB2BLG393ydPoK+A88U8XJsm8/jqHXvL2Og3RzsBNgwBPS5MFZiE
 wIndDBUGNaUYdLCUf7InlbI0opG6e9hmAtY+ZS9eXqyZAImvTGZdxB7UIA7seuUIMV
 +LWleB8T7nWCN7LNBJbH6JkVBcQznIBK0l2yu4XEpzp9HXkCXT30rys+6eVqT33aR4
 gMZF/eDWjVcViE6YJ0daSwvJuDkxOojXb7g2jr9qR1LfwAySNW5WiNDBkcYNYzzxve
 dRSEQEqrMZYUA905ucwYLCRfaqtSJwplaGsvP5gVOZuATPXOJNrpj+M2TfmcBEFN/g
 t7XSrmUuCc9bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XePDpyzH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to
 version 2.0.2
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

On 2023-01-28 23:48 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-greenlet/python-greenlet.hash | 4 ++--
>  package/python-greenlet/python-greenlet.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
> index 4e9e96398a..f378436beb 100644
> --- a/package/python-greenlet/python-greenlet.hash
> +++ b/package/python-greenlet/python-greenlet.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/greenlet/json
> -md5  8d0f10b807144a86b54841cfab2620a9  greenlet-2.0.1.tar.gz
> -sha256  42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67  greenlet-2.0.1.tar.gz
> +md5  e6637d59015cba7e86f2111e6aa8168b  greenlet-2.0.2.tar.gz
> +sha256  e7c8dc13af7db097bed64a051d2dd49e9f0af495c26995c00a9ee842690d34c0  greenlet-2.0.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
>  sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
> diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
> index 232e2820f8..40f05f667e 100644
> --- a/package/python-greenlet/python-greenlet.mk
> +++ b/package/python-greenlet/python-greenlet.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_GREENLET_VERSION = 2.0.1
> +PYTHON_GREENLET_VERSION = 2.0.2
>  PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
> -PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/fd/6a/f07b0028baff9bca61ecfcd9ee021e7e33369da8094f00eff409f2ff32be
> +PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/1e/1e/632e55a04d732c8184201238d911207682b119c35cecbb9a573a6c566731
>  PYTHON_GREENLET_SETUP_TYPE = setuptools
>  PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
>  PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
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
