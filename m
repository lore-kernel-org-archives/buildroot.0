Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B79C4167B
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B22940354;
	Thu,  9 Nov 2023 21:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B22940354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Shh-mWzJR0df; Thu,  9 Nov 2023 21:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC744417FE;
	Thu,  9 Nov 2023 21:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC744417FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1801BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BD9541B1B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD9541B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N46JJj3HsLC6 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:45 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10B144189A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B144189A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 521DD13F81D;
 Thu,  9 Nov 2023 22:05:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:05:40 +0100
Date: Thu, 9 Nov 2023 22:05:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231109210540.GB996011@scaer>
References: <20231109001612.3671745-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109001612.3671745-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699563943;
 bh=ljMevkC7L/94yPZl6Ut9Ps3em/zAxs5BSxBr3l8Lpw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AkJxbJ/agYYBoj+xk/QRY6bz5JELqJ7ZOtAlcTLqpStJ6Kp7vKSFdxiYZ6CwRi57c
 UNJkiNrLIivSu42raHqiKmq7eVh57YaPTLmPhKx6IlHlOkkOD7j6o1jkHGpgrEa5G5
 Xct8X5UV7fORNGJyCsgg3L7AYt3GfwSQul46oaqYa6RDuG+AaN3ux+ki/Zk1AZXqbK
 bUEOvLHMwQ/U7Ut6FDuz9HkDreTk4EZLQVclo+EcJrf1Q3dhbnzkfDkXQoSKry9T8H
 Ri6JohjwFgAYY553gs4mEk/KB/mKKzD9dm4XnIMxS9ldoozs2gILoPb2p00mh25vs3
 rswV9fkrAccSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AkJxbJ/a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-networkx: bump to
 version 3.2.1
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

On 2023-11-08 17:16 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, alog with the previous bumps:
    [1861812] 1c56620ee95c  package/python-networkx: bump to version 3.2.1
    [1861810] 0a073da1d144  package/python-netaddr: bump to version 0.9.0
    [1861809] 85b803fafac4  package/python-mypy-extensions: bump to version 1.0.0
    [1861808] eb5e6a65003c  package/python-mutagen: bump to version 1.47.0
    [1861807] ece72fffdce6  package/python-munch: bump to version 4.0.0
    [1861806] 014a66fcde68  package/python-msgpack: bump to version 1.0.7
    [1861805] c616c640d2a5  package/python-msgfy: bump to version 0.2.1
    [1861804] 8903773f7e81  package/python-more-itertools: bump to version 10.1.0
    [1861803] 4ab85dc04e49  package/python-modbus-tk: bump to version 1.1.3
    [1861802] 20d6625eb1f6  package/python-mistune: bump to version 3.0.2
    [1861801] 24872df67838  package/python-mbstrdecoder: bump to version 1.1.3
    [1861800] bea0baf6ba5e  package/python-marshmallow: bump to version 3.20.1
    [1861799] d6e9553bef5c  package/python-markdown2: bump to version 2.4.10
    [1861798] f9c7fb680632  package/python-markdown: bump to version 3.5.1

Regards,
Yann E. MORIN.

> ---
>  package/python-networkx/python-networkx.hash | 4 ++--
>  package/python-networkx/python-networkx.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
> index 96ef9777da..b9fe50fd9c 100644
> --- a/package/python-networkx/python-networkx.hash
> +++ b/package/python-networkx/python-networkx.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/networkx/json
> -md5  1bfbb5cd184b486feae8345f541a5e50  networkx-3.0.tar.gz
> -sha256  9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412  networkx-3.0.tar.gz
> +md5  e81583dcb3d929b60660721912f3faed  networkx-3.2.1.tar.gz
> +sha256  9f1bb5cf3409bf324e0a722c20bdb4c20ee39bf1c30ce8ae499c8502b0b5e0c6  networkx-3.2.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
> diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
> index d369df1a04..e463dca40a 100644
> --- a/package/python-networkx/python-networkx.mk
> +++ b/package/python-networkx/python-networkx.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_NETWORKX_VERSION = 3.0
> +PYTHON_NETWORKX_VERSION = 3.2.1
>  PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
> -PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/99/f9/d45c9ecf50a6b67a200e0bbd324201b5cd777dfc0e6c8f6d1620ce5a7ada
> +PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/c4/80/a84676339aaae2f1cfdf9f418701dd634aef9cc76f708ef55c36ff39c3ca
>  PYTHON_NETWORKX_LICENSE = BSD-3-Clause
>  PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
>  PYTHON_NETWORKX_CPE_ID_VENDOR = python
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
