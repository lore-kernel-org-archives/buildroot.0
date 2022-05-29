Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D522BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B246101A;
	Sun, 29 May 2022 21:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4x9sxhjLPXP; Sun, 29 May 2022 21:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6BA605AE;
	Sun, 29 May 2022 21:41:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45E2D1BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34622605AE
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9F2_wiFV5SZN for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:41:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36FB96058F
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:41:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 67D33780333;
 Sun, 29 May 2022 23:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653860471;
 bh=Gh3r66WWwV/slHjqFcvHzy4g8zkdg2D7Vfdd4hsaGTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHoPSmn2G53VAnAWLmIz9f5nf0cOzYKogKW25DefcBbxdgiUAFl9v2AR0fkotk2/u
 MHmz13XlD21yU0gl6V5Af3h1U102zETrdpsnjk+iMNvAOstZVWSpN9Nn5YBeiax+ZT
 BSnz84rikK7Eyk6P39Y5VIk5koe7OizdFv1HF9kazYzkIl+cZTEvh657V70BF/6Cxc
 T/RcMhGczYmM/Lf0OXAzX1I+X73j19hoL9wSdn7lzwPfn7r2i1Er+eJRIHF8mxYCpc
 DWK3tN/NRK0SBTtMnquBfADqKVkCIyitVawTruhC5mvAXCbtnaMg1+rOL/oR6QKVxM
 G6w7ms1w+E7XQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:41:07 +0200
Date: Sun, 29 May 2022 23:41:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220529214107.GK993669@scaer>
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517200923.1516695-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-05-17 14:09 -0600, James Hilliard spake thusly:
> License hash change due to license title syntax change:
> https://github.com/pallets/flask/commit/9e7d3a6b694b27f997266889ae463e06dd83a189
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Since this version bump fixes a runtime test, I applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-flask/python-flask.hash | 13 ++++++-------
>  package/python-flask/python-flask.mk   |  4 ++--
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> index c6ccd633f8..5f19a450a1 100644
> --- a/package/python-flask/python-flask.hash
> +++ b/package/python-flask/python-flask.hash
> @@ -1,7 +1,6 @@
> -# From https://pypi.org/project/Flask/#copy-hash-modal-911ffb67-fe84-4e25-a1a9-f4c745a0a980
> -md5  0da4145d172993cd28a6c619630cc19c  Flask-1.1.2.tar.gz
> -sha256	4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060  Flask-1.1.2.tar.gz
> -
> -# License files
> -sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> -sha256	0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150  docs/license.rst
> +# md5, sha256 from https://pypi.org/pypi/flask/json
> +md5  93f1832e5be704ef6ff2a4124579cd85  Flask-2.1.2.tar.gz
> +sha256  315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477  Flask-2.1.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> +sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d  docs/license.rst
> diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> index 077aa600b8..b684aff480 100644
> --- a/package/python-flask/python-flask.mk
> +++ b/package/python-flask/python-flask.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FLASK_VERSION = 1.1.2
> +PYTHON_FLASK_VERSION = 2.1.2
>  PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
> -PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e67545a0e3a37ea1ca3d45de3aca43ceb7dbf1712fb5127d5d
> +PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d3/3c/94f38d4db919a9326a706ad56f05a7e6f0c8f7b7d93e2997cca54d3bc14b
>  PYTHON_FLASK_SETUP_TYPE = setuptools
>  PYTHON_FLASK_LICENSE = BSD-3-Clause
>  PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
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
